//
//  LevelThree.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

var familiar = "essa voz é\nfamiliar"
var levemNo = "levem-no"
var recarregar = "preciso recarregar"

var funcoesLevel3 : OpcaoParametros = OpcaoParametros(
    nome: "print",
    actionHandler: {(arg:String) in
       print("printei: " + arg)
    }
    , parametros: [levemNo ,familiar, recarregar])

struct LevelThree : View {
    
    init(){
        SoundManager.Instance.playMusic(file_name: "music3")
    }
    
    @StateObject var painelFuncoes = Painel([funcoesLevel3]);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [funcoesLevel3.OpcaoComResposta(levemNo)]);
    
    @EnvironmentObject var data: Data
    @Environment(\.dismiss) private var dismiss
    
    @State var executionButtonShow = false
    @State var actionAreaShow = false
    @State var executionAreaShow = false
    @State var activeExecButton = true
    @State var imageShow = false
    @State var text1Show = false
    @State var clickForNextShow = false
    @State var tapScreenActive = false
    @State var tapCounter = 0
    @State var objectiveShow = false
    @State var speachBubble1Show = false
    @State var finalImageShow = false
    @State var fadeToWhite = false
    
    let imageShowKey = "image"
    let actionAreaShowKey = "actionArea"
    let executionAreaShowKey = "executionArea"
    let executionButtonShowKey = "executionButton"
    let text1ShowKey = "text1"
    let clickForNextShowKey = "clickForNext"
    let objectiveShowKey = "objetive"
    let speachBubble1ShowKey = "speachBubble1"
    let finalImageShowKey = "finalImage"
    let fadeToWhiteShowKey = "fadeToWhite"
    @State var imagePath = "tut3.1"
    
    var body: some View{
        
        
        
        ZStack{
            HStack{
                ZStack{
                    Image(imagePath)
                        .resizable()
                        .interpolation(.none)
                        .opacity(imageShow ? 1 : 0)
                    VStack{
                        Lvl3SpeachBubble1()
                            .opacity(speachBubble1Show ? 1 : 0)
                    }
                    
                        
                }
                VStack{
                    //Rectangle().fill(Color(.white)).frame(height:15)
                    Spacer()
                    //Area de Acoes
                    ActionArea(isFunc: true)
                        .environmentObject(painelExecucao)
                        .environmentObject(painelFuncoes)
                        .opacity(actionAreaShow ? 1 : 0)
                    Spacer()
                    
                    ZStack(alignment: .bottomTrailing){
                        //Area de Execucoes
                        ExecutionArea()
                            .environmentObject(painelExecucao)
                            .environmentObject(painelFuncoes)
                        .opacity(executionAreaShow ? 1 : 0)
                        
                        ExecutionButton()
                            .offset(x: 30, y: 35)
                            .opacity(executionButtonShow ? 1 : 0).opacity(activeExecButton ? 1 : 0.5)
                            .onTapGesture{
                                if(activeExecButton){
                                    if (painelExecucao.executar() == false){
                                        SoundManager.Instance.playSfx("error")
                                    }else{
                                        //SoundManager.Instance.playSfx("correct")
                                        activeExecButton = false
                                        show(objectiveShowKey, show: false)
                                        wait(time: 1, doAfter: {
                                            
                                            show(actionAreaShowKey, show: false)
                                            show(executionAreaShowKey, show: false)
                                            show(executionButtonShowKey, show: false)
                                            wait(time: 1, doAfter: {
                                                show(speachBubble1ShowKey, show: false)
                                                wait(time: 2, doAfter: {
                                                    imagePath = "tut3.2"
                                                    wait(time: 2.5, doAfter: {
                                                        show(imageShowKey, show: false)
                                                        show(finalImageShowKey)
                                                        wait(time: 3, doAfter: {
                                                            show(fadeToWhiteShowKey)
                                                            wait(time: 2, doAfter: {
                                                                SoundManager.Instance.playMusic(file_name: "music");
                                                                dismiss()
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                        })
                                    }
                                }
                            }
                    }
                    
                    
                    Spacer()
        
                }.frame(height: UIScreen.main.bounds.height)
                Rectangle().fill(Color(.white)).frame(width:10)
                
                
                
            }
            
            Level3Text1()
                .opacity(text1Show ? 1 : 0)
            
            ClickForNext()
                .opacity(clickForNextShow ? 1 : 0)
            
            Lvl3Objective()
                .opacity(objectiveShow ? 1 : 0)
            
            
            Group{
                HStack{
                    Image("tut3.3")
                        .resizable()
                        .interpolation(.none)
                    Rectangle().fill(Color.white).frame(width: 10.0)
                }
                
                
                Textinho.FonteBonita("nããããããããããão", 100)
                    .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 80, trailing: 0.0))
            }
            .opacity(finalImageShow ? 1 : 0)
            
            
            
            Rectangle().fill(Color(.white))
                .opacity(fadeToWhite ? 1 : 0)
                
            if(tapScreenActive){
                Rectangle().fill().opacity(0.0001)
                    .onTapGesture{
                        if(tapCounter == 0){
                            tapCounter += 1
                            tapScreenActive = false
                            show(clickForNextShowKey, show: false)
                            show(text1ShowKey, show: false)
                            wait(time: 1, doAfter: {
                                show(speachBubble1ShowKey, show: false)
                                wait(time: 0.0, doAfter: {
                                    show(objectiveShowKey)
                                    wait(time: 1, doAfter: {
                                        show(executionButtonShowKey)
                                        
                                    })
                                })
                            })
                        }
                        else if(tapCounter == 1){
                            tapCounter += 1
                            tapScreenActive = false
                            
                        }
                    }
            }
            
            
        }.onAppear(){
            wait(time: 1, doAfter: {
                show(imageShowKey)
                wait(time: 3, doAfter: {
                    show(speachBubble1ShowKey)
                    wait(time: 2.5, doAfter: {
                        show(speachBubble1ShowKey, show: false)
                    })
                    wait(time: 3.65, doAfter: {
                        show(actionAreaShowKey)
                        show(executionAreaShowKey)
                        show(text1ShowKey)
                        wait(time: 2, doAfter: {
                            show(clickForNextShowKey)
                            tapScreenActive = true
                        })
                    })
                    
                })
            })
            
            
        }.environmentObject(data)
    }
    
    func show(_ objName: String, show: Bool = true){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == imageShowKey){
                imageShow = show
            }else if(objName == actionAreaShowKey){
                actionAreaShow = show
            }else if(objName == executionAreaShowKey){
                executionAreaShow = show
            }else if(objName == executionButtonShowKey){
                executionButtonShow = show
            }else if(objName == text1ShowKey){
                text1Show = show
            }else if(objName == clickForNextShowKey){
                clickForNextShow = show
            }else if(objName == speachBubble1ShowKey){
                speachBubble1Show = show
            }else if(objName == objectiveShowKey){
                objectiveShow = show
            }else if(objName == finalImageShowKey){
                finalImageShow = show
            }else if(objName == fadeToWhiteShowKey){
                fadeToWhite = show
            }
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
}

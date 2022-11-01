//
//  LevelTwoTutorial.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

var morteAosHumanos = "destroy all\nhumans??"
var queHorasSao = "what time is it?"
var odeioRobos = "I hate robots"

var funcoesLevel2Tut : OpcaoParametros = OpcaoParametros(
    nome: "say",
    actionHandler: {(arg:String) in
       print("Falei: " + arg)
    }
    , parametros: [odeioRobos ,queHorasSao, morteAosHumanos])

struct LevelTwoTutorial : View{
    
    init(){
        SoundManager.Instance.playMusic(file_name: "music2");
    }
    
    @StateObject var painelFuncoes = Painel([funcoesLevel2Tut]);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [funcoesLevel2Tut.OpcaoComResposta(morteAosHumanos)]);
    
    @EnvironmentObject var data: Data
    @Environment(\.dismiss) private var dismiss
    
    @State var imageShow = false
    @State var actionAreaShow = false
    @State var executionAreaShow = false
    @State var executionButtonShow = false
    @State var activeExecButton = true
    @State var tutMessage1Show = false
    @State var redArrowShow = false
    @State var clickForNextShow = false
    @State var tapScreenActive = false
    @State var tapCounter = 0
    @State var redArrow2Show = false
    @State var tutMessage2Show = false
    @State var objetiveShow = false
    @State var imagePath = "tut2.1"
    @State var speachBubble1Show = false
    @State var speachBubble2Show = false
    @State var objetiveCompleteShow = false
    @State var fadeToWhite = false
    @State var redScreenShow = false
    @State var redScreenHide = false
    
    var body: some View{
        ZStack{
            
            HStack{
                ZStack{
                    Image(imagePath)
                        .interpolation(.none)
                        .resizable()
                        .opacity(imageShow ? 1 : 0)
                    
                    
                    TutMessage1().opacity(tutMessage1Show ? 1 : 0)
                    RedArrow().opacity(redArrowShow ? 1 : 0)
                    
                    
                    VStack{
                        Lvl2SpeachBubble()
                            .opacity(speachBubble1Show ? 1 : 0)
                        if(speachBubble2Show){
                            Lvl2SpeachBubble2()
                                .opacity(speachBubble2Show ? 1 : 0)
                        }
                    }
                    
                }
                
                
                VStack{
                    //Rectangle().fill(Color(.white)).frame(height:15)
                    Spacer()
                    //Area de Acoes
                    ActionArea(isFunc: true).environmentObject(painelExecucao)
                        .environmentObject(painelFuncoes)
                        .opacity(actionAreaShow ? 1 : 0)
                    Spacer()
                    
                    ZStack(alignment: .bottomTrailing){
                        //Area de Execucoes
                        ExecutionArea().environmentObject(painelExecucao).environmentObject(painelFuncoes)
                        .opacity(executionAreaShow ? 1 : 0)
                        
                        ExecutionButton()
                            .offset(x: 30, y: 35)
                            .opacity(executionButtonShow ? 1 : 0).opacity(activeExecButton ? 1 : 0.5)
                            .onTapGesture{
                                if(activeExecButton){
                                    if (painelExecucao.executar() == false){
                                        SoundManager.Instance.playSfx("error")
                                        redScreenShow = true
                                    }else{
                                        //SoundManager.Instance.playSfx("correct")
                                        activeExecButton = false
                                        show("objetive", show: false)
                                        wait(time: 1, doAfter: {
                                            show("speachBubble1")
                                            wait(time: 2.5, doAfter: {
                                                show("speachBubble2")
                                                imagePath = "tut2.2"
                                                wait(time: 1, doAfter: {
                                                    show("clickForNext")
                                                    tapScreenActive = true
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
            
            ClickForNext()
                .opacity(clickForNextShow ? 1 : 0)
            
            Lvl2TutText()
                .opacity(tutMessage2Show ? 1 : 0)
            
            Lvl2RedArrow()
                .opacity(redArrow2Show ? 1 : 0)
            
            Lvl2Objetivo()
                .opacity(objetiveShow ? 1 : 0)
            
            ObjectiveComplete()
                .opacity(objetiveCompleteShow ? 1 : 0)
            
            if(tapScreenActive){
                TapScreen()
                    .onTapGesture{
                        if(tapCounter == 0){
                            tapScreenActive = false
                            tapCounter += 1
                            show("tutMessage1", show: false)
                            show("redArrow", show: false)
                            show("clickForNext", show: false)
                            wait(time: 1, doAfter: {
                                show("redArrow2")
                                show("tutMessage2")
                                wait(time: 2, doAfter: {
                                    show("clickForNext")
                                    tapScreenActive = true
                                })
                            })
                        }else if(tapCounter == 1){
                            tapScreenActive = false
                            tapCounter += 1
                            show("tutMessage2", show: false)
                            show("redArrow2", show: false)
                            show("clickForNext", show: false)
                            wait(time: 1, doAfter: {
                                show("objetive")
                                wait(time: 2, doAfter: {
                                    show("execButton")
                                })
                            })
                            
                            
                        
                        }else if(tapCounter == 2){
                            tapCounter += 1
                            tapScreenActive = false
                            show("clickForNext", show: false)
                            wait(time: 1, doAfter: {
                                show("objetiveComplete")
                                wait(time: 0.2, doAfter: {
                                    SoundManager.Instance.playSfx("correct")
                                    wait(time: 1, doAfter: {
                                        
                                        show("clickForNext")
                                        tapScreenActive = true
                                    })
                                })
                                
                            })
                        }else if(tapCounter == 3){
                            tapCounter += 1
                            tapScreenActive = false
                            show("fadeToWhite")
                            wait(time: 1, doAfter: {
                                data.level = "level3"
                            })
                        }
                    }
            }

            
            
            Rectangle().fill(Color(.white))
                .opacity(fadeToWhite ? 1 : 0)
            
            if(redScreenShow){
                ZStack{
                    Rectangle().fill(Color(.red))
                        .opacity(redScreenHide ? 0.0 : 0.4)
                }
                .frame(height: screenHeight + 40)
                .onAppear{
                    withAnimation(Animation.linear(duration: 1.0)){
                        redScreenHide = true
                    }
                    wait(time: 1.0, doAfter: {
                        redScreenHide = false
                        redScreenShow = false
                    })
                }
            }
   
        }.onAppear(perform: {
            show("image")
            wait(time: 1.0, doAfter: {
                show("actionArea")
                show("executionArea")
                //show("execButton")
                wait(time: 1.0, doAfter: {
                    show("redArrow")
                    show("tutMessage1")
                    wait(time: 2.0, doAfter: {
                        show("clickForNext")
                        tapScreenActive = true
                    })
                })
            })
        })
            .environmentObject(data)
        
        
    }
    
    
    
    func show(_ objName: String, show: Bool = true){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == "image"){
                imageShow = show
            }else if(objName == "redArrow"){
                redArrowShow = show
            }else if(objName == "tutMessage1"){
                tutMessage1Show = show
            }else if(objName == "actionArea"){
                actionAreaShow = show
            }else if(objName == "executionArea"){
                executionAreaShow = show
            }else if(objName == "execButton"){
                executionButtonShow = show
            }else if(objName == "clickForNext"){
                clickForNextShow = show
            }else if(objName == "redArrow2"){
                redArrow2Show = show
            }else if(objName == "tutMessage2"){
                tutMessage2Show = show
            }else if(objName == "objetive"){
                objetiveShow = show
            }else if(objName == "speachBubble1"){
                speachBubble1Show = show
            }else if(objName == "speachBubble2"){
                speachBubble2Show = show
            }else if(objName == "objetiveComplete"){
                objetiveCompleteShow = show
            }else if(objName == "fadeToWhite"){
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

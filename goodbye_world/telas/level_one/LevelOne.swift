//
//  LevelOne.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

var falarTchau = Opcao(nome: global_language == Language.portuguese ? "falar \"tchau\"" : "say \"goodbye\"", actionHandler: {() in print("tchau")});
var falarTudoBem = Opcao(nome: global_language == Language.portuguese ? "falar \"tudo bem?\"" : "say \"how are you?\"", actionHandler: {() in print("tudo bem?")});
var darUmPulo = Opcao(nome: global_language == Language.portuguese ? "dar um pulo" : "jump" , actionHandler: {() in print("pulando")});

var funcoesLevelOne : [Opcao] = [falarTchau, falarTudoBem, darUmPulo]

struct LevelOne : View{
    @State var anim1Show = false
    @State var clickForNextShow = false
    @State var onScreenTapActive = true
    @State var imagePath = "tut1.1"
    @State var imageShow = false
    @State var actionAreaShow = false
    @State var executionAreaShow = false
    @State var executionButtonShow = false
    @State var objetivoShow = false
    @State var activeExecButton = true
    @State var speachBubble1Show = false
    @State var speachBubble2Show = false
    @State var tapCount = 0
    @State var objetivoConlcuidoShow = false
    @State var fadeToWhite = false
    @State var redScreenShow = false
    @State var redScreenHide = false
    @EnvironmentObject var data: Data
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var painelFuncoes = Painel(funcoesLevelOne);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [falarTudoBem]);
    
    var body: some View{
        ZStack{
            LevelText1().opacity(anim1Show ? 1 : 0)
            
            HStack{
                
                ZStack{
                    // Bolhas de texto
                    VStack{
                        SpeachBubble1().opacity(speachBubble1Show ? 1 : 0)
                        if(speachBubble2Show){
                            SpeachBubble2().opacity(speachBubble2Show ? 1 : 0)
                        }
                    }
                    
                    //Imagem Principal
                    Image(imagePath)
                        .resizable()
                        .interpolation(.none)
                        .opacity(imageShow ? 1 : 0)
                }
                
                
                VStack(){
                    //Rectangle().fill(Color(.white)).frame(height:15)
                    Spacer()
                    //Area de Acoes
                    ActionArea().environmentObject(painelExecucao)
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
                                if (painelExecucao.executar() == false){
                                    SoundManager.Instance.playSfx("error")
                                    redScreenShow = true
                                }else{
                                    //SoundManager.Instance.playSfx("correct")
                                    activeExecButton = false
                                    show("objetivo", show: false)
                                    wait(time: 1.0, doAfter: {
                                        show("speachBubble1")
                                        wait(time: 1, doAfter: {
                                            show("speachBubble2")
                                            imagePath = "tut1.6" 
                                            wait(time: 2.0, doAfter: {
                                                show("clickForNext")
                                                onScreenTapActive = true
                                            })
                                        })
                                        
                                    })
                                }
                                
                            }
                    }
                    
                    
                    Spacer()
        
                }.frame(height: UIScreen.main.bounds.height)
                Rectangle().fill(Color(.white)).frame(width:10)
            }
            
            Objetivo()
                .opacity(objetivoShow ? 1 : 0)
            
            ObjectiveComplete().opacity(objetivoConlcuidoShow ? 1 : 0)
            
            ClickForNext().opacity(clickForNextShow ? 1 : 0)
            
            if(onScreenTapActive){
                TapOnScreen()
                    .onTapGesture{
                        
                        if(tapCount == 0){
                            tapCount += 1
                            onScreenTapActive = false
                            show("anim1", show: false)
                            show("clickForNext", show: false)
                            wait(time: 1, doAfter: {
                                show("image")
                                show("actionArea")
                                show("executionArea")
                                show("execButton")
                                wait(time: 1, doAfter: {
                                    show("objetivo")
                                })
                            })
                        }else if(tapCount == 1){
                            tapCount += 1
                            show("objetivoConcluido")
                            wait(time: 0.2, doAfter: {
                                SoundManager.Instance.playSfx("correct")
                            })
                        }else if(tapCount == 2){
                            show("fadeToWhite")
                            wait(time: 1.0, doAfter: {
                                //dismiss()
                                data.level = "level2tut"
                            })
                        }
                        
                        
                        
                    }.environmentObject(data)
            }
                
            Rectangle().fill(Color(.white))
                .opacity(fadeToWhite ? 1 : 0)
            
            if(redScreenShow){
                ZStack{
                    VStack(spacing: 0.0){
                        Rectangle().fill(Color(.red))
                            .opacity(redScreenHide ? 0.0 : 0.4)
                    }
                    
                }
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
            
            
        }.onAppear(){
            show("anim1")
            show("clickForNext")
        }
    }
    
    func show(_ objName: String, show: Bool = true){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == "image"){
                imageShow = show
            }else if(objName == "anim1"){
                anim1Show = show
            }else if(objName == "clickForNext"){
                clickForNextShow = show
            }else if(objName == "actionArea"){
                actionAreaShow = show
            }else if(objName == "executionArea"){
                executionAreaShow = show
            }else if(objName == "execButton"){
                executionButtonShow = show
            }else if(objName == "objetivo"){
                objetivoShow = show
            }else if(objName == "speachBubble1"){
                speachBubble1Show = show
            }else if(objName == "speachBubble2"){
                speachBubble2Show = show
            }else if(objName == "objetivoConcluido"){
                objetivoConlcuidoShow = show
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


//
//  LevelOne.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

var falarTchau = Opcao(nome: "falar \"tchau\"", actionHandler: {() in print("tchau")});
var falarTudoBem = Opcao(nome: "falar \"tudo bem?\"", actionHandler: {() in print("tudo bem?")});
var darUmPulo = Opcao(nome: "dar um pulo", actionHandler: {() in print("pulando")});

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
    
    @StateObject var painelFuncoes = Painel(funcoesLevelOne);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [falarTudoBem]);
    
    var body: some View{
        ZStack{
            LevelText1().opacity(anim1Show ? 1 : 0)
            ClickForNext().opacity(clickForNextShow ? 1 : 0)
    
            if(onScreenTapActive){
                TapOnScreen()
                    .onTapGesture{
                        show("anim1", show: false)
                        show("clickForNext", show: false)
                        onScreenTapActive = false
                        wait(time: 1, doAfter: {
                            show("image")
                            show("actionArea")
                            show("executionArea")
                            show("execButton")
                            wait(time: 1, doAfter: {
                                show("objetivo")
                            })
                        })
                        
                        
                    }
            }
            
            HStack{
                
                ZStack{
                    // Bolhas de texto
                    VStack{
                        SpeachBubble1().opacity(speachBubble1Show ? 1 : 0)
                        SpeachBubble2().opacity(speachBubble2Show ? 1 : 0)
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
                                    print("Verificão falhou");
                                    // barulho de falha
                                }else{
                                    activeExecButton = false
                                    show("objetivo", show: false)
                                    wait(time: 1.0, doAfter: {
                                        show("speachBubble1")
                                        wait(time: 1, doAfter: {
                                            show("speachBubble2")
                                            imagePath = "tut1.6"
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
            }
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
}


//
//  LevelTwoTutorial.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

//var falarTchau = Opcao(nome: "falar \"tchau\"", actionHandler: {() in print("tchau")});
//var falarTudoBem = Opcao(nome: "falar \"tudo bem?\"", actionHandler: {() in print("tudo bem?")});
//var darUmPulo = Opcao(nome: "dar um pulo", actionHandler: {() in print("pulando")});
//
//var funcoesLevelOne : [Opcao] = [falarTchau, falarTudoBem, darUmPulo]

var funcoesLevel2Tut : OpcaoParametros = OpcaoParametros(
    nome: "falar",
    actionHandler: {(arg:String) in
       print("Falei: " + arg)
    }
    , parametros: ["morte aos humanos,\nnão é mesmo?"])

struct LevelTwoTutorial : View{
    
    @StateObject var painelFuncoes = Painel([funcoesLevel2Tut]);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [funcoesLevel2Tut]);
    
    @State var imageShow = false
    @State var actionAreaShow = false
    @State var executionAreaShow = false
    @State var executionButtonShow = false
    @State var activeExecButton = true
    
    var body: some View{
        ZStack{
            HStack{
                Image("tut2.1")
                    .interpolation(.none)
                    .resizable()
                    .opacity(imageShow ? 1 : 0)
                
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
                                if (painelExecucao.executar() == false){
                                    print("Verificão falhou");
                                    // barulho de falha
                                }else{
                                    
                                }
                                
                            }
                    }
                    
                    
                    Spacer()
        
                }.frame(height: UIScreen.main.bounds.height)
                Rectangle().fill(Color(.white)).frame(width:10)
            }
        }.onAppear(perform: {
            show("image")
            wait(time: 1.0, doAfter: {
                show("actionArea")
                show("executionArea")
                show("executionButton")
            })
        })
    }
    
    func show(_ objName: String, show: Bool = true){
        withAnimation(Animation.linear(duration: 1.0)){
            if(objName == "image"){
                imageShow = show
            }else if(objName == "anim1"){
                //anim1Show = show
            }else if(objName == "clickForNext"){
                //clickForNextShow = show
            }else if(objName == "actionArea"){
                actionAreaShow = show
            }else if(objName == "executionArea"){
                executionAreaShow = show
            }else if(objName == "execButton"){
                executionButtonShow = show
            }else if(objName == "objetivo"){
                //objetivoShow = show
            }else if(objName == "speachBubble1"){
                //speachBubble1Show = show
            }else if(objName == "speachBubble2"){
                //speachBubble2Show = show
            }else if(objName == "objetivoConcluido"){
                //objetivoConlcuidoShow = show
            }else if(objName == "fadeToWhite"){
                //fadeToWhite = show
            }
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
}

//
//  LevelThree.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

var parem = "parem, ele é meu convidado"
var levemNo = "levem-no"

var funcoesLevel3 : OpcaoParametros = OpcaoParametros(
    nome: "print",
    actionHandler: {(arg:String) in
       print("printei: " + arg)
    }
    , parametros: [levemNo ,parem, odeioRobos])

struct LevelThree : View {
    
    @StateObject var painelFuncoes = Painel([funcoesLevel3]);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: [funcoesLevel3.OpcaoComResposta(levemNo)]);
    
    @State var executionButtonShow = false
    @State var actionAreaShow = false
    @State var executionAreaShow = false
    @State var activeExecButton = true
    @State var imageShow = false
    
    let imageShowKey = "image"
    let actionAreaShowKey = "actionArea"
    let executionAreaShowKey = "executionArea"
    let executionButtonShowKey = "executionButton"
    
    var body: some View{
        ZStack{
            HStack{
                Image("tut3.1")
                    .resizable()
                    .interpolation(.none)
                    .opacity(imageShow ? 1 : 0)
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
                                        print("Verificão falhou");
                                        // barulho de falha
                                    }else{
                                        activeExecButton = false
                                        
                                    }
                                }
//                                
//                                
                            }
                    }
                    
                    
                    Spacer()
        
                }.frame(height: UIScreen.main.bounds.height)
                Rectangle().fill(Color(.white)).frame(width:10)
                
            }
        }.onAppear(){
            show(imageShowKey)
            wait(time: 1, doAfter: {
                show(actionAreaShowKey)
                show(executionAreaShowKey)
            })
        }
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
            }
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
}

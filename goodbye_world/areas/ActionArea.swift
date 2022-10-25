//
//  ActionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

//func getLinearGradient(initColor: Color, finalColor: Color) -> LinearGradient{
//    return LinearGradient(
//        gradient: Gradient(stops: [
//    .init(color: initColor, location: 0),
//    .init(color: finalColor, location: 1)]),
//        startPoint: UnitPoint(x: 0.7079918490440847, y: 1.000000041185293),
//        endPoint: UnitPoint(x: 0.2643442919563681, y: 5.507062383891537e-8))
//}

let orange : LinearGradient = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color( #colorLiteral(red: 1, green: 0.7800833582878113, blue: 0.6208333373069763, alpha: 1)), location: 0),
        .init(color: Color( #colorLiteral(red: 1, green: 0.5625833868980408, blue: 0.24583333730697632, alpha: 1)), location: 1)]),
    startPoint: UnitPoint(x: 0.7079918490440847, y: 1.000000041185293),
    endPoint: UnitPoint(x: 0.2643442919563681, y: 5.507062383891537e-8))


struct ActionArea : View {
    private var panelWidth = UIScreen.main.bounds.width * 0.4
    private var panelHeight = UIScreen.main.bounds.height * 0.45
    // let actions: [String] = ["action 1", "action 2"]
    var isFunc : Bool
    
    init(isFunc: Bool = false){
        self.isFunc = isFunc
    }
    
    @EnvironmentObject var painelExecucao : PainelExecucao;
    @EnvironmentObject var painelAcoes : Painel;
    
//    init(painelExecucao : PainelExecucao, painelAcoes : Painel){
 //       self.painelExecucao = painelExecucao;
 //       self.painelAcoes = painelAcoes;
//    }
    
    func moveToExec(_ action:Opcao){
        if (self.painelExecucao.canAdd()){
            self.painelAcoes.removeOpcao(opcao: action);
            self.painelExecucao.addOpcao(opcao: action);
        }
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(
                    orange
                )
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .border(.black, width: 4)
            Textinho.FonteBonita(isFunc ? "funcoes" : "acoes")
                .padding()
                .border(.black, width: 4)
            
            // Lista de acoes
            VStack(){
                ForEach(self.painelAcoes.funcoes){
                    action in
                    if (action is OpcaoParametros){
                        Function(readyToExecute: false, actionText: action.nome, action_data: action as! OpcaoParametros, onClickEvent: self.moveToExec)
                    }else{
                        Action(readyToExecute: false, actionText: action.nome, action_data: action, onClickEvent: self.moveToExec);
                    }
                    
                     // mover acao desse painel para o outro
                        //self.painelAcoes.removeOpcao(opcao: action);
                        //self.painelExecucao.addOpcao(opcao: action);
                }
                
            }
            .offset(x: 20, y: 70)
            
        }
    }
}

//struct ActionArea_Previews: PreviewProvider {
 //   static var previews: some View {
   //     ActionArea()
    //        .previewInterfaceOrientation(.landscapeLeft)
//    }
//}



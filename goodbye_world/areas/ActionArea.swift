//
//  ActionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct ActionArea : View {
    private var panelWidth = UIScreen.main.bounds.width * 0.4
    private var panelHeight = UIScreen.main.bounds.height * 0.45
    // let actions: [String] = ["action 1", "action 2"]
    
    var painelExecucao : PainelExecucao;
    var painelAcoes : Painel;
    
    init(painelExecucao : PainelExecucao, painelAcoes : Painel){
        self.painelExecucao = painelExecucao;
        self.painelAcoes = painelAcoes;
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("customOrange"))
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .border(.black, width: 4)
            Textinho.FonteBonita("acoes")
                .padding()
                .border(.black, width: 4)
            
            // Lista de acoes
            VStack(){
                ForEach(self.painelAcoes.funcoes){
                    action in
                    Action(readyToExecute: false, actionText: action.nome);
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





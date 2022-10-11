//
//  ExecutionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct ExecutionArea : View {
    private var panelWidth = UIScreen.main.bounds.width * 0.4
    private var panelHeight = UIScreen.main.bounds.height * 0.45
    
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    
    @EnvironmentObject var painelExecucao : PainelExecucao;
    @EnvironmentObject var painelAcoes : Painel;
    
    //init(painelExecucao : PainelExecucao, painelAcoes : Painel){
    //    self.painelExecucao = painelExecucao;
     //   self.painelAcoes = painelAcoes;
    //}
    
    func moveToAction(_ action:Opcao){
        self.painelExecucao.removeOpcao(opcao: action);
        self.painelAcoes.addOpcao(opcao: action);
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("customGreen"))
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .border(.black, width: 4)
            Textinho.FonteBonita("execucao")
                .padding()
                .border(.black, width: 4)
            
            VStack(){
                ForEach(self.painelExecucao.funcoes){ action in
                    if (action.nome == "nil"){
                        Rectangle()
                            .stroke(style: StrokeStyle(lineWidth: 4.0, dash: [6]))
                            .fill(Color(.black).opacity(1.0))
                            .frame(width: actionWidth, height: actionHeight)
                    }else{
                        Action(readyToExecute : true, actionText: action.nome, action_data: action, onClickEvent: self.moveToAction)
                    }
                            
                }
            }
            .offset(x: 20, y: 70)
        }
    }
}

struct ExecutionArea_Previews: PreviewProvider {
    static var previews: some View {
        ExecutionArea()
    .previewInterfaceOrientation(.landscapeLeft)
//    .environmentObject(PainelExecucao())
//    .environmentObject(Painel())
    
    }
}

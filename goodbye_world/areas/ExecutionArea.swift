//
//  ExecutionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

let green : LinearGradient = LinearGradient(
    gradient: Gradient(stops: [
        .init(color: Color( #colorLiteral(red: 0.8172042965888977, green: 1, blue: 0.7333333492279053, alpha: 1)), location: 0),
        .init(color: Color( #colorLiteral(red: 0.42352941632270813, green: 0.8078431487083435, blue: 0.24705882370471954, alpha: 1)), location: 1)]),
    startPoint: UnitPoint(x: 0.7079918490440847, y: 1.000000041185293),
    endPoint: UnitPoint(x: 0.2643442919563681, y: 5.507062383891537e-8))

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
                .fill(green)
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
                        
                        if (action is OpcaoParametros){
                            Action(readyToExecute : true, actionText: "\(action.nome) ( \((action as! OpcaoParametros).parametroSelecionado) )", action_data: action, onClickEvent: self.moveToAction)
                        }else{
                            Action(readyToExecute : true, actionText: action.nome, action_data: action, onClickEvent: self.moveToAction)
                        }
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

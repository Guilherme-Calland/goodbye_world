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
    let actions: [String]
    
    init(actions: [String] = []){
        self.actions = actions
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
            
            
            if actions.count > 0{
                // Lista de acoes
                VStack(spacing: 15.0){
                    ForEach(actions, id:\.self){
                        action in
                        Action(readyToExecute: true, actionText: action)
                    }
                }
                .offset(x: 20, y: 70)
            }else{
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 4.0, dash: [6]))
                    .fill(Color(.black).opacity(1.0))
                    .frame(width: actionWidth, height: actionHeight)
                    .offset(x: 20, y: 70)
                    
            }
            
            
        }
    }
}

struct ExecutionArea_Previews: PreviewProvider {
    static var previews: some View {
        ExecutionArea()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

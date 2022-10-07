//
//  ExecutionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct ExecutionArea : View {
    var panelWidth = UIScreen.main.bounds.width/2.2
    var panelHeight = UIScreen.main.bounds.height/2.2
    
    var body : some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("customGreen"))
                .border(.black, width: 4)
            Textinho.FonteBonita("Execucao")
                .padding()
                .border(.black, width: 4)
        }.frame(width: panelWidth, height: panelHeight)
    }
}

struct ExecutionArea_Previews: PreviewProvider {
    static var previews: some View {
        ExecutionArea()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//
//  ActionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct ActionArea : View {
    private var panelWidth = UIScreen.main.bounds.width/2.2
    private var panelHeight = UIScreen.main.bounds.height/2.2
    var body: some View{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("customOrange"))
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .border(.black, width: 4)
            Textinho.FonteBonita("acoes")
                .padding()
                .border(.black, width: 4)
//            List{
//                Action(actionText: "Teste 1")
//            }
        }
    }
}

struct ActionArea_Previews: PreviewProvider {
    static var previews: some View {
        ActionArea()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}




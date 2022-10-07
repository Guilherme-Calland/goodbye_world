//
//  Action.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct Action : View {
    var readyToExecute: Bool?
    var actionText: String?
    private var panelWidth = UIScreen.main.bounds.width/3.2
    private var panelHeight = 40.0
    
    init(readyToExecute: Bool? = nil, actionText: String? = nil){
        self.actionText = actionText
        self.readyToExecute = readyToExecute
    }
    
    var body : some View {
        ZStack{
            Rectangle()
                .fill(Color.black)
                .opacity(0.4)
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .offset(x: -6.0, y: 6.0)
            Rectangle()
                .fill(Color(readyToExecute ?? false ? "customGreen" : "customOrange"))
                .frame(width: panelWidth, height: panelHeight, alignment: .leading)
                .border(.black, width: 4)
            Textinho.FonteBonita(actionText ?? "Falar \"Ola\"")
        }
    }
}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Action()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


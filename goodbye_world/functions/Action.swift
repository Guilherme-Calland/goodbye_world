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
    var callback: (() -> Void)?
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    
    init(readyToExecute: Bool? = nil, actionText: String? = nil){
        self.actionText = actionText
        self.readyToExecute = readyToExecute
    }
    
    var body : some View {
        ZStack{
            ActionShadow()
            ZStack{
                Rectangle()
                    .fill(Color(readyToExecute ?? false ? "customGreen" : "customOrange"))
                    .frame(width: actionWidth, height: actionHeight, alignment: .leading)
                    .border(.black, width: 4)
                Textinho.FonteBonita(actionText ?? "Falar \"Ola\"")
            }.onTapGesture {
                print("hello there, hello")
            }
        }
    }
}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Action()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


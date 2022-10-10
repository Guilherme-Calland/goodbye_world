//
//  Action.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct Action : View {
    var id: Int?
    var readyToExecute: Bool?
    var actionText: String?
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    
    init(readyToExecute: Bool? = nil, actionText: String? = nil, id: Int? = 0){
        self.actionText = actionText
        self.readyToExecute = readyToExecute
        self.id = id
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
                moveActionToExecution(1)
            }
        }
    }
    
    func moveActionToExecution(_ id : Int){
        Data.actions.removeAll()
        print("hello test test")
    }

}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Action()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}



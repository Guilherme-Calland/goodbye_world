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
    var onClickEvent: (Opcao) -> ();
    var action_data: Opcao;
    
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    
    init(readyToExecute: Bool? = nil, actionText: String? = nil, id: Int? = 0, action_data: Opcao, onClickEvent:@escaping (Opcao) -> ()){
        self.actionText = actionText
        self.readyToExecute = readyToExecute
        self.id = id
        self.action_data = action_data;
        self.onClickEvent = onClickEvent
    }
    
    var body : some View {
        ZStack{
            ActionShadow()
            ZStack{
                Rectangle()
                    .fill(Color(readyToExecute ?? false ? "customGreen" : "customOrange"))
                    .frame(width: actionWidth, height: actionHeight, alignment: .leading)
                    .border(.black, width: 4)
                Textinho.FonteBonita(actionText ?? "nil")
            }.onTapGesture {
                SoundManager.Instance.playSfx("chipsCollide1");
                self.onClickEvent(self.action_data);
            }
        }
    }
    
    func moveActionToExecution(_ id : Int){
//        data.actions.removeAll()
    }

}

//struct Action_Previews: PreviewProvider {
//    static var previews: some View {
//        Action()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}



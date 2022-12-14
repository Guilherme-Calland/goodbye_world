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
    var onClickEvent: (Opcao) -> ();
    var action_data: Opcao;
    
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.7
    private var actionHeight = 40.0
    @EnvironmentObject var data : Data
    
    init(readyToExecute: Bool? = nil, actionText: String? = nil, id: Int? = 0, action_data: Opcao, onClickEvent:@escaping (Opcao) -> ()){
        self.actionText = actionText
        self.readyToExecute = readyToExecute
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
            
                Textinho.FonteBonita(actionText ?? "Falar \"Ola\"")
                    .padding(EdgeInsets.init(top: 0.0, leading: 10, bottom: 0.0, trailing: 0.0))
                    .frame(width: actionWidth, height: actionHeight, alignment: .leading)
            }.onTapGesture {
                self.onClickEvent(self.action_data);
                SoundManager.Instance.playSfx("click")
            }
        }
    }
    
    func moveActionToExecution(_ id : Int){
        data.actions.removeAll()
//        print("test")
    }

}

//struct Action_Previews: PreviewProvider {
//    static var previews: some View {
//        Action()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}



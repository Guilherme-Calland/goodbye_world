//
//  InitialContrastTextPopup.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 13/10/22.
//

import SwiftUI

struct InitialContrastTextPopup : View {
    var text: String
    var body : some View {
        HStack{
            ZStack{
                Rectangle().fill(Color(.white))
                    .border(.black, width: 6)
                    .frame(width: 400)
                Textinho.FonteBonita(text, 35)
            }.frame(height: 80).offset(y: -80)
                .padding(EdgeInsets(top: 0.0, leading: 60.0, bottom: 0.0, trailing: 0.0))
            Rectangle().opacity(0.0)
        }
    }
}



//
//  MainTextPopup.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 13/10/22.
//

import SwiftUI

struct MainTextPopup : View{
    var text: String
    var body : some View {
        ZStack{
            Rectangle().fill(Color(.white))
                .border(.black, width: 6)
                .frame(width: 400, height: 250)
            Textinho.FonteBonita(text)
                .frame(width: 400, height: 400)
        }
    }
}

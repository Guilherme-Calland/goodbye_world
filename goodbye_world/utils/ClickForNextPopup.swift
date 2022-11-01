//
//  ClickForNextPopup.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 13/10/22.
//

import SwiftUI

struct ClickForNextPopup : View {
    var body : some View {
        ZStack{
            Rectangle()
                .fill(Color(.white))
                .frame(width: 800, height: 40)
                .border(.black, width: 4)
            Textinho.FonteBonita(tap_anywhere[global_language] ?? "")
                
        }
        .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 60.0, trailing: 0.0))
    }
}


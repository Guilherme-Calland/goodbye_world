//
//  Lvl2SpeachBubble.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl2SpeachBubble : View {
    var body: some View{
        ZStack{
            Image("lvl2SpeachBubble1")
                .resizable()
                .interpolation(.none)
                .frame(width: 300, height: 100)
            Textinho.FonteBonita("morte aos humanos,\nnão é mesmo?")
                
        }
    }
}

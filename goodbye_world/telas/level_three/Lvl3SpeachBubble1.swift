//
//  Lvl3SpeachBubble1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl3SpeachBubble1 : View{
    var body: some View{
        ZStack{
            Image("speachBubble2")
                .resizable()
                .interpolation(.none)
                .frame(width: 300, height: 100)
            Textinho.FonteBonita(lvl3_speach_bubble1[global_language] ?? " ")
        }
        
    }
}

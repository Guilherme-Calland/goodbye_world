//
//  SpeachBubble1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct SpeachBubble1 : View{
    var body: some View{
        ZStack{
            Image("speachBubble1")
                .resizable()
                .interpolation(.none)
                .frame(width: 300, height: 100)
            Textinho.FonteBonita("tudo bem?")
                
        }
    }
}

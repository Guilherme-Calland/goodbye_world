//
//  Lvl3Objective.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl3Objective : View {
    var body: some View{
        HStack{
            VStack{
                VStack{
                    ZStack{
                        Rectangle().fill(Color(.white)).frame(width: 400, height: 100).border(.black, width: 8)
                        Textinho.FonteBonita("Objetivo", 32).frame(width: 360, height: 60)
                    }
                    ZStack{
                        Rectangle().fill(Color(.white)).frame(width: 400, height: 200).border(.black, width: 8)
                        Textinho.FonteBonita("mande os robôs levarem o intruso", 32).frame(width: 360, height: 160)
                    }.offset(y: -20)
                }
                
                
                Spacer()
            }
            Spacer()
        }.offset(x: 80, y: 80)
    }
}

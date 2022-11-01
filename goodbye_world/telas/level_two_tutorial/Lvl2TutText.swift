//
//  Lvl2TutText.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl2TutText : View {
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Rectangle().fill(Color(.white)).border(.black, width: 4)
                            .frame(width: 520, height: 400)
                        Textinho.FonteBonita(lvl2_message2[global_language] ?? "")
                            .frame(width: 500)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }.offset(x: 40, y: 40)
    }
}

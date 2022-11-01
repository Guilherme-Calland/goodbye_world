//
//  TutMessage1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct TutMessage1 : View{
    
    @EnvironmentObject var data: Data
    
    var body: some View{
        VStack{
            ZStack{
                Rectangle().fill(Color(.white)).border(.black, width: 4.0)
                    .frame(width: 500, height: 450)
                Textinho.FonteBonita(lvl2_message1[global_language] ?? "").environmentObject(data)
                    .frame(width: 450)
    //
                
            }
            Spacer()
        }
        .offset(x: 20, y: 20.0)
    }
}

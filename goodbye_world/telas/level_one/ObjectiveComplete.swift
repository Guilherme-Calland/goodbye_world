//
//  ObjectiveComplete.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct ObjectiveComplete : View{
    var body: some View{
        ZStack{
            ZStack{
                Rectangle().fill(Color(.white)).border(.black, width: 8.0).frame(height: 400)
            }.padding(EdgeInsets(top: 0.0, leading: 20, bottom: 0.0, trailing: 20))
            
            HStack(alignment: .center){
                Image("red_baloon")
                    .resizable()
                    .interpolation(.none)
                    .frame(width: 95, height: 215)
                Rectangle().fill().opacity(0.0).frame(width: 20, height: 0.0)
                Textinho.FonteBonita("Objetivo concluído", 54)
                Rectangle().fill().opacity(0.0).frame(width: 20, height: 0.0)
                Image("blue_baloon")
                    .resizable()
                    .interpolation(.none)
                    .frame(width: 95, height: 215)
            }
            
        }
    }
}

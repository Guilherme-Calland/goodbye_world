//
//  LevelText1.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

struct LevelText1 : View {
    var body: some View{
        ZStack{
            Rectangle().fill(Color(.white)).frame(width: 640, height: 300)
                .border(.black, width: 8)
            Textinho.FonteBonita("Ok. agora vamos ver se você consegue concluir o objetivo a seguir.", 32)
                .frame(width: 560, height: 240, alignment: .center)
        }
    }
}

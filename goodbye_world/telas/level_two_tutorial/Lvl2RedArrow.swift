//
//  Lvl2RedArrow.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl2RedArrow : View {
    var body: some View{
        VStack{
            Image("little_red_arrow")
                .interpolation(.none)
                .resizable()
                .frame(width: 108, height: 102)
            Spacer()
        }.offset(x: 50, y: 65.0)
    }
}

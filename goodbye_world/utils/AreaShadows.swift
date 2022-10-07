//
//  AreaShadows.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct AreaShadow : View {
    var panelWidth = UIScreen.main.bounds.width/2.2
    var panelHeight = UIScreen.main.bounds.height/2.2
    var body: some View{
        Rectangle()
            .fill(Color(.black))
            .opacity(0.5)
            .frame(width: panelWidth, height: panelHeight, alignment: .leading)
            .offset(x: -10, y: 10)
    }
}

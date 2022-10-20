//
//  ContrastImage.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 13/10/22.
//

import SwiftUI

struct ContrastImage : View {
    var contrastImagePath: String
    
    var body : some View {
        HStack{
            Image(contrastImagePath)
                .resizable()
                .interpolation(.none)
            Rectangle().fill().opacity(0.0)
                .frame(width: panelWidth)
        }
    }
}




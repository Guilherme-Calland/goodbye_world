//
//  util_screens.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 05/10/22.
//

import SwiftUI

struct WhiteScreen : View {
    var body : some View{
            Rectangle().fill(Color(.white))
            .frame(width: UIScreen.main.bounds.width,
                                                  height: UIScreen.main.bounds.height)
        
    }
}

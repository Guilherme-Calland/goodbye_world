//
//  ActionShadow.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct ActionShadow : View{
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.7
    private var actionHeight = 40.0
    private var isFunction: Bool
    
    init(isFunction: Bool = false){
        self.isFunction = isFunction
    }
    
    var body : some View {
        Rectangle()
            .fill(Color.black)
            .opacity(0.4)
            .frame(width: isFunction ? actionWidth + actionWidth * 0.15  : actionWidth , height: actionHeight, alignment: .leading)
            .offset(x: isFunction ? 15.5 : -6.0, y: 6.0)
    }
}


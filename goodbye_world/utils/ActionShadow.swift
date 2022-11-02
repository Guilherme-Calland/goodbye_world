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
    var body : some View {
        Rectangle()
            .fill(Color.black)
            .opacity(0.4)
            .frame(width: actionWidth, height: actionHeight, alignment: .leading)
            .offset(x: -6.0, y: 6.0)
    }
}

struct FunctionShadow : View{
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.7  //actionWidth*0.15
    
    init(){
        actionWidth += actionWidth*0.15
    }
    
    private var actionHeight = 40.0
    var body : some View {
        Rectangle()
            .fill(Color.black)
            .opacity(0.4)
            .frame(width: actionWidth, height: actionHeight, alignment: .leading)
            .offset(x: -16.0, y: 6.0)
            
    }
}






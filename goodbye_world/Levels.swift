//
//  Levels.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

struct Levels: View {
    
    @StateObject var g = GlobalVars()
    
    var body: some View{
        ZStack{
            if(g.level == "level1Tut"){
                LevelOneTutorial()
            }else if(g.level == "level1"){
    //            LevelOne
                ZStack{
                    Rectangle().fill(Color(.black))
                }
            }
        }
    }
}

class GlobalVars : ObservableObject {
    @Published var level = "level1Tut"
}

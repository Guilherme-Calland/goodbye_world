//
//  Levels.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 24/10/22.
//

import SwiftUI

struct Levels: View {
    
    @StateObject var data = Data()
    
    var body: some View{
        ZStack{
            if(data.level == "level1tut"){
                LevelOneTutorial()
            }else if(data.level == "level1"){
                LevelOne()
            }
        }.environmentObject(data)
            .navigationBarTitle("")
                .navigationBarHidden(true)
    }
}



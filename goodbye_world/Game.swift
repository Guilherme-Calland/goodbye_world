//
//  Game.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 01/11/22.
//

import SwiftUI

struct Game : View {
    @StateObject var data: Data = Data()
    
    init(){
        UINavigationBar.setAnimationsEnabled(false);
        SoundManager.Instance.playMusic(file_name: "music");
    }
    
    var body: some View{
        LevelTwoTutorial()
            .environmentObject(data)
    }
}

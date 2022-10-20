//
//  ConfigsScreen.swift
//  goodbye_world
//
//  Created by Igor Rocha on 10/10/22.
//

import SwiftUI

struct ConfigsScreen: View {
    @State private var volumeM: Double = 0
    
    @State private var volumeS: Double = 0
    
    var body: some View {
       
        VStack {
            Textinho.FonteBonita("Configurações", 60)
            Spacer()
            VStack {
                Textinho.FonteBonita("Áudio", 40)
                    .padding()
                VStack {
                    Textinho.FonteBonita("Volume da Música", 30)
                        .padding()
                    Slider(value: $volumeM,
                            in: 0 ... 100)
                    
                    Textinho.FonteBonita("Volume do Som", 30)
                        .padding()
                    Slider(value: $volumeS,
                            in: 0 ... 100)
                }
                Textinho.FonteBonita("Legendas", 40)
                    .padding()
                Textinho.FonteBonita("On/Off", 25)
            }
            Spacer()
        }
    }
}

struct ConfigsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConfigsScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

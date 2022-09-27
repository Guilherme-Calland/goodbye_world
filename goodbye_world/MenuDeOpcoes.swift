//
//  MenuDeOpcoes.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct MenuDeOpcoes: View {
    var body: some View {
        VStack {
            Text("Menu de Opções").font(.system(size: 30))
            
            Spacer()
            Button("Progresso", action: {}).font(.system(size: 30)).padding()
            Button("História", action: {}).font(.system(size: 30)).padding()
            Button("Configurações", action: {}).font(.system(size: 30)).padding()
            Button("Saves", action: {}).font(.system(size: 30)).padding()
            Button("Voltar", action: {}).font(.system(size: 30))
            Spacer()
        }
        
    }
}

struct MenuDeOpcoes_Previews: PreviewProvider {
    static var previews: some View {
        MenuDeOpcoes()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

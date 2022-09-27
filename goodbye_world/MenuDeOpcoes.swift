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
            Text("Menu de Opções").font(.system(size: 50))
            HStack {
                Image("Juquinha").padding()
                
                VStack {
                    Spacer()
                    Button("Progresso", action: {}).font(.system(size: 30)).padding()
                        .border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    
                    Button("História", action: {}).font(.system(size: 30)).padding()
                        .border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    
                    Button("Configurações", action: {}).font(.system(size: 30)).padding()
                        .border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    
                    Button("Saves", action: {}).font(.system(size: 30)).padding()
                        .border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    
                    Button("Voltar", action: {}).font(.system(size: 30))
                        .padding()
                        .border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    Spacer()
                }
                
                Image("robo1 1").padding()
            }
            
        }
        
    }
}

struct MenuDeOpcoes_Previews: PreviewProvider {
    static var previews: some View {
        MenuDeOpcoes()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

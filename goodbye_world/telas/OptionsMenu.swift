//
//  MenuDeOpcoes.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct OptionsMenu: View {
    var body: some View {
        NavigationView{
        VStack {
            Textinho.FonteBonita("Menu de Opções",60)
            Spacer()
            
            
            HStack {
                Image("Juquinha").padding()
                
                VStack {
                        NavigationLink(destination: ProgressScreen()){
                            Textinho.FonteBonita("Progresso",30)
                                .padding()
                                .border(.black)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(15)
                        }

                    NavigationLink(destination: StoryScreen()){
                        Textinho.FonteBonita("História",30)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }
                        
                    NavigationLink(destination: ConfigsScreen()){
                        Textinho.FonteBonita("Configurações",30)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: SaveScreen()){
                        Textinho.FonteBonita("Saves",30)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: InitScreen()){
                        Textinho.FonteBonita("Voltar",30)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }
                }.foregroundColor(.black)

                
                Image("robo1 1").padding()
            }
            Spacer()
            Spacer()
            
        }.frame(height: UIScreen.main.bounds.height)
        }.navigationViewStyle(StackNavigationViewStyle.stack)
            .frame(width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height)
        
    }
}

struct OptionsMenu_Previews: PreviewProvider {
    static var previews: some View {
        OptionsMenu()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

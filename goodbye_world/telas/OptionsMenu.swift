//
//  MenuDeOpcoes.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct OptionsMenu: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var data: Data = Data()
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView{
        VStack {
            Textinho.FonteBonita("Menu de Opções",60)
            Spacer()
            
            
            HStack {
                Image("Juquinha").padding()
                
                VStack {
                        NavigationLink(destination: ProgressScreen()){
                            Textinho.FonteBonita("Progresso",29)
                                .padding()
                                .border(.black)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(15)
                        }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)

                    NavigationLink(destination: StoryScreen()){
                        Textinho.FonteBonita("História",29)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        
                    NavigationLink(destination: ConfigsScreen()){
                        Textinho.FonteBonita("Configurações",29)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    
                    NavigationLink(destination: SaveScreen()){
                        Textinho.FonteBonita("Saves",29)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    
                    NavigationLink(destination: InitScreen()){
                        Textinho.FonteBonita("Voltar",29)
                            .padding()
                            .border(.black)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                    }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true).onTapGesture {
                            dismiss()
                        }
                }
                    
                
                Image("robo1 1").padding()
            }
            Spacer()
            Spacer()
            
        }.frame(height: UIScreen.main.bounds.height)
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle.stack)
            .environmentObject(data)
            .frame(width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
    }
}

struct OptionsMenu_Previews: PreviewProvider {
    static var previews: some View {
        OptionsMenu()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

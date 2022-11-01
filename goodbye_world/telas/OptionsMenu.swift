//
//  MenuDeOpcoes.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct OptionsMenu: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var data: Data
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView{
        VStack {
            Textinho.FonteBonita(menu_title[data.language] ?? "",60)
            Spacer()
            
            
            HStack {
                Spacer()
                Image("Juquinha")
                    .frame(width: 100, height: 100)
                Spacer()
                VStack {
                    HStack{
                        Image(data.language == Language.portuguese ? "flag_brasil" : "flag_brasil_unselected")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 90, height: 60)
                            .onTapGesture{
                                data.language = Language.portuguese
                            }
                        Spacer()
                        Image(data.language == Language.english ? "flag_usa" : "flag_usa_unselected")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 90, height: 60)
                            .onTapGesture {
                                data.language = Language.english
                            }
                    }.frame(width: 300, height: 100, alignment: .top)
                    
//                        NavigationLink(destination: ProgressScreen()){
                    HStack{
                        LockImage()
                        Textinho.FonteBonita(menu_progress[data.language] ?? "",29)
                                    .padding()
                                            .foregroundColor(.white)
                                            .background(Color.gray)
                                            .cornerRadius(15)
    //                        }
                            .foregroundColor(.black).buttonStyle(NoClickAnimation())
                            .navigationTitle("")
                            .navigationBarHidden(true)
                        LockImage()
                            .opacity(0.0)
                    }
                    

                    NavigationLink(destination: StoryScreen()){
                    HStack{
                       
                        Textinho.FonteBonita(menu_story[data.language] ?? "",29)
                            .padding()
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                        
                    }
                        
                    }
                .foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        
//                    NavigationLink(destination: ConfigsScreen()){
                    HStack{
                        LockImage()
                        Textinho.FonteBonita(menu_volume[data.language] ?? "",29)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(15)
                        LockImage().opacity(0.0)
                    }
                    
                    //linguagem aqui
                        
//                    }
                .foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    
                    //NavigationLink(destination: SaveScreen()){
                        HStack{
                            LockImage()
                            Textinho.FonteBonita(menu_saves[data.language] ?? "",29)
                                .padding()
                               
                                        .foregroundColor(.white)
                                        .background(Color.gray)
                                        .cornerRadius(15)
                            LockImage()
                                .opacity(0.0)
                        //}
                        
                    }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    
                    NavigationLink(destination: InitScreen()){
                        
                        Textinho.FonteBonita(menu_back[data.language] ?? "",29)
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
                Spacer()
                Image("robo1 1").frame(width: 100, height: 100)
                Spacer()
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

struct LockImage : View{
    var body: some View{
        Image("lock2")
            .resizable()
            .interpolation(.none)
            .frame(width: 30, height: 30)
    }
}

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
                Spacer()
                Image("Juquinha")
                    .frame(width: 100, height: 100)
                Spacer()
                VStack {
//                        NavigationLink(destination: ProgressScreen()){
                    HStack{
                        LockImage()
                                Textinho.FonteBonita("Progresso",29)
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
                       
                        Textinho.FonteBonita("História",29)
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
                        Textinho.FonteBonita("Configurações",29)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(15)
                        LockImage().opacity(0.0)
                    }
                        
//                    }
                .foregroundColor(.black).buttonStyle(NoClickAnimation())
                        .navigationTitle("")
                        .navigationBarHidden(true)
                    
                    //NavigationLink(destination: SaveScreen()){
                        HStack{
                            LockImage()
                            Textinho.FonteBonita("Saves",29)
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

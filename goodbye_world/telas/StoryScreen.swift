//
//  TelaHistoria.swift
//  goodbye_world
//
//  Created by Igor Rocha on 29/09/22.
//

import SwiftUI

struct StoryScreen: View {
    
    @EnvironmentObject var data: Data
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                NavigationLink(destination: OptionsMenu()){
                    Textinho.FonteBonita(" < ", 40)
                        
                        .border(.black)
                        .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(15)
                }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                Spacer()
                Spacer()
                
                Textinho.FonteBonita(story_title[data.language] ?? "", 60).padding().foregroundColor(.white)
                
                Spacer()
                Spacer()
                
                
                Spacer()
                
            }
            HStack {
                Spacer()
                VStack{
                    Textinho.FonteBonita(story_text1[data.language] ?? "", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(story_text2[data.language] ?? "", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(story_text3[data.language] ?? "", 18).foregroundColor(.white)
                }.frame(width: 460, height: 420, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
                VStack{
                    Spacer()
                    Textinho.FonteBonita(story_text4[data.language] ?? "", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(story_text5[data.language] ?? "", 18).foregroundColor(.white)
                    Spacer()
                    Spacer()
                }.frame(width: 460, height: 420, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
            }
            Spacer()
            Image("robo2_b")
            Spacer()
        }.frame(height: UIScreen.main.bounds.height).background(.black)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .environmentObject(data)
    }
}

struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

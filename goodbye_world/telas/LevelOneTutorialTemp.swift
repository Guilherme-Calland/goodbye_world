//
//  LevelOneTutorialTemp.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 05/10/22.
//

import SwiftUI

struct LevelOneTutorialTemp: View {
    @Environment(\.dismiss) private var dismiss
    
    var panelWidth = UIScreen.main.bounds.width/2.2
    @State private var fadeIn = true
    
    var body: some View {
        ZStack{
            ZStack(alignment: .bottomTrailing){
                HStack{
                    Image("LevelOneTutorial1")
                        .resizable()
                        .interpolation(.none)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10.0){
                        Rectangle().fill(Color(.white)).frame(height: 0.0)
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill(Color("customOrange"))
                                .frame(width: panelWidth, height: .infinity, alignment: .leading)
                                .border(.black)
                            Text("Ações")
                                .padding()
                                .border(.black)
                        }
                        .opacity(1.0)
                        
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill(Color("customGreen"))
                                .border(.black)
                            Text("Execução")
                                .padding()
                                .border(.black)
                            
                        }.frame(width: panelWidth, height: .infinity)
                        .opacity(1.0)

                        Rectangle()
                            .fill(Color(.white))
                            .frame(height: 4.0)
                    }.frame(height: UIScreen.main.bounds.height)
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 5.0)
                }.frame(width: UIScreen.main.bounds.width)
                    .navigationBarTitle("")
                    .navigationBarHidden(true).onTapGesture {
                        dismiss()
                    }
                Image("execution-buttom")
                    .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 20, trailing: 10))
                    .opacity(1.0)
            }
            
            InitScreenPlaceholder().onAppear(){
                withAnimation(Animation.linear(duration: 1.0)){
                    fadeIn.toggle()
                }
            }.opacity(fadeIn ? 1: 0)
        }
        
        
        
        
    }
}

struct LevelOneTutorialTemp_Previews: PreviewProvider {
    static var previews: some View {
        LevelOneTutorialTemp()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

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
    @State private var fadeToWhite = false
    @State private var imageAppear = false
    @State private var clickOnScreenAppear = false
    @State private var actionPanelAppear = false
    @State private var executionPanelAppear = false
    @State private var executionButtonAppear = false
    @State private var clickForNext = false
    @State private var translucentScreenReady = false
    @State private var translucentScreenShow = false
    @State private var imageContrastShow = false
    
    var body: some View {
    
        ZStack(alignment: .bottom){
            ZStack(alignment: .bottomTrailing){
                HStack{
                    Image("tut1.1")
                        .resizable()
                        .interpolation(.none)
                        .opacity(imageAppear ? 1 : 0)
                        .onAppear(){
                            withAnimation(Animation.linear(duration: 1).delay(1.5)){
                                imageAppear.toggle()
                            }
                        }
                    VStack(alignment: .trailing, spacing: 10.0){
                        Rectangle().fill(Color(.white)).frame(height: 10.0)
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill(Color("customOrange"))
                                .frame(width: panelWidth, height: .infinity, alignment: .leading)
                                .border(.black, width: 4)
                            Textinho.FonteBonita("acoes")
                                .padding()
                                .border(.black, width: 4)
                        }
                        .opacity(actionPanelAppear ? 1 : 0)
                        
                        ZStack(alignment: .topLeading){
                            Rectangle()
                                .fill(Color("customGreen"))
                                .border(.black, width: 4)
                            Textinho.FonteBonita("Execucao")
                                .padding()
                                .border(.black, width: 4)
                        }.frame(width: panelWidth, height: .infinity)
                            .opacity(executionPanelAppear ? 1 : 0)
                        Rectangle()
                            .fill(Color(.white))
                            .frame(height: 14.0)
                    }.frame(height: UIScreen.main.bounds.height)
                        
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 5.0)
                }.frame(width: UIScreen.main.bounds.width)
                
                
                Image("execution-buttom")
                    .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 40, trailing: 20))
                    .opacity(executionButtonAppear ? 1 : 0)
//                    .onTapGesture {
//                        dismiss()
//                    }
            //
                
            }
            
            
            Rectangle()
                .fill(Color(.black))
                .opacity(translucentScreenShow ? 0.5 : 0)
            ZStack{
                Rectangle()
                    .fill(Color(.white))
                    .frame(width: 800, height: 40)
                    .border(.black, width: 4)
                Textinho.FonteBonita("Clique em qualquer lugar de tela para prosseguir")
                    
            }
            .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 60.0, trailing: 0.0))
            .opacity(clickForNext ? 1 : 0)
            .onAppear(){
                translucentScreenReady = true
                showClickForNext()
            }//
            
            HStack{
                Image("tut1.2")
                    .resizable()
                    .interpolation(.none)
                Rectangle().fill().opacity(0.0)
            }.opacity(imageContrastShow ? 1 : 0)
                .padding(EdgeInsets.init(top:0, leading:0, bottom: 0, trailing: 14))
            
            
            InitScreenPlaceholder().onAppear(){
                withAnimation(Animation.linear(duration: 1.0)){
                    fadeToWhite.toggle()
                }
            }.opacity(fadeToWhite ? 0: 1)
                
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onTapGesture(){
            if translucentScreenReady {
                showTranslucentScreen()
                hideClickForNext()
            }
        }
        
    }
    
    func showTranslucentScreen(){
        withAnimation(Animation.linear(duration: 1.0)){
            translucentScreenShow = true
            toggleContrastImage()
        }
    }
    
    func showClickForNext(){
        withAnimation(Animation.linear(duration: 1.0).delay(3.0)){
            clickForNext = true
        }
    }
    
    func hideClickForNext(){
        withAnimation(Animation.linear(duration: 1.0)){
            clickForNext = false
        }
    }
    
    func toggleContrastImage(){
        withAnimation(Animation.linear(duration: 1.0).delay(1.0)){
            imageContrastShow.toggle()
        }
    }
}

struct LevelOneTutorialTemp_Previews: PreviewProvider {
    static var previews: some View {
        LevelOneTutorialTemp()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

//
//  LevelOneTutorialTemp.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 05/10/22.
//

import SwiftUI

struct LevelOneTutorialNew: View {
    @Environment(\.dismiss) private var dismiss
    private var panelWidth = UIScreen.main.bounds.width * 0.4
    @State private var fadePlaceholderScreen = false
    @State private var imageShow = false
    @State private var clickOnScreenAppear = false
    @State private var actionPanelAppear = true
    @State private var executionPanelAppear = true
    @State private var executionButtonAppear = false
    @State private var clickForNext = false
    @State private var translucentScreenReady = false
    @State private var translucentScreenShow = false
    @State private var imageContrastShow = false
    
    
    
    var body: some View {
    
        ZStack(alignment: .bottom){
            ZStack(alignment: .bottomTrailing){
                HStack{
                    
                    //Imagem Principal
                    Image("tut1.1")
                        .resizable()
                        .interpolation(.none)
                        .opacity(imageShow ? 1 : 0)
                        
                    VStack(alignment: .trailing){
                        //Rectangle().fill(Color(.white)).frame(height:15)
                        Spacer()
                        //Area de Acoes
                        ActionArea(actions: [])
                        .opacity(actionPanelAppear ? 1 : 0)
                        Spacer()
                        
                        //Area de Execucoes
                        ExecutionArea(actions: [])
                        .opacity(executionPanelAppear ? 1 : 0)
                
                        Spacer()
                        //Rectangle().fill(Color(.white)).frame(height:20)
            
                    }.frame(height: UIScreen.main.bounds.height)
                    
                    Rectangle().fill(Color(.white)).frame(width:10)
                    
                }.frame(width: UIScreen.main.bounds.width)
                
                
                Image("execution-buttom")
                    .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 45, trailing: 25))
                    .opacity(executionButtonAppear ? 1 : 0)
//                    .onTapGesture {
//                        dismiss()
//                    }
            //
                
            }
            
            // Tela meio transparente 1
//            true ?
//            Rectangle()
//                .fill(Color(.black))
//                .opacity(translucentScreenShow ? 0.5 : 0.00001)
//                .highPriorityGesture(
//                    TapGesture().onEnded{
//                        if translucentScreenReady {
//                            showTranslucentScreen()
//                            hideClickForNext()
//                        }
//                    }
//                )
//            : Rectangle()
            
            
            // Mensagem: clique em qualquer lugar para prosseguir
            ZStack{
                Rectangle()
                    .fill(Color(.white))
                    .frame(width: 800, height: 40)
                    .border(.black, width: 4)
                Textinho.FonteBonita("Clique em qualquer lugar de tela para prosseguir")
                    
            }
            .padding(EdgeInsets.init(top: 0.0, leading: 0.0, bottom: 60.0, trailing: 0.0))
            .opacity(clickForNext ? 1 : 0)
            
            HStack{
                Image("tut1.2")
                    .resizable()
                    .interpolation(.none)
                Rectangle().fill().opacity(0.0)
                    .frame(width: panelWidth)
            }.opacity(imageContrastShow ? 1 : 0)
                .padding(EdgeInsets.init(top:0, leading:0, bottom: 0, trailing: 14))
            
            // Apenas a imagem da tela inicial
            InitScreenPlaceholder().onAppear(){
                placeholderScreenFade()
            }.opacity(fadePlaceholderScreen ? 0 : 1)
                //
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
//        .onTapGesture(){
//            if translucentScreenReady {
//                showTranslucentScreen()
//                hideClickForNext()
//            }
//        }
        
    }
    
    // Animacao que some com a tela que mostra a imagem da tela inicial
    func placeholderScreenFade(){
        withAnimation(Animation.linear(duration: 1.0)){
            fadePlaceholderScreen = true
            showImage()
        }
    }
    
    // mostra tela transparente que serve para dar contraste aos itens em destaque
    func showTranslucentScreen(){
        withAnimation(Animation.linear(duration: 1.0)){
            translucentScreenReady = false
            translucentScreenShow = true
            showContrastImage()
            hideClickForNext()
        }
    }
    
    // Mensagem de clicar na tela para prosseguir
    func showClickForNext(delay: Double){
        withAnimation(Animation.linear(duration: 1.0).delay(delay)){
            clickForNext = true
        }
    }
    
    // esconde a mensagem de clicar na tela para prosseguir
    func hideClickForNext(){
        withAnimation(Animation.linear(duration: 1.0)){
            clickForNext = false
        }
    }
    
    // mostra a imagem que está em contraste, ou seja, a imagem que está na frente da tela meio transparente
    func showContrastImage(){
        withAnimation(Animation.linear(duration: 1.0).delay(1.0)){
            imageContrastShow = true
        }
    }
    
    // mostra a imagem principal
    func showImage(){
        withAnimation(Animation.linear(duration: 1).delay(1.0)){
            imageShow = true
            showClickForNext(delay: 2.0)
            translucentScreenReady = true
        }
    }
}

struct LevelOneTutorialNew_Previews: PreviewProvider {
    static var previews: some View {
        LevelOneTutorialNew()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

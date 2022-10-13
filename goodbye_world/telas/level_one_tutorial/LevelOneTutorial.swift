//
//  LevelOneTutorialTemp.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 05/10/22.
//

import SwiftUI

// Essas opcoes foram criadas em outro lugar ;p "PainelTesteView"
var correct_output : [Opcao] = [opcao3, opcao2, opcao1]
var panelWidth = UIScreen.main.bounds.width * 0.4
var screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height

var falarOla = Opcao(nome: "falar ola", actionHandler: {() in print("olar")});

var funcoesTutOne : [Opcao] = [falarOla]

struct LevelOneTutorial: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var fadePlaceholderScreen = false
    @State private var imageShow = false
    @State private var clickOnScreenAppear = false
    @State private var executionButtonAppear = true
    @State private var clickForNext = false
    @State private var translucentScreenReady = false
    @State private var translucentScreenShow = false
    @State private var imageContrastShow = false
    @State private var actionAreaReady = false
    @State private var executionAreaReady = false
    @State private var actionAreaShow = false
    @State private var executionAreaShow = false
    @State private var contrastActionAreaShow = false
    @State private var contrastExecutionAreaShow = false
    @State private var contrastImagePath = "tut1.2"
    @State private var contrastFirstTextShow = false
    @State private var mainTextShow = false
    @State private var isMainTextUp = true
    @State private var mainText = "Isso é a área de acoes\n\naqui aparecerá todas as escolhas que você poderá fazer."
    @State private var actionAndExecutionAreaReady = false
    @State private var fullScreenClick = true
    
    @StateObject var painelFuncoes = Painel(funcoesTutOne);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 1, correct_output: funcoesTutOne);
    
    var body: some View {
    
        ZStack(alignment: .bottom){
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
                            ActionArea().environmentObject(painelExecucao).environmentObject(painelFuncoes)
                            .opacity(actionAreaShow ? 1 : 0)////
                            Spacer()
                            
                            //Area de Execucoes
                            ExecutionArea().environmentObject(painelExecucao).environmentObject(painelFuncoes)//(painelExecucao: painelExecucao, painelAcoes: painelFuncoes)
                            .opacity(executionAreaShow ? 1 : 0)
                    
                            Spacer()
                            //Rectangle().fill(Color(.white)).frame(height:20)
                
                        }.frame(height: UIScreen.main.bounds.height)
                        
                        Rectangle().fill(Color(.white)).frame(width:10)
                        
                    }.frame(width: UIScreen.main.bounds.width)
                    
                    
                    ExecutionButton()
                        .opacity(executionButtonAppear ? 1 : 0)
                        .onTapGesture {
                            if (painelExecucao.executar() == false){
                                print("Verificão falhou");
                            }else{
                                print("Verificão passou");
                            }
                        }
                
                    
                }
                
                // Tela meio transparente 1
                Rectangle()
                    .fill(Color(.black))
                    .opacity(translucentScreenShow ? 0.5 : 0.0)
    //            : Rectangle()//
                
                
                // Image that shows in front  of the translucent screen
                ContrastImage(contrastImagePath: contrastImagePath)
                .opacity(imageContrastShow ? 1 : 0)
                    .padding(EdgeInsets.init(top:0, leading:0, bottom: 0, trailing: 14))
                
                // Apenas a imagem da tela inicial
                InitScreenPlaceholder().onAppear(){
                    placeholderScreenFade()
                }.opacity(fadePlaceholderScreen ? 0 : 1)
                
                
                    //
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            // o textinho que aparece: este é você
            InitialContrastTextPopup(text: "esse é você")
            .opacity(contrastFirstTextShow ? 1 : 0)
            
            // Texto tutorial principal
            HStack{
                VStack{
                    if(!isMainTextUp){
                        Spacer()
                    }
                    MainTextPopup(text: mainText)
                        .offset(x: 30.0, y: isMainTextUp ? 40 : -40)
                    if(isMainTextUp){
                        Spacer()
                    }
                    
                }
                Spacer()
                
            }
                .opacity(mainTextShow ? 1 : 0)
                
            
            VStack{
                Spacer()
                // area de acoes que aparece na frente da tela translucida
                ContrastActionArea()
                    .opacity(contrastActionAreaShow ? 1 : 0)
                Spacer()
                // area de execucao que aparece na frente da tela translucida
                ContrastExecutionArea()
                    .opacity(contrastExecutionAreaShow ? 1 : 0)
            }
            
            // Mensagem: clique em qualquer lugar para prosseguir
            ClickForNextPopup()
            .opacity((clickForNext) ? 1 : 0)
            
            // tela para clicar para avancar
            if(fullScreenClick){
                ZStack{
                    Rectangle().fill().opacity(0.0001)
                }.highPriorityGesture(
                    TapGesture().onEnded{
                        if translucentScreenReady {
                            translucentScreenReady = false
                            showTranslucentScreen()
                            DispatchQueue.main.asyncAfter(deadline: .now() +  2.0){
                                actionAreaReady = true
                            }
                        }
                        else if(actionAreaReady){
                            actionAreaReady = false
                            hideClickForNext()//
                            showClickForNext(delay: 3.0)
                            showContrastActionArea()
                            DispatchQueue.main.asyncAfter(deadline: .now() +  3.0){
                                executionAreaReady = true
                            }
                            
                        }
                        else if(executionAreaReady){
                            executionAreaReady = false
                            hideClickForNext()
                            showClickForNext(delay: 2.0)
                            showContrastExecutionArea()
                            wait(time: 2.0, doAfter: {
                                actionAndExecutionAreaReady = true
                            })
                        }
                        else if(actionAndExecutionAreaReady){
                            actionAreaReady = false
                            hideClickForNext()
                            hideContrastImage()
                            hideContrastActionAndExecutionAreas()
                            showActionAndExecutionArea()
                            hideTranslucentScreen()
                        }
                    }
                )
            }
        }
    }
    
    func hideContrastActionAndExecutionAreas(){
        withAnimation(Animation.linear(duration: 1.0)){
            contrastActionAreaShow = false
            contrastExecutionAreaShow = false
        }
    }
    
    func hideTranslucentScreen(){
        withAnimation(Animation.linear(duration: 1.0)){
            translucentScreenShow = false
        }
    }
    
    func wait(time: Double, doAfter: @escaping () -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + time){
            doAfter()
        }
    }
    
    // Animacao que some com a tela que mostra a imagem da tela inicial
    func placeholderScreenFade(){
        withAnimation(Animation.linear(duration: 1.0)){
            fadePlaceholderScreen = true
            showImage()
        }
    }
    
    func showActionAndExecutionArea(){
        withAnimation(Animation.linear(duration: 1.0)){
            actionAreaShow = true
            executionAreaShow = true
            fullScreenClick = false
            hideMainText(delay: 0.0)
        }
    }
    
    // mostra tela transparente que serve para dar contraste aos itens em destaque
    func showTranslucentScreen(){
        withAnimation(Animation.linear(duration: 1.0)){
            translucentScreenReady = false
            translucentScreenShow = true
            showContrastImage()
            showContrastFirstText()
            hideClickForNext()
            showClickForNext(delay: 2.0)

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
        }//
    }
    
    // mostra a imagem que está em contraste, ou seja, a imagem que está na frente da tela meio transparente
    func showContrastImage(delay: Double = 1.0){
        withAnimation(Animation.linear(duration: 1.0).delay(delay)){
            imageContrastShow = true
        }
    }
    
    func showContrastFirstText(){
        withAnimation(Animation.linear(duration: 1.0).delay(1.0)){
            contrastFirstTextShow = true
        }
    }
    
    func hideContrastFirstText(){
        withAnimation(Animation.linear(duration: 1.0)){
            contrastFirstTextShow = false
        }
    }
    
    // mostra a imagem principal
    func showImage(){
        withAnimation(Animation.linear(duration: 1).delay(1.0)){
            imageShow = true
            showClickForNext(delay: 2.0)
            DispatchQueue.main.asyncAfter(deadline: .now() +  2.0){
                translucentScreenReady = true
            }
        }
    }
    
    func showContrastActionArea(delay: Double = 1.0){
        withAnimation(Animation.linear(duration: 1.0).delay(delay)){
            contrastActionAreaShow = true
            
            hideContrastImage()
            hideContrastFirstText()
            DispatchQueue.main.asyncAfter(deadline: .now() +  1.0){
                contrastImagePath = "tut1.3"
            }
            showContrastImage(delay: 2.0)
            showMainText(delay: 2.0)
            
        }
    }
    
    func showContrastExecutionArea(){
        withAnimation(Animation.linear(duration: 1.0).delay(0.0)){
            contrastExecutionAreaShow = true
            hideContrastImage()
            hideMainText(delay: 0.0)//
            DispatchQueue.main.asyncAfter(deadline: .now() +  1.0){
                contrastImagePath = "tut1.4"
                showMainText(delay: 0.0)
                showContrastImage(delay: 0.0)
                changeMainText(mainTextUp: false,
                               inMainText: "essa é a area de execucões.\n\nas acoes só poderão ser realizadas uma vez que estiverem nessa area")
            }
        }
    }
    
    func changeMainText(mainTextUp: Bool = true, inMainText: String){
        isMainTextUp = mainTextUp
        mainText = inMainText
    }
    
    func hideContrastImage(){
        withAnimation(Animation.linear(duration: 1.0)){
            imageContrastShow = false
        }
    }
    
    func showMainText(delay: Double = 1.0){
        withAnimation(Animation.linear(duration: 1.0).delay(delay)){
            mainTextShow = true
        }
    }
    
    func hideMainText(delay: Double){
        withAnimation(Animation.linear(duration: 1.0).delay(delay)){
            mainTextShow = false
        }
    }
}


struct LevelOneTutorial_Previews: PreviewProvider {
    static var previews: some View {
        LevelOneTutorial()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Data())
    }
}



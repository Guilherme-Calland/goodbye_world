//
//  TelaInicial.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//
import SwiftUI

struct InitScreen: View {
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
        //Start playing music
        SoundManager.Instance.playMusic(file_name: "retrobeat1", type: "mp3");
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: LevelOneTutorialNew()){
                ScreenBody()
            }.foregroundColor(.black).buttonStyle(NoClickAnimation())
        }.navigationViewStyle(StackNavigationViewStyle.stack)
    }
}

struct InitScreen_Previews: PreviewProvider {
    static var previews: some View {
        InitScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ScreenBody : View {
    var body: some View{
        VStack(spacing: 0.0){
            Textinho.FonteBonita("GOODBYE WORLD", 100)
                    
                    HStack(alignment: .center, spacing: -100.0){
                        Image("Juquinha")
                        Image("robo1 1")
                        Image("robo2 1").padding(EdgeInsets(top: 0.0, leading: 40, bottom: 0.0, trailing: 0.0))
                    }
                    
            Textinho.FonteBonita("PRESSIONE EM QUALQUER LUGAR PARA INICIAR", 30)
            .padding(EdgeInsets(top: 40, leading: 0.0, bottom: 0.0, trailing: 0.0))
        }.frame(width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height).padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 100, trailing: 0.0))
    }
}


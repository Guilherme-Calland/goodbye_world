//
//  TelaInicial.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//
import SwiftUI//

struct InitScreen: View {
    
    
    @StateObject var data: Data = Data()
    
    init(){
        UINavigationBar.setAnimationsEnabled(false);
        SoundManager.Instance.playMusic(file_name: "music");
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: Levels()){  
                ScreenBody()
            }.foregroundColor(.black).buttonStyle(NoClickAnimation())
        }.navigationViewStyle(StackNavigationViewStyle.stack)
            .environmentObject(data)
            .navigationBarTitle("")
            .navigationBarHidden(true)
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
            HStack {
            
                Spacer()
                NavigationLink(destination: OptionsMenu()){
                    Image("Barra de opções")
                }.frame(width: 60, height: 50)
                    .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 45))
                
            }
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
        
    }
}

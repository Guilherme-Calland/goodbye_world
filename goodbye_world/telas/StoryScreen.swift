//
//  TelaHistoria.swift
//  goodbye_world
//
//  Created by Igor Rocha on 29/09/22.
//

import SwiftUI

struct StoryScreen: View {
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
                
                Textinho.FonteBonita("História", 60).padding().foregroundColor(.white)
                
                Spacer()
                Spacer()
                
                
                Spacer()
                
            }
            HStack {
                Spacer()
                VStack{
                    Textinho.FonteBonita(" Terra 2237, as IAs evoluíram muito, ao ponto que passaram a se tornar uma ameaça... Robôs e humanos iniciaram uma guerra, que teve os robôs como vencedores.", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" As pessoas mais ricas conseguiram fugir da terra, rumo a e73, um planeta habitável, que os humanos pretendem colonizar.", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" Porém, os humanos mais pobres, que ficaram na terra, passaram a viver como refugiados ou como escravos dos robôs.", 18).foregroundColor(.white)
                }.frame(width: 460, height: 420, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
                VStack{
                    Spacer()
                    Textinho.FonteBonita(" Neste cenário, Juquinha tem que consertar a sua nave para sair da terra e salvar a sua família.", 18).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" Para ter chances contra os robôs e alcançar os seus objetivos, ele terá que passar a agir como um robô, o que colocará a sua humanidade em risco.", 18).foregroundColor(.white)
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
    }
}

struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

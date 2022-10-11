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
            Textinho.FonteBonita("História", 60).foregroundColor(.white)
            Spacer()
            HStack {
                Spacer()
                VStack{
                    Textinho.FonteBonita("Terra 2237, as IAs evoluíram muito, ao ponto que passaram a se tornar uma ameaça... Robôs e humanos iniciaram uma guerra, que teve os robôs como vencedores.", 20).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" As pessoas mais ricas conseguiram fugir da terra, rumo a e73, um planeta habitável, que os humanos pretendem colonizar.", 20).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" Porém, os humanos mais pobres, que ficaram na terra, passaram a viver como refugiados ou como escravos dos robôs.", 20).foregroundColor(.white)
                }.frame(width: 460, height: 420, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
                VStack{
                    Spacer()
                    Textinho.FonteBonita(" Neste cenário, Juquinha tem que consertar a sua nave para sair da terra e salvar a sua família.", 20).foregroundColor(.white)
                    Text("       ")
                    Textinho.FonteBonita(" Para ter chances contra os robôs e alcançar os seus objetivos, ele terá que passar a agir como um robô, o que colocará a sua humanidade em risco.", 20).foregroundColor(.white)
                    Spacer()
                    Spacer()
                }.frame(width: 460, height: 420, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
            }
            Spacer()
            Image("robo2_b")
        }.frame(height: UIScreen.main.bounds.height).background(.black)
    }
}

struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

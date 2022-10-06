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
            Text("História").font(.system(size: 60))
            Spacer()
            HStack {
                Spacer()
                VStack{
                    Text("Terra 2237, as IAs evoluíram muito, ao ponto que passaram a se tornar uma ameaça... Robôs e humanos iniciaram uma guerra, que teve os robôs como vencedores.")
                    Text("       ")
                    Text(" As pessoas mais ricas conseguiram fugir da terra, rumo a e73, um planeta habitável, que os humanos pretendem colonizar.")
                    Text("       ")
                    Text("Porém, os humanos mais pobres, que ficaram na terra, passaram a viver como refugiados ou como escravos dos robôs.")
                }.frame(width: 410, height: 400, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
                VStack{
                    Text("Neste cenário, Juquinha tem que consertar a sua nave para sair da terra e salvar a sua família")
                    Text("       ")
                    Text("Para ter chances contra os robôs e alcançar os seus objetivos, ele terá que passar a agir como um robô, o que colocará a sua humanidade em risco")
                }.frame(width: 410, height: 400, alignment: .leading)
                    .border(.black)
                    .cornerRadius(15)
                Spacer()
            }
            Spacer()
            Image("robo2_b")
        }
    }
}

struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

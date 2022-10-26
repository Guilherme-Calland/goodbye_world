//
//  TutMessage1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct TutMessage1 : View{
    var body: some View{
        VStack{
            ZStack{
                Rectangle().fill(Color(.white)).border(.black, width: 4.0)
                    .frame(width: 500, height: 450)
                Textinho.FonteBonita("isso é a área de funções.\n\nem programacao, uma função é um pedaco de código que faz alguma tarefa específica.\n\no princípio de uma função está, naturalmente, em permitir encapsular uma ideia ou operacão, dando-lhe um nome, e então chamar essa operacão de várias partes do programa simplesmente usando seu nome")
                    .frame(width: 450)
    //
                
            }
            Spacer()
        }
        .offset(x: 20, y: 20.0)
    }
}

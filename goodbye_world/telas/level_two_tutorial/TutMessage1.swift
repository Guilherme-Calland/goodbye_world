//
//  TutMessage1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct TutMessage1 : View{
    var body: some View{
        ZStack{
            Rectangle().fill(Color(.white)).border(.black, width: 4.0)
                .frame(width: 500, height: 450)
            Textinho.FonteBonita("isso é a area de funcões.\n\nem programacao, uma funcao é um pedaco de código que faz alguma tarefa específica.\n\no princípio de uma funcão está, naturalmente, em permitir encapsular uma ideia ou operacão, dando-lhe um nome, e então chamar essa operacão de várias partes do programa simplesmente usando seu nome")
                .frame(width: 450)
//
            
        }.offset(x: 40, y: 0.0)
    }
}

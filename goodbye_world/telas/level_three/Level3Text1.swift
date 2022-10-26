//
//  Level3Text1.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Level3Text1 : View{
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Rectangle().fill(Color(.white)).border(.black, width: 4)
                            .frame(width: 540, height: 200)
                        Textinho.FonteBonita("vamos agora para a linguagem swift.\n\nprint, do inglês, imprimir, é uma função de swift que recebe como parâmetro um texto, e imprime o texto recebido na tela.")
                            .frame(width: 500)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }.offset(x: 40, y: 180)
    }
}

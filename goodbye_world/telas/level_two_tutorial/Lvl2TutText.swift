//
//  Lvl2TutText.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct Lvl2TutText : View {
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Rectangle().fill(Color(.white)).border(.black, width: 4)
                            .frame(width: 520, height: 400)
                        Textinho.FonteBonita("Essa é uma função\n\nfunções muitas vezes recebem parâmetros. parâmetros são informacões que passamos para dentro das funções para controlarmos como ela será executada.\n\npara ver quais parâmetros a função pode receber, aperte na caixinha do lado direito da função.")
                            .frame(width: 500)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }.offset(x: 40, y: 40)
    }
}

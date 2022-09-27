//
//  TelaInicial.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct TelaInicial: View {
    var body: some View {
        VStack {
            
            Text("GOODBYE WORLD").font(.system(size: 75))
            
            HStack(alignment: .center, spacing: -80.0){
                Image("Juquinha")
                Image("robo1 1")
                Image("robo2 1")
            }
            
            Text("PRESSIONE EM QUALQUER LUGAR PARA INICIAR").font(.system(size: 30))
        }
    }
}

struct TelaInicial_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicial()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

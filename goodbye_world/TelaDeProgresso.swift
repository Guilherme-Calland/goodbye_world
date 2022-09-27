//
//  TelaDeProgresso.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct TelaDeProgresso: View {
    var body: some View {
        let rows = [
            GridItem(.flexible())
        ]
        
        VStack {
            Text("Progresso").font(.system(size: 50))
            Spacer()
            ScrollView {
                LazyHGrid (rows: rows) {
                    ForEach(Progresso.listarConteudos()) { cont in
                        VStack {
                            Text(cont.conteudo)
                            Text(cont.progresso)
                        }
                        
                    }
                }
            }
        }
    }
}

struct TelaDeProgresso_Previews: PreviewProvider {
    static var previews: some View {
        TelaDeProgresso()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

struct Progresso: Identifiable {
    var id: UUID = UUID()
    let conteudo: String
    let progresso: String
    
    static func listarConteudos() -> [Progresso] {
        
        return [Progresso(conteudo: "Tutorial", progresso: "15%"),
            Progresso(conteudo: "Variáveis", progresso: "2%"),
            Progresso(conteudo: "Condicionais", progresso: "0%"),
            Progresso(conteudo: "Laços", progresso: "0%")
        ]
    }
}


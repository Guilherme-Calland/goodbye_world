//
//  TelaDeProgresso.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//

import SwiftUI

struct ProgressScreen: View {
    var body: some View {
        let rows = [
            GridItem(.flexible(minimum: 0, maximum: 200), spacing:90)
        ]
        
        VStack(spacing:0) {
            HStack {
                Spacer()
                
                NavigationLink(destination: OptionsMenu()){
                    Textinho.FonteBonita(" < ", 40)
                        
                        .border(.black)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(15)
                }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                Spacer()
                Spacer()
                
                Textinho.FonteBonita("Progresso", 60).padding()
                
                Spacer()
                Spacer()
                
                
                Spacer()
                
            }
            
            Spacer()
            ScrollView(.horizontal) {
                LazyHGrid (rows: rows, alignment: .bottom,
                           spacing: 80) {
                    Spacer()
                    ForEach(Progresso.listarConteudos()) { cont in
                        
                        VStack(spacing:30) {
                            
                            Button {
                                
                            } label: {
                                VStack() {
                                    Textinho.FonteBonita(cont.conteudo, 50)
                                        .padding()
                                    Textinho.FonteBonita(cont.progresso, 40)
                                }.frame(width: 450, height: 300, alignment: .center)
                            }.border(.gray)
                                .foregroundColor(.black)
                                .background {
                                    LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
                                }
                                .cornerRadius(18);                        }
                        
                    }
                }
            }.padding()
            Spacer()
            Image("robo3_pequeno")
            Spacer()
            
        }.frame(height: UIScreen.main.bounds.height)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct ProgressScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressScreen()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

struct Progresso: Identifiable {
    var id: UUID = UUID()
    let conteudo: String
    let progresso: String
    
    static func listarConteudos() -> [Progresso] {
        
        return [Progresso(conteudo: "Tutorial", progresso: "15%"),
            Progresso(conteudo: "Vari??veis", progresso: "2%"),
            Progresso(conteudo: "Condicionais", progresso: "0%"),
            Progresso(conteudo: "La??os", progresso: "0%"),
            Progresso(conteudo: "Arrays", progresso: "0%")
        ]
    }
}


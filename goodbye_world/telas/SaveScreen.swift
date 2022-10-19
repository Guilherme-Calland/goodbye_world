//
//  SaveScreen.swift
//  goodbye_world
//
//  Created by Igor Rocha on 04/10/22.
//

import SwiftUI

struct SaveScreen: View {
    var body: some View {
        let rows = [
                    GridItem(.flexible(minimum: 0, maximum: 200), spacing:90)
                ]
                
                VStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: OptionsMenu()){
                            Textinho.FonteBonita(" < ", 40)
                                
                                .border(.black)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(15)
                        }.foregroundColor(.black).buttonStyle(NoClickAnimation())
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Textinho.FonteBonita("Saves", 60).padding()
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        LazyHGrid (rows: rows, alignment: .center,
                                   spacing: 80) {
                            Spacer()
                            Spacer()
                                .padding()
                                .padding()
                                .padding()
                                .padding()
                            ForEach (Saves.listadesaves()) { cont in
                                VStack(spacing:30) {
                                    
                                    Button {
                                        
                                    } label: {
                                        VStack(){
                                            Textinho.FonteBonita(cont.slot, 65).padding()
                                                .padding()
                                            Textinho.FonteBonita(cont.nivel,45)
                                                
                                        }.frame(width: 450, height: 300, alignment: .center)
                                    }.border(.white)
                                        .foregroundColor(.white)
                                        .background{
                                            LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom)
                                        }
                                        .cornerRadius(18);
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                    Button{
                        
                    }
                label: {
                    Textinho.FonteBonita("Novo Slot +",30)
                        .padding()
                }.border(.black)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    Spacer()
                }.frame(height: UIScreen.main.bounds.height)
            }
        }

        struct SaveScreen_Previews: PreviewProvider {
            static var previews: some View {
                SaveScreen()
        .previewInterfaceOrientation(.landscapeLeft)
            }
        }

        struct Saves: Identifiable {
            var id: UUID = UUID()
            let slot: String
            let nivel: String
            
            static func listadesaves() -> [Saves] {
                
                return [Saves(slot: "Save 1", nivel: "Níveis 5/20"),
                        Saves(slot: "Save 2", nivel: "Níveis 0/20")
                ]
            }
        }

//
//  ContentView.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 27/09/22.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        HStack{
            Text("Good bye, world!").padding()
            Spacer()
            VStack(alignment: .trailing, spacing: 0){
                ZStack(alignment: .topLeading){
                   
                    Rectangle().fill(Color("customOrange")).frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2, alignment: .leading).border(.black)
                    Text("Ações").padding().border(.black)
                }
                Divider()
                ZStack(alignment: .topLeading){
                    Rectangle().fill(Color("customGreen")).frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2, alignment: .trailing).border(.black)
                    Text("Execução").padding().border(.black)
                    VStack(alignment: .trailing){
                        Image("execution-buttom")
                    }
                    
                    
                }.frame(height: UIScreen.main.bounds.height/2)
                
            }.frame(height: UIScreen.main.bounds.height)
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

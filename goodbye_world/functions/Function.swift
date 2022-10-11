//
//  Action.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct Function : View {
    var options = ["","Hello World", "Goodbye World", "Olá Mundo"]
    @State private var selectedOption = ""
    
    var body : some View {
        VStack{
            Picker("Escolha o Parametro", selection:$selectedOption){
                ForEach(options, id: \.self ){
                    Text("Falar(\($0))")
                }
               
            }
            Text(selectedOption)
        }
    }
    

}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Function()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}



//
//  Action.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

let orange1 = Color(#colorLiteral(red: 1, green: 0.5231882333755493, blue: 0.17259114980697632, alpha: 1))
let orange2 = Color(#colorLiteral(red: 1, green: 0.6000000238418579, blue: 0.30588236451148987, alpha: 1))

struct Function : View {
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    var parameters = ["Hello World", "Goodbye World", "Olá Mundo"]
    @State private var selectedParameter = "?"
    @State var dropdown = false

    var body : some View {
        ZStack{
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color( "customOrange"))
                        .frame(width: actionWidth, height: actionHeight, alignment: .leading)
                        .border(.black, width: 4)
                    HStack{
                        Textinho.FonteBonita("Falar")
                        Textinho.FonteBonita("(\(selectedParameter))")
                    }
                }.onTapGesture {
                    dropdown.toggle()
                }
                
                if(dropdown){
                    ForEach(parameters, id: \.self){
                        parameter in
                        ZStack{
                            Rectangle()
                                .fill(Color( "customOrange"))
                                .frame(width: actionWidth, height: actionHeight, alignment: .leading)
                                .border(.black, width: 4)
                            HStack{
                                Text("\(parameter)")
                            }
                        }.onTapGesture{
                            selectedParameter = parameter
                            dropdown.toggle()
                        }
                    }
                }
                            
            }
        }

    }
    

}



struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Function()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}



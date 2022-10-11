//
//  Action.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 07/10/22.
//

import SwiftUI

struct Function : View {
    private var actionWidth = (UIScreen.main.bounds.width * 0.4) * 0.6
    private var actionHeight = 40.0
    var options = ["?","Hello World", "Goodbye World", "Olá Mundo"]
    @State private var selectedOption = "?"
    init() {
     //This changes the "thumb" that selects between items
     UISegmentedControl.appearance().selectedSegmentTintColor = .red
      
     //This changes the color for the whole "bar" background
     UISegmentedControl.appearance().backgroundColor = .purple

      
     //This will change the font size
     UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .headline)], for: .highlighted)
     UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .largeTitle)], for: .normal)
      
     //these lines change the text color for various states
     UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.cyan], for: .highlighted)
     UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.green], for: .selected)
        
   }
    
    func foo(){
        
    }

    var body : some View {
        ZStack{
            Rectangle()
                .fill(Color( "customOrange"))
                .frame(width: actionWidth, height: actionHeight, alignment: .leading)
                .border(.black, width: 4)
            HStack{
                Textinho.FonteBonita("Falar(")
                Menu(content:{
                    ForEach(options, id: \.self){
                        index in
                        Button(action: {selectedOption = index}, label: { Textinho.FonteBonita("\(index)") })
                    }
                }, label:{
                    Textinho.FonteBonita(selectedOption)
                })
                Textinho.FonteBonita(")")
            }.background(Color("customOrange"))
        }
    }
    

}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Function()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}



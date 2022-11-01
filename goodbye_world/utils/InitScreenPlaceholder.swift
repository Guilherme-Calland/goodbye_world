//
//  TelaInicial.swift
//  goodbye_world
//
//  Created by Igor Rocha on 27/09/22.
//
import SwiftUI

struct InitScreenPlaceholder: View {
    
    var text: String
    
    init(text: String){
        self.text = text
    }
    
    
    var body: some View {
        NavigationView{
                ScreenBody(text: text)
        }.navigationViewStyle(StackNavigationViewStyle.stack)
            
    }
}

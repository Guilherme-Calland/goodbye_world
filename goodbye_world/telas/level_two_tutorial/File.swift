//
//  File.swift
//  Goodbye World
//
//  Created by Guilherme Calland Rosa Borba on 25/10/22.
//

import SwiftUI

struct RedArrow: View{
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Image("little_red_arrow")
                    .interpolation(.none)
                    .resizable()
                    .frame(width: 108, height: 102)
                    
            }
            Spacer()
        }.offset(x: 10)
    }
}

//
//  ContrastActionArea.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 13/10/22.
//

import SwiftUI

struct ContrastActionArea : View{
    @StateObject var painelFuncoes = Painel([]);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 3, correct_output: correct_output);
    
    var body : some View {
        HStack(alignment: .top){
            Rectangle().fill(Color(.white)).opacity(0.0)
            ActionArea().environmentObject(painelExecucao).environmentObject(painelFuncoes)
        }.padding(EdgeInsets(top: 20.0, leading: 0.0, bottom: 0.0, trailing: 18))
    }
}


//
//  PainelTesteView.swift
//  goodbye_world
//
//  Created by Lucas campos de morais cavalcanti on 29/09/22.
//

import SwiftUI

func FalarArthur() -> Void{
    print("Arthur")
}

func FalarIgor() -> Void{
    print("Igor")
}

func FalarGuilherme() -> Void{
    print("Guilherme")
}

var acao1 = ActionHandler (action: FalarArthur);

var acao2 = ActionHandler (action: FalarIgor);

var acao3 = ActionHandler (action: FalarGuilherme);

var opcao1 = Opcao(nome: "Printar arthur", actionHandler: acao1);

var opcao2 = Opcao(nome: "Printar Igor", actionHandler: acao2);

var opcao3 = Opcao(nome: "Printar Guilherme", actionHandler: acao3);

var funcoes: [Opcao] = [opcao1, opcao2, opcao3]


struct PainelTesteView: View {
    @StateObject var painelFuncoes = Painel(funcoes);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 3);
    

    var body: some View {
        VStack {
            ForEach(painelFuncoes.funcoes){ funcao in
                Button{
                    painelExecucao.addOpcao(opcao: funcao);
                    painelFuncoes.removeOpcao(opcao: funcao);
                } label: {
                    Textinho.FonteBonita(funcao.nome, 64)
                }
            }
            ForEach(painelExecucao.funcoes){ funcao in
                Button{
                    if (funcao.nome != "nil")
                    {painelFuncoes.addOpcao(opcao: funcao);
                    painelExecucao.removeOpcao(opcao: funcao);}
                } label: {
                    Textinho.FonteBonita(funcao.nome, 64)
                }
                .foregroundColor(.green)
                .background(Color.black)
                //Textinho.FonteBonita(funcao.nome)
            }
            
            Button{
                painelExecucao.executar();
            } label: {
                Textinho.FonteBonita("Executar", 128)
            }
            .foregroundColor(.yellow)
            .background(Color.black)
            Textinho.FonteBonita("fim")
        }
        
    }
}

struct PainelTesteView_Previews: PreviewProvider {
    static var previews: some View {
        PainelTesteView()
    }
}

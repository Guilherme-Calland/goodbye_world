//
//  PainelTesteView.swift
//  goodbye_world
//
//  Created by Lucas campos de morais cavalcanti on 29/09/22.
//

import SwiftUI

func test_print(_ text : String) {
    print(text)
}

var opcao1 = Opcao(nome: "Printar Arthur", actionHandler: {() in print("Arthur")});

var opcao2 = Opcao(nome: "Printar Igor", actionHandler: {() in print("Igor")});

var opcao3 = Opcao(nome: "Printar Guilherme", actionHandler: {() in print("Guilherme")});

var opcao_teste_parametro = OpcaoParametros(nome: "Parametro", actionHandler: test_print, parametros: ["Igor", "Arthur", "Guilherme"])

var opcao_mudar_parametro = Opcao(nome: "(Test)Mudar parametro", actionHandler: {() in opcao_teste_parametro.parametroSelecionado = opcao_teste_parametro.parametros[1]});

//var funcoes: [Opcao] = [opcao1, opcao2, opcao3]
var funcoes: [Opcao] = [opcao1, opcao2, opcao3, opcao_teste_parametro, opcao_mudar_parametro]

struct PainelTesteView: View {
    @StateObject var painelFuncoes = Painel(funcoes);
    @StateObject var painelExecucao = PainelExecucao(max_slots: 3, correct_output: correct_output);
    

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
                    {
                        painelFuncoes.addOpcao(opcao: funcao);
                    painelExecucao.removeOpcao(opcao: funcao);
                        
                        
                    }
                } label: {
                    Textinho.FonteBonita(funcao.nome, 64)
                }
                .foregroundColor(.green)
                .background(Color.black)
                //Textinho.FonteBonita(funcao.nome)
            }
            
            Button{
                //painelExecucao.executar();
                for opcao in painelExecucao.funcoes {
                    opcao.exec();
                }
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

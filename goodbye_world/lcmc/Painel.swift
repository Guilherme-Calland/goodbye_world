//
//  Painel.swift
//  goodbye_world
//
//  Created by Lucas campos de morais cavalcanti on 29/09/22.
//

import Foundation
import UIKit

class Opcao : Equatable, Identifiable{
    static func == (lhs: Opcao, rhs: Opcao) -> Bool {
        return (lhs.nome == rhs.nome)
    }
    
    var nome : String;
    var actionHandler : () -> Void;
    
    init (nome:String, actionHandler : @escaping () -> Void){
        self.nome = nome;
        self.actionHandler = actionHandler;
    }
    
    func exec(){
        self.actionHandler()
    }
}

class OpcaoParametros : Opcao{
    var parametros : [String] = []
    var parametroSelecionado : String = "";
    var actionHandlerG : (String) -> Void;
    
    static func == (lhs: OpcaoParametros, rhs: OpcaoParametros) -> Bool {
        return (lhs.nome == rhs.nome && lhs.parametroSelecionado == rhs.parametroSelecionado)
    }
    
    init (nome:String, actionHandler : @escaping (String) -> Void, parametros : [String]){
        self.parametros = parametros;
        self.parametroSelecionado = self.parametros[0];
        self.actionHandlerG = actionHandler;
        super.init(nome: nome, actionHandler: {});
    }
    
    override func exec() {
        self.actionHandlerG(self.parametroSelecionado);
    }
    
    func OpcaoComResposta (_ parametroCorreto : String) -> OpcaoParametros {
       let copia = OpcaoParametros(nome: self.nome, actionHandler: self.actionHandlerG, parametros: self.parametros);
       copia.parametroSelecionado = parametroCorreto;
       return copia;
   }
    
}

class Painel : ObservableObject{
    @Published var funcoes: [Opcao] = []
    
    init(_ funcoes_list : [Opcao]){
        self.funcoes = funcoes_list
    }
    
    func canAdd() -> Bool{
        return true;
    }
    
    func addOpcao(opcao:Opcao){
        self.funcoes.append(opcao)
    }
    
    func removeOpcao(opcao:Opcao){
        if let index = self.funcoes.firstIndex(of: opcao) {
            self.funcoes.remove(at: index)
        }
    }
}


class PainelExecucao : Painel {
    var max_slots = 0;
    var avaliable_slot = 0;
    var count = 0;
    var correct_output : [Opcao] = [];
    
    let opcao_nil = Opcao(nome: "nil", actionHandler: {});
    
    init(max_slots : Int, correct_output: [Opcao]){
        super.init(Array(repeating: opcao_nil, count: self.max_slots))
        self.max_slots = max_slots
        self.funcoes = Array(repeating: opcao_nil, count: self.max_slots)
        self.correct_output = correct_output
    }
    
    func verificar() -> Bool {
        return (self.correct_output == self.funcoes)
    }
    
    func executar() -> Bool{
        if (self.verificar()){
            for opcao in self.funcoes {
                opcao.exec();
            }
            return true;
        }
        return false;
    }
    
    override func canAdd() -> Bool {
        return (self.count < self.max_slots)
    }
    
    override func addOpcao(opcao:Opcao){
        if (self.canAdd()){
            self.funcoes[self.avaliable_slot] = opcao
            self.avaliable_slot = find_avaliable_slot();
            self.count += 1;
        }
    }
    
    override func removeOpcao(opcao:Opcao){
        if let index = self.funcoes.firstIndex(of: opcao) {
            //self.funcoes.remove(at: index)
            self.funcoes[index] = opcao_nil;
            self.count -= 1;
            if self.avaliable_slot > index{
                self.avaliable_slot = index;
            }else{
                self.avaliable_slot = self.find_avaliable_slot();
            }
        }
    }
    
    func find_avaliable_slot() -> Int{
        //achar um jeito mais pratico de fazer isso
        var index = 0;
        for opcao in self.funcoes {
            if (opcao.nome == "nil"){
                return index
            }
            index += 1;
        }
        return self.max_slots
    }
}

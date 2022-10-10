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
    var actionHandler : ActionHandler;
    
    init (nome:String, actionHandler : ActionHandler){
        self.nome = nome
        self.actionHandler = actionHandler
    }
    
    func exec(){
        self.actionHandler.play()
    }
}

class OpcaoParametros : Opcao{
    var parametros : [String] = []
    var indexSelecionado : Int = 0
    
    init (nome:String, actionHandler : ActionHandler, parametros : [String], indexSelecionado:Int = 0){
        super.init(nome: nome, actionHandler: actionHandler)
        self.parametros = parametros
        self.indexSelecionado = indexSelecionado
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


func nil_test(){
    print("nill guilherm")
}

class PainelExecucao : Painel {
    var max_slots = 0;
    var avaliable_slot = 0;
    var count = 0;
    let opcao_nil = Opcao(nome: "nil", actionHandler: ActionHandler(action: (nil_test)));
    
    init(max_slots : Int){
        super.init(Array(repeating: opcao_nil, count: self.max_slots))
        self.max_slots = max_slots
        self.funcoes = Array(repeating: opcao_nil, count: self.max_slots)
    }
    
    func executar(){
        for opcao in self.funcoes {
            opcao.exec();
        }
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

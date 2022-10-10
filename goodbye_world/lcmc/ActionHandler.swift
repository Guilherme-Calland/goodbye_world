//
//  ActionBox.swift
//  goodbye_world
//
//  Created by Lucas campos de morais cavalcanti on 29/09/22.
//

import Foundation


// Nao soube um nome bom de momento

struct ActionHandler{
    
    //var action: (()->())?
    var action: () -> Void;
    
    func play(){
        self.action();
    }
}

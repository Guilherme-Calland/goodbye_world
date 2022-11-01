//
//  Data.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 10/10/22.
//

import SwiftUI

class Data : ObservableObject {
    @Published var actions = ["action 1", "action 2"]
    @Published var executions = []
    @Published var level = "level1tut"
    @Published var language = Language.english
}





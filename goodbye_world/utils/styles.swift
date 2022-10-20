//
//  styles.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 05/10/22.
//

import SwiftUI

struct NoClickAnimation: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

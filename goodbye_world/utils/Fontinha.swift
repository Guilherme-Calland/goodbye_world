//
//  Fontinha.swift
//  goodbye_world
//
//  Created by Guilherme Calland Rosa Borba on 30/09/22.
//

import Foundation
import SwiftUI

struct Textunho {
    static func FonteBonita(_ texto: String, _ size: CGFloat=20) -> Text{
        return Text(texto).font(Font.custom("Silkscreen-Regular", size: size));
    }
}

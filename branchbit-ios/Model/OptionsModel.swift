//
//  OptionsModel.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

class OptionsModel{
    static func getData() -> [String]{
        return ["Cámara", "Foto", "Nombre Completo","Número Telefónico","Fecha de Nacimiento", "Sexo (Masculio/Femenino)", "Color Favorito"]
    }
    static func getOptions() -> [String]{
        return ["Masculino", "Femenino"]
    }
    static func getColors() -> [UIColor]{
        return [.blue,.brown,.green,.magenta,.cyan]
    }
}

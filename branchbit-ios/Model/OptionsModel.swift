//
//  OptionsModel.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import Foundation

class OptionsModel{
    static func getData() -> [String]{
        return ["Cámara", "Foto", "Nombre Completo","Número Telefónico","Fecha de Nacimiento", "Sexo (Masculio/Femenino)", "Color Favorito"]
    }
    static func getOptions() -> [String]{
        return ["Masculino", "Femenino"]
    }
}

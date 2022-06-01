//
//  DettaglioPercorso.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 01/06/22.
//

import Foundation

public class DettaglioPercorso : Codable {
    public var id_percorso : Int
    public var durata : String
    public var dimore : Array<Dimora>
}

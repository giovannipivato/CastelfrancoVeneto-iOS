//
//  Zona.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 30/03/22.
//

import Foundation

public class Zona : Codable {
    
    public var id : Int
    public var descrizione : Descrizione
    public var dimore : Array<Dimora>
}

/*public struct Zona : Codable {
    
    public var id : Int? = 0
    public var descrizione : Descrizione? = nil
    public var dimore : Array<Dimora>? = nil
    public var monumenti : Array<Dimora>? = nil
    public var bar : Array<Dimora>? = nil
    public var hotel : Array<Dimora>? = nil
    
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case descrizione = "descrizione"
        case dimore      = "dimore"
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self           , forKey: .id         )
        descrizione = try values.decodeIfPresent(Descrizione.self   , forKey: .descrizione)
        dimore      = try values.decodeIfPresent(Array<Dimora>.self , forKey: .dimore     )
        
        monumenti = []
        bar = []
        hotel = []
        
        dimore?.forEach({ d in
            if d.tipologia == "Bar" || d.tipologia == "Ristorante" {
                bar?.append(d)
            }
            else {
                monumenti?.append(d)
            }
        })
    }
    
    init() {

    }
}*/

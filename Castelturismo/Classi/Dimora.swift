//
//  Dimora.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 30/03/22.
//

import Foundation

public class Dimora : Codable {
    
    public var id : Int
    public var zona : Int?
    public var via : String
    public var numero : String
    public var descrizione : Descrizione?
    public var tipologia : String
    public var foto : Array<Foto>
    
    public func getPathCopertina() -> String {
        for f in foto {
            if f.copertina == 1 {
                return f.path
            }
        }
        return ""
    }
    
    public func getPathSfondo() -> String {
        for f in foto {
            if f.copertina == 2 {
                return f.path 
            }
        }
        return ""
    }
}

/*public struct Dimora : Codable {
    
    public var id : Int? = 0
    public var zona : Int? = 0
    public var via : String? = nil
    public var numero : String? = nil
    public var descrizione : Descrizione? = nil
    public var tipologia : String? = nil
    public var foto : Array<Foto>? = nil
    
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case zona        = "zona"
        case via         = "via"
        case numero      = "numero"
        case tipologia   = "tipologia"
        case descrizione = "descrizione"
        case foto        = "foto"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id          = try values.decodeIfPresent(Int.self         , forKey: .id         )
        zona        = try values.decodeIfPresent(Int.self         , forKey: .zona       )
        via         = try values.decodeIfPresent(String.self      , forKey: .via        )
        numero      = try values.decodeIfPresent(String.self      , forKey: .numero     )
        descrizione = try values.decodeIfPresent(Descrizione.self , forKey: .descrizione)
        tipologia   = try values.decodeIfPresent(String.self         , forKey: .tipologia  )
        foto        = try values.decodeIfPresent(Array<Foto>.self , forKey: .foto       )
    }
    
    init() {

    }
    
    public func getPathCopertina() -> String {
        for f in foto! {
            if f.copertina == 1 {
                return f.path ?? ""
            }
        }
        return ""
    }
    
    public func getPathSfondo() -> String {
        for f in foto! {
            if f.copertina == 2 {
                return f.path ?? ""
            }
        }
        return ""
    }
}*/

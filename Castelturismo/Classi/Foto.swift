//
//  Foto.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 30/03/22.
//

import Foundation

public class Foto : Codable {
    
    public var id : Int
    public var dimora : Int
    public var path : String
    public var copertina : Int
}

/*public struct Foto : Codable {
    
    public var id : Int? = 0
    public var dimora : Int? = 0
    public var path : String? = nil
    public var copertina : Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case id        = "id"
        case dimora    = "dimora"
        case path      = "path"
        case copertina = "copertina"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id        = try values.decodeIfPresent(Int.self    , forKey: .id       )
        dimora    = try values.decodeIfPresent(Int.self    , forKey: .dimora   )
        path      = try values.decodeIfPresent(String.self , forKey: .path     )
        copertina = try values.decodeIfPresent(Int.self    , forKey: .copertina)
    }
    
    init() {
        
    }
}*/

//
//  Testo.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import Foundation

public class Descrizione : Codable {
    
    public var it : String? = nil
    public var en : String? = nil
}

/*public struct Descrizione : Codable {
    
    public var it : String? = nil
    public var en : String? = nil
    
    enum CodingKeys: String, CodingKey {
        case it = "it"
        case en = "en"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        it = try values.decodeIfPresent(String.self, forKey: .it)
        en = try values.decodeIfPresent(String.self, forKey: .en)
    }
    
    init() {

    }
}*/

//
//  Testo.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/05/22.
//

import Foundation

public class Testo {
    public static func getDescrizione(_ descrizione: String) -> String {
        let lingua = NSLocale.preferredLanguages[0].prefix(2)
        print(lingua)
        
        let descrizioni = descrizione.split(separator: "<")
        var en = ""
        for d in descrizioni {
            if d.starts(with: lingua) {
                return String(d.dropFirst(3))
            }
            else if d.starts(with: "en") {
                en = String(d.dropFirst(3))
            }
        }
        return en
    }
}

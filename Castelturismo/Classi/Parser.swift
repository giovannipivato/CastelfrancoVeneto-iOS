//
//  Parser.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/05/22.
//

import Foundation

import Foundation

public class Parser {
    public static func getZona(from json : Data) -> Zona? {
        do {
            let zona = try JSONDecoder().decode(Zona.self, from: json)
            return zona
        } catch {
            print(error)
            return nil
        }
    }
    
    public static func getDimoreFiltri(from json : Data) -> [Dimora]? {
        do {
            let dimore = try JSONDecoder().decode([Dimora].self, from: json)
            return dimore
        } catch {
            print(error)
            return nil
        }
    }
    
    public static func getFiltri(from json : Data) -> [Filtro]? {
        do {
            let filtri = try JSONDecoder().decode([Filtro].self, from: json)
            return filtri
        } catch {
            print(error)
            return nil
        }
    }
    
    public static func getPercorsi(from json: Data) -> [Percorso]? {
        do {
            let percorsi = try JSONDecoder().decode([Percorso].self, from: json)
            return percorsi
        } catch {
            print(error)
            return nil
        }
    }
    
    public static func getPercorso(from json: Data) -> Percorso? {
        do {
            let percorso = try JSONDecoder().decode(Percorso.self, from: json)
            return percorso
        } catch {
            print(error)
            return nil
        }
    }
}

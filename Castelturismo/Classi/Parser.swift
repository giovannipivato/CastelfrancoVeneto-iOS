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
            print(dimore.count)
            return dimore
        } catch {
            print(error)
            return nil
        }
    }
}

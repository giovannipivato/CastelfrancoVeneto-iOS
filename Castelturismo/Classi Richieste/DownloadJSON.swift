//
//  DownloadJSON.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import Foundation
import UIKit

public class DownloadJSON {
    
    private var onFinish: (Data) -> Void
    
    public init(method: @escaping (Data) -> Void) {
        self.onFinish = method
    }
    
    public func getJSONzona(from id: Int) {
        
        let link = "http://prolococasteo.altervista.org/index.php/zona?zona=" + String(id)
        print(link)
        guard let url = URL(string: link) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err != nil {
                return print(err as Any)
            }
            
            guard let data = data else {
                return print("error")
            }
            
            self.onFinish(data)
        }.resume()
    }
    
    public func getJSONdimoreFiltri(from filters: String) {
        
        let link = "https://prolococasteo.altervista.org/index.php/filtro?filtro=" + filters
        print(link)
        guard let url = URL(string: link) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err != nil {
                return print(err as Any)
            }
            
            guard let data = data else {
                return print("error")
            }
            
            self.onFinish(data)
        }.resume()
    }
    
    public func getJSONfiltri() {
        
        let link = "https://prolococasteo.altervista.org/index.php/filtri"
        print(link)
        guard let url = URL(string: link) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err != nil {
                return print(err as Any)
            }
            
            guard let data = data else {
                return print("error")
            }
            
            self.onFinish(data)
        }.resume()
    }
}


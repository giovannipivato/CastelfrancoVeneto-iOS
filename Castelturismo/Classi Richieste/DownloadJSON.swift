//
//  DownloadJSON.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import Foundation
import UIKit

public class DownloadJSON {
    
    private var onFinish: (Zona) -> Void
    
    public init(method: @escaping (Zona) -> Void) {
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
			
            if let zona = try? JSONDecoder().decode(Zona.self, from: data)
            {
                print(zona)
                self.onFinish(zona)
			} else {
				print("error while decoding data")
			}
		}.resume()
    }
}


class Download {
	static func getJSONZona(id: Int) async throws -> Zona {
		let link = "http://prolococasteo.altervista.org/index.php/zona?zona=" + String(id)
		guard let url = URL(string: link) else {
			fatalError("Invalid url entered")
		}
		
		let (data, _) = try await URLSession.shared.data(from: url)
		
		if let zona = try? JSONDecoder().decode(Zona.self, from: data)
		{
			return zona
		} else {
			fatalError("Error while decoding data")
		}
	}
}


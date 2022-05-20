//
//  DownloadIMG.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import Foundation
import UIKit

public class DownloadIMG {
    
    private var onFinish: (Data) -> Void
    
    public init(method: @escaping (Data) -> Void) {
        self.onFinish = method
    }
    
    public func getIMG(from link: String) {
        
        let url = URL(string: link)!
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            self.onFinish(data)
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

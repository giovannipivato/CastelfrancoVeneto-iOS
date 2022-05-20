//
//  ZonaController.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import UIKit
import SwiftUI

class ZonaController: UIViewController {
    
    var dimore : [View]? = nil
    var idZona : Int = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // creo l'oggetto della async task dandogli un metodo da eseguire a parsing effettuato
        // la zona 2 (corso 29 aprile) ha un problema nel parsing, infatti l'oggetto zona risulta nullo
        // quando si entra in questa view la percentuale di cpu usata scende a 0% e quando si chiude l'app in console
        // viene scritto "terminated due to signal 9"
        // spero che riesca a trovare cosa non va
        // grazie mille e mi scusi per il fastidio
        
        let downloadZona = DownloadJSON(method: onFinishZona(zona:))
        downloadZona.getJSONzona(from: idZona)
    }
    
    func onFinishZona(zona: Zona) -> Void {
        print(zona.descrizione.it ?? "prova")
        print("numero di dimore: " + String(zona.dimore.count))
        
        // scarico tutte le copertine delle varie dimore
        
        dimore = []
        
        /*for dim in zona.monumenti! {
            let downloadCopertina = DownloadIMG(method: onFinishCopertina(foto:))
            let path = dim.getPathCopertina()
            downloadCopertina.getIMG(from: path)
        }
        
        DispatchQueue.main.async { [self] in
            // view.bringSubviewToFront(pageControl)
            setupScrollView(dimore: dimore!)
            
            pageControl.numberOfPages = dimore!.count
            pageControl.currentPage = 0
        }*/
    }
    
    func setupScrollView(dimore: [View]) {
        
        DispatchQueue.main.async { [self] in
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(dimore.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< dimore.count {
                dimore[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView.addSubview(dimore[i])
            }
        }
    }
    
    func onFinishCopertina(foto: Data) -> Void {
        let v = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
        v.copertina.image = UIImage(data: foto)
        dimore?.append(v)
    }
}

extension ZonaController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

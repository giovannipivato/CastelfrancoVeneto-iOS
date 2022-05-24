//
//  ZonaController.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 31/03/22.
//

import UIKit
import SwiftUI

class ZonaController: UIViewController {
    
    var dimoreView : [View]? = nil
    var idZona : Int = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadZona = DownloadJSON(method: onFinishZona(zona:))
        downloadZona.getJSONzona(from: idZona)
		scrollView.delegate = self
		
		// TODO: change page when clicking on points of page controller
    }
	
    func onFinishZona(zona: Zona) -> Void {
		DispatchQueue.main.async {
			self.loadingSpinner.isHidden = true
		}
        
        // scarico tutte le copertine delle varie dimore
		dimoreView = []
		
		let downloadCopertina = DownloadIMG(method: onFinishCopertina(foto:))
		for dim in zona.dimore {
            let path = dim.getPathCopertina()
			if path != "" {
				downloadCopertina.getIMG(from: path)
			}
        }
        
		// PROBLEMA: task eseguita prima dello scaricamento di tutte le immagini
		DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
			print(self.dimoreView!.count)
			self.view.bringSubviewToFront(self.pageControl)
			self.setupScrollView(dimore: self.dimoreView!)
			
			self.pageControl.numberOfPages = self.dimoreView!.count
			self.pageControl.currentPage = 0
			
		})
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
		DispatchQueue.main.async {
			let v = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
			v.copertina.image = UIImage(data: foto)
			self.dimoreView?.append(v)
		}
    }
}

extension ZonaController: UIScrollViewDelegate {
	// update pageControl when scrollView change page
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}



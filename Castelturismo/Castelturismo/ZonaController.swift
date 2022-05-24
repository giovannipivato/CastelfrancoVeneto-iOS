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
    
    @IBOutlet weak var logoZona: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        
        if idZona == 1 {
            logoZona.image = UIImage(named: "iconapiazzagiorgione")
        }
        else if idZona == 2 {
            logoZona.image = UIImage(named: "iconacorso29")
        }
        else if idZona == 3 {
            logoZona.image = UIImage(named: "iconatramura")
        }
        else if idZona == 4 {
            logoZona.image = UIImage(named: "iconaborgotreviso")
        }
        
        let downloadZona = DownloadJSON(method: onFinishZona(zona:))
        downloadZona.getJSONzona(from: idZona)
		scrollView.delegate = self
		
		// TODO: change page when clicking on points of page controller
    }
	
    func onFinishZona(zona: Zona) -> Void {
		DispatchQueue.main.async { [self] in
			loadingSpinner.isHidden = true
            let countDimore = zona.getCountDimore()
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(countDimore), height: view.frame.height)
            scrollView.isPagingEnabled = true
            pageControl.numberOfPages = countDimore
		}
        
        // scarico tutte le copertine delle varie dimore
		dimoreView = []
		
		let downloadCopertina = DownloadIMG(method: onFinishCopertina(foto:))
        let dimore = zona.getDimore()
		for dimora in dimore {
            let path = dimora.getPathCopertina()
			if path != "" {
				downloadCopertina.getIMG(from: path)
			}
        }
        
		DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
			self.view.bringSubviewToFront(self.pageControl)
			self.pageControl.currentPage = 0
		})
    }
    
    func onFinishCopertina(foto: Data) -> Void {
		DispatchQueue.main.async { [self] in
			let v = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
			v.copertina.image = UIImage(data: foto)
            let i = scrollView.subviews.count
            v.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(v)
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



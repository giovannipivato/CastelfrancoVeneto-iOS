//
//  IntroDimoraController.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 01/04/22.
//

import UIKit
import SwiftUI

class IntroDimoraController: UIViewController {
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var arrowButton: UIButton!
	
	var dimora: Dimora!
	var idZona: Int! // necessary to go back to previous page
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let downloader = DownloadIMG(method: showImage(foto: ))
		downloader.getIMG(from: dimora.getPathSfondo())
		
		titleLabel.text = dimora.nome
		
		// extract first sentence from description
        let description = Testo.getDescrizione(dimora.descrizione!)
		let endOfSentence = description.firstIndex(where: {$0 == "."}) ?? description.endIndex
		let firstSentence = description[..<endOfSentence]
		descriptionLabel.text = String(firstSentence)
		
		titleLabel.numberOfLines = 3
		descriptionLabel.numberOfLines = 10
    }
	
	func showImage(foto: Data) {
		DispatchQueue.main.async {
			// setup background gradient
			let colorTop = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
			let colorBottom = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1).cgColor
			let gradientLayer = CAGradientLayer()
			gradientLayer.frame = self.backgroundImage.bounds
			gradientLayer.colors = [colorTop, colorBottom]
			self.backgroundImage.layer.insertSublayer(gradientLayer, at: 0)
			
			self.backgroundImage.image = UIImage(data: foto)
			
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "zona" {
			let destinationVC = segue.destination as! ZonaController
			destinationVC.idZona = self.idZona
		} else if segue.identifier == "dettaglioDimora" {
			let destinationVC = segue.destination as! DettaglioDimoraController
			destinationVC.dimora = dimora
			destinationVC.idZona = idZona
		}
	}
}

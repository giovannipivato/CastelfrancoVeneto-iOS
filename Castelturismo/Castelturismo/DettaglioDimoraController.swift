//
//  DettaglioDimoraViewController.swift
//  Castelturismo
//
//  Created by Martin on 29/05/22.
//

import UIKit

class DettaglioDimoraController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	var dimora: Dimora!
	var idZona: Int!
	private let scrollStackViewContainer: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	let imagesStackView: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupScrollView()
		setupElements()
		
		let downloader = DownloadIMG(method: addImageToView(foto:))
		for foto in dimora.foto {
			if foto.path != dimora.getPathSfondo() && foto.path != dimora.getPathCopertina() {
				downloader.getIMG(from: foto.path)
			}
		}
    }
	
	private func setupScrollView() {
		scrollView.addSubview(scrollStackViewContainer)
		scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		scrollStackViewContainer.spacing = 20
	}
	
	func setupElements() {
		// a label and a stackview for the images
		let descriptionLabel = UILabel()
		
		descriptionLabel.text = dimora.descrizione
		descriptionLabel.textColor = UIColor.white
		descriptionLabel.numberOfLines = 999
		
		scrollStackViewContainer.addArrangedSubview(descriptionLabel)
		scrollStackViewContainer.addArrangedSubview(imagesStackView)
	}
	
	func addImageToView(foto: Data) {
		DispatchQueue.main.async {
			let imageView = UIImageView()
			imageView.image = UIImage(data: foto)
			imageView.contentMode = .scaleAspectFit
			self.imagesStackView.addArrangedSubview(imageView)
		}
	}
    
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "introDimora" {
			let destinationVC = segue.destination as! IntroDimoraController
			destinationVC.idZona = idZona
			destinationVC.dimora = dimora
		}
	}

}

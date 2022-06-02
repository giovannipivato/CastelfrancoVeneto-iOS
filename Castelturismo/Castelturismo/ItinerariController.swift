//
//  FiltriController.swift
//  Castelturismo
//
//  Created by Martin on 21/05/22.
//

import UIKit

class ItinerariController: UIViewController {
	
	@IBOutlet weak var scrollView: UIScrollView!
	private let scrollStackViewContainer: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	// let itinerari = ["1 ora", "2 ore", "3 ore", "4 ore", "Luoghi di Giorgione", "Luoghi d'arte", "Edifici aperti al pubblico", "Edifici religiosi", "Via riccati e borghi", "Piazza Giorgione", "Dentro le mura", "Corso XXIX aprile"]
    var itinerari : [String] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()

        let downloadPercorsi = DownloadJSON(method: onFinishFiltri(data: ))
        downloadPercorsi.getJSONpercorsi()
		
	}
        
    private func onFinishFiltri(data: Data) {
        let percorsi = Parser.getPercorsi(from: data)
        
        for p in percorsi ?? [] {
            itinerari.append(Testo.getDescrizione(p.descrizione))
        }
        
        DispatchQueue.main.async { [self] in
            setupScrollView()
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
		setupItinerariButtons()
	}
	
	private func setupItinerariButtons() {
		for i in 0..<itinerari.count {
			let filterButton = UIButton()
			scrollStackViewContainer.addArrangedSubview(filterButton)
			filterButton.heightAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.25).isActive = true
			
			filterButton.setTitle(itinerari[i], for: .normal)
			filterButton.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 20)
			filterButton.setBackgroundColor(color: UIColor.init(rgb: 0x353538), forState: .normal)
			filterButton.setBackgroundColor(color: UIColor.init(rgb: 0x252528), forState: .highlighted)
			filterButton.layer.cornerRadius = scrollView.frame.width * 0.12
			
			filterButton.addTarget(self, action: #selector(handleFilterClick), for: .touchUpInside)
		}
	}
	
	@objc func handleFilterClick(sender: UIButton) {
		print(sender.titleLabel!.text as Any)
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}

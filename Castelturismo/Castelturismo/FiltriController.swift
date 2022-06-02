//
//  FiltriController.swift
//  Castelturismo
//
//  Created by Martin on 22/05/22.
//

import UIKit

class FiltriController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	let scrollStackViewContainer: UIStackView = UIStackView()
    
    var filters : [String] = []
	var filtersState : [Filter] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        let downloadFiltri = DownloadJSON(method: onFinishFiltri(data:))
        downloadFiltri.getJSONfiltri()

		scrollStackViewContainer.axis = .vertical
		scrollStackViewContainer.spacing = 0
		scrollStackViewContainer.translatesAutoresizingMaskIntoConstraints = false
		
	}
    
    private func onFinishFiltri(data: Data) {
        let filtri = Parser.getFiltri(from: data)
        
        for f in filtri ?? [] {
            filters.append(Testo.getDescrizione(f.stato))
        }
        
        DispatchQueue.main.async { [self] in
            setupScrollView()
            setupFilters()
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
	
	private func setupFilters() {
		filtersState = Filter.getFilters() // get from UserDefaults
		
		for i in 0..<filters.count {
			let filterButton = UIButton()
			scrollStackViewContainer.addArrangedSubview(filterButton)
			// height based on image aspect ratio
			filterButton.heightAnchor.constraint(equalTo: scrollStackViewContainer.widthAnchor, multiplier: 0.3).isActive = true
			
			if(filtersState[i].isChecked) {
				filterButton.setBackgroundImage(UIImage(named: "filtroconspunta"), for: .normal)
			} else {
				filterButton.setBackgroundImage(UIImage(named: "filtro"), for: .normal)
			}
			
			filterButton.setTitle(filters[i], for: .normal)
			filterButton.titleLabel!.font = UIFont(name: "Helvetica Neue", size: 20)
			filterButton.titleLabel!.numberOfLines = 2
			filterButton.titleLabel!.leadingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: 130).isActive = true
			filterButton.titleLabel!.widthAnchor.constraint(equalTo: filterButton.widthAnchor, constant: -140).isActive = true
			
			filterButton.addTarget(self, action: #selector(handleFilterClick), for: .touchUpInside)
			filterButton.tag = i
		}
	}
	
	@objc func handleFilterClick(sender: UIButton) {
		let id = sender.tag
		if(filtersState[id].isChecked) {
			sender.setBackgroundImage(UIImage(named: "filtro"), for: .normal)
		} else {
			sender.setBackgroundImage(UIImage(named: "filtroconspunta"), for: .normal)
		}
		
		filtersState[id].isChecked = !filtersState[id].isChecked
		// update in UserDefaults
		Filter.updateFilter(id: id, isChecked: filtersState[id].isChecked)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	}

}

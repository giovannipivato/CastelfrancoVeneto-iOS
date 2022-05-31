//
//  CreditsController.swift
//  Castelturismo
//
//  Created by Martin on 31/05/22.
//

import UIKit

class CreditsController: UIViewController {
	
	@IBOutlet weak var scrollView: UIScrollView!
	private let scrollStackViewContainer: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let credits = """
Testi a cura di Associazione Pro Loco di Castelfranco Veneto, di Barbara Grassi e Sergio
Prior con validazione di Giacinto Cecchetto.
Traduzioni in lingua inglese di Ada Nigris, Nadia Palazzani e Claudio Campagnaro e in
lingua tedesca di Jenny Cappellin e Rosanna Carlostella.
Sviluppo del programma applicativo
a cura di ITT Barsanti di Castelfranco Veneto, proff. Claudio Franzi e Gianluca Melchiori e gli
studenti Martin Meneghetti, Francesco Pozzobon, Nicolò Bolzon, Giovanni Pivato, Alessandro Perin, Luca
Martignon.
User Interface Design e User Experience Design
a cura di ISISS C. Rosselli, prof. Monica Perin e classe 5AL Liceo Artistico - indirizzo Grafica
Progetto grafico e realizzazione del mock-up dell’APP: Veronica Piotto, Francesco Turcato,
Roberta Della Corte e Giorgia Benvenuto
Illustrazioni: Roberta della Corte
Reportage fotografico: classe 5AL
Editing fotografico: Giorgia Benvenuto e Veronica Piotto.
Progetto Logo App: Angela Bosello
"""

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
		let descriptionLabel = UILabel()
		descriptionLabel.text = credits
		descriptionLabel.numberOfLines = 999
		descriptionLabel.textColor = .white
		scrollStackViewContainer.addArrangedSubview(descriptionLabel)
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

}

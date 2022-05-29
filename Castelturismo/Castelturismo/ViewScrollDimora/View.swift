//
//  View.swift
//  Castelturismo
//
//  Created by Martin on 22/05/22.
//

import UIKit

class View: UIView {
	@IBOutlet weak var copertina: UIImageView!
    @IBOutlet weak var btnScopri: UIButton!
	var dimora: Dimora?
		
	open var delegate: DimoraViewDelegate!
	
	override func awakeFromNib() {
		copertina.layer.cornerRadius = copertina.frame.width * 0.12
		btnScopri.addTarget(self, action: #selector(onButtonPress), for: .touchUpInside)
	}
	
	@objc func onButtonPress() {
		self.delegate.onButtonPress(sender: self)
	}
	
	func setDimora(dimora: Dimora) {
		self.dimora = dimora
	}
}

protocol DimoraViewDelegate {
	func onButtonPress(sender: Any?)
}

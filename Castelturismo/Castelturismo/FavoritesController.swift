//
//  FavoritesController.swift
//  Castelturismo
//
//  Created by Martin on 22/05/22.
//

import UIKit

class FavoritesController: UIViewController {

	@IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let downloader = DownloadJSON(method: {zona in self.onFinishRequest()})
		downloader.getJSONzona(from: 3)
    }

	func onFinishRequest() {
		DispatchQueue.main.async {
			self.loadingSpinner.isHidden = true
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
	}
}

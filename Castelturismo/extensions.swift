//
//  extensions.swift
//  Castelturismo
//
//  Created by Martin on 22/05/22.
//

import Foundation
import UIKit

extension UIButton {
	func setBackgroundColor(color: UIColor, forState: UIControl.State) {
		self.clipsToBounds = true  // add this to maintain corner radius
		UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
		if let context = UIGraphicsGetCurrentContext() {
			context.setFillColor(color.cgColor)
			context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
			let colorImage = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			self.setBackgroundImage(colorImage, for: forState)
		}
	}
}

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int, alpha: Double?) {
	   assert(red >= 0 && red <= 255, "Invalid red component")
	   assert(green >= 0 && green <= 255, "Invalid green component")
	   assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		var alphaValue = 1.0
		if alpha != nil {
			alphaValue = alpha!
		}

	   self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaValue)
   }

   convenience init(rgb: Int) {
	   self.init(
		   red: (rgb >> 16) & 0xFF,
		   green: (rgb >> 8) & 0xFF,
		   blue: rgb & 0xFF,
		   alpha: nil
	   )
   }
}



//
//  ViewController.swift
//  Castelturismo
//
//  Created by Giovanni Pivato on 30/03/22.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet public var zona1 : UIButton!
    @IBOutlet public var zona2 : UIButton!
    @IBOutlet public var zona3 : UIButton!
    @IBOutlet public var zona4 : UIButton!
    @IBOutlet weak var imgZone : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zona1.tag = 1
        zona2.tag = 2
        zona3.tag = 3
        zona4.tag = 4
        
        self.imgZone.image =  UIImage(named: "home2.png")!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let btn = sender as! UIButton
		if segue.identifier == "zona" {
			let zonaController = segue.destination as! ZonaController
			zonaController.idZona = btn.tag
		}
    }
}

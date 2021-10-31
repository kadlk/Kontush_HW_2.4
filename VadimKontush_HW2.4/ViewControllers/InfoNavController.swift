//
//  InfoNavController.swift
//  Vadim.KontushVI_HW2.3
//
//  Created by Vadim Kontush on 31.10.21.
//

import Foundation
import UIKit

class InfoNavController:UINavigationController{
    
    @IBOutlet var infoLabelOutlet: UILabel!
    
    var info = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabelOutlet.text = "This is info: \(info)"
        
        
    }
}

//
//  InfoNavController.swift
//  Vadim.KontushVI_HW2.3
//
//  Created by Vadim Kontush on 31.10.21.
//

import Foundation
import UIKit

class InfoNavController:UIViewController{
    
    @IBOutlet var infoLabelOutlet: UILabel!
    @IBOutlet var bottomNavigationItemOutlet: UINavigationItem!
    
    @IBOutlet var topBarButtonOutlet: UIBarButtonItem!
    
    var user: User = User();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabelOutlet.text = "This is info: \(user.info)"
        topBarButtonOutlet.title = user.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = user.name
       }
}

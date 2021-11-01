//
//  ViewController.swift
//  Vadim.KontushVI_HW2.3
//
//  Created by Vadim Kontush on 27.10.21.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var usernameTFOutlet: UITextField!
    @IBOutlet var passwordTFOutlet: UITextField!
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTFOutlet.delegate = self
        passwordTFOutlet.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for controller in viewControllers{
            if let welcomeViewController = controller as? WelcomeViewController{
                welcomeViewController.userName = user.name
            }
            if let navigationController = controller as? UINavigationController{
                let infoNavController = navigationController.topViewController as! InfoNavController
//                infoNavController.info = user.info
//                infoNavController.userName = user.name
                infoNavController.user = user
            }
        }
    }

    @IBAction func forgotData(_ sender: UIButton) {
        if sender.tag == 0{
            showAlert(
                        title: "Hello",
                        message: "Your user name: \(user.name)"
                    )
        }
        else{
            showAlert(
                        title: "Hello",
                        message: "Your pass: \(user.password)"
                    )
        }
    }
    
    @IBAction func loginButtonAction() {
        if usernameTFOutlet.text != user.name || passwordTFOutlet.text != user.password{
            showAlert(
                title: "Wrong login or pass",
                message: "Enter correct login or pass")
        }
    }
    
    @IBAction func unwindToWelcomeVC(_ segue: UIStoryboardSegue) {
        usernameTFOutlet.text = ""
        passwordTFOutlet.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
            
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?

            if nextResponder != nil {
                nextResponder?.becomeFirstResponder()
            } else {
                loginButtonAction()
            }

            return false
        }
}

extension LoginViewController{
    private func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){
            _ in self.passwordTFOutlet.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}









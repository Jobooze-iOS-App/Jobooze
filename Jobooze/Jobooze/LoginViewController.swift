//
//  LoginViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/20/21.
//

import UIKit
import AlamofireImage
import Parse

class LoginViewController: UIViewController {
    

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //custom keyboard input view
    override var inputAccessoryView: UIView? {
        return nil //here come out input view
    }
    
    override var canBecomeFirstResponder: Bool {
        return false //will tell us whether it can become the first responder or not
    }
    
    
    //will take the user to the dashboard if user exists
    @IBAction func onSignIn(_ sender: Any) {
            
        let username = usernameField.text!
        let password = passwordField.text!
        
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                self.incorrectInfoPopUp()
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    
    //segue that will allow the user to sign up
    @IBAction func onSignUp(_ sender: Any) {
        performSegue(withIdentifier: "ToSignUp", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func incorrectInfoPopUp() {
        let alert = UIAlertController(title: "Uh-Oh!", message: "The username and password you entered did not match our records. Please double-check and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Reset Password", style: .default))
                                      
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

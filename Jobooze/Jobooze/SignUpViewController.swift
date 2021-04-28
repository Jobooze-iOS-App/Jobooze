//
//  SignUpViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/20/21.
//

import UIKit
import AlamofireImage
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    after successful sign up, do we direct the user to their dashboard or have them login first? Former: we add a segue from the signup button to the dashboard; latter: we simply dismiss the sign up view so the user can login
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailField.text!
        //also there is an issue with the db app, we need the username field as its required, but I was thinking we just fill that area with the user's email too
        user.password = passwordField.text!
        user.email = emailField.text!
        user["firstName"] = firstnameField.text!
        user["lastName"] = lastnameField.text!
        
        user.signUpInBackground { (success, error) in
            if success && user.password == self.confirmPwdField.text! {
                self.performSegue(withIdentifier: "loginFromSignUpSegue", sender: nil)
            } else {
                print("Error with signing up \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    //will remove the segue presentation from the screen, bringing the user back to the login
    @IBAction func OnSignIn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
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

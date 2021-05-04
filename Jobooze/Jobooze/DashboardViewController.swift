//
//  DashboardViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/20/21.
//

import UIKit
import Parse

class DashboardViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                       
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                       
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                       
        delegate.window?.rootViewController = loginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let currentUser = PFUser.current()
        let firstName = currentUser?.value(forKey: "firstName") as? String
        
        greetingLabel.text = "Hi, " + firstName! + "!"
        
        // Do any additional setup after loading the view.
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

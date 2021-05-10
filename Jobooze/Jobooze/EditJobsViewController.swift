//
//  EditJobsViewController.swift
//  Jobooze
//
//  Created by Andy Celdo on 5/9/21.
//

import UIKit
import Parse

class EditJobsViewController: UIViewController {
    
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateAppliedTextField: UITextField!
    @IBOutlet weak var statusControl: UISegmentedControl!
    @IBOutlet weak var additionalTextField: UITextField!
    
    //variables to catch info from Dashboard View
    var objectId = ""
    var companyName = ""
    var position = ""
    var location = ""
    var dateApplied = ""
    var additionalText = ""
    
    var notes = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setupUIElements()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        storeValues()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                       
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                       
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                       
        delegate.window?.rootViewController = loginViewController
    }
    
    func setupUIElements() {
        companyTextField.text = companyName
        positionTextField.text = position
        locationTextField.text = location
        dateAppliedTextField.text = dateApplied
        additionalTextField.text = additionalText
    }

    func storeValues() {
        print("store values()")
        let query = PFQuery(className:"Notes")
        query.getObjectInBackground(withId: objectId) { (note, error: Error?) -> Void in
            if error != nil {
                print("Error: ", error)
            } else if note != nil {
                print("get object: ", note!)
                note!.setObject(self.companyTextField.text!, forKey: "companyName")
                note!.setObject(self.positionTextField.text!, forKey: "jobTitle")
                note!.setObject(self.locationTextField.text!, forKey: "location")
                note!.setObject(self.additionalTextField.text!, forKey: "comments")

                note?.saveInBackground()
            }
        }
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

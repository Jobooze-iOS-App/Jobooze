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
    @IBOutlet weak var statusControl: UISegmentedControl!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerLabel: UILabel!
    
    //variables to catch info from Dashboard View
    var objectId = ""
    var companyName = ""
    var position = ""
    var location = ""
    var additionalText = ""
    var status = ""
    var applied = Date()
    
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
    
    @IBAction func statusSwitch(_ sender: Any) {
        status = statusControl.titleForSegment(at: statusControl.selectedSegmentIndex)!
        setDatePickerLabel()
    }
    
    func setDatePickerLabel() {
        if status == "Pending" {
            datePickerLabel.text = "Will apply on:"
        } else {
            datePickerLabel.text = status + " on:"
        }
    }
    
    func setupUIElements() {
        companyTextField.text = companyName
        positionTextField.text = position
        locationTextField.text = location
        datePicker.setDate(applied as Date, animated: true)
        commentsTextView.text = additionalText
        if status == statusControl.titleForSegment(at: 0) {
            statusControl.selectedSegmentIndex = 0
        } else if status == statusControl.titleForSegment(at: 1) {
            statusControl.selectedSegmentIndex = 1
        } else if status == statusControl.titleForSegment(at: 2) {
            statusControl.selectedSegmentIndex = 2
        }
        setDatePickerLabel()
    }

    func storeValues() {
        let query = PFQuery(className:"Notes")
        query.getObjectInBackground(withId: objectId) { (note, error: Error?) -> Void in
            if error != nil {
                print("Error: ", error)
            } else if note != nil {
                print("get object: ", note!)
                note!.setObject(self.companyTextField.text!, forKey: "companyName")
                note!.setObject(self.positionTextField.text!, forKey: "jobTitle")
                note!.setObject(self.locationTextField.text!, forKey: "location")
                note!.setObject(self.commentsTextView.text!, forKey: "comments")
                note!.setObject(self.datePicker.date, forKey: "appliedAt")
                note!.setObject(self.statusControl.titleForSegment(at: self.statusControl.selectedSegmentIndex)!, forKey: "status")
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

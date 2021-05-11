//
//  NewEntryViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/27/21.
//

import UIKit
import Parse
//import InputBarAccessoryView

class NewEntryViewController: UIViewController/*, InputBarAccessoryViewDelegate*/ {

    @IBOutlet var newEntryView: UIView!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var statusControl: UISegmentedControl!
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
//    var notes = [PFObject]()
    
//    let commentBar = InputBarAccessoryView()
//    var showsCommentBar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
//        commentBar.sendButton.title = "Done"
//        commentBar.delegate = self
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//
//        view.addGestureRecognizer(tap)
//
//        let center = NotificationCenter.default
//        center.addObserver(self, selector: #selector(dismissKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        let center = NotificationCenter.default
//        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    @IBAction func statusSwitch(_ sender: Any) {
        setDatePickerLabel()
    }
    //    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
//        commentBar.inputTextView.text = nil
//        showsCommentBar = true
//        becomeFirstResponder()
//        commentBar.inputTextView.resignFirstResponder()
//    }
//
//    @objc func keyboardWillBeHidden(note: Notification) {
//        commentBar.inputTextView.text = nil
//        showsCommentBar = false
//        becomeFirstResponder()
//    }
    
    @IBAction func onCancel(_ sender: Any) {
        //what happens? We return to the dashboard, reset the fields? etc
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        let note = PFObject(className: "Notes")
        
        note["author"] = PFUser.current()
        note["companyName"] = companyTextField.text
        note["jobTitle"] = positionTextField.text
        note["status"] = statusControl.titleForSegment(at: statusControl.selectedSegmentIndex)
        note["comments"] = commentsTextView.text
        note["appliedAt"] = datePicker.date
        note["location"] = locationTextField.text
        
        note.saveInBackground { (success, error: Error?) -> Void in
            if success {
                print("Note Saved!!: ", success)
            } else {
                print("Error with saving note!: ", error)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setDatePickerLabel() {
        if statusControl.selectedSegmentIndex == 1 {
            datePickerLabel.text = "Will apply on:"
        } else {
            datePickerLabel.text = statusControl.titleForSegment(at: statusControl.selectedSegmentIndex)! + " on:"
        }
    }
    
    
//    override var inputAccessoryView: UIView? {
//        return commentBar
//    }
//
//    override var canBecomeFirstResponder: Bool {
//        return showsCommentBar
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

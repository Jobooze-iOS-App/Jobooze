//
//  NewEntryViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/27/21.
//

import UIKit
//import InputBarAccessoryView

class NewEntryViewController: UIViewController/*, InputBarAccessoryViewDelegate*/ {

    @IBOutlet var newEntryView: UIView!
    
//    let commentBar = InputBarAccessoryView()
//    var showsCommentBar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
//        commentBar.sendButton.title = "Done"
//        commentBar.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(dismissKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        let center = NotificationCenter.default
//        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

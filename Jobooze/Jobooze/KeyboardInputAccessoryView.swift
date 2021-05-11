//
//  KeyboardInputAccessoryView.swift
//  Jobooze
//
//  Created by Andy Celdo on 4/27/21.
//

import UIKit

protocol KeyboardInputAccessoryViewProtocol where Self: UIViewController {

    func send(data type: String)

    //Scroll view inset is auto-adjusted buy the keyboard
    func scrollView() -> UIScrollView

}

internal struct InputContainerViewConstants {
    static let maxInputMessageContainerViewHeight: CGFloat = 220.0
    static let containerInsetsDefault = UIEdgeInsets(top: 10, left: 8, bottom: 8, right: 30)
}

class KeyboardInputAccessoryView: UIView {

//    @IBAction weak var inputTextView: UITextView!
    
//    private weak var delegate: KeyboardInputAccessoryViewProtocol?
//    private weak var hostViewController: KeyboardInputAccessoryViewProtocol?
//
//    private var firstResponder: Bool = false
//
//    class func view(controller: KeyboardInputAccessoryViewProtocol) -> KeyboardInputAccessoryView {
//        let view = KeyboardInputAccessoryView()
//        view.delegate = controller
//        view.inputTextView.delegate = view
//        view.hostViewController = controller
//
//        setupUI(view: view)
//        return view
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    override var intrinsicContentSize: CGSize {
//        let size = textViewSize(height: &inputMessageTextViewHeight, maxInputHeight: InputContainerViewConstants.maxInputMessageContainerViewHeight, textView: inputTextView)
//        self.inputHeightConstraint.constant = size.height
//        return size
//    }
//
//    class private func setupUI(view: KeyboardInputAccessoryView) {
//        view.inputTextView.font = UIFont.systemFont(ofSize: 16)
//        view.inputTextView.isScrollEnabled = false
//        view.inputTextView.layer.cornerRadius = 18
//        view.inputTextView.textContainerInset = InputContainerViewConstants.ContainerInsetsDefault
//    }
    
//    func showKeyboard() {
//        setupKeyboardNotification()
//
//        DispatchQueue.main.async {
//            self.firstResponder = true
//            self.delegate?.becomeFirstResponder()
//            self.inputTextView.becomeFirstResponder()
//        }
//    }
//
//    private func textViewSize(height: inout CGFloat, maxInputHeight: CGFloat, textView: UITextView) -> CGSize {
//        let textSize = textView.sizeThatFits(CGSize(width: textView.bounds.width,
//                                                    height: CGFloat.greatestFiniteMagnitude))
//        if textSize.height >= maxInputHeight {
//            height = maxInputHeight
//            textView.isScrollEnabled = true
//        } else {
//            textView.isScrollEnabled = false
//            height = textSize.height
//        }
//        return CGSize(width: self.bounds.width, height: height)
//    }
//
//    private func dismissKeyboard() {
//        self.inputTextView.text = nil // we clean our keyboard
//        firstResponder = false
//        self.inputTextView.resignFirstResponder()
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    private func setupKeyboardNotification() {
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
//            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        }
//
//        // MARK: - Keyboard avoid
//        @objc private func keyboardWillShow(notification: NSNotification) {
//            sendButton.isEnabled = !(self.inputTextView.text == nil || self.inputTextView.text == "")
//
//            if let scrollView = self.hostViewController?.scrollView(), let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//                let size = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
//                scrollView.contentInset = size
//                scrollView.scrollIndicatorInsets = size
//                scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: true) // Scrolls to end
//            }
//        }
//
//        @objc private func keyboardWillHide(notification: NSNotification) {
//            self.hostViewController?.scrollView().contentInset = .zero
//            self.hostViewController?.scrollView().scrollIndicatorInsets = .zero
//        }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
    
//    extension KeyboardInputAccessoryView: UITextViewDelegate {
//
//        func textViewDidChange(_ textView: UITextView) {
//            UILabel().isHidden = !textView.text.isEmpty
//            UIButton().isEnabled = !(textView.text == nil || textView.text == "")
//        }
//    }


//
//  ProfilePicViewController.swift
//  Jobooze
//
//  Created by Andrea Habib on 5/16/21.
//

import UIKit
import AlamofireImage
import Parse

class ProfilePicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var scaledImage: UIImage? = nil

    var ProfileViewInstance:ProfileViewController!
    @IBOutlet weak var profilepic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        let profile = PFUser.current()
        let imageData = profilepic.image!.pngData()

        let file = PFFileObject(data: imageData!)

        profile?["profilePic"] = file

        profile?.saveInBackground { [self] (success, error) in
        if success {
            print("saved!")
            //ProfileViewInstance.profileTableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        } else {
                print("error!")
            }
        }
    }
    
    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
               picker.delegate = self
               picker.allowsEditing = true
               
               if UIImagePickerController.isSourceTypeAvailable(.camera) {
                   picker.sourceType = .camera
               } else {
                   picker.sourceType = .photoLibrary
               }
               
               present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.editedImage] as! UIImage
            
            let size = CGSize(width: 300, height: 300)
            scaledImage = image.af_imageScaled(to: size)
            
            profilepic.image = scaledImage
            
            dismiss(animated: true, completion: nil)
            
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

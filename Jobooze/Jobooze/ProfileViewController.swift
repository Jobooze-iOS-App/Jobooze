//
//  ProfileViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/20/21.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ProfilePicController: ProfilePicViewController = ProfilePicViewController(nibName: nil, bundle: nil)
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var jobsNumber: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var profilepic: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.destination is ProfilePicViewController {
                print("Hello")
                let profileInstance = segue.destination as? ProfilePicViewController
                profileInstance?.ProfileViewInstance = self
            }  // Pass the value of VCA in instance of VCB while navigating through segue
    }

    var notes = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        let currentUser = PFUser.current()
        let firstName = currentUser?.value(forKey: "firstName") as? String
        let lastName = currentUser?.value(forKey: "lastName") as? String
        let email = currentUser?.value(forKey: "email") as? String
        //let image = currentUser?.value(forKey: "profilePic") as? UIImage
        let imageFile = currentUser?["profilePic"] as! PFFileObject
                    let urlString = imageFile.url!
                    let url = URL(string: urlString)!
                    
                    profilepic.af_setImage(withURL: url)
        
        username.text =  firstName! + " " + lastName!
        emailField.text = email!
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        print(ProfilePicController.scaledImage)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(ProfilePicController.scaledImage)
        print("viewWillAppear()")
        let query = PFQuery(className: "Notes")
        query.whereKey("author", contains: PFUser.current()?.objectId)
//        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (notes, error) in
            if notes != nil {
                self.notes = notes!
                self.profileTableView.reloadData()
            }
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        jobsNumber.text = String(notes.count)
        return notes.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileTableViewCell") as! profileTableViewCell
        
        let note = notes[indexPath.row]
        
        cell.companyName.text = note["companyName"] as! String
        cell.jobStatus.text = note["status"] as! String
   
                
        return cell
    }


    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                       
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                       
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                       
        delegate.window?.rootViewController = loginViewController
    }
    
    
    @IBAction func addJob(_ sender: Any) {
    
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

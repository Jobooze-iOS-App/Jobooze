//
//  DashboardViewController.swift
//  Jobooze
//
//  Created by Nicholas Palermo on 4/20/21.
//

import UIKit
import Parse
import AlamofireImage

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var jobsTableView: UITableView!
    
    //variables that contain values that will be passed to the next view controller
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

        jobsTableView.delegate = self
        jobsTableView.dataSource = self
        
        let currentUser = PFUser.current()
        let firstName = currentUser?.value(forKey: "firstName") as? String
        
        greetingLabel.text = "Hi, " + firstName! + "!"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewWillAppear()")
        let query = PFQuery(className: "Notes")
        query.whereKey("author", contains: PFUser.current()?.objectId)
//        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (notes, error) in
            if notes != nil {
                self.notes = notes!
                self.jobsTableView.reloadData()
            }
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
                       
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                       
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                       
        delegate.window?.rootViewController = loginViewController
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editViewController = segue.destination as? EditJobsViewController {
            editViewController.companyName = companyName
            editViewController.position = position
            editViewController.location = location
            editViewController.additionalText = additionalText
            editViewController.status = status
            editViewController.applied = applied
            editViewController.objectId = objectId
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobsTableView.dequeueReusableCell(withIdentifier: "JobTableViewCell") as! JobTableViewCell
        
        let note = notes[indexPath.row]
        
        cell.jobNameLabel.text = note["jobTitle"] as! String
        cell.statusLabel.text = note["status"] as! String
        cell.companyLabel.text = note["companyName"] as! String
//        cell.dateAppliedLabel.text = note["appliedAt"] as? NSDate as String?
//        print("row: ", indexPath.row, "  date: ", note["appliedAt"])
        if let date = note["appliedAt"] as? Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/YY"
            cell.dateAppliedLabel.text = dateFormatter.string(from: date)
        } else {
            print("Still nil")
        }
                
        return cell
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedNote = notes[indexPath.row]
        
        companyName = selectedNote["companyName"] as! String
        position = selectedNote["jobTitle"] as! String
        location = selectedNote["location"] as! String
        additionalText = selectedNote["comments"] as! String
        status = selectedNote["status"] as! String
        applied = selectedNote["appliedAt"] as! Date
        objectId = selectedNote.objectId!
        
        return indexPath
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

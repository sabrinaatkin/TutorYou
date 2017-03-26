//
//  TutorSignUpViewController.swift
//  Tutor2
//
//  Created by Sabrina Atkin on 3/26/17.
//  Copyright © 2017 Sabrina Atkin. All rights reserved.
//

import UIKit

class TutorSignUpViewController: UIViewController {
    
    @IBOutlet weak var otherInfo: UITextView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var gradeValue: UISegmentedControl!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    var dataDictionary = [String: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitClicked(_ sender: UIButton) {
       let username = usernameTextField.text
        let grade = String (gradeValue.selectedSegmentIndex)
        let subject = subjectTextField.text
        let name = nameTextField.text
        let state = stateTextField.text
        let city = cityTextField.text
        let other = otherInfo.text
        
        let valueArray = [name ?? "jane doe", subject ?? "math", grade, city ?? "fairfax", state ?? "VA", other ?? "111-111-1111"]
        dataDictionary[username ?? "duh"] = valueArray
        
        //self.performSegue(withIdentifier: "tutorToHome", sender: sender)
        for (key, value) in dataDictionary {
            print(key)
            print(value)
            (self.presentingViewController as! ViewController).usernamesDictionary[key] = value
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tutorToHome" {
            
            // Send the dictionary back to the  home controller
            for (key, value) in dataDictionary {
                print(key)
                print(value)
                (segue.destination as! ViewController).usernamesDictionary[key] = value
            }
            //(segue.destination as! ViewController).usernamesDictionary = dataDictionary
        }
    }

}

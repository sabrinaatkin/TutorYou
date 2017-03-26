//
//  ViewController.swift
//  Tutor2
//
//  Created by Sabrina Atkin on 3/25/17.
//  Copyright © 2017 Sabrina Atkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var subjectInput: UITextField!
    @IBOutlet weak var gradeInput: UISegmentedControl!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var stateInput: UITextField!
    var usernamesDictionary = [String: [String]]()
    var matches = [String]()
    var stringa = ""
    var stringb = ""
    var stringc = ""
    var stringd = ""
    var stringe = ""
    var stringf = ""
    var printPerson = ""
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findButton(_ sender: UIButton) {
        
        let subjectText = subjectInput.text
        let cityText = cityInput.text
        let stateText = stateInput.text
        let gradeValue = gradeInput.selectedSegmentIndex
        let gradeString = String(gradeValue)
        
        matches = [String]()
        print("all keys", Array(usernamesDictionary.keys))
        for key in usernamesDictionary.keys {
            print("key", key)
            let element = usernamesDictionary[key]!
            print(element)
            if element[1] == subjectText || element[2] == gradeString || element[3] == cityText || element[4] == stateText{
                //matches.insert(key, at: matchLoc)
                matches.append(key)
                //matches[matchLoc] = key
                print("matches", matches)
                //matchLoc = matchLoc + 1
                stringa = element[0]
               
                stringf = element[5]
                
                //printPerson = stringa + " " +  */stringb + " " + stringc + " " + stringd + " " + stringe + " " + stringf
                printPerson = stringa + " " + stringf
            }
        }
        
       tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    //for index in 0...5 {
     //   display = element[index]
   // index = index + 1
   // }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = printPerson
            //matches[indexPath.row]
     
        return cell
    }
    
    @IBAction func openTutorPage(_ sender: UIButton) {
    }
   
  
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
        
    }
    
}


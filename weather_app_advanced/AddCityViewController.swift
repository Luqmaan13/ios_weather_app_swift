//
//  AddCityViewController.swift
//  weather_app_advanced
//
//  Created by Luqmaan Siddiqui on 6/21/18.
//  Copyright © 2018 Luqmaan Siddiqui. All rights reserved.
//

import UIKit
let states = ["Alaska",
              "Alabama",
              "Arkansas",
              "American Samoa",
              "Arizona",
              "California",
              "Colorado",
              "Connecticut",
              "District of Columbia",
              "Delaware",
              "Florida",
              "Georgia",
              "Guam",
              "Hawaii",
              "Iowa",
              "Idaho",
              "Illinois",
              "Indiana",
              "Kansas",
              "Kentucky",
              "Louisiana",
              "Massachusetts",
              "Maryland",
              "Maine",
              "Michigan",
              "Minnesota",
              "Missouri",
              "Mississippi",
              "Montana",
              "North Carolina",
              " North Dakota",
              "Nebraska",
              "New Hampshire",
              "New Jersey",
              "New Mexico",
              "Nevada",
              "New York",
              "Ohio",
              "Oklahoma",
              "Oregon",
              "Pennsylvania",
              "Puerto Rico",
              "Rhode Island",
              "South Carolina",
              "South Dakota",
              "Tennessee",
              "Texas",
              "Utah",
              "Virginia",
              "Virgin Islands",
              "Vermont",
              "Washington",
              "Wisconsin",
              "West Virginia",
              "Wyoming"]

 let defaults = UserDefaults.standard

 var remaining_states = [String]()

class AddCityViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
   
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return  remaining_states.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return remaining_states[row]
    }
   
   
    
    
    @IBAction func AddStateTapped(_ sender: Any) {
  
        
        let state = pickerViewOutlet.selectedRow(inComponent: 0)
        states_in_table.append(remaining_states[state])
        print(remaining_states[state])
       defaults.set(states_in_table, forKey: "States")
        defaults.synchronize()
       navigationController?.popToRootViewController(animated: true)
      
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


            for each in states{
                if !(states_in_table.contains(each)){
                    remaining_states.append(each)
                }

        
        }
        
        self.pickerViewOutlet.dataSource = self
        self.pickerViewOutlet.delegate = self
        //Load states in the pickerview that do not exist in the exsisting states
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        
    }
 

}

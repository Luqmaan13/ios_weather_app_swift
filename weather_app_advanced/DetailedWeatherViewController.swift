//
//  DetailedWeatherViewController.swift
//  weather_app_advanced
//
//  Created by Luqmaan Siddiqui on 6/21/18.
//  Copyright © 2018 Luqmaan Siddiqui. All rights reserved.
//

import UIKit
import  CoreLocation
class DetailedWeatherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var dates=[Date]()
    
    var tenDaysfromNow: Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: 10, to: Date(), options: [])!
    }
    
    let date = Date()
    
    var forecastData = [Weather]()
    @IBOutlet weak var tableViewCon: UITableView!
    
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var weatherTodayLabel: UILabel!
    var cityName = ""
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
 // var  a = ["hi","sup"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! weatherDetailsCell
        
        let weatherObject = forecastData[indexPath.row]
      print(indexPath.row)
        print(indexPath.section)
        
        print()
        print()
        cell.temparatureOutlet.text = String(weatherObject.temperature)
        cell.SummaryOutlet.text = weatherObject.summary
        cell.imageOutlet.image = UIImage(named: weatherObject.icon)
        cell.dateOutlet.text = dates[indexPath.row].description
        if  indexPath.row == 0
        {
            
            temparatureLabel.text = String(weatherObject.temperature) + " °F"
            weatherTodayLabel.text = weatherObject.summary
            cityNameLabel.text = cityName
        }
        
        
        
        
        return cell
    }
    
    
    
  
    
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                        
                        if let weatherData = results {
                            self.forecastData = weatherData
                            
                            DispatchQueue.main.async {
                                self.tableViewCon.reloadData()
                            }
                            
                        }
                        
                    })
                }
            }
        }
        
       
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
tableViewCon.dataSource = self
        tableViewCon.delegate = self
        
        
        tableViewCon.estimatedRowHeight = 120
        tableViewCon.rowHeight = UITableViewAutomaticDimension
        //print(cityName)
        updateWeatherForLocation(location: cityName)
       
       print(tenDaysfromNow)
        
        
        for each in -1...6{
            dates.append((Calendar.current as NSCalendar).date(byAdding: .day, value: each, to: Date(), options: [])!)
        }
        print(dates)
        
    }

//    override func viewDidAppear(_ animated: Bool) {
//      //  updateWeatherForLocation(location: cityName)
//      //  let weatherObject = forecastData[0]
//        //temparatureLabel.text = String(weatherObject.temperature)
//        //weatherTodayLabel.text = weatherObject.summary
//        //cityNameLabel.text = cityName
//    }
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

}

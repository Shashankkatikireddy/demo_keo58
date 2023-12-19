//
//  MyTableViewController.swift
//  TableViewController Local JSON
//
//  Created by Macbook air  on 06/09/2023.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var fruitsList:[Fruits]=[Fruits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruitsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell?.textLabel?.text=fruitsList[indexPath.row].fruits
        cell?.detailTextLabel?.text=fruitsList[indexPath.row].color
        return cell!
    }
    
    func fetchData() {
        guard let fileLocation=Bundle.main.url(forResource: "Fruits", withExtension: "JSON") else {
            
            print("File Location")
            return
        }
    }
    
    do  {
            {
                let data=try Data(contentsOf: fileLocation)
                let receivedData=try JSONDecoder().decode([Fruits].self, from: data)
                
                self.fruitsList=receivedData
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            catch {
                
                print("Error Occured in Decoding")
            }
            
        }
        
    }
    


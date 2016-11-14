//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by roger on 23/10/16.
//  Copyright © 2016 roger. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    var restaurants:[RestaurantMO] = []
    

    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.hidesBarsOnSwipe = true
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
     
        
//        self.navigationController?.navigationBar.frame.size.height = 300

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.thumbnailImageView?.image = UIImage(data: restaurants[indexPath.row].image as! Data)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        
        
//        if restaurantIsVisited[indexPath.row] {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        // or use the ternary conditional operator
        
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
       // [tableView deselectRowAt:indexPath animated:YES];

        // Configure the cell...
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override var prefersStatusBarHidden: Bool {
//        
//        return true
//    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet or alert
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Add Call cation closure
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            
            self.present(alertMessage, animated: true, completion: nil)
        }
            
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: .default, handler:callActionHandler)
        optionMenu.addAction(callAction)
        
        // Check-in action, using another closure
        let titleForCheckIn = restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
        let checkInAction = UIAlertAction(title: titleForCheckIn, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            
            // Toggle check-in and undo-check-in
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        })
        
        optionMenu.addAction(checkInAction)
        
        // Display the menu
        tableView.deselectRow(at: indexPath, animated: true)
        present(optionMenu, animated: true, completion: nil)

    }
 */
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
 
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt
        indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {
            (action, indexPath) -> Void in
                let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name!
            
                if let imageToShare = UIImage(data: self.restaurants[indexPath.row].image as! Data){
                    let activityController = UIActivityViewController(activityItems:[defaultText, imageToShare], applicationActivities:nil)
                    self.present(activityController, animated: true, completion: nil)
                }
            
            
            })
        
        // Delete Button
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{(action, indexPath) -> Void in
            // Delete the row from the data source
            
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255/0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    
    }
    
    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            // three steps for deleting with exactly same order
//            // 1. check the even is delete or insert or none,
//            // 2. detele the item from the data source, remove the objects
//            // 3.call deleteRows(at:) on the table view
//            
//            restaurantNames.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            
//        }
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//        //tableView.reloadData()
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        print("number of restaurant \(restaurantNames.count)")
//    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // check the sugue's identifier
        if segue.identifier == "showRestaurantDetail" {
            if let IndexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[IndexPath.row]
            }
        }
    }
    

}

//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by Hong 'Roger' Han on 7/11/16.
//  Copyright © 2016 roger. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UINavigationControllerDelegate {
    
    @IBOutlet var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
                
                imagePicker.delegate = self
            }
            
        }
        
        
    }
}
extension AddRestaurantController:UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        // Add the constraint programmatically to the photoImageView
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute:
            NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem:
            photoImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1,
                                      constant: 0)
        topConstraint.isActive = true
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute:
            NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem:
            photoImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1,
                                      constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
}
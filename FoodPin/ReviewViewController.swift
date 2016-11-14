//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by roger on 30/10/16.
//  Copyright © 2016 roger. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant: RestaurantMO!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add the blurry animation to the view
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
       
        imageView.image = UIImage(data: restaurant.image as! Data)
        // Add the transition animation to the containerView
        
        // View animation
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
         closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
        
        // Solution to Exercise #2 - Start here
        //closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)

    }
    
   
     override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.containerView.transform = CGAffineTransform.identity
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
            
            self.closeButton.transform = CGAffineTransform.identity
            
        }, completion: nil)
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

}

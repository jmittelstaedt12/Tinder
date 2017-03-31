//
//  ViewController.swift
//  Tinder
//
//  Created by Jacob Mittelstaedt on 3/30/17.
//  Copyright © 2017 Jacob Mittelstaedt. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var divisor: CGFloat!
    var pfImageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
        profileImageView.image = #imageLiteral(resourceName: "ryan")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        let upOrLow: Bool!
        
        if location.y <= 284{
            upOrLow = true
        } else {
            upOrLow = false
        }
        
        let xFromCenter = profileImageView.center.x - view.center.x

        if sender.state == .began {
            print("Gesture began")
            pfImageOriginalCenter = profileImageView.center;
        } else if sender.state == .changed {
            print("Gesture is changing")
            profileImageView.center = CGPoint(x: pfImageOriginalCenter.x + translation.x, y: pfImageOriginalCenter.y)
            if upOrLow == true{
            profileImageView.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
            }else{
            profileImageView.transform = CGAffineTransform(rotationAngle: -1*(xFromCenter/divisor))

            }

        } else if sender.state == .ended {
            print("Gesture ended")
            if translation.x > 50{
                UIView.animate(withDuration: 0.2, animations: {
                    self.profileImageView.center.x = 1000
                    self.profileImageView.transform = CGAffineTransform(rotationAngle: xFromCenter/self.divisor)
                    //self.profileImageView.isHidden = true
                })
            } else if translation.x < -50{
                UIView.animate(withDuration: 0.2, animations: {
                self.profileImageView.center.x = -1000
                    self.profileImageView.transform = CGAffineTransform(rotationAngle: xFromCenter/self.divisor)

                })
            }else {
                UIView.animate(withDuration: 0.1, animations: {
                self.profileImageView.transform = CGAffineTransform.identity
                    self.profileImageView.center = self.pfImageOriginalCenter
                })
            }
        }
    }
    
    @IBAction func profileTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue"{
            let navVC = segue.destination as? UINavigationController
            let profileVC = navVC?.viewControllers.first as! ProfileViewController
            profileVC.imageForProfile = profileImageView.image
        }
    }
    
}


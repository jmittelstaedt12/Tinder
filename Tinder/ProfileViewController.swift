//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Jacob Mittelstaedt on 3/30/17.
//  Copyright © 2017 Jacob Mittelstaedt. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var profileTapImage: UIImageView!
    var imageForProfile: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTapImage.image = imageForProfile

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

}

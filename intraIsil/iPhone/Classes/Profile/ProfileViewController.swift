//
//  ProfileViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var SaveEditProfile: UIButton!
    @IBOutlet var EditProfile: UIButton!
    @IBOutlet var ImgProfile: UIImageView!
    @IBOutlet var CloseSessionProfile: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        CloseSessionProfile.layer.cornerRadius = 10.0
        CloseSessionProfile.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        CloseSessionProfile.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        CloseSessionProfile.layer.shadowOpacity = 1.0
        CloseSessionProfile.layer.shadowRadius = 0.0
        CloseSessionProfile.layer.masksToBounds = false
        ImgProfile.layer.cornerRadius = ImgProfile.frame.size.width / 2
        EditProfile.layer.cornerRadius = 10.0
        EditProfile.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        EditProfile.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        EditProfile.layer.shadowOpacity = 1.0
        EditProfile.layer.shadowRadius = 0.0
        EditProfile.layer.masksToBounds = false
        SaveEditProfile.layer.cornerRadius = 10.0
        SaveEditProfile.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        SaveEditProfile.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        SaveEditProfile.layer.shadowOpacity = 1.0
        SaveEditProfile.layer.shadowRadius = 0.0
        SaveEditProfile.layer.masksToBounds = false
    }


}

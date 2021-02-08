//
//  ScheduleViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit

class ScheduleViewController: UIViewController {
    @IBOutlet weak var switchCourses: UISwitch!
    @IBOutlet weak var buttonCourses: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCourses.isHidden = true
    }
    
    @IBAction func hiddenButtonCourse(_ sender: Any) {
        if switchCourses.isOn{
            buttonCourses.isHidden = false
        }else{
            buttonCourses.isHidden = true
        }
    }
}

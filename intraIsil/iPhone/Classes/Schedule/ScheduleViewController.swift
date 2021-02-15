//
//  ScheduleViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var tlbSchedule: UITableView!
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var arrayRelleno = [Relleno]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ScheduleViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayRelleno.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ScheduleTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ScheduleTableViewCell
        cell.objRelleno = self.arrayRelleno[indexPath.row]
        
        return cell
    }
}

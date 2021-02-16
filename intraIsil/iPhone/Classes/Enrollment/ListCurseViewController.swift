//
//  ListCurseViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/5/21.
//

import UIKit

class ListCurseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let courses = ["o98u7y","31","das"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BlockTableViewCell", bundle: nil), forCellReuseIdentifier: "blockCourse")
    }
}
extension ListCurseViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "blockCourse", for: indexPath) as? BlockTableViewCell
        
        cell?.texto.backgroundColor = .red
        
        return cell!
    }
    
    
}



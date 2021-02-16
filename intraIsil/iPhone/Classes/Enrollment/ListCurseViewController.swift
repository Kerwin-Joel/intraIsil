//
//  ListCurseViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/5/21.
//

import UIKit

class ListCurseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleCourse: UILabel!
    
    private let courses = ["o98u7y","31","das"]
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BlockListTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomListCell")
        titleCourse.text = name
    }
}

extension ListCurseViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomListCell", for: indexPath) as? BlockListTableViewCell

        return cell!
        
    }
    
    
}



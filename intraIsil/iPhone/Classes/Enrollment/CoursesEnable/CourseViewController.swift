//
//  CourseViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/5/21.
//

import UIKit

class CourseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let courses = ["APLICACIONES MOVILES PARA IPHONE ","SOLUCIONES CLOUD","DISPOSITIVOS TECNOLOGICOS","APLICACIONES ANDROID"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
    }

}

extension CourseViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.labelCourse.text = courses[indexPath.row]
        return cell!
    }
    
}
extension CourseViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell  = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.white
        
        let vc = storyboard?.instantiateViewController(identifier: "cursos") as? ListCurseViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        print("tocado")
    }
}

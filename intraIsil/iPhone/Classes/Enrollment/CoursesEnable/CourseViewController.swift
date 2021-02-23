//
//  CourseViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/5/21.
//

import UIKit
import Firebase

class CourseViewController: UIViewController, UITableViewDelegate{
 
    @IBOutlet weak var tableCourses: UITableView!
    var database = Database.database().reference()
    var arrayCourses =   [CourseBE]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tableCourses.delegate = self
        self.tableCourses.delegate = self
        self.tableCourses.dataSource =  self
        self.cargarTabla()
    }
    
    func cargarTabla(){
        
        database.child("IntraIsil").child("Cursos").observe(DataEventType.value, with: { (snapshot) in

            if snapshot.childrenCount > 0 {
                self.arrayCourses.removeAll()

                for course in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    print("course", course)
                    let object = course.value as? [String: AnyObject]
                    
                    let nombre  = object?["nombre"] as! String
                    let profesor  = "\("Prof. ") \(object?["profesor"] as! String)"
                    let urlImage  = object?["urlImage"] as! String
 
                    let course = CourseBE(idCourse: "", urlImage: urlImage, name: nombre, teacher: profesor)

                    self.arrayCourses.append(course)
                }

                DispatchQueue.main.async {
                    self.tableCourses.reloadData()
                }
                //self.tableCourses.reloadData()
            }
        })
        
    }
    
    
}


/*extension CourseViewController: CourseTableViewCellDelegate {
    func CourseTableViewCell(_ cell: CourseTableViewCell, deletePlace place: CourseBE) {
        print("sssss  ====> extension CourseViewController")
        self.showAlertWithTitle("Eliminar", message: "¿Deseas eliminar este lugar?", acceptButton: "Aceptar", cancelButton: "Cancelar", acceptHandler: {
            print("Eliminaaaaar")
        }, cancelHandler: nil)
    }
}*/

extension CourseViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        print("ddddd")
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCourses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CourseTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CourseTableViewCell
        //cell.delegate = self
        cell.obj = self.arrayCourses[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row", indexPath.row)
        let objPlace = self.arrayCourses[indexPath.row]
        print("objPlace ===>", objPlace)
        self.performSegue(withIdentifier: "ListCurseViewController", sender: objPlace)
    }

}
 

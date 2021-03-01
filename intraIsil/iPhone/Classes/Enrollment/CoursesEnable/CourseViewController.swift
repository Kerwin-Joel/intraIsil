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
    var database = Database.database().reference().child("IntraIsil")
    var arrayCourses =   [CourseBE]()
    var idCourse: String?
    var nameCourse: String?
    var nameTeacher: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableCourses.delegate = self
        self.tableCourses.dataSource =  self
        self.cargarTabla()
    }
    
    func cargarTabla(){
        
        self.database.child("Cursos").observe(DataEventType.value, with: { (snapshot) in

            if snapshot.childrenCount > 0 {
                self.arrayCourses.removeAll()

                for course in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let object = course.value as? [String: AnyObject]
                    let nombre  = object?["nombre"] as! String
                    let profesor  = "Profesor: \(object?["profesor"] as! String)"
                    let urlImage  = object?["urlImage"] as! String
                    let idCourse  = course.key
 
                    let course = CourseBE(idCourse: idCourse, urlImage: urlImage, name: nombre, teacher: profesor)

                    self.arrayCourses.append(course)
                }

                DispatchQueue.main.async {
                    self.tableCourses.reloadData()
                }
            }
        })
        
    }
    
    
}



extension CourseViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCourses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CourseTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CourseTableViewCell
        cell.obj = self.arrayCourses[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.arrayCourses[indexPath.row]
        
        self.idCourse = obj.idCourse
        self.nameCourse = obj.name
        self.nameTeacher = obj.teacher
        
        /*
         self.database.child("IntraIsil").child("Cursos").child(obj.idCourse).observe(.value, with: { (snapshot) in
             let media = snapshot.value as! [String : Any]
             //print("media media ===>", media["detalles"] as Any)
             for childSnapshot in media["detalles"] as! JSON {
                 print("ffffffffffff ===>", childSnapshot)
                 //let course = ScheduleBE(json: childSnapshot as! JSON)

             }
             
         })
         */
        
        /*let storyboard = UIStoryboard(name: "Enrollment", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ListSchedure") as! ListCourseViewController{
            controller.uid = self.uid
        }

        self.present(controller, animated: true, completion: nil)*/
        //var controller = storyboard.instantiateViewControllerWithIdentifier("ListSchedure") as! ListCourseViewController
        //self.presentViewController(controller, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "ListSchedure", sender: obj)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ListSchedure"{
                if let destino = segue.destination as? ListCourseViewController{
                    destino.idCourse = self.idCourse
                    destino.nameCourse = self.nameCourse
                    destino.nameTeacher = self.nameTeacher
                }
            }
    }

}
 

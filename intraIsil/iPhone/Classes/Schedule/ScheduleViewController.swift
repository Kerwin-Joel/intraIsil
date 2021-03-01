//
//  ScheduleViewController.swift
//  intraIsil
//
//  Created by kerwin Joel on 2/3/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ScheduleViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tlbSchedule: UITableView!
    
    var database = Database.database().reference().child("IntraIsil")
    var arraySchedule = [EnrolledCourseBE]()
    var uidUsuer: String?
    var dataJSON: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uidUsuer = Auth.auth().currentUser?.uid ?? ""
        self.tlbSchedule.delegate = self
        self.tlbSchedule.dataSource = self
        self.tlbSchedule.allowsSelection = false
        self.tlbSchedule.allowsMultipleSelection = false
        self.cargarTabla()
    }
    
    func cargarTabla(){
        self.database.child("Matriculas").queryOrdered(byChild: "usuario_id").queryStarting(atValue: self.uidUsuer).observeSingleEvent(of: .childAdded) { (snapshot) in
            
            guard snapshot.exists() != false else {
                return
            }
            guard let dict = snapshot.value as? [String:Any] else {
                return
            }
            
            
            for course in dict["detalles"] as? JSON ?? [:]{
                let object = course.value as? [String: AnyObject]
                let curso_id  = object?["curso_id"] as! String
                let horario  = object?["horario"] as! String
                /*
                let json: [String: Any]  = [
                    "urlImage": "https://edteam-media.s3.amazonaws.com/courses/big/2b50db54-d6b6-4123-8e5a-afbd4f765741.jpg",
                    "nameCourse": "ttttt",
                    "nameTeacher": "dddd",
                    "schedule": "Taylor swift"
                ]
                let objEnrollerd = EnrolledCourseBE(json:json)
                self.arraySchedule.append(objEnrollerd)
                */
                //let json: [String: Any] = self.getDataCourse(curso_id: curso_id)
                //print("json =====>", json)
                 self.database.child("Cursos").child(curso_id ?? "").observe(.value, with: { (data) in
                     guard data.exists() != false else {
                         return
                     }
                     
                     guard let dict = data.value as? [String:Any] else {
                         return
                     }
                     
                    var completeSchedure:String = ""
                    var place:String = ""
                     
                    for course in dict["detalles"] as! [String: AnyObject] {
                        print("======================================")
                        print("course ", course)
                        if(course.key == horario){
                            let d = course.value as? [String:Any]
                            print("meyyyyy ", d?["dia"])
                            completeSchedure = "\(d?["dia"] as! String) de \(d?["hora"] as! String)"
                            place = d?["lugar"] as! String
                        }
                        
                        //let object = course.value as? [String: AnyObject]
                        //let nombre  = object?["nombre"] as! String
                        
                        //self.arrayCourses.append(course)
                    }
                    
                    let json: [String: Any]  = [
                        "urlImage": dict["urlImage"] as! String,
                        "nameCourse": dict["nombre"] as! String,
                        "nameTeacher": "Profesor: \(dict["profesor"] ?? "")",
                        "place": place,
                        "schedule": completeSchedure
                    ]
                    
                    
                    DispatchQueue.main.async {
                        let objEnrollerd = EnrolledCourseBE(json:json)
                        self.arraySchedule.append(objEnrollerd)
                    }
                    
                     /*for courseData in dict["detalles"] as? JSON ?? [:]{
                         
                     }*/
                    
                    
                    DispatchQueue.main.async {
                        self.tlbSchedule.reloadData()
                    }
                     
                 })
                //self.arrayCourses.append(course)
            }
            
            /*for course in snapshot.children.allObjects as! [DataSnapshot] {
                
                let object = course.value as? [String: AnyObject]
                let nombre  = object?["nombre"] as! String
                let profesor  = "Profesor: \(object?["profesor"] as! String)"
                let urlImage  = object?["urlImage"] as! String
                let idCourse  = course.key

                let course = CourseBE(idCourse: idCourse, urlImage: urlImage, name: nombre, teacher: profesor)

                //self.arrayCourses.append(course)
            }*/
           
        }
    }
    
    func getDataCourse(curso_id: String) -> [String: Any]{
        
        self.database.child("Cursos").child(curso_id).observe(.value, with: { (data) in
            guard data.exists() != false else {
                return
            }
            
            guard let dict = data.value as? [String:Any] else {
                return
            }
            
            DispatchQueue.main.async {
                self.dataJSON = [
                    "urlImage": dict["urlImage"] as! String,
                    "nameCourse": dict["nombre"] as! String,
                    "nameTeacher": "Profesor: \(dict["profesor"] ?? "")",
                    "schedule": "Taylor swift"
                ]
            }
            
        })
        return self.dataJSON
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ScheduleViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ddddd   ==]", self.arraySchedule.count)
        return self.arraySchedule.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ScheduleTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ScheduleTableViewCell
        cell.obj = self.arraySchedule[indexPath.row]
        
        return cell
    }
}

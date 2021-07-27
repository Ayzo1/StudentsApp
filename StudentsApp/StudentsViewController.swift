import UIKit

class StudentsViewController: UIViewController, UITableViewDataSource {
    
    var listOfStudents: ListOfStudents = ListOfStudents(studentsArray:
        [
            Student(firstName: "Ivan", lastName: "Ivanov", score: 5),
            Student(firstName: "Petr", lastName: "Petrov", score: 4),
            Student(firstName: "Pavel", lastName: "Pavlov", score: 3),
        ]
    )
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStudents.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        let student = listOfStudents[indexPath.row]
        cell.textLabel?.text = student.fullName
        cell.detailTextLabel?.text = String(student.score)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Students"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

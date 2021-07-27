import UIKit

class StudentDetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var nameTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nameTable.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! TextFieldTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textField.placeholder = "First Name"
            cell.textField.text = student.firstName
        case 1:
            cell.textField.placeholder = "Last name"
            cell.textField.text = student.lastName
        case 2:
            cell.textField.placeholder = "Average score"
            if(student.score == 0) {cell.textField.text = ""}
            else {cell.textField.text = String(student.score)}
        default:
            cell.textField.text = student.fullName
        }
        return cell
    }
    

    var student: Student = Student(firstName: "", lastName: "", score: 0)
    var students: ListOfStudents?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTable.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "NameCell")
        if (student.fullName.count < 2){
            navigationItem.title = "New Student"
        }
        else {
            navigationItem.title = student.fullName
            
        }
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

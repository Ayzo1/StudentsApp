import UIKit

class StudentDetailsViewController: UIViewController {

    var student: Student = Student(firstName: "", lastName: "", score: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        if (student.fullName.count < 2){
            navigationItem.title = "New Student"
        }
        else {
            navigationItem.title = student.fullName
            
        }
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

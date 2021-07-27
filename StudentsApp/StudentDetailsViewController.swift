import UIKit

class StudentDetailsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var nameTable: UITableView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let studentData = checkStudentData()
            if(studentData != nil){
                student.firstName = studentData![0]
                student.lastName = studentData![1]
                student.score = Int(studentData![2])!
                students?.addStudent(student: student)
            }
        navigationItem.title = student.fullName
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func checkStudentData() -> [String]? {
        var studentsData: [String] = []
        let alertForText = UIAlertController(title: "Error", message: "Please, type only letters", preferredStyle: .alert)
        let alertForDigit = UIAlertController(title: "Error", message: "Please, enter the number from 1 to 5", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertForText.addAction(okButton)
        alertForDigit.addAction(okButton)
        for i in 0...2 {
            let cell = nameTable.cellForRow(at: IndexPath(row: i, section: 0)) as! TextFieldTableViewCell
            let text = cell.textField.text!
            let reg = "^[a-zA-Zа-яА-Я]+$"
            switch i{
            case 0:
                if((text.range(of: reg, options: .regularExpression)) == nil){
                    present(alertForText, animated: true, completion: nil)
                    return nil
                }
            case 1:
                if((text.range(of: reg, options: .regularExpression)) == nil){
                    present(alertForText, animated: true, completion: nil)
                    return nil
                }
            case 2:
                let reg1 = "^[1-5]$"
                if((text.range(of: reg1, options: .regularExpression)) == nil){
                    present(alertForDigit, animated: true, completion: nil)
                    return nil
                }
            default:
                student.firstName = text
            }
            studentsData.append(text)
        }
        return studentsData
    }
    
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

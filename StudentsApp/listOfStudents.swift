import Foundation

class ListOfStudents {
    
    init(studentsArray: [Student]) {
        students = studentsArray
    }
    
    private var students: [Student] = []
    
    func count() -> Int {
        return students.count
    }
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    subscript(index: Int) -> Student{
        get{
            return students[index]
        }
        set{
            students[index] = newValue
        }
    }
}

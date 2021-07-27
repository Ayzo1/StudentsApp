import Foundation

class Student{
    
    init(firstName: String, lastName: String, score: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.score = score
    }
    
    public var firstName: String = ""
    public var lastName: String = ""
    public var score: Int = 0
    public var fullName: String {lastName + " " + firstName}
}

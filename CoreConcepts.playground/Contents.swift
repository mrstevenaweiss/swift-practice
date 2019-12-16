import UIKit

var welcomeMessage = "Hello, playground"

let yo = "maybe"

let ayo = true


// Optionals

// TODO: Write solution here
let hasAllergies = false
let dogName: String?

dogName = hasAllergies ? nil : "Mango"

var specialDate = (month: 1, day: 2, year: 1990, special: "Birthday")


specialDate.month = 10


var pastries = ["danish", "cookie", "muffin", "eclair"]
pastries

var newPastries = pastries[1...2]
newPastries
newPastries.append("yo")
newPastries
pastries


var players = ["Adam", "Bommel", "Derek", "Eli", "Frank"]

players.first
players.contains("c")
players.count
players.last
players += ["Gloria", "Hermione"]
players.insert("Charles", at: 2)
let teamOne = Array(players[4...7])

let count = 100

for i in 1...count where i % 5 == 0 {
//    print(i)
}

let rangeStart = Int.random(in: 1...10)
for i in rangeStart..<rangeStart+3 {
    print("steven")
}

struct Student {
    let name: String
    var grade: Int
    var pet: String?
    func getPassStatus(_ lowerPass: Int = 50) -> Bool {
        return grade >= lowerPass
    }
    mutating func extraCredit() {
        grade += 5
    }
    mutating func loseCredit() {
        grade -= 10
    }
}
var chris = Student(name: "Chris", grade: 49, pet: nil)
chris.getPassStatus()
chris.extraCredit()
chris.grade
chris.getPassStatus()

var evilChris = chris
evilChris.grade
evilChris.loseCredit()

evilChris.grade
chris.grade




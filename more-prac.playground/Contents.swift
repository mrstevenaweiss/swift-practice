import UIKit

var str = "Hello, playground"
str = "Hello Swift"
let constStr = str
print(constStr)

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7

//let avgReading = (reading1! + reading2! + reading3!) / 3

if let r1 = reading1,
    let r2 = reading2,
    let r3 = reading3 {
    let avgReading = (r1+r2+r3)/3
    print(avgReading)
    
} else {
    print("errors B")
}

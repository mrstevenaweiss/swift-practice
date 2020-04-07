//import UIKit
//
//var str = "Hello, playground"
//
//enum Activity {
//    case bored
//    case running(destination: String)
//    case talking(topic: String)
//    case singing(volume: Int)
//}
//
//var item = Activity.bored
//print(item)
//
//item = Activity.talking(topic: "politics")
//print(item)


let driving = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving )

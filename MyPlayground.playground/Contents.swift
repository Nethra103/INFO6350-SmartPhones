import UIKit

func test(_ str : String,_ intval : Int?) -> Int{
    print("I am a String \(str)")
    guard let intval = intval
    else{
        print ("I am not assigned any value - nil")
        return 0
        
    }
    print ("I am an integer \(intval)")
    return intval*5
}
print("My return value is \(test("Hi", 3))")
print ("My return value is \(test("Hi", nil))")


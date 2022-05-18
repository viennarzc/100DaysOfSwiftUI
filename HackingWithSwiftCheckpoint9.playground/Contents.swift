import UIKit

var greeting = "Hello, playground"


func randomizeNumbers(_ numbers: [Int]?) -> Int? {
    return numbers?.randomElement()
}


let randomNum = try? randomizeNumbers([2,5,129,5]) ?? (1...100).randomElement()

print(randomNum)

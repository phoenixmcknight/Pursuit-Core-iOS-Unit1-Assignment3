//
//  main.swift
//  Calculator
//
//  Created by Phoenix McKnight on 7/18/19.
//  Copyright © 2019 Phoenix McKnight. All rights reserved.
//

import Foundation



var operations: ([String: (Double, Double) -> Double]) = ["+": { $0 + $1 },
                                                          "-": { $0 - $1 },
                                                          "*": { $0 * $1 },
                                                          "/": { $0 / $1 }]

let validOperations = ["+","-","/","*","?"]
var emptyString = String()
func input() -> String? {
    return readLine(strippingNewline: true)! //developer.apple.com/documentation/swift/1641199-readline reference
}

func simpleMath() {
    let tempInput = input()!
    
    let tempArray: [String?] = tempInput.components(separatedBy: " ")
    if tempArray.count != 3 {
        print("The input must be in the \'number\' operator \'number\' format (2 + 2 for example).")

    } else {

    let x = Double(tempArray[0]!)
    let y = Double(tempArray[2]!)

        if x == nil || y == nil {
            print("Please enter valid numbers.")
        } else {
        let tempOperation = tempArray[1]
            if !validOperations.contains((tempOperation!))  {
            print("Invalid operation. Please use \"+\",\"-\",\"*\",\"/\", or \"?\"")
            } else {
                if tempOperation == "?" {
                    let random = operations.randomElement()!
                    let congrats = ["Great","Good job","Excellent","Fantastic","That was really cool","Nice work"]
                    let quotes = ["When life knocks you down, try to land on your back. Because if you can look up, you can get up.","Instead of giving myself reasons why I can’t, I give myself reasons why I can.","Fall seven times, stand up eight.","If you’re going through hell, keep going.","It’s not what happens to you, but how you react to it that matters.","Life is tough, but you must be tougher.","This too shall pass.","I know of no more encouraging fact than the unquestionable ability of man to elevate his life by conscious endeavor.","Whatever you’re going through, many others have not only experienced the same but got out of it just fine.","Encourage those around you by never giving up on your dreams.","Whenever you feel like giving up, remember why you set this goal in the first place.","Every failure is a step closer to success.","In the middle of every difficulty lies opportunity.","Fighting for your dreams isn’t always easy but it’s so worth it.","Setbacks are temporary as long as you don’t give up.","Other people’s opinion of you does not have to become your reality."]
                    let result = random.1(x!,y!)
                    let usedNumber = ("\(tempInput) = \(result)")
                    print("Guess the operation!")
                    print(usedNumber)
                    let guess = input()
                    if guess == random.0 {
                        
                        print("\(congrats.randomElement()!), you're correct! The operation was \"\(random.0)\"")
                    } else {
                        print("Wrong answer, but don't be discouraged! \(quotes.randomElement()!)")
                        print("The correct operation was \"\(random.0)\" .")
                    }
                } else {

        let newOperation = operations[tempOperation!]
        let result = newOperation!(x!,y!)
        emptyString = ("\(tempInput) = \(result)")
        print(emptyString)
            }
        }
    }
}
}
func myFilter(inputArray: [Int], filter: (Int) -> Bool) -> [Int] { // repeat syntax for each  function
    var emptyArr:[Int] = []
    
    for num in inputArray{
        if filter(num) {
            emptyArr.append(num)
        }
    }
    return emptyArr
}

func myMap(inputArray: [Int], map: (Int) -> Double) -> [Double] {
    var emptyArr:[Double] = []
    
    for num in inputArray{
        emptyArr.append(map(num))
    }
    return emptyArr
}

func myReduce(inputArray: [Int], initial: Double, reduce: (Double, Double) -> Double) -> Double {
    var reduceFunc = initial
    
    for num in inputArray{
        reduceFunc = reduce(Double(reduceFunc), Double(num))
    }
    return reduceFunc
}

func complicated() {
   
    let tempInput = input()!
    
    var tempArray = [String?]()
    tempArray = tempInput.components(separatedBy: " ")
    if tempArray.count == 5,
        let part1 = tempArray[0],
        let part2 = tempArray[1],
        let part4 = tempArray[3],
        let part5 = tempArray[4] {
        let tempArray2 = part2.components(separatedBy: ",").map { Int($0)!}
        
        
        switch part1 {
        case "filter":
            if part4 == ">" { //copy syntax for each func
                print("Your filter returns \(myFilter(inputArray: tempArray2, filter: { $0 > Int(part5)!})).")
            } else if part4 == "<" {
                print("Your filter returns \(myFilter(inputArray: tempArray2, filter: { $0 < Int(part5)! })).")
            }
            
        case "map":
            if part4 == "*" {
                print("Your map returns \(myMap(inputArray: tempArray2, map: { Double($0) * Double(part5)!})).")
            } else if part4 == "/" {
                print("Your map returns \(myMap(inputArray: tempArray2, map: { Double($0) / Double(part5)! })).")
            }
        case "reduce":
            if part4 == "+" {
                print("Your reduce returns \(myReduce(inputArray: tempArray2, initial: Double(part5)!, reduce: { Double($0) + Double($1) })).")
            } else if part4 == "*"{
                print("Your reduce returns \(myReduce(inputArray: tempArray2, initial: Double(part5)!, reduce: { Double($0) / Double($1) })).")
            }
        default:
            print("Please enter a valid input. You can choose from \"filter\",\"map\" and \"reduce\"")
        }
        
    }
}

func switch1() {
    print("""
     -----------------------------------------------
    |                                               |
    |   Press "S" for simple calculations           |
    |       or "E" for filter, map and reduce       |
    |                                               |
     -----------------------------------------------
    """)
  
    
    let calculationMethod = input()!.lowercased()
    let questionExamples = ["map 1,5,2,7,3,4 by * 3", "filter 1,5,2,7,3,4 by < 4", "reduce 1,5,2,7,3,4 by + 4"]
    let encourgingWords = ["I’m behind you 100%.",
                           "It’s totally up to you..","It’s your call.","Follow your dreams.","Reach for the stars.","Do the impossible.","Believe in yourself.","The sky is the limit."]
    switch calculationMethod {
    case "s":
        print("Enter your operation to begin.")
        simpleMath()
    case "e":
        print("""
Enter your operation to begin.
You can try something like \(questionExamples.randomElement()!)" Functions are hard but \(encourgingWords.randomElement()!)
""")
        complicated()
    default:
        print("Please enter \"S\" or \"E\".")
    }
    
}

func start() {

var gameStart = true
    let risky = ["Give it a try.",
                 "Go for it.",
                 "Why not?",
                 "It’s worth a shot.",
                 "What are you waiting for?",
                 "What do you have to lose?",
                 "You might as well.",
                 "Just do it."]
    while gameStart == true {
        switch1()
        print("Want to calculate again? \(risky.randomElement()!) Enter \"y\" to continue and \"n\" to end the program.")
        let response = input()!
        if response.lowercased() == "y" {
            gameStart = true
            
        } else if response.lowercased() == "n" {
          break
        }
           
        }
    }


start()

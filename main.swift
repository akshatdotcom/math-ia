// func leibniz(iterations: Int) -> Double {
//     var sum: Double = 0.0

//     var iterationCounter = 0

//     let numerator = 1
//     var denominator = 1
//     var termNegativity = false;

//     while(iterationCounter < iterations) {
//         var term : Double = Double(numerator)/Double(denominator)
//         term *= termNegativity ? -1 : 1

//         sum += term
//         denominator += 2       
//         iterationCounter += 1
//         termNegativity = !termNegativity
//     }

//     return sum
// }



// for x in 1...1000000 {
//     print(leibniz(iterations: x) * 4)
// }

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

var sum: Double = 0.0

var iterationCounter = 0

let iterations = 10000000

let numerator = 1
var denominator = 1
var termNegativity = false

var str = ""

while(iterationCounter < iterations) {
    var term : Double = Double(numerator)/Double(denominator)
    term *= termNegativity ? -1 : 1
    
    sum += term

    let piEstimate = sum * 4
    print("iteration: \(iterationCounter+1), pi estimate: \(piEstimate), \(Double(iterationCounter+1)/Double(iterations)*100.0)%")
    str += "\(String(piEstimate))\n"
        
    denominator += 2       
    iterationCounter += 1
    termNegativity = !termNegativity
}

let filename = URL(string: "file:///home/akshat-shah/Projects/math-ia/output.csv")!

do {
    try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
} catch {
    // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
}

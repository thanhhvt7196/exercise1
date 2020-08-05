import UIKit

var str = "Hello, playground"

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let half = count/2 + count % 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< count]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

func combine<T>(arrays:[[T]]) -> [T] {
    let maxCount = arrays.reduce(0) { max($0, $1.count) }
    var result = [T]()

    for i in 0..<maxCount {
        for array in arrays {
            if i < array.count {
                result.append(array[i])
            }
        }
    }
    return result
}

extension String {
    func check() -> String {
        guard self.count > 0 else {
            return ""
        }
        var numberOfAppearances = [String: Int]()
        let characters = Array(self)
        let characterSet = Set(characters)
        for character in characterSet {
            numberOfAppearances[String(character)] = characters.filter { $0 == character }.count
        }
        let values = numberOfAppearances.values
        if (values.filter { $0 > (characters.count/2 + characters.count % 2) }.count > 0) {
           return ""
        } else {
            let splitedCharacters = characters.sorted().split()
            let firstLeft = splitedCharacters.left
            let lastRight = splitedCharacters.right
            let combinedCharacters = combine(arrays: [firstLeft, lastRight])
            return String(combinedCharacters)
        }
    }
}

"abc".check()
"aaab".check()

"aaaabbc".check()

//
//  Regex.swift
//  Validator
//
//  Created by Arkadiusz Pituła on 16.05.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

public protocol Regex {
    var regex: String { get }
    var errorMessage: String { get }

    func validate(text: String) -> Bool
}

extension Regex {

    public func validate(text: String) -> Bool {
        return isValidString(text: text)
    }

    private func isValidString(text: String) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return stringTest.evaluate(with: text)
    }

}

public func & (left: Regex, right: Regex) -> Regex {
    return ANDRegex(regexA: left, regexB: right)
}

public func | (left: Regex, right: Regex) -> Regex {
    return ORRegex(regexA: left, regexB: right)
}

class ANDRegex: Regex {
    var regex: String = ""
    var errorMessage: String = ""

    private var regexA: Regex
    private var regexB: Regex

    init(regexA: Regex, regexB: Regex) {
        self.regexA = regexA
        self.regexB = regexB

        regex = "A: \(regexA.regex) B: \(regexB.regex)"
        errorMessage = "A: \(regexA.errorMessage) B: \(regexB.errorMessage)"
    }

    func validate(text: String) -> Bool {
        return regexA.validate(text: text) && regexB.validate(text: text)
    }
}

class ORRegex: Regex {
    var regex: String = ""
    var errorMessage: String = ""

    private var regexA: Regex
    private var regexB: Regex

    init(regexA: Regex, regexB: Regex) {
        self.regexA = regexA
        self.regexB = regexB

        regex = "A: \(regexA.regex) B: \(regexB.regex)"
        errorMessage = "A: \(regexA.errorMessage) B: \(regexB.errorMessage)"
    }

    func validate(text: String) -> Bool {
        return regexA.validate(text: text) || regexB.validate(text: text)
    }
}

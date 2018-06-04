//
//  Validator.swift
//  Validator
//
//  Created by Arkadiusz Pituła on 16.05.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

public class Validator {

    public typealias ValidCompletion = (result: Bool, wrong: [Regex]?)
    public typealias ValidCompletionTextField = (result: Bool, pair: [Pair]?)

    public init() {}

    private var pairArray = [Pair]()

    public func append(pair: Pair) {
        pairArray.append(pair)
    }

    public func validate(_ textField: UITextField, regex: [Regex]) -> ValidCompletion {
        return validate(textField.text ?? "", regex: regex)
    }

    public func validate(_ text: String, regex: Regex...) -> ValidCompletion {
        return validate(text, regex: regex)
    }

    public func validate(_ text: String, regex: [Regex]) -> ValidCompletion {

        var wrongArr = [Regex]()
        for r in regex {
            if !r.validate(text: text) {
                wrongArr.append(r)
            }
        }

        if wrongArr.isEmpty {
            return (true, nil)
        }

        return (false, wrongArr)
    }

    public func validateAll() -> ValidCompletionTextField {

        var wrongArr = [Pair]()

        for pair in pairArray {
            let result = validate(pair.textField, regex: pair.regex)
            if result.wrong != nil {
                wrongArr.append(Pair(textField: pair.textField, regex: result.wrong!))
            }
        }

        if wrongArr.isEmpty {
            return (true, nil)
        }

        return (false, wrongArr)
    }

}

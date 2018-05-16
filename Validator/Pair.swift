//
//  Pair.swift
//  Validator
//
//  Created by Arkadiusz Pituła on 16.05.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

public struct Pair {
    var textField: UITextField
    var regex: [Regex]

    public init(textField: UITextField, regex: [Regex]) {
        self.textField = textField
        self.regex = regex
    }

    public init(textField: UITextField, regex: Regex) {
        self.textField = textField
        self.regex = [regex]
    }
}

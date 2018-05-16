//
//  SimpleRegex.swift
//  Validator
//
//  Created by Arkadiusz Pituła on 16.05.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

public class EmailRegex: Regex {

    public init() {}

    public var regex: String {
        return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    }

    public var errorMessage: String {
        return "Email is not valid"
    }
}

public class StrongPasswordRegex: Regex {

    public init() {}

    public var regex: String {
        return "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
    }

    public var errorMessage: String {
        return "Email is not valid"
    }

}


public class PhoneRegex: Regex {

    public init() {}

    public var regex: String {
        return "[0-9]{10,14}"
    }

    public var errorMessage: String {
        return "Phone is not valid"
    }

}

public class LetterRegexWithoutSpaceRegex: Regex {

    public init() {}

    public var regex: String {
        return "^[\\p{L}\\s'.-]+$"
    }

    public var errorMessage: String {
        return "Letter regex without space is not valid"
    }

}

public class AlphabeticStringFirstLetterCapsRegex: Regex {

    public var regex: String {
        return "^[A-Z]+[a-zA-Z]*$"
    }

    public var errorMessage: String {
        return "AlphabeticStringFirstLetterCaps is not valid"
    }

}

public class AlphabeticStringWithSpaceRegex: Regex {

    public var regex: String {
        return "^[a-zA-Z ]*$"
    }

    public var errorMessage: String {
        return "AlphabeticStringWithSpace is not valid"
    }
}

public class PostCodeRegex: Regex {

    public var regex: String {
        return "^\\d{2}-\\d{3}$"
    }

    public var errorMessage: String {
        return "PostCodeRegex is not valid"
    }
}

public class CreditCardRegex: Regex {

    public var regex: String {
        return "^[0-9 ]{12,19}$"
    }

    public var errorMessage: String {
        return "CreditCardRegex is not valid"
    }
}

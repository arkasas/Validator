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
        return "Password is not valid"
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

    public init() {}

    public var regex: String {
        return "^[A-Z]+[a-zA-Z]*$"
    }

    public var errorMessage: String {
        return "AlphabeticStringFirstLetterCaps is not valid"
    }

}

public class AlphabeticStringWithSpaceRegex: Regex {

    public init() {}

    public var regex: String {
        return "^[a-zA-Z ]*$"
    }

    public var errorMessage: String {
        return "AlphabeticStringWithSpace is not valid"
    }
}

public class PostCodeRegex: Regex {

    public init() {}

    public var regex: String {
        return "^\\d{2}-\\d{3}$"
    }

    public var errorMessage: String {
        return "PostCodeRegex is not valid"
    }
}

public class CreditCardRegex: Regex {

    public init() {}

    public var regex: String {
        return "^[0-9 ]{12,19}$"
    }

    public var errorMessage: String {
        return "CreditCardRegex is not valid"
    }
}

public class PeselRegex: Regex {

    public init() {}

    public var regex: String {
        return "^[0-9]{11}$"
    }

    public var errorMessage: String {
        return "PeselRegex is not valid"
    }
}

public class MinimumLengthRegex: Regex {

    public var regex: String
    public var errorMessage: String {
        return "MinimumLengthRegex is not valid"
    }


    init(minimum: Int) {
        if minimum < 0 {
            fatalError("minimum cannot be < 0")
        }
        regex = "^.{\(minimum),}$"
    }
}

public class MaximumLengthRegex: Regex {

    public var regex: String
    public var errorMessage: String {
        return "MaximumLengthRegex is not valid"
    }

    init(maximum: Int) {
        if maximum < 0 {
            fatalError("Maximum cannot be < 0")
        }
        regex = "^.{0,\(maximum)}$"
    }
}

public class SpecifiedLengthRegex: Regex {

    public var regex: String
    public var errorMessage: String {
        return "SpecifiedLengthRegex is not valid"
    }

    init(min: Int, max: Int) {
        if min < 0 || max < 0 {
            fatalError("Values cannot be < 0")
        }

        regex = "^.{\(min),\(max)}$"
    }

}


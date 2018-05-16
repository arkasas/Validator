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
}

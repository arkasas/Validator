//
//  ValidatorTests.swift
//  ValidatorTests
//
//  Created by Arkadiusz Pituła on 16.05.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import XCTest
@testable import Validator

class ValidatorTests: XCTestCase {

    let validator = Validator()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidator() {
        XCTAssertNotNil(validator)
    }

    func testEmailRegex() {
        XCTAssertFalse(validator.validate("", regex: EmailRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: EmailRegex()).result)
        XCTAssertFalse(validator.validate("11111111111", regex: EmailRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: EmailRegex()).result)
        XCTAssertTrue(validator.validate("test@test.test", regex: EmailRegex()).result)
    }

    func testStrongPasswordRegex() {
        XCTAssertFalse(validator.validate("", regex: StrongPasswordRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: StrongPasswordRegex()).result)
        XCTAssertFalse(validator.validate("11111111111", regex: StrongPasswordRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: StrongPasswordRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: StrongPasswordRegex()).result)
        XCTAssertTrue(validator.validate("Zaq12345@", regex: StrongPasswordRegex()).result)
    }

    func testPhoneRegex() {
        XCTAssertFalse(validator.validate("", regex: PhoneRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: PhoneRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: PhoneRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: PhoneRegex()).result)
        XCTAssertTrue(validator.validate("1234567890", regex: PhoneRegex()).result)
        XCTAssertTrue(validator.validate("12345678901234", regex: PhoneRegex()).result)
    }

    func testLetterWithoutSpaceRegex() {
        XCTAssertFalse(validator.validate("", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertTrue(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertFalse(validator.validate("1234567890", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertFalse(validator.validate("12345678901234", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertTrue(validator.validate("test test", regex: LetterRegexWithoutSpaceRegex()).result)
        XCTAssertTrue(validator.validate(" ", regex: LetterRegexWithoutSpaceRegex()).result)
    }

    func testAlphabeticStringFirstLetterCapsRegex() {
        XCTAssertFalse(validator.validate("", regex: AlphabeticStringFirstLetterCapsRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: AlphabeticStringFirstLetterCapsRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: AlphabeticStringFirstLetterCapsRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: AlphabeticStringFirstLetterCapsRegex()).result)
        XCTAssertFalse(validator.validate("1234567890", regex: AlphabeticStringFirstLetterCapsRegex()).result)
        XCTAssertTrue(validator.validate("Test", regex: AlphabeticStringFirstLetterCapsRegex()).result)
    }

    func testAlphabeticStringWithSpaceRegex() {
        XCTAssertTrue(validator.validate("", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertTrue(validator.validate("fjfjdjosdffidsofsdijfgsdojfgdjso", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertFalse(validator.validate("1234567890", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertTrue(validator.validate("Test", regex: AlphabeticStringWithSpaceRegex()).result)
        XCTAssertTrue(validator.validate("Test Tesrt", regex: AlphabeticStringWithSpaceRegex()).result)
    }

    func testPostCodeRegex() {
        XCTAssertFalse(validator.validate("", regex: PostCodeRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: PostCodeRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: PostCodeRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: PostCodeRegex()).result)
        XCTAssertFalse(validator.validate("1234567890", regex: PostCodeRegex()).result)
        XCTAssertFalse(validator.validate("22-22", regex: PostCodeRegex()).result)
        XCTAssertTrue(validator.validate("22-212", regex: PostCodeRegex()).result)
    }

    func testCreditCardRegex() {
        XCTAssertFalse(validator.validate("", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("fjfjdjosdffjidsofsdijfgsdojfgdjso", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("//////////////////", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("test@test.test", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("1234567890", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("22-212", regex: CreditCardRegex()).result)
        XCTAssertFalse(validator.validate("111", regex: CreditCardRegex()).result)
        XCTAssertTrue(validator.validate("111111111111", regex: CreditCardRegex()).result)
        XCTAssertTrue(validator.validate("1111111111111111111", regex: CreditCardRegex()).result)
    }


    func testOrRegex() {
        let regex = EmailRegex() | PeselRegex()
        XCTAssertTrue(validator.validate("00000000000", regex: [regex]).result)
        XCTAssertTrue(validator.validate("test@test.com", regex: regex).result)
        XCTAssertFalse(validator.validate("ddd22", regex: regex).result)
        XCTAssertFalse(validator.validate("", regex: regex).result)
    }

    func testAndRegex() {
        let regex = EmailRegex() & StrongPasswordRegex()
        XCTAssertFalse(validator.validate("", regex: regex).result)
        XCTAssertFalse(validator.validate("test@test.com", regex: regex).result)
        XCTAssertFalse(validator.validate("Zaq12345", regex: regex).result)
        XCTAssertTrue(validator.validate("Test@tes1t.com", regex: regex).result)
    }

    func testAndOrRegex() {
        let regex = (EmailRegex() | PeselRegex()) & StrongPasswordRegex()
        XCTAssertFalse(validator.validate("", regex: regex).result)
        XCTAssertFalse(validator.validate("test@test.com", regex: regex).result)
        XCTAssertFalse(validator.validate("Zaq12345", regex: regex).result)
        XCTAssertTrue(validator.validate("Test@tes1t.com", regex: regex).result)
        XCTAssertFalse(validator.validate("00000000000", regex: regex).result)
    }

    func testMinimumLength() {
        XCTAssertTrue(validator.validate("", regex: MinimumLengthRegex(minimum: 0)).result)
        XCTAssertTrue(validator.validate("1", regex: MinimumLengthRegex(minimum: 1)).result)
        XCTAssertFalse(validator.validate("111", regex: MinimumLengthRegex(minimum: 5)).result)
    }

    func testMaximumLength() {
        let reg = MaximumLengthRegex(maximum: 10)

        XCTAssertFalse(validator.validate("11111111111", regex: reg).result)
        XCTAssertTrue(validator.validate("11", regex: reg).result)
    }

    func testSpecifiedLength() {
        let reg = SpecifiedLengthRegex(min: 5, max: 10)
        XCTAssertFalse(validator.validate("", regex: reg).result)
        XCTAssertFalse(validator.validate("111", regex: reg).result)
        XCTAssertFalse(validator.validate("1111", regex: reg).result)
        XCTAssertFalse(validator.validate("asdfghjkloi", regex: reg).result)
        XCTAssertTrue(validator.validate("drtgh", regex: reg).result)
        XCTAssertTrue(validator.validate("dfrtufsw", regex: reg).result)
        XCTAssertTrue(validator.validate("edcvfrtgbn", regex: reg).result)

    }

}

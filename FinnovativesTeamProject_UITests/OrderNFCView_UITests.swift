//
//  OrderNFCView_UITests.swift
//  FinnovativesTeamProject_UITests
//
//  Created by Akramov Akbarkhon on 27/04/25.
//

import XCTest

let scrollViewsQuery = app.scrollViews

final class OrderNFCView_UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws { }

    func test_OrderView_confirmButton_shouldCloseView() {
        app.tabBars["Tab Bar"].buttons["Services"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["Purchase tickets for various events"].swipeUp()
        elementsQuery.buttons["Order NFC Sticker, Order NFC sticker for your business"].tap()
        app.textFields["Search"].tap()
        
        app.keys["E"].tap()
        
        app.scrollViews.containing(.other, identifier:"Vertical scroll bar, 1 page")
                        .children(matching: .other)
                        .element(boundBy: 0)
                        .children(matching: .other)
                        .element.children(matching: .button)
                        .element(boundBy: 0)
                        .tap()
        
        let phoneNumberTextField = app.textFields["Phone number"]
        phoneNumberTextField.tap()
        
        app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"1\"]",".keys[\"1\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"2\"]",".keys[\"2\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["3"].tap()
        app.keys["4"].tap()
        app.keys["5"].tap()
        app.keys["6"].tap()
        app.keys["7"].tap()
        app.keys["8"].tap()
        app.keys["9"].tap()
        
        let numberOfNfcStickersTextField = app.textFields["Number of NFC stickers"]
        numberOfNfcStickersTextField.tap()
        app.keys["5"].tap()
        
        app.buttons["Confirm"].tap()
    }
}

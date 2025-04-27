//
//  GuidelineView_UITests.swift
//  FinnovativesTeamProject_UITests
//
//  Created by Akramov Akbarkhon on 25/04/25.
//

import XCTest

let app = XCUIApplication()
let collectionViewsQuery = app.collectionViews

final class GuidelineView_UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}

    func test_GuidelineView_xButton_shouldCloseView() {
     
        let screen = app.windows.element(boundBy: 0)
        let rightQuarter = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.85, dy: 0.5))
        let leftQuarter = screen.coordinate(withNormalizedOffset: CGVector(dx: 0.15, dy: 0.5))
        
        let storyimage2Image = collectionViewsQuery.images["StoryImage2"]
        let xButton = collectionViewsQuery.buttons["xmark"]
        
        collectionViewsQuery.children(matching: .scrollView)
            .element(boundBy: 1)
            .children(matching: .cell)
            .element(boundBy: 0)
            .otherElements.containing(.image, identifier:"event")
            .element
            .tap()
        
        rightQuarter.tap()
        storyimage2Image/*@START_MENU_TOKEN@*/.press(forDuration: 2.1);/*[[".tap()",".press(forDuration: 2.1);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rightQuarter.tap()
        leftQuarter.tap()
        rightQuarter.tap()
        xButton.tap()

        XCTAssertFalse(xButton.exists, "xButton should disappear after tapping to close the view.")
    }
}

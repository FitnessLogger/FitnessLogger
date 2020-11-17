//
//  FitnessLoggerUITests.swift
//  FitnessLoggerUITests
//
//  Created by Marcus August Christiansen on 29/09/2020.
//  Copyright © 2020 FitnessLogger. All rights reserved.
//

import XCTest

class FitnessLoggerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let app2 = app
        
        app2.textFields["Email"].clearText(andReplaceWith: "UITest@mail.com")
        app2.secureTextFields["Password"].clearText(andReplaceWith: "UITestPassword")
        
        app2.buttons["Sign In"].tap()
        sleep(3)
        app2.navigationBars["My Programs"].buttons["plus"].tap()
        sleep(1)
        app2.textFields["Enter program name"].tap()
        app2.textFields["Enter program name"].typeText("Something")
        sleep(1)
        
        app2.buttons["Add exercise"].tap()
        sleep(1)
        
        app2.textFields["Enter exercise name"].tap()
        app2.textFields["Enter exercise name"].typeText("Test Exercise")
        sleep(1)
        
        let accordianButtonsQuery = app2.buttons.matching(identifier: "Save")
        if accordianButtonsQuery.count > 0 {
            let firstButton = accordianButtonsQuery.element(boundBy: 1)
            firstButton.tap()
        }
        else {
            app2.buttons["Save"].tap()
        }

        sleep(1)
        app2.navigationBars["Add program"].buttons["Save"].tap()

        
        app2.tabBars["Tab Bar"].buttons["3.circle"].tap()
        app2.buttons["Sign Out"].tap()
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

// Lån fra : https://stackoverflow.com/questions/32821880/ui-test-deleting-text-in-text-field
extension XCUIElement {
    func clearText(andReplaceWith newText:String? = nil) {
        tap()
        tap() //When there is some text, its parts can be selected on the first tap, the second tap clears the selection
        press(forDuration: 1.0)
        let selectAll = XCUIApplication().menuItems["Select All"]
        //For empty fields there will be no "Select All", so we need to check
        if selectAll.waitForExistence(timeout: 0.5), selectAll.exists {
            selectAll.tap()
            typeText(String(XCUIKeyboardKey.delete.rawValue))
        }
        if let newVal = newText { typeText(newVal) }
    }
}

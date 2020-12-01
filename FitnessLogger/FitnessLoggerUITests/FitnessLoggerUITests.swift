import XCTest

class FitnessLoggerUITests: XCTestCase {
    
    var app = XCUIApplication()
    var isLaunched = false
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        if !isLaunched {
            app.launch()
            isLaunched.toggle()
        }

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1_SignIn() throws {
        
        app.textFields["Email"].clearText(andReplaceWith: "UITest@mail.com")
        app.secureTextFields["Password"].clearText(andReplaceWith: "UITestPassword")
        
        app.buttons["Sign In"].tap()
        sleep(3)

        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["3.circle"].isHittable)
    }
    
    func test2_AddProgram() throws {

        app.navigationBars["My Programs"].buttons["plus"].tap()
        sleep(1)
        app.textFields["Enter program name"].tap()
        app.textFields["Enter program name"].typeText("Something")
        sleep(1)

        app.buttons["Add exercise"].tap()
        sleep(1)

        app.textFields["Enter exercise name"].tap()
        app.textFields["Enter exercise name"].typeText("Test Exercise")
        sleep(1)

        let accordianButtonsQuery = app.buttons.matching(identifier: "Save")
        if accordianButtonsQuery.count > 0 {
            let firstButton = accordianButtonsQuery.element(boundBy: 1)
            firstButton.tap()
        }
        else {
            app.buttons["Save"].tap()
        }

        sleep(1)
        app.navigationBars["Add program"].buttons["Save"].tap()

        XCTAssertTrue(app.tables.containing(.cell, identifier:"Something\n1 exercise").count == 1)
    }
    
    func test3_AddLog() throws {
        app.tables.containing(.cell, identifier:"Something\n1 exercise").element.swipeDown()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Something\n1 exercise"]/*[[".cells[\"Something\\n1 exercise\"].buttons[\"Something\\n1 exercise\"]",".buttons[\"Something\\n1 exercise\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.tables.containing(.cell, identifier:"Test Exercise").element.swipeDown()
        tablesQuery.buttons["Test Exercise"].tap()
        
        let plusButton = app.buttons["+"]
        plusButton.tap()
        plusButton.tap()
        plusButton.tap()
        plusButton.tap()
        plusButton.tap()
        app.buttons["Save"].tap()
        app.navigationBars["Something"].buttons["My Programs"].tap()
    }
    
    func test4_DeleteProgram() throws {
        app.tables.containing(.cell, identifier:"Something\n1 exercise").element.swipeDown()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Something\n1 exercise"]/*[[".cells[\"Something\\n1 exercise\"].buttons[\"Something\\n1 exercise\"]",".buttons[\"Something\\n1 exercise\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()

        app.tables.cells.element(boundBy: 0).buttons["Delete"].tap()
        
        XCTAssertTrue(app.buttons["Add training program"].isHittable)
    }
    
    func test5_SignOut() throws {
        
        app.tabBars["Tab Bar"].buttons["3.circle"].tap()
        app.buttons["Sign Out"].tap()

        XCTAssertTrue(app.buttons["Sign In"].isHittable)
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

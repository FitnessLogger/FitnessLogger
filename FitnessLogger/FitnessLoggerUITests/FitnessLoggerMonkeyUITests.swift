import XCTest
import SwiftMonkey

class FitnessLoggerMonkeyUITests: XCTestCase {
    
    var app = XCUIApplication()
    var isLaunched = false
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launchArguments = ["--MonkeyPaws"]
        
        if !isLaunched {
            app.launch()
            isLaunched.toggle()
        }

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
        !CAN ONLY BE RUN ON TARGET 13.6!
     */
    func testMonkey() throws {
        
        let monkey = Monkey(frame: app.frame)
        
        _ = app.descendants(matching: .any).element(boundBy: 0).frame
        
        monkey.addDefaultUIAutomationActions()
        monkey.addXCTestTapAlertAction(interval: 100, application: app)
        monkey.monkeyAround(forDuration: 60)
    }
}


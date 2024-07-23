import XCTest

class EntryUITests: XCTestCase {

    func testInitialRouteIsLogin() {
        let app = XCUIApplication()
        app.launch()

        // Verify that the login screen is shown initially
        XCTAssertTrue(app.textFields["Имя пользователя"].exists)
    }
}
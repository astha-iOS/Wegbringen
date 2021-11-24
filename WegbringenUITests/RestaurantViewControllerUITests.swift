//
//  RestaurantViewControllerUITests.swift
//  WegbringenUITests
//
//  Created by Astha yadav on 21/11/21.
//

import XCTest

class RestaurantViewControllerUITests: XCTestCase {
    
    var searchBar: UISearchBar = UISearchBar()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRestuarntSearch(){
        
        let app = XCUIApplication()

        XCTAssertEqual(app.tables.count, 1)
        XCTAssertEqual(app.searchFields.count, 1)
        XCTAssertEqual(app.buttons.count, 2)
        
        XCTAssertEqual(app.searchFields.element.placeholderValue, "Search restaurant by name")
        
        let table = app.tables.element(boundBy: 0)
        XCTAssertEqual(table.cells.count, 19)
    }
    
    func testSearchBarExist(){
        let app = XCUIApplication()
        app.launch()
               
        let searchBar = app.searchFields.firstMatch
        XCTAssertTrue(searchBar.exists)
    }

    func testSearchBarKeyboardSearchButton(){
        let app = XCUIApplication()
        app.searchFields["Search restaurant by name"].clearAndEnterText("Sushi")
        app.buttons["Search"].tap()
    }

}

extension XCUIElement{
    func clearAndEnterText(_ text: String) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
        self.typeText(text)
    }
}

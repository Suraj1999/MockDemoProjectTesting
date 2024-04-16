//
//  MockDemoProjectUserInterfaceTests.swift
//  MockDemoProjectUserInterfaceTests
//
//  Created by Suraj Gupta on 17/04/24.
//


    import XCTest
    @testable import MockDemoProject

    final class when_user_clicks_on_login_button: XCTestCase {
        
        private var app: XCUIApplication!
        
        override func setUp() async throws {
            app = XCUIApplication()
            continueAfterFailure = false
            app.launchEnvironment = ["ENV": "TEST"]
            
        }

        func test_should_error_message_for_missing_required_fields() {
            
           
            app.launch()
            let usernameTextField = app.textFields["usernameTextField"]
            usernameTextField.tap()
            usernameTextField.typeText("")
            
            let passwordTextField = app.textFields["passwordTextField"]
            passwordTextField.tap()
            passwordTextField.typeText("")
            
            let loginButton = app.buttons["loginButton"]
            loginButton.tap()
            
            let messageTextField = app.staticTexts["messageText"]
            
            XCTAssertEqual(messageTextField.label, "Required fields are missing")
            
        }
        
        func test_should_navigate_to_dashboard_page_when_authenticated() {
            
            app.launch()
            
            let usernameTextField = app.textFields["usernameTextField"]
            usernameTextField.tap()
            usernameTextField.typeText("JohnDoe")
            
            let passwordTextField = app.textFields["passwordTextField"]
            passwordTextField.tap()
            passwordTextField.typeText("Password")
            
            let loginButton = app.buttons["loginButton"]
            loginButton.tap()
            
            let dashboardNavBarTitle = app.staticTexts["Dashboard"]
            XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
        }
        
    }



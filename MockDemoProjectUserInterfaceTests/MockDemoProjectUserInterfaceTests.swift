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
        private var loginPageObject: LoginPageObjects!
        
        override func setUp() async throws {
            app = XCUIApplication()
            loginPageObject = LoginPageObjects(app: app)
            continueAfterFailure = false
            app.launchEnvironment = ["ENV": "TEST"]
            
        }

        func test_should_error_message_for_missing_required_fields() {
            
           
            app.launch()
            let usernameTextField = loginPageObject.usernameTextField
            usernameTextField.tap()
            usernameTextField.typeText("")
            
            let passwordTextField = loginPageObject.passwordTextField
            passwordTextField.tap()
            passwordTextField.typeText("")
            
            let loginButton = loginPageObject.loginButton
            loginButton.tap()
            
            let messageTextField = loginPageObject.messageText
            
            XCTAssertEqual(messageTextField.label, "Required fields are missing")
            
        }
        
        func test_should_display_error_message_for_invalid_credentials() {
            
            app.launch()
            
            let usernameTextField = loginPageObject.usernameTextField
            usernameTextField.tap()
            usernameTextField.typeText("JohnDoe")
            
            let passwordTextField = loginPageObject.passwordTextField
            passwordTextField.tap()
            passwordTextField.typeText("WrongPassword")
            
            let loginButton = loginPageObject.loginButton
            loginButton.tap()
            
            let messageText = loginPageObject.messageText
            XCTAssertEqual(messageText.label, "Invalid credentials")
        }
        
        func test_should_navigate_to_dashboard_page_when_authenticated() {
            
            app.launch()
            
            let usernameTextField = loginPageObject.usernameTextField
            usernameTextField.tap()
            usernameTextField.typeText("JohnDoe")
            
            let passwordTextField = loginPageObject.passwordTextField
            passwordTextField.tap()
            passwordTextField.typeText("Password")
            
            let loginButton = loginPageObject.loginButton
            loginButton.tap()
            
            let dashboardNavBarTitle = app.staticTexts["Dashboard"]
            XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
        }
        
    }



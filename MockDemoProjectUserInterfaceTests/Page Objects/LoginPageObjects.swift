//
//  LoginPageObjects.swift
//  MockDemoProjectUserInterfaceTests
//
//  Created by Suraj Gupta on 17/04/24.
//

import Foundation
import XCTest

class LoginPageObjects {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        return app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        return app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        return app.buttons["loginButton"]
    }
    
    var messageText: XCUIElement {
        return app.staticTexts["messageText"]
    }
}


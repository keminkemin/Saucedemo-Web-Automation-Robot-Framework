*** Settings ***
Resource    ../Resource/login.resource

Suite Setup        Run Keywords    Configure selenium
Suite Teardown     Run Keywords    Exit selenium

Test Setup         Run Keywords    Open browser then go to url
Test Teardown      Run Keywords    Exit selenium

*** Test Cases ***
User able to login using valid username and valid password
    Given user in login page
    When user login using username and password    ${VALIDUSERNAME}    ${VALIDPASSWORD}
    Then user in homepage    #user proceed to product list page

User not able to login using valid username and invalid password
    Given user in login page
    When user login using username and password    ${VALIDUSERNAME}    ${INVALIDPASSWORD}
    Then user in login page    #user still in login page

User not able to login using invalid username and valid password
    Given user in login page
    When user login using username and password    ${INVALIDUSERNAME}    ${VALIDPASSWORD}
    Then user in login page    #user still in login page

User not able to login using invalid username and invalid password
    Given user in login page
    When user login using username and password    ${INVALIDUSERNAME}    ${INVALIDPASSWORD}
    Then user in login page    #user still in login page

User not able to login using empty field 
    Given user in login page
    When user login using username and password    ${EMPTY}    ${EMPTY}
    Then user in login page    #user still in login page

User not able to login using lockout username
    Given user in login page
    When user login using username and password    locked_out_user    ${VALIDPASSWORD}
    Then user in login page    #user still in login page

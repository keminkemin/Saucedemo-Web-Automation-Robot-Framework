*** Settings ***
Resource    ./init.resource
Resource     ./locator.resource

*** Keywords ***
user login using username and password
    [Arguments]    ${username}    ${password}
    Input Text    ${usernameField}    ${username}
    Input Text    ${passwordField}    ${password}
    Click Element    ${loginButton}

user in homepage
    Element Should Be Visible    ${appLogo}
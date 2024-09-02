*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${BASEURL}            https://www.saucedemo.com/v1/
${VALIDUSERNAME}      standard_user
${VALIDPASSWORD}      secret_sauce
${INVALIDUSERNAME}    ASD123
${INVALIDPASSWORD}    ASD123
${BROWSER}            chrome
${SELENIUM_SPEED}       0.3 seconds
${SELENIUM_WAIT_SPEED}  0.5 seconds
${SELENIUM_TIMEOUT}     30 seconds

*** Keywords ***
Configure selenium
    Set Selenium Speed              ${SELENIUM_SPEED}
    Set Selenium Implicit Wait      ${SELENIUM_WAIT_SPEED}
    Set Selenium Timeout            ${SELENIUM_TIMEOUT}

Open browser then go to url
    Open Browser    ${BASEURL}    ${BROWSER}
    Maximize Browser Window

user in login page
    Location Should Be    ${BASEURL}

Exit selenium
    Close All Browsers
    
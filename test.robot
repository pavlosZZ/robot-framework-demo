*** Settings ***
Documentation       Simple example using SeleniumLibrary.

Library             SeleniumLibrary


*** Variables ***
${LOGIN URL}    https://www.saucedemo.com/
${BROWSER}      Edge


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    standard_user
    Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Input Username
    [Arguments]    ${username}
    Input Text    css=[id=user-name]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css=[id = password]    ${password}

Submit Credentials
    Click Button    css=[id=login-button]

Welcome Page Should Be Open
    Title Should Be    Swag Labs

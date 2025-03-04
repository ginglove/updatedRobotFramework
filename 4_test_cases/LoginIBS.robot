*** Settings ***
# Documentation    Suite description
Resource            ../imports.robot

Test Setup          [Common] - Open Chrome Browser with mode   ${URL}  ${browser}
Test Teardown       Close All Browsers


*** Test Cases ***
[TC 02] - User input valid user information
    [Kw] - User input User information for registration
    ...    ${firstName}
    ...    ${lastName}
    ...    ${username}
    ...    ${email}
    ...    ${password}
    ...    ${confirm_password}
    ...    ${description}
    [Kw] - User click button Submit
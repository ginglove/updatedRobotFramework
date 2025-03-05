*** Settings ***
# Documentation    Suite description
Resource            ../imports.robot

Test Setup          [Common] - Open Chrome Browser with mode   ${URL}  ${BROWSER}
Test Teardown       Close All Browsers


*** Test Cases ***
[TC 02] - User input valid user information
    [Tags]    TC_02
    [Documentation]    This testcases which test the valiation of user information
    [KW] - User input User information for registration
    ...    ${firstName}
    ...    ${lastName}
    ...    ${username}
    ...    ${email}
    ...    ${password}
    ...    ${confirm_password}
    ...    ${description}
    [KW] - User click button Submit
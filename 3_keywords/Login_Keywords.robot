*** Settings ***
Documentation       Suite description

Resource            ../imports.robot


*** Keywords ***
[Kw] - User input User information for registration
    [Arguments]
    ...    ${firstname}
    ...    ${lastname}
    ...    ${username}
    ...    ${email}
    ...    ${password}
    ...    ${confirm_password}
    ...    ${description}
    Sleep    5s
    ##Input ${firstname} into ${txtFirstname}
    [Common] - Input text into textbox    ${txtFirstname}    ${firstname}
    [Common] - Input text into textbox    ${txtLastName}    ${lastname}
    [Common] - Input text into textbox    ${txtLastName}    ${lastname}
    [Common] - Input text into textbox    ${txtUsername}    ${username}
    [Common] - Input text into textbox    ${txtEmail}    ${email}
    [Common] - Input text into textbox    ${txtUserPasswords}    ${password}
    [Common] - Input text into textbox    ${txtConfirmPassword}    ${confirm_password}
    [Common] - Input text into textbox    ${txtUserBio}    ${description}

[Kw] - User click button Submit
    [Common] - Click element    ${btnSubmit}

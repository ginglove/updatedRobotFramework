*** Settings ***
#Documentation    Suite description
Resource          ../imports.robot
Test Setup
...               [KW] - Open Browser with input url and type    ${URL}    ${BROWSER}
Test Teardown     Close All Browsers

*** Test Cases ***
[TC 01] - Login invalid username
    [Common] - click element    ${link_Language}
    [Common] - Input text into textbox    ${txt_Username}    invalid
    [Common] - Input text into textbox    ${txt_Password}    111111
    [Common] - Input text into textbox    ${txt_Captra}    1
    [Common] - Verify display text of element    ${txt_Message}    User does not exist!
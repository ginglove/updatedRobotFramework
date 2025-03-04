*** Settings ***
Documentation      Suite description
Resource           ../imports.robot

*** Keywords ***
[Kw] - Open browser
    [Arguments]    ${url}
     [Common] - Open Chrome Browser with mode     ${url}

[Kw] - Input into Account, Password and Captra
     [Arguments]     ${user}     ${pass}     ${cap}
     Sleep     5s
     [Common] - click element     ${link_Language}
     [Common] - Input text into textbox     ${txt_Username}     ${user}
     [Common] - Input text into textbox     ${txt_Password}     ${pass}
     [Common] - Input text into textbox     ${txt_Captra}     ${cap}
[KW] - Open Browser with input url and type
     [Arguments]     ${url}     ${browser}
     Open Browser     ${url}     ${browser}
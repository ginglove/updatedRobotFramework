*** Settings ***
Resource    ../imports.robot


*** Variables ***
${SPECIAL}      !#%^*()-_
${NUMBERS}      1234567890


*** Keywords ***
[Common] - click element checkbox by text
    [Arguments]    ${text}
    Wait Until Keyword Succeeds
    ...    30s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    //label[contains(text(),'${text}')]
    ...    timeout=40s
    ...    error=Could not find //label[contains(text(),'${text}')] element.
    click element    //label[contains(text(),'${text}')]

[Common] - click element by text
    [Arguments]    ${text}
    Wait Until Keyword Succeeds
    ...    30s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    //div[text()='${text}']
    ...    timeout=40s
    ...    error=Could not find //div[text()='${text}'] element.
    click element    //div[text()='${text}']
# [Common] - Verify display text of element
#    [Arguments]    ${input_element}    ${input_text}
#    ${value}=    Get text    ${input_element}
#    Should Be Equal As Strings    ${value}    ${input_text}

[Common] - Verify menu is display
    [Arguments]    ${value}    ${input_text}
    ${value}    Get text    //a[text()='${value}']
    Should Be Equal As Strings    ${value}    ${input_text}

[Common] - Click element button by text
    [Arguments]    ${txt_button}
    Wait Until Keyword Succeeds
    ...    30s
    ...    15s
    ...    Wait Until Element Is Visible
    ...    //button[text()='${txt_button}']
    ...    timeout=30s
    ...    error=Could not find //button[text()='${txt_button}'] element.
    Click Element    //button[text()='${txt_button}']

[Common] - Upload file
    [Arguments]    ${textbox_loc}    ${text}
    # Wait Until Keyword Succeeds    15s    2s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${text}
    RETURN    ${text}

[Common] - Generate a random string return value
    [Arguments]    ${length}=10    ${output}=suite_random_string
    ${random_string}    generate random string    ${length}    [LETTERS]
    RETURN    ${random_string}
    # [Common] - Set variable    name=${output}    value=${random_string}

[Common] - Input text into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    15s    2s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${text}
    RETURN    ${text}

[Common] - Input text into textbox by names
    [Arguments]    ${txt_name}    ${text}
    Wait Until Keyword Succeeds    15s    2s    Element Should Be Visible    //input[@name='${txt_name}']
    input text    //input[@name='${txt_name}']    ${text}
    RETURN    ${text}

[Common] - Click element link by text
    [Arguments]    ${txt_link}
    Wait Until Keyword Succeeds
    ...    30s
    ...    15s
    ...    Wait Until Element Is Visible
    ...    //a[text()='${txt_link}']
    ...    timeout=30s
    ...    error=Could not find //a[text()='${txt_link}'] element.
    Click Element    //a[text()='${txt_link}']

[Common] - Click header menu by text
    [Arguments]    ${text}
    Sleep    5s
    [Common] - click element
    ...    //div[@class='collapse navbar-collapse navbar--default w-100 h-100']//a[text()='${text}']

[Common] - Click sub menu by text
    [Arguments]    ${text}
    [Common] - click element    //li[@class='nav-item sub--navbar h-100']//a[text()='${text}']

[Common] - Click child sub menu by text
    [Arguments]    ${text}
    [Common] - click element    //li[@class='nav-item sub--navbar h-100']//a[text()='${text}']

[Common] - Maximize browser size to fit screen
    Set window position    0    0
    Set window size    1440    900

[Common] - Resize windows to ignore responsive display
    Set Window Size    1440    900

[Common] - Open Chrome Headless Browser with DownloadDir
    [Arguments]    ${url}    ${downloadDir}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}    Create Dictionary    download.default_directory=${downloadDir}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --test-type
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-impl-side-painting
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    [Common] - Maximize browser size to fit screen
    Go To    ${url}

[Common] - Open Chrome Browser with DownloadDir
    [Arguments]    ${url}    ${downloadDir}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs}    Create Dictionary    download.default_directory=${downloadDir}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --test-type
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-impl-side-painting
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    [Common] - Maximize browser size to fit screen
    Go To    ${url}

[Common] - Open Chrome Browser with mode
    [Arguments]    ${url}    ${browser}
    ${browser}    convert to lowercase    ${browser}
    ${true}    convert to boolean    true
    ${list_options_headless}    Create List
    ...    --no-sandbox
    ...    --headless
    ...    --ignore-certificate-errors
    ...    --disable-web-security
    ...    --disable-notifications
    ...    --disable-impl-side-painting
    ...    --enable-features=NetworkService,NetworkServiceInProcess
    ${list_options}    Create List
    ...    --no-sandbox
    ...    --ignore-certificate-errors
    ...    --disable-web-security
    ...    --disable-notifications
    ...    --disable-impl-side-painting
    ...    --enable-features=NetworkService,NetworkServiceInProcess
    ${args_headless}    Create Dictionary    args=${list_options_headless}
    ${args}    Create Dictionary    args=${list_options}
    ${desired_capabilities_headless}    create dictionary
    ...    acceptSslCerts=${true}
    ...    acceptInsecureCerts=${true}
    ...    ignore-certificate-errors=${true}
    ...    chromeOptions=${args_headless}
    ${desired_capabilities}    create dictionary
    ...    acceptSslCerts=${true}
    ...    acceptInsecureCerts=${true}
    ...    ignore-certificate-errors=${true}
    ...    chromeOptions=${args}
    IF    '${browser}' == 'chrome'
        Open Browser    ${url}    ${browser}    desired_capabilities=${desired_capabilities}
        [Common] - Maximize browser size to fit screen
    ELSE IF    '${browser}' == 'headlesschrome'
        Open Browser    ${url}    ${browser}    desired_capabilities=${desired_capabilities_headless}
        [Common] - Maximize browser size to fit screen
    ELSE
        should be true    ${FALSE}
    END

[Common] - Open Browser with default downloadDir config
    [Documentation]    Open Back Office url with browser option
    [Arguments]    ${downloadDir}    ${url}
    IF    '${browser}' == 'chrome'
        [Common] - Open Chrome Browser with DownloadDir    ${url}    ${downloadDir}
        [Common] - Maximize browser size to fit screen
    ELSE IF    '${browser}' == 'headlesschrome'
        [Common] - Open Chrome Headless Browser with DownloadDir    ${url}    ${downloadDir}
        [Common] - Maximize browser size to fit screen
    ELSE
        should be true    ${FALSE}
    END

[Common] - Open Safari browser
    [Arguments]    ${url}
    Create Webdriver
    ...    Safari
    ...    executable_path=/System/Cryptexes/App/usr/bin/safaridriver
    Go To    ${url}

[Common] - Close Browser
    close browser

[Common] - scroll up on page
    Execute Javascript    window.scrollTo(document.body.scrollHeight,0);

[Common] - Select Iframe
    [Arguments]    ${element_loc}
    wait until keyword succeeds
    ...    5s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    ${element_loc}
    ...    timeout=20s
    ...    error=Could not find ${element_loc} element.
    Select Frame    ${element_loc}

[Common] - click element
    [Arguments]    ${element_loc}
    wait until keyword succeeds
    ...    20s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    ${element_loc}
    ...    timeout=20s
    ...    error=Could not find ${element_loc} element.
    click element    ${element_loc}

[Common] - Verify display text of element
    [Arguments]    ${input_element}    ${input_text}
    wait until keyword succeeds
    ...    20s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    ${input_element}
    ...    timeout=20s
    ...    error=Could not find ${input_element} element.
    ${value}    Get text    ${input_element}
    Should Be Equal As Strings    ${value}    ${input_text}

[Common] - Execute JavaScript Click On Element By Xpath
    [Documentation]    Execute JavaScript Click On Element By Xpath
    [Arguments]    ${element_xpath}
    wait until page contains element    ${element_xpath}
    Execute JavaScript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()

[Common] - Click on element and wait for expected item to appear
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    click element    ${locator}
    [Common] - Wait For Element To Appear On Page    ${expectedItem}    ${timeout}

[Common] - Execute JavaScript Highlight Element
    [Documentation]    Execute JavaScript Highlight Element
    [Arguments]    ${element_xpath}
    Wait Until Page Contains Element    ${element_xpath}
    Execute Javascript

[Common] - Click on element and wait for expected item not to appear
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    click element    ${locator}
    [Common] - Wait for element not to appear on page    ${expectedItem}    ${timeout}

[Common] - Try to click on element until expected item appears
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait until keyword succeeds    30s    1s    run keywords
    ...    click element    ${locator}    AND
    ...    element should be visible    ${expectedItem}

[Common] - Try to click on element until expected item unappears
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait until keyword succeeds    30s    1s    run keywords
    ...    click element    ${locator}    AND
    ...    element should not be visible    ${expectedItem}

[Common] - Click on element and wait for expected item to appear using JS
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    [Common] - Execute JavaScript Click On Element By Xpath    ${locator}
    [Common] - Wait for element to appear on page    ${expectedItem}    ${timeout}

[Common] - Click on element and wait for expected item not to appear using JS
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...    with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${expectedItem}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    [Common] - Execute JavaScript Click On Element By Xpath    ${locator}
    [Common] - Wait for element not to appear on page    ${expectedItem}    ${timeout}

[Common] - Execute JavaScripts Wait Element Is Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]    ${element_xpath}
    ${isVisible}    run keyword and return status
    ...    Wait Until Keyword Succeeds
    ...    5s
    ...    1s
    ...    Execute JavaScript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${true}    convert to boolean    TRUE
    Should Be Equal    ${isVisible}    ${true}    Element ${element_xpath} is not Visible !

[Common] - Execute JavaScripts Wait Element Is Not Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]    ${element_xpath}
    ${isVisible}    run keyword and return status
    ...    Wait Until Keyword Succeeds
    ...    5s
    ...    1s
    ...    Execute JavaScript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${false}    convert to boolean    FALSE
    Should Be Equal    ${isVisible}    ${false}    Element ${element_xpath} is Visible !

[Common] - Execute JavaScripts to Input Text
    [Documentation]    Execute JavaScripts to Input Text
    [Arguments]    ${element_xpath}    ${text}
    ${isVisible}    run keyword and return status
    ...    Wait Until Keyword Succeeds
    ...    5s
    ...    1s
    ...    Execute JavaScript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().value = "${text}";
    ${true}    convert to boolean    TRUE
    Should Be Equal    ${isVisible}    ${true}    Element ${element_xpath} is not Visible !

[Common] - Verify maxlength of selected item is correct
    [Documentation]    verify element at ${locator} having correct maxlength on client-side as ${expectedMaxlength}
    [Arguments]    ${locator}    ${expectedMaxlength}
    Wait Until Element Is Visible    ${locator}
    element should be enabled    ${locator}
    clear element text    ${locator}
    ${tempLength}    evaluate    ${expectedMaxlength}1
    ${string}    generate random string    ${tempLength}    123456789
    input text    ${locator}    ${string}
    ${screenText}    get value    ${locator}
    ${screenTextLength}    get length    ${screenText}
    should be equal as integers    ${screenTextLength}    ${expectedMaxlength}

[Common] - Wait for element to appear on page
    [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${timeout}=30
#    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    wait until keyword succeeds    ${timeout}s    1s    element should be visible    ${locator}
#    Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for element not to appear on page
    [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
    [Arguments]    ${locator}    ${timeout}=30
#    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    wait until keyword succeeds    ${timeout}s    1s    element should not be visible    ${locator}
#    Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait For Spinner is not Visible
    ${previous_kw}    Register Keyword To Run On Failure    Nothing
    Wait Until Keyword Succeeds
    ...    30s
    ...    1s
    ...    Page Should Not Contain Element
    ...    //div[contains(@class, 'ant-spin-spinning')]
    Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for Spinner is loading successful
    Wait Until Keyword Succeeds
    ...    20s
    ...    1s
    ...    Page Should Not Contain Element
    ...    //div[contains(@class,'_loading_overlay_content')]

[Common] - Wait for page to finish loading
#    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    wait until keyword succeeds    60s    1s    Element Should Not Be Visible    //div[@id='fetching_menu_preloader']
    wait until keyword succeeds
    ...    60s
    ...    1s
    ...    Element Should Not Be Visible
    ...    //span[@class='ant-spin-dot ant-spin-dot-spin']
    wait until keyword succeeds
    ...    60s
    ...    1s
    ...    Element Should Not Be Visible
    ...    //div[@class='ant-spin-container ant-spin-blur']
#    Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for datagrid to finish refreshing
#    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    wait until keyword succeeds
    ...    60s
    ...    1s
    ...    Element Should Not Be Visible
    ...    //span[@class='ant-spin-dot ant-spin-dot-spin']
    wait until keyword succeeds
    ...    60s
    ...    1s
    ...    Element Should Not Be Visible
    ...    //div[@class='ant-spin ant-spin-spinning']
#    Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for screen to finish loading data
    [Common] - Wait for page to finish loading
    [Common] - Wait for datagrid to finish refreshing

[Common] - Delete text from the field by using Backspace key
    [Documentation]    Clear element text using backspace
    [Arguments]    ${str_value}    ${locator}
    ${line_length}    Get Length    ${str_value}
    FOR    ${INDEX}    IN RANGE    1    ${line_length}1
        press key    ${locator}    \\08
    END

[Common] - Clear element text using backspace
    [Documentation]    Clear element text using backspace
    [Arguments]    ${locator}
    execute javascript
    ...    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.select()
    press key    ${locator}    \\08

[Common] - Set element text to blank
    [Documentation]    Set element text to blank
    [Arguments]    ${locator}
    execute javascript
    ...    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value=''

[Common] - Clear textbox
    [Arguments]    ${textbox_loc}
    wait until keyword succeeds    10s    1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${EMPTY}

[Common] - Verify value is not displayed on textbox
    [Arguments]    ${textbox_loc}
    ${value}    Get text    ${textbox_loc}
    Should Be Equal As Strings    ${value}    ${EMPTY}

[Common] - Verify value is displayed on textbox
    [Arguments]    ${textbox_loc}    ${text}
    ${value}    Get value    ${textbox_loc}
    Should Be Equal As Strings    ${text}    ${value}

[Common] - Verify page should not contain button
#    TODO will update to allow @{buttons} as web_locator arguments
    [Arguments]    ${button}
    Page Should Not Contain Element    xpath=${button}

[Common] - verify confirmation message is
    [Arguments]    ${message}
    wait until page contains    ${message}
    page should contain    ${message}

[Common] - verify page title is
    [Arguments]    ${title}
    wait until page contains    ${title}    30

[Common] - verify element is displayed
    [Arguments]    ${locator}
    element should be enabled    ${locator}

[Common] - get text by attribute
    [Arguments]    ${element_loc}    ${atrribute}
    ${get_value}    Get element attribute    ${element_loc}    ${atrribute}
    RETURN    ${get_value}

[Common] - verify page contain message
    [Arguments]    ${element_loc}
    wait until keyword succeeds
    ...    5s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    ${element_loc}
    ...    timeout=20s
    ...    error=Could not find ${element_loc} element.

[Common] - get text
    [Arguments]    ${element_loc}
    wait until keyword succeeds
    ...    5s
    ...    1s
    ...    Wait Until Element Is Visible
    ...    ${element_loc}
    ...    timeout=20s
    ...    error=Could not find ${element_loc} element.
    ${get_text}    get text    ${element_loc}
    RETURN    ${get_text}

[Common] - Verify page should contain labels
    [Arguments]    @{labels}
    FOR    ${label}    IN    @{labels}
        wait until page contains    ${label}    5s
        page should contain    ${label}
    END

[Common] - verify dropdownlist contain options
    [Arguments]    ${dropdown_loc}    ${dropdown_item_loc}    @{options}
    wait until keyword succeeds    20s    2s    page should contain element    ${dropdown_loc}
    [Common] - Execute JavaScript Click On Element By Xpath    ${dropdown_loc}
    wait until keyword succeeds    20s    2s    page should contain element    ${dropdown_item_loc}
    ${get_all_options}    get text    ${dropdown_item_loc}
    ${count}    Get Length    ${options}
    FOR    ${index}    IN RANGE    0    ${count}
        ${expected_option}    get from list    ${options}    ${index}
        should contain    ${get_all_options}    ${expected_option}
    END

[Common] - verify dropdownlist contain correct options
    [Arguments]    ${dropdown_loc}    @{options}
    wait until keyword succeeds    10s    1s    Element Should Be Visible    ${dropdown_loc}
    [Common] - Execute JavaScript Click On Element By Xpath    ${dropdown_loc}
    ${count}    Get Length    ${options}
    FOR    ${index}    IN RANGE    0    ${count}
        ${option}    get from list    ${options}    ${index}
        [Common] - Execute JavaScripts Wait Element Is Visible
        ...    //div[contains(@class,'ant-select-dropdown')]//li[text()='${option}']
    END

[Common] - Verify element is invisible
    [Arguments]    ${element_loc}
    wait until keyword succeeds    5s    1s    Element Should Not Be Visible    ${element_loc}

[Common] - Verify element is visible
    [Arguments]    ${element_loc}
    wait until keyword succeeds    5s    1s    Element Should Be Visible    ${element_loc}

[Common] - verify message is
    [Arguments]    ${message}
    wait until keyword succeeds    5s    1s    page should contain    ${message}

[Common] - Wait until message is invisible
    [Arguments]    ${message}
    wait until keyword succeeds    5s    1s    page should not contain    ${message}

[Common] - Convert Boolean to Shown Value
    [Arguments]    ${val}
    IF    ${val}    RETURN    Yes
    RETURN    No

[Common] - Wait until element has text
    [Arguments]    ${element}
    wait until keyword succeeds    10s    2s    [Common] - Get text and verify it has value    ${element}

[Common] - Get text and verify it has value
    [Arguments]    ${element}
    ${text}    get text    ${element}
    should not be empty    ${text}

[Common] - Select label of dropdownlist by label
    [Arguments]    ${dropdownlist_xpath}    ${label}
    click element    ${dropdownlist_xpath}
    click element    //li[@role='option' and text()='${label}']

[Common] - Select item of dropdownlist by text
    [Arguments]    ${dropdownlist_xpath}    ${label1}    ${text}
    Click element    ${dropdownlist_xpath}
    input text    //div[@id='react-select-12-option-${label1}']    ${text}

[Common] - Get selected value of dropdownlist
    [Arguments]    ${dropdownlist_id}
    ${get_selected_value}    get selected list value    ${dropdownlist_id}
    RETURN    ${get_selected_value}

[Common] - Get selected label of dropdownlist
    [Arguments]    ${dropdownlist_id}
    ${get_selected_label}    get selected list label    ${dropdownlist_id}
    RETURN    ${get_selected_label}

[Common] - Get selected label of dropdownlist by index
    [Arguments]    ${dropdownlist_id}    ${index}
    ${dropdownlist_id1}    replace string    ${dropdownlist_id}    =    ='
    ${dropdownlist_id2}    replace string using regexp    ${dropdownlist_id1}    $    '
#    click element    ${dropdownlist_id}
    ${get_selected_label}    get text    xpath=//*[@${dropdownlist_id2}]/option[${index}]
    RETURN    ${get_selected_label}

[Common] - Verify url path is
    [Arguments]    ${url_path}
    ${url}    get location
    ${match}    Get Regexp Matches    ${url}    ${url_path}
    Should Not Be Empty    ${match}

[Common] - check page contains element text
    [Arguments]    ${element_text}
    wait until page contains    ${element_text}    30

[Common] - verify it redirects to page
    [Arguments]    ${page_title}
    [Common] - check page contains element text    ${page_title}

[Common] - check page contains dropdownlists with valid data
    [Arguments]    @{ddl_names}
    FOR    ${name}    IN    @{ddl_names}
        ${ddl_text}    get text    id=ddl_${name}
        should not start with    ${ddl_text}    None
    END

[Common] - check page doesn't contain element texts
    [Arguments]    @{elements}
    FOR    ${element}    IN    @{elements}
        page should not contain    ${element}
    END

[Common] - convert to lowercase and replace spaces into underscore
    [Arguments]    ${string}
    ${string_lower}    convert to lowercase    ${string}
    ${string_repl}    replace string    ${string_lower}    ${SPACE}    _
    RETURN    ${string_repl}

[Common] - Get Element Attribute
    [Arguments]    ${locator}    ${attribute}
    run keyword and return    Get Element Attribute    ${locator}    ${attribute}

[Common] - Get value with prefix
    [Arguments]    ${value}    ${prefix}
    ${returnValue}    Catenate    ${prefix}    ${value}
    RETURN    ${returnValue}

[Common] - Get value with postfix
    [Arguments]    ${value}    ${postfix}
    ${returnValue}    Catenate    ${value}    ${postfix}
    RETURN    ${returnValue}

[Common] - Scroll To Element By Xpath
    [Documentation]    Scroll To Element By Xpath
    [Arguments]    ${element_xpath}
    wait until page contains element    ${element_xpath}
    Execute Javascript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(false);

[Common] - Scroll To Element By Xpath with additional alignment
    [Documentation]    true - the top of the element will be aligned to the top of the visible area of the scrollable ancestor
    ...    false - the bottom of the element will be aligned to the bottom of the visible area of the scrollable ancestor
    ...    If omitted, it will scroll to the top of the element
    [Arguments]    ${element_xpath}    ${align_to}=true
    wait until page contains element    ${element_xpath}
    Execute Javascript
    ...    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(${align_to});

[Common] - Scroll right on page
    Execute Javascript    window.scrollTo(document.body.scrollWidth,document.body.scrollHeight);

[Common] - scroll down on page
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight);

[Common] - Get page source
    ${myHtml}    Get Source
    log    ${myHtml}
    RETURN    ${myHtml}

[Common] - Get page title
    ${page_title}    Get Title
    log    ${page_title}
    RETURN    ${page_title}

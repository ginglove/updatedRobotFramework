*** Settings ***
Resource          ../../../imports.robot

*** Keywords ***
[Common][extract] - field or empty if missing
    [Arguments]    ${field}    ${output}=test_value
    ${has_field}    rest has field    ${field}
    ${value}    run keyword if    '${has_field}'=='True'    rest extract    ${field}
    ...    ELSE    set variable    ${EMPTY}
    [com mon] - Set variable   name=${output}    value=${value}

[Common][extract] - request body
    [Arguments]    ${output}=test_body
    ${id}    rest extract    request body
    [Common] - Set variable   name=${output}    value=${id}

[Common][extract] - ID
    [Arguments]    ${output}=test_id
    ${id}    rest extract    $.data.id
    [Common] - Set variable    name=${output}    value=${id}

[Common][extract] - token
    [Arguments]    ${output}=test_token
    ${id}    rest extract    $.data[0].token
    [Common] - Set variable    name=${output}    value=${id}

[Common][extract] - access token
    [Arguments]    ${output}=test_token
    ${id}    rest extract    $.data.access_token
    [Common] - Set variable    name=${output}    value=${id}

[Common][extract] - order_id
    [Arguments]    ${output}=test_order_id
    ${id}    rest extract    $.data.order_id
    [Common] - Set variable    name=${output}    value=${id}

[Common][extract] - data
    [Arguments]    ${output}=data
    ${data}    rest extract    $.data
    [Common] - Set variable    name=${output}    value=${data}

[Common][extract] - status
    [Arguments]    ${output}=status
    ${status}    rest extract    $.status
    [Common] - Set variable    name=${output}    value=${status}

[Common][verify] - validate code and message
    [Arguments]         ${code}             ${message}
    should be equal as strings          ${response['status']['code']}               ${code}
    should be equal as strings          ${response['status']['message']}            ${message}

[Common][verify] - validate codes and messages
    [Arguments]         ${code1}             ${message1}       ${code2}             ${message2}
    ${status1}=         run keyword and return status       [Common][verify] - validate code and message     ${code1}    ${message1}
    ${status2}=         run keyword and return status       [Common][verify] - validate code and message     ${code2}    ${message2}
    should be true       ${status1} or ${status2}

[Common][verify] - validate response success accept language "${language}"
    [Common][verify] - validate response format
    Run Keyword If      '${language}'=='${accept-language_en}'         [Common][verify] - validate code and message        code=${code_success}       message=${message_success_en}
    ...     ELSE        [Common][verify] - validate code and message        code=${code_success}       message=${message_success_vi}

[Common][verify] - validate response format
    rest has field          $.httpStatus
    rest has field          $.status
    rest has field          $.data
*** Settings ***
Documentation     Buttons
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Page Object
${H5 ELEMENTS}    xpath=//h5[.='Elements']
${BUTTONS}        xpath=//li[.='Buttons']
# Menu
${DOUBLE CLICK}    //button[@id='doubleClickBtn']
${RIGHT CLICK}    //button[@id='rightClickBtn']
${CLICK ME}       //button[text()="Click Me"]
# Result
${MESSAGE DOUBLE CLICK}    id=doubleClickMessage
${MESSAGE RIGHT CLICK}    id=rightClickMessage
${MESSAGE DYNAMIC CLICK}    id=dynamicClickMessage
# List
@{LIST MESSAGE}    You have done a double click    You have done a right click    You have done a dynamic click

*** Test Cases ***
Test Cases
    [Documentation]    Performing button testing
    Enter Page Buttons
    Perform Double Click
    Perform Dynamic Click
    Perform Right Click

*** Keywords ***
Enter Page Buttons
    [Documentation]    Enter page Buttons
    Click Then Verify Text    ${H5 ELEMENTS}    Elements
    Click Then Verify Text    ${BUTTONS}    Buttons

Perform Double Click
    [Documentation]    User double click then check message
    Double Click Element    ${DOUBLE CLICK}
    ${status}    Get Text    ${MESSAGE DOUBLE CLICK}
    Log To Console    Check status ${status}
    Should Be Equal    ${status}    ${LIST MESSAGE}[0]

Perform Right Click
    [Documentation]    User right click then check message
    Open Context Menu    ${RIGHT CLICK}
    ${status}    Get Text    ${MESSAGE RIGHT CLICK}
    Log To Console    Check status ${status}
    Should Be Equal    ${status}    ${LIST MESSAGE}[1]

Perform Dynamic Click
    [Documentation]    User dynamic click then check message
    Click Element    ${CLICK ME}
    ${status}    Get Text    ${MESSAGE DYNAMIC CLICK}
    Log To Console    Check status ${status}
    Should Be Equal    ${status}    ${LIST MESSAGE}[2]

*** Comments ***
- Access List item ${LIST}[0]

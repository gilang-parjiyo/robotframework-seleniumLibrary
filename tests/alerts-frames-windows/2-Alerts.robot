*** Settings ***
Documentation     Mocking behaviour user with prompt
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${H5 ALERTS}      //h5[.='Alerts, Frame & Windows']
${ALERTS}         //span[.='Alerts']
# Form
${BTN ALERT}      id=alertButton
${BTN TIME ALERT}    id=timerAlertButton
${BTN CONFIRM}    id=confirmButton
${BTN PROMPT}     id=promtButton
${ALERTS RESULT}    id=confirmResult
${PROMPT RESULT}    id=promptResult

*** Test Cases ***
Alerts
    [Documentation]    This test case mocking user behaviour against alerts
    Enter Page Alerts
    Trigger Alerts
    Trigger Time Alerts
    Accept Alerts
    Dismiss Alerts
    Input Prompt
    Cancel Input Prompt

*** Keywords ***
Enter Page Alerts
    [Documentation]    Enter page alerts
    Click Then Verify Text    ${H5 ALERTS}    Alerts, Frame & Windows
    Click Then Verify Text    ${ALERTS}    Alerts

Trigger Alerts
    [Documentation]    Mocking user interact against alert
    Click Element    ${BTN ALERT}
    Alert Should Be Present    text=You clicked a button    action=ACCEPT
    Alert Should Not Be Present

Trigger Time Alerts
    [Documentation]    Mocking user wait alert for 5 seconds
    Click Element    ${BTN TIME ALERT}
    Sleep    5
    Alert Should Be Present    text=This alert appeared after 5 seconds    action=ACCEPT
    Alert Should Not Be Present

Accept Alerts
    [Documentation]    Mocking user accepts alerts
    Click Element    ${BTN CONFIRM}
    Alert Should Be Present    text=Do you confirm action?    action=ACCEPT
    Alert Should Not Be Present
    ${status}    Get Text    ${ALERTS RESULT}
    Should Be Equal    ${status}    You selected Ok

Dismiss Alerts
    [Documentation]    Mocking user dismiss alerts
    Click Element    ${BTN CONFIRM}
    Alert Should Be Present    text=Do you confirm action?    action=DISMISS
    Alert Should Not Be Present
    ${status}    Get Text    ${ALERTS RESULT}
    Should Be Equal    ${status}    You selected Cancel

Input Prompt
    [Documentation]    Mocking user input prompt
    Click Element    ${BTN PROMPT}
    Input Text Into Alert    text=Test    action=ACCEPT
    Alert Should Not Be Present
    ${status}    Get Text    ${PROMPT RESULT}
    Should Be Equal    ${status}    You entered Test

Cancel Input Prompt
    [Documentation]    Mocking cancel input prompt
    Click Element    ${BTN PROMPT}
    Input Text Into Alert    text=Test    action=DISMISS
    Alert Should Not Be Present
    Element Should Not Be Visible    ${PROMPT RESULT}

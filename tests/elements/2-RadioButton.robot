*** Settings ***
Documentation     Radio Button
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test


*** Variables ***
# Page Object
${H5 ELEMENTS}    xpath=//h5[.='Elements']
${RADIO BUTTON}    xpath=//li[.='Radio Button']
${SELECTED STATUS}    xpath=//span[@class='text-success']
# Form
${RADIO YES}      xpath=//label[.='Yes']
${RADIO IMPRESSIVE}    xpath=//label[.='Impressive']
${RADIO NO}       xpath=//label[@class='custom-control-label disabled']
${YOU HAVE SELECTED}    xpath=//p[@class='mt-3']
${RADIO NO}       css=[for='noRadio']


*** Test Cases ***
Test Cases
    [Documentation]    Performing radio button testing
    Enter Page Radio Button
    Click Yes Radio Button
    Click No Radio Button
    Click Impressive Radio Button


*** Keywords ***
Enter Page Radio Button
    [Documentation]    Enter page radio button
    Click Then Verify Text    ${H5 ELEMENTS}    Radio Button
    Click Then Verify Text    ${RADIO BUTTON}    Radio Button

Click Yes Radio Button
    [Documentation]    Click yes radio button then check status
    Click Element    ${RADIO YES}
    ${status}    Get Text    ${SELECTED STATUS}
    Log To Console    Checkingf status
    Should Be Equal    ${status}    Yes

Click Impressive Radio Button
    [Documentation]    Click yes radio button then check status
    Click Element    ${RADIO IMPRESSIVE}
    ${status}    Get Text    ${SELECTED STATUS}
    Log To Console    Checkingf status
    Should Be Equal    ${status}    Impressive

Click No Radio Button
    [Documentation]    Click No radio button then check status
    Click Element    ${RADIO YES}
    ${status}    Get Text    ${SELECTED STATUS}
    Log To Console    Checkingf status
    Should Not Be Equal    ${status}    No

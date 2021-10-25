*** Settings ***
Documentation     Progress bar
Library           SeleniumLibrary
Library           String
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
${WIDGET}         xpath=//h5[.='Widgets']
${PROGRESS}       css=.show #item-4 > .text
${START STOP}     id=startStopButton
${PROGESS BAR}    xpath=//div[@id='progressBar']

*** Test Cases ***
Progress Bar
    [Documentation]    Mocking progressbar menu
    Enter Page Slider
    Move Progress Bar

*** Keywords ***
Enter Page Slider
    [Documentation]    Mocking user againts progressbar
    Click Then Verify Text    ${WIDGET}    Widgets
    Click Then Verify Text    ${PROGRESS}    Progress Bar

Move Progress Bar
    [Documentation]    Mocking auto complet multiple colorname
    Click Element    ${START STOP}
    Sleep    3
    Click Element    ${START STOP}
    ${width}    Get Text    ${PROGESS BAR}
    @{number}    Split String To Characters    ${width}
    Should Be True    ${number}[0]${number}[1] > 10
    ##### START AGAIN
    Click Element    ${START STOP}
    Wait Until Element Contains    ${PROGESS BAR}    100%    30
    ${width}    Get Text    ${PROGESS BAR}
    @{number}    Split String To Characters    ${width}
    Should Be True    ${number}[0]${number}[1]${number}[2] == 100

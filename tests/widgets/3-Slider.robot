*** Settings ***
Documentation     Slider
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
${WIDGET}         xpath=//h5[.='Widgets']
${SLIDER}         css=.show #item-3
${RANGE}          css=.range-slider
${SLIDER VALUE}    xpath=//input[@id='sliderValue']

*** Test Cases ***
Slider
    [Documentation]    Mocking slider menu
    Enter Page Slider
    Move Slider

*** Keywords ***
Enter Page Slider
    [Documentation]    Mocking user againts accordion
    Click Then Verify Text    ${WIDGET}    Widgets
    Click Then Verify Text    ${SLIDER}    Slider

Move Slider
    [Documentation]    Mocking auto complet multiple colorname
    FOR    ${counter}    IN RANGE    0    350    20
        Drag And Drop By Offset    ${RANGE}    ${counter}    0
        ${attribute}    Get Element Attribute    ${SLIDER VALUE}    value
        Should Be True    ${attribute} > 25
    END
    

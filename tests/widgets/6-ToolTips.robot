*** Settings ***
Documentation     Tool Tips
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${WIDGET}         xpath=//h5[.='Widgets']
${TOOL TIPS}      xpath=//span[.='Tool Tips']
# Hover tool tips element
${BUTTON}         id=toolTipButton
${FIELD}          id=toolTipTextField

*** Test Cases ***
Tool Tips
    [Documentation]    Performing show tool tips
    Enter Page Tool Tips
    Hover Button
    Hover Text Field

*** Keywords ***
Enter Page Tool Tips
    [Documentation]    Enter page tool tips
    Click Then Verify Text    ${WIDGET}    Widgets
    Execute Javascript    window.scrollTo(0,100)
    Click Then Verify Text    ${TOOL TIPS}    Tool Tips

Hover Button
    [Documentation]    Mokcing hover button
    Mouse Over    ${BUTTON}
    Page Should Contain    You hovered over the Button

Hover Text Field
    [Documentation]    Mokcing text field
    Mouse Over    ${FIELD}
    Page Should Contain    You hovered over the text field
    Input Text    ${FIELD}    Test Hover

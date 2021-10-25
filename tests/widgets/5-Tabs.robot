*** Settings ***
Documentation     Tabs
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${WIDGET}         xpath=//h5[.='Widgets']
${TABS}           xpath=//span[.='Tabs']
${TEST URL}       https://demoqa.com/tabs
# Form
${WHAT}           id=demo-tab-what
${ORIGIN}         id=demo-tab-origin
${USE}            id=demo-tab-use
# Paragraph
${PARAGRAPH WHAT}    Lorem Ipsum is simply dummy text of the printing and typesetting industry.
${PARAGRAPH ORIGIN}    Contrary to popular belief, Lorem Ipsum is not simply random text.
${PARAGRAPH USE}    It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.
# List
@{LIST TABS}      ${WHAT}    ${ORIGIN}    ${USE}
@{LIST PARAGRAPH}    ${PARAGRAPH WHAT}    ${PARAGRAPH ORIGIN}    ${PARAGRAPH USE}

*** Test Cases ***
Performing Switching Tabs
    [Documentation]    Mocking tab behaviour
    Enter Page Tabs
    Checking Tab

*** Keywords ***
Enter Page Tabs
    [Documentation]    Mocking tabs
    Click Then Verify Text    ${WIDGET}    Widgets
    Click Then Verify Text    ${TABS}    Tabs

Checking Tab
    [Documentation]    Enter AB testing page and back to home page
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST TABS}
        Click Element    ${element}
        Wait Until Page Contains    ${LIST PARAGRAPH}[${index}]
    END

*** Settings ***
Documentation     Resizeable
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${INTERACTIONS}    xpath=//h5[.='Interactions']
${RESIZEABLE}     xpath=//span[.='Resizable']
# Resizeable Box
${BOX}            xpath=//div[@id='resizableBoxWithRestriction']/span[@class='react-resizable-handle react-resizable-handle-se']
${WIDTH}          xpath=//div[@id='resizableBoxWithRestriction']
${WIDTH VALUE}    width: 500px; height: 200px;
${HEIGHT VALUE}    width: 500px; height: 300px;
# Resizeable
${BOX 2}          xpath=//div[@id='resizable']/span[@class='react-resizable-handle react-resizable-handle-se']
${WIDHT 2}        xpath=//div[@id='resizable']
${WIDTH VALUE 2}    width: 700px; height: 200px;
${HEIGHT VALUE 2}    width: 700px; height: 400px;

*** Test Cases ***
Resizeable
    [Documentation]    Performing resizeable testing
    Enter Page Resizeable
    Resize Element 1
    Resize Element 2

*** Keywords ***
Enter Page Resizeable
    [Documentation]    Enter page resizeable
    Click Then Verify Text    ${INTERACTIONS}    Interactions
    Execute Javascript    window.scrollTo(0,350)
    Click Then Verify Text    ${RESIZEABLE}    Resizable

Resize Element 1
# Resize width
    Drag And Drop By Offset    ${BOX}    500    0
    ${attribute}    Get Element Attribute    ${WIDTH}    style
    Should Be Equal    ${attribute}    ${WIDTH VALUE}
# Resize height
    Drag And Drop By Offset    ${BOX}    0    200
    ${attribute}    Get Element Attribute    ${WIDTH}    style
    Should Be Equal    ${attribute}    ${HEIGHT VALUE}

Resize Element 2
# Resize width
    Drag And Drop By Offset    ${BOX 2}    500    0
    ${attribute}    Get Element Attribute    ${WIDHT 2}    style
    Should Be Equal    ${attribute}    ${WIDTH VALUE 2}
# Resize height
    Drag And Drop By Offset    ${BOX 2}    0    200
    ${attribute}    Get Element Attribute    ${WIDHT 2}    style
    Should Be Equal    ${attribute}    ${HEIGHT VALUE 2}

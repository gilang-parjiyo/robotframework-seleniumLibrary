*** Settings ***
Documentation     Menu
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${WIDGET}         xpath=//h5[.='Widgets']
${MENU}    xpath=//span[.='Menu']
# Item Menu
${ITEM 1}         xpath=//a[.='Main Item 1']
${ITEM 2}         xpath=//a[.='Main Item 2']
${ITEM 3}         xpath=//a[.='Main Item 3']
# Sub Menu
${SUB MENU 1}     xpath=//ul[@id='nav']//li[1]/a[.='Sub Item']
${SUB MENU 2}     xpath=//ul[@id='nav']//li[2]/a[.='Sub Item']
${SUB LIST}       xpath=//a[.='SUB SUB LIST »']
${SUB SUB ITEM 1}    xpath=//a[.='Sub Sub Item 1']
${SUB SUB ITEM 2}    xpath=//a[.='Sub Sub Item 2']
${SUB MENU 4}     xpath=//a[.='Main Item 3']
# List Menu
@{LIST MENU}      ${ITEM 1}    ${ITEM 2}    ${SUB MENU 1}    ${SUB MENU 2}    ${SUB LIST}    ${SUB SUB ITEM 1}    ${SUB SUB ITEM 2}    ${ITEM 3}

*** Test Cases ***
Menu Robot
    [Documentation]    Performing Menu Testing
    Enter Page Menu
    Hover Behavior

*** Keywords ***
Enter Page Menu
    [Documentation]    Enter page menu
    Click Then Verify Text    ${WIDGET}    Widgets
    Execute Javascript    window.scrollTo(0,200)
    Click Then Verify Text    ${MENU}    Menu

Hover Behavior
    [Documentation]    Mocking selecting menu
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST MENU}
        Mouse Over    ${element}
        Element Should Be Visible    ${element}
    END

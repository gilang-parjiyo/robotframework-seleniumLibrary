*** Settings ***
Documentation     Selectable
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${INTERACTIONS}    xpath=//h5[.='Interactions']
${SELECTABLE}     xpath=//span[.='Selectable']
# Selectable
${LIST}           //div[@id='demo-tabpane-list']//li
${LIST UNSELECT}    mt-2 list-group-item list-group-item-action
${LIST SELECTED}    mt-2 list-group-item active list-group-item-action
# Grid
${GRID}           id=demo-tab-grid
${GRID LIST}      //div[@id='gridContainer']//li
${GRID UNSELECTED}    list-group-item list-group-item-action
${GRID SELECTED}    list-group-item active list-group-item-action

*** Test Cases ***
Menu Robot
    [Documentation]    Performing selectable testing
    Enter Page Selectable
    Selectable List
    Selectable Grid

*** Keywords ***
Enter Page Selectable
    [Documentation]    Enter page menu
    Click Then Verify Text    ${INTERACTIONS}    Interactions
    Execute Javascript    window.scrollTo(0,300)
    Click Then Verify Text    ${SELECTABLE}    Selectable

Selectable List
    @{list item}    Get WebElements    ${LIST}
    FOR    ${index}    ${element}    IN ENUMERATE    @{list item}
# Check element list before click
        ${attribute}    Get Element Attribute    ${element}    class
        Should Be Equal    ${attribute}    ${LIST UNSELECT}
# Click list then check element
        Click Element    ${element}
        ${attribute}    Get Element Attribute    ${element}    class
        Should Be Equal    ${attribute}    ${LIST SELECTED}
    END

Selectable Grid
    Click Element    ${GRID}
    @{grid item}    Get WebElements    ${GRID LIST}
    FOR    ${index}    ${element}    IN ENUMERATE    @{grid item}
#Check grid before click
        ${attribute}    Get Element Attribute    ${element}    class
        Should Be Equal    ${attribute}    ${GRID UNSELECTED}
#Click then check grid
        Click Element    ${element}
        ${attribute}    Get Element Attribute    ${element}    class
        Should Be Equal    ${attribute}    ${GRID SELECTED}
#Unclick then check grid
        Click Element    ${element}
        ${attribute}    Get Element Attribute    ${element}    class
        Should Be Equal    ${attribute}    ${GRID UNSELECTED}
    END

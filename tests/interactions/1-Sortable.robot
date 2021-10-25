*** Settings ***
Documentation     Sortable
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${INTERACTIONS}    xpath=//h5[.='Interactions']
${SORTABLE}       xpath=//span[.='Sortable']
${NUMBER}         xpath=//div[@id='demo-tabpane-list']/div/div
${LIST GROUP ITEM}    xpath=//div[@class='vertical-list-container mt-4']/div
@{LIST NUMBER}    Six    One    Two    Three    Four    Five
# Grid
${GRID TAB}       id=demo-tab-grid
@{LIST GRID}      Two    Four    Six    Seven    One    Eight    Three    Nine    Five
${GRID LIST}      xpath=//div[@id='demo-tabpane-grid']/div/div/div

*** Test Cases ***
Menu Robot
    [Documentation]    Performing Testing sortable
    Enter Page Sortable
    Sort List
    Sort Grid

*** Keywords ***
Enter Page Sortable
    [Documentation]    Enter page sortable
    Click Then Verify Text    ${INTERACTIONS}    Interactions
    Execute Javascript    window.scrollTo(0,300)
    Click Then Verify Text    ${SORTABLE}    Sortable

Sort List
    FOR    ${counter}    IN RANGE    0    5    1
        Wait Until Element Is Visible    ${NUMBER}
        Drag And Drop By Offset    ${NUMBER}    0    250
    END
    @{item list}    Get WebElements    ${LIST GROUP ITEM}
    FOR    ${index}    ${element}    IN ENUMERATE    @{item list}
        ${Text}    Get Text    ${element}
        Should Be Equal    ${text}    ${LIST NUMBER}[${index}]
    END

Sort Grid
    Click Element    ${GRID TAB}
    FOR    ${counter}    IN RANGE    1    4    1
        Drag And Drop By Offset    //div[@id='demo-tabpane-grid']/div/div/div[${counter}]    0    200
    END
    @{grid list}    Get WebElements    ${GRID LIST}
    FOR    ${index}    ${element}    IN ENUMERATE    @{grid list}
        ${text}    Get Text    ${element}
        Should Be Equal    ${text}    ${LIST GRID}[${index}]
    END

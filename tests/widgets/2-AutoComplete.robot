*** Settings ***
Documentation     Accordion
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
${WIDGET}         xpath=//h5[.='Widgets']
${AUTO COMPLETE}    xpath=//span[.='Auto Complete']
${MULTIPLE}       css=.auto-complete__value-container--is-multi
${MULTIPLE FIELD}    id=autoCompleteMultipleInput
${SINGLE}         css=#autoCompleteSingleContainer .auto-complete__value-container
${SINGLE FIELD}    id=autoCompleteSingleInput
@{LIST COLOR}     RED    BLUE    GREEN    YELLOW    VOILET

*** Test Cases ***
Auto Complete
    [Documentation]    Mocking accordion menu
    Enter Page Auto Complete
    Type Mulitple Color Name
    Type Single Color

*** Keywords ***
Enter Page Auto Complete
    [Documentation]    Mocking user againts accordion
    Click Then Verify Text    ${WIDGET}    Widgets
    Click Then Verify Text    ${AUTO COMPLETE}    Auto Complete

Type Mulitple Color Name
    [Documentation]    Mocking auto complet multiple colorname
    Wait Click Element    ${MULTIPLE}
    FOR    ${element}    IN    @{LIST COLOR}
        Wait Input Text    ${MULTIPLE FIELD}    ${element}
        Press Keys    ${None}    ENTER
    END

Type Single Color
    [Documentation]
    Wait Click Element    ${SINGLE}
    Wait Input Text    ${SINGLE FIELD}    RED
    Press Keys    ${None}    ENTER

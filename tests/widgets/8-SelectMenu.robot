*** Settings ***
Documentation     Select Menu
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${WIDGET}         xpath=//h5[.='Widgets']
${SELECT MENU}    xpath=//span[.='Select Menu']
# List Menu
${VALUE}          xpath=//div[@id='withOptGroup']//div[@class=' css-1hwfws3']
${VALUE OPTION}    id=react-select-2-option-0-1
${ONE}            xpath=//div[@id='selectOne']//div[@class=' css-1hwfws3']
${ONE OPTION}     id=react-select-3-option-0-0
${OLD MENU}       id=oldSelectMenu
${OLD MENU OPTION}    xpath=//option[.='Green']
${MULTI SELECT}    xpath=//div[text()="Select..."]
@{LIST COLOR}     id=react-select-4-option-0    id=react-select-4-option-1    id=react-select-4-option-2    id=react-select-4-option-3
@{LIST CAR}       xpath=//option[.='Volvo']    xpath=//option[.='Saab']    xpath=//option[.='Opel']    xpath=//option[.='Audi']

*** Test Cases ***
Menu Robot
    [Documentation]    Performing Testing Select Menu
    Enter Page Menu
    Select Menu
    Select One
    Old Menu
    Select Multiple Menu
    Standrd Multi Select

*** Keywords ***
Enter Page Menu
    [Documentation]    Enter page menu
    Click Then Verify Text    ${WIDGET}    Widgets
    Execute Javascript    window.scrollTo(0,300)
    Click Then Verify Text    ${SELECT MENU}    Select Menu

Select Menu
    [Documentation]    Mocking selecting menu
    Wait Click Element    ${VALUE}
    Wait Click Element    ${VALUE OPTION}

Select One
    [Documentation]    Mokcing selct one menu
    Wait Click Element    ${ONE}
    Wait Click Element    ${ONE OPTION}

Old Menu
    [Documentation]    Mocking user selecting old menu
    Wait Click Element    ${OLD MENU}
    Wait Click Element    ${OLD MENU OPTION}

Select Multiple Menu
    [Documentation]    Mocking selecting multiple menu
    Click Element    ${MULTI SELECT}
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST COLOR}
        Wait Click Element    ${element}
    END

Standrd Multi Select
    [Documentation]    Mocking selecting standard multiselect
    FOR    ${element}    IN    @{LIST CAR}
        Click Element    ${element}
    END

*** Settings ***
Documentation     Accordion
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
${WIDGET}         xpath=//h5[.='Widgets']
${ACCORDIAN}      xpath=//span[.='Accordian']
${H1}             xpath=//div[@id="section1Heading"]
${H2}             xpath=//div[@id="section2Heading"]
${H3}             xpath=//div[@id="section3Heading"]
@{LIST}           xpath=//div[text()="What is Lorem Ipsum?"]    xpath=//div[text()="Where does it come from?"]    xpath=//div[.='Why do we use it?']
${EXPAND}         xpath=//div[@class="collapse show"]

*** Test Cases ***
Widget Accordion
    [Documentation]    Mocking accordion menu
    Enter Page Accordion
    Check Menu Collapse

*** Keywords ***
Enter Page Accordion
    [Documentation]    Mocking user againts accordion
    Click Then Verify Text    ${WIDGET}    Widgets
    Click Then Verify Text    ${ACCORDIAN}    Accordian

Check Menu Collapse
    [Documentation]    Mocking widget accordion
    Click Element    ${LIST}[0]
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST}
        Wait Until Element Is Not Visible    ${EXPAND}
        Click Element    ${element}
        Wait Until Element Is Visible    ${EXPAND}
        Click Element    ${element}
    END

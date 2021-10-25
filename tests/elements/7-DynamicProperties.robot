*** Settings ***
Documentation     Dynamic Properties
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Page Object
${H5 ELEMENTS}    xpath=//h5[.='Elements']
${DYNAMIC PROPERTIES}    xpath=//span[.='Dynamic Properties']
${ENABLE 5 SECONDS}    xpath=//button[@id='enableAfter']
${COLOR CHANGE}    xpath=//button[@id='colorChange']
${VISIBLE 5 SECONDS}    id=visibleAfter

*** Test Cases ***
Dynamic Properties
    [Documentation]    Mocking user interacting dynamic properties
    Enter Page Dynamic Properties
    Check Dynamic Properties Before 5 Seconds
    Check Dynamic Properties After 5 Seconds

*** Keywords ***
Enter Page Dynamic Properties
    [Documentation]    Enter page DynamicProperties
    Click Then Verify Text    ${H5 ELEMENTS}    Elements
    Click Then Verify Text    ${DYNAMIC PROPERTIES}    Dynamic Properties

Check Dynamic Properties Before 5 Seconds
    [Documentation]    Clcik element
    # Check Enable before 5 seconds
    ${attribute}    Get Element Attribute    ${ENABLE 5 SECONDS}    disabled
    Should Be Equal    ${attribute}    true
    # Check color change
    ${enable}    Get Element Attribute    ${COLOR CHANGE}    class
    Should Be Equal    ${enable}    mt-4 btn btn-primary
    Element Should Not Be Visible    ${VISIBLE 5 SECONDS}
    Sleep    5

Check Dynamic Properties After 5 Seconds
    [Documentation]    Clcik element
    # Check Enable after 5 seconds
    ${attribute}    Get Element Attribute    ${ENABLE 5 SECONDS}    disabled
    Should Be Equal    ${attribute}    ${None}
    # Check color change
    ${enable}    Get Element Attribute    ${COLOR CHANGE}    class
    Should Be Equal    ${enable}    mt-4 text-danger btn btn-primary
    Element Should Be Visible    ${VISIBLE 5 SECONDS}

*** Comments ***
- Wait 5 seconds until button enable
- Text color will change after 5 minutes
- Button visible after 5 minutes

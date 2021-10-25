*** Settings ***
Documentation     Broken Link
Library           RequestsLibrary
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test
Test Template     Check Link

*** Variables ***
# Page Object
${TEST URL}       https://demoqa.com/broken
# Menu
${VALID IMAGE}    https://demoqa.com/images/Toolsqa.jpg
${BROKEN IMAGE}    https://demoqa.com/images/Toolsqa_1.jpg
${VALID LINK}     http://demoqa.com
${BROKEN LINK}    http://the-internet.herokuapp.com/status_codes/500

*** Test Cases ***
Request All Available Link
    [Documentation]    Performing broken link testing
    ${VALID IMAGE}
    ${BROKEN IMAGE}
    ${VALID LINK}
    ${BROKEN LINK}

*** Keywords ***
Check Link
    [Documentation]    Check every link available
    [Arguments]    ${link}
    ${status}    GET    ${link}
    Status Should Be    200    ${status}
    Log To Console    Checkin status ${status}

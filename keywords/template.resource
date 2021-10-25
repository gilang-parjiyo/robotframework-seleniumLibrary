*** Settings ***
Documentation     This resource contain keyword template
Library           OperatingSystem
Library           SeleniumLibrary


*** Keywords ***
Click Then Verify Text
    [Documentation]    This keyword perform click then wait until location contain text elements.
    [Arguments]    ${element}    ${validate}
    Click Element    ${element}
    Wait Until Page Contains    ${validate}

Click Then Verify Element Added
    [Documentation]    This keyword perform click then wait until page contains element
    [Arguments]    ${element}    ${locator}
    Click Element    ${element}
    Wait Until Page Contains Element    ${locator}

Click Then Verify Element Removed
    [Documentation]    This keyword perform click then wait until page does not contains element
    [Arguments]    ${element}    ${locator}
    Click Element    ${element}
    Wait Until Page Does Not Contain Element    ${locator}

Click Then Verify Attribute
    [Documentation]    Cklick element then verify atribute
    [Arguments]    ${locator}    ${attribute}    ${expected attribute}
    Click Element    ${locator}
    ${status}    Get Element Attribute    ${locator}    ${attribute}
    Should Be Equal    ${status}    ${expected attribute}
    Log    ${status}

Check Attribute
    [Documentation]    Verify attribute element
    [Arguments]    ${locator}    ${attribute}    ${expected attribute}
    ${status}    Get Element Attribute    ${locator}    ${attribute}
    Should Be Equal    ${status}    ${expected attribute}

Wait Click Element
    [Documentation]    Wait element appear then click element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Click Element    ${element}

Find Scroll Then Click
    [Documentation]    find element if false scroll until element found.
    [Arguments]    ${locator}    ${verify}
    Scroll Element Into View    ${locator}
    Click Element    ${locator}
    Page Should Contain    ${verify}

Custom Drag And Drop
    [Documentation]    Handle drag and drop
    [Arguments]    ${source}    ${target}
    ${js}=    Get File    ${EXECDIR}/libraries/DragAndDrop.js
    ${result}=    Execute Javascript    ${js}; return DragNDrop(${source}, ${target});
    Log    ${result}

Wait Input Text
    [Documentation]    Wait element appear then click element
    [Arguments]    ${element}    ${text}
    Wait Until Page Contains Element    ${element}
    Input Text    ${element}    ${text}

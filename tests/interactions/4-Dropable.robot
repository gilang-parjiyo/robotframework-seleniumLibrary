*** Settings ***
Documentation     dropable
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test


*** Variables ***
# Menu
${INTERACTIONS}    xpath=//h5[.='Interactions']
${DROPABLE}       xpath=//span[.='Droppable']
# Simple
${DRAGABLE}       id=draggable
${DRAGABLE ATTRIBUTE}    //div[@id='simpleDropContainer']/div[@id='droppable']
# Accept
${ACCEPT}         id=droppableExample-tab-accept
${ACCEPTABLE}     id=acceptable
${NOT ACCEPTABLE}    id=notAcceptable
${ACCEPTABLE ATTRIBUTE}    //div[@id='acceptDropContainer']/div[@id='droppable']
${NOT ACCEPTABLE ATTRIBUTE}    //div[@id='notAcceptable']
${NOT ACCEPTABLE VALUE}    position: relative; left: 370px; top: 0px;
# Prevent Proprogration
${PROPROGATION}    id=droppableExample-tab-preventPropogation
${DRAGBOX}        id=dragBox
${NOT GREEDY TEXT}    xpath=//div[@id='notGreedyDropBox']/p
${NOT GREEDY INNER}    xpath=//div[@id='notGreedyInnerDropBox']/p[.='Dropped!']
${NOT GREEDY BOX INNER}    xpath=//div[@id='greedyDropBoxInner']/p[.='Dropped!']
# Revert Draggable
${REVERT DRAGABLE}    xpath=//a[@id='droppableExample-tab-revertable']
${REVERTABLE}     xpath=//div[@id='revertable']
${REVERTABLE DROPPED}    xpath=//div[@id='revertableDropContainer']//p[.='Dropped!']
${NOT REVERTABLE}    xpath=//div[@id='notRevertable']


*** Test Cases ***
Dropable
    [Documentation]    Performing dropable testing
    Enter Page Resizeable
    Drag simple
    Drag Accept
    Drag Proprogration
    Revert Draggable


*** Keywords ***
Enter Page Resizeable
    [Documentation]    Enter dropable menu
    Click Then Verify Text    ${INTERACTIONS}    Interactions
    Execute Javascript    window.scrollTo(0,350)
    Click Then Verify Text    ${DROPABLE}    Droppable

Drag simple
    Drag And Drop By Offset    ${DRAGABLE}    370    0
    ${attribute}    Get Text    ${DRAGABLE ATTRIBUTE}
    Should Be Equal    ${attribute}    Dropped!

Drag Accept
# Drag Acceptable
    Click Element    ${ACCEPT}
    Drag And Drop By Offset    ${ACCEPTABLE}    370    0
    ${text}    Get Text    ${ACCEPTABLE ATTRIBUTE}
    Should Be Equal    ${text}    Dropped!
# Drag Not Acceptable
    Click Element    ${NOT ACCEPTABLE}
    Drag And Drop By Offset    ${NOT ACCEPTABLE}    370    0
    ${atribute}    Get Element Attribute    ${NOT ACCEPTABLE}    style
    Should Be Equal    ${atribute}    ${NOT ACCEPTABLE VALUE}

Drag Proprogration
# Drag proprogation
    Click Element    ${PROPROGATION}
    Drag And Drop By Offset    ${DRAGBOX}    370    0
    ${text}    Get Text    ${NOT GREEDY TEXT}
    Should Be Equal    ${text}    Dropped!
# Drag inner
    Click Element    ${PROPROGATION}
    Drag And Drop By Offset    ${DRAGBOX}    0    100
    Wait Until Element Is Visible    ${NOT GREEDY INNER}
# Drag box inner
    Click Element    ${PROPROGATION}
    Drag And Drop By Offset    ${DRAGBOX}    0    250
    Wait Until Element Is Visible    ${NOT GREEDY BOX INNER}

Revert Draggable
# Revert dragable
    Click Element    ${REVERT DRAGABLE}
    Drag And Drop By Offset    ${REVERTABLE}    370    0
    Element Should Be Visible    ${REVERTABLE DROPPED}
# Not revertable
    Drag And Drop By Offset    ${NOT REVERTABLE}    370    0
    Element Should Be Visible    ${REVERTABLE DROPPED}

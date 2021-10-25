*** Settings ***
Documentation     Dragable
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${INTERACTIONS}    xpath=//h5[.='Interactions']
${DRAGABLE}       xpath=//span[.='Dragabble']
# Dragbox
${DRAGBOX}        //div[@id='dragBox']
# Axis Restricted
${AXIS RESTRICTED}    //a[@id='draggableExample-tab-axisRestriction']
${X AXIS}         id=restrictedX
${Y AXIS}         id=restrictedY
# Container Restricted
${CONTAINER RESTRICTED}    id=draggableExample-tab-containerRestriction
${RESTRICTED}     xpath=//div[@class='draggable ui-widget-content ui-draggable ui-draggable-handle']
${CONTAINED}      css=.ui-widget-header
# Cursor style
${CURSOR STYLE}    id=draggableExample-tab-cursorStyle
${CENTER}         id=cursorCenter
${TOP LEFT}       id=cursorTopLeft
${BOTTOM}         id=cursorBottom

*** Test Cases ***
Resizeable
    [Documentation]    Performing Testing Dragable
    Enter Page Draggable
    Simple Draggable
    Axis Restricted
    Container Restricted
    Cursor Style

*** Keywords ***
Enter Page Draggable
    [Documentation]    Enter page menu
    Click Then Verify Text    ${INTERACTIONS}    Interactions
    Execute Javascript    window.scrollTo(0,400)
    Click Then Verify Text    ${DRAGABLE}    Dragabble

Simple Draggable
    [Documentation]    Mokcing simple dragable
# X axis
    Drag And Drop By Offset    ${DRAGBOX}    500    0
    ${attribute}    Get Element Attribute    ${DRAGBOX}    style
    Should Be Equal    ${attribute}    position: relative; left: 500px; top: 0px;
# Y axis
    Drag And Drop By Offset    ${DRAGBOX}    0    100
    ${attribute}    Get Element Attribute    ${DRAGBOX}    style
    Should Be Equal    ${attribute}    position: relative; left: 500px; top: 100px;

Axis Restricted
    [Documentation]    Mocking drag axis restricted
    Click Element    ${AXIS RESTRICTED}
# X axis drag to Y axis
    Drag And Drop By Offset    ${X AXIS}    0    100
    ${attribute}    Get Element Attribute    ${X AXIS}    style
    Should Be Equal    ${attribute}    position: relative; left: 0px; top: 0px;
# X axis drag
    Drag And Drop By Offset    ${X AXIS}    500    0
    ${attribute}    Get Element Attribute    ${X AXIS}    style
    Should Be Equal    ${attribute}    position: relative; left: 500px; top: 0px;
# Y axis drag to x axis
    Drag And Drop By Offset    ${Y AXIS}    500    0
    ${attribute}    Get Element Attribute    ${Y AXIS}    style
    Should Be Equal    ${attribute}    position: relative; left: 0px; top: 0px;
# Y axis drag
    Drag And Drop By Offset    ${Y AXIS}    0    100
    ${attribute}    Get Element Attribute    ${Y AXIS}    style
    Should Be Equal    ${attribute}    position: relative; left: 0px; top: 100px;

Container Restricted
    [Documentation]    Mocking container Restricted
    Click Element    ${CONTAINER RESTRICTED}
# Restricted X
    Drag And Drop By Offset    ${RESTRICTED}    800    0
    ${attribute}    Get Element Attribute    ${RESTRICTED}    style
    Should Be Equal    ${attribute}    position: relative; left: 673px; top: 0px;
# Restricted Y
    Drag And Drop By Offset    ${RESTRICTED}    0    300
    ${attribute}    Get Element Attribute    ${RESTRICTED}    style
    Should Be Equal    ${attribute}    position: relative; left: 673px; top: 106px;
# I'm contained within my parent
# Move x axis
    Drag And Drop By Offset    ${CONTAINED}    300    0
    ${attribute}    Get Element Attribute    ${CONTAINED}    style
    Should Be Equal    ${attribute}    position: relative; left: 13px; top: 0px;
# Move y axis
    Drag And Drop By Offset    ${CONTAINED}    0    200
    ${attribute}    Get Element Attribute    ${CONTAINED}    style
    Should Be Equal    ${attribute}    position: relative; left: 13px; top: 86px;

Cursor Style
    [Documentation]    Mocking cursor style
    Click Element    ${CURSOR STYLE}
    Drag And Drop By Offset    ${CENTER}    500    0
    ${attribute}    Get Element Attribute    ${CENTER}    style
    # Should Be Equal    ${attribute}    position: relative; left: 13px; top: 86px;
    Drag And Drop By Offset    ${TOP LEFT}    500    0
    ${attribute}    Get Element Attribute    ${TOP LEFT}    style
    # Should Be Equal    ${attribute}    position: relative; left: 13px; top: 86px;
    Drag And Drop By Offset    ${BOTTOM}    500    0
    ${attribute}    Get Element Attribute    ${BOTTOM}    style
    # Should Be Equal    ${attribute}    position: relative; left: 13px; top: 86px;

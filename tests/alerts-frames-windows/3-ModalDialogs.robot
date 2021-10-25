*** Settings ***
Documentation     Mocking user against modal dialogs
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
${H5 ALERTS}      xpath=//h5[.='Alerts, Frame & Windows']
${MODAL DIALOGS}    xpath=//span[.='Modal Dialogs']
${SMALL MODAL}    id=showSmallModal
${LARGE MODAL}    id=showLargeModal
${TITLE SMALL MODAL}    xpath=//div[text()='Small Modal']
${TITLE LARGE MODAL}    xpath=//div[text()='Large Modal']
${CLOSE SMALL MODAL}    id=closeSmallModal
${CLOSE LARGE MODAL}    id=closeLargeModal

*** Test Cases ***
Modal Dialogs
    [Documentation]    Performing modal dialogs testing
    Enter Page Modal Dialogs
    Small Modal
    Large Modal

*** Keywords ***
Enter Page Modal Dialogs
    [Documentation]    Enter page modal dialogs
    Click Then Verify Text    ${H5 ALERTS}    Alerts
    Click Then Verify Text    ${MODAL DIALOGS}    Modal Dialogs

Small Modal
    [Documentation]    Open small modal
    Click Element    ${SMALL MODAL}
    Element Should Be Visible    ${TITLE SMALL MODAL}
    Click Element    ${CLOSE SMALL MODAL}

Large Modal
    [Documentation]    Open large modal
    Click Element    ${LARGE MODAL}
    Element Should Be Visible    ${TITLE LARGE MODAL}
    Click Element    ${CLOSE LARGE MODAL}

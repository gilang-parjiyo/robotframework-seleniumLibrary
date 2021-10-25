*** Settings ***
Documentation     Links
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Library           RequestsLibrary
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Page Object
${H5 ELEMENTS}    xpath=//h5[.='Elements']
${LINKS}          xpath=//span[.='Links']
# New Tab
${NEW TAB 1}      id=simpleLink
${NEW TAB 2}      id=dynamicLink
${HOME}           xpath=//img[@src='/images/Toolsqa.jpg']
# Status
${CREATED}        id=created
${NO CONTENT}     id=no-content
${MOVED}          id=moved
${BAD REQUEST}    id=bad-request
${UNAUTHORIZED}    id=unauthorized
${FORBIDDEN}      id=forbidden
${NOT FOUND}      id=invalid-url
${LINK RESPONSE}    xpath=//p[@id='linkResponse']
# List
@{LIST STATUS}    201    204    301    400    401    403    404
@{LIST ELEMENTS}    ${CREATED}    ${NO CONTENT}    ${MOVED}    ${BAD REQUEST}    ${UNAUTHORIZED}    ${FORBIDDEN}    ${NOT FOUND}

*** Test Cases ***
Links
    [Documentation]    Performing link testing
    Enter Page Link
    Check Request Status
    Create New Tab Home


*** Keywords ***
Enter Page Link
    [Documentation]    Enter page links
    Click Then Verify Text    ${H5 ELEMENTS}    Elements
    Click Then Verify Text    ${LINKS}    Links

Check Request Status
    [Documentation]    Loop trough all status lis
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST ELEMENTS}
#Get request
        Click Element    ${element}
        ${text}    Get Text    ${LINK RESPONSE}
        Should Contain    ${text}    ${LIST STATUS}[${index}]
    END


Create New Tab Home
    [Documentation]    Switch window after create new tab
    ${title}    Get Title
    Click Element    ${NEW TAB 1}
    Wait Until Page Contains Element    ${HOME}
    Sleep    2
    Switch Window    ${title}

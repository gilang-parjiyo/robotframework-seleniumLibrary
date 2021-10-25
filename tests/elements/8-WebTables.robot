*** Settings ***
Documentation     Web Tables
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Page Object
${ELEMENTS}       xpath=//h5[.='Elements']
${WEB TABLES}     xpath=//span[.='Web Tables']
# Search
${SEARCH}         id=searchBox
${BODY}           xpath=//div[@class='rt-tbody']
# Add
${BTN ADD}        id=addNewRecordButton
# Registration Form
${FIRST NAME}     id=firstName
${LAST NAME}      id=lastName
${EMAIL}          id=userEmail
${AGE}            id=age
${SALLARY}        id=salary
${DEPARTEMENT}    id=department
${SUBMIT}         id=submit
# Edit item
${EDIT}           css=.rt-tbody > div:nth-of-type(4) .mr-2 > [stroke='currentColor']
${ROW}            xpath=//div[@class='rt-tbody']/div[1]//div[@class="rt-td"]
@{LIST FORM}      Gilang Edit    Romadhan    20    gilang.romadhan@outlook.com
...               10000000    Quality Assurance    ${Empty}

*** Test Cases ***
Test Cases
    [Documentation]    Performing Web Tables testing
    Enter Page Web Tables
    Fill Form
    Edit Item
    Search Item
    Check Data

*** Keywords ***
Enter Page Web Tables
    [Documentation]    Enter page web tables 
    Click Then Verify Text    ${ELEMENTS}    Elements
    Click Then Verify Text    ${WEB TABLES}    Web Tables

Fill Form
    [Documentation]    Mocking fill form
    Click Button    ${BTN ADD}
    Input Text    ${FIRST NAME}    Gilang
    Input Text    ${LAST NAME}    Romadhan
    Input Text    ${EMAIL}    gilang.romadhan@outlook.com
    Input Text    ${AGE}    20
    Input Text    ${SALLARY}    10000000
    Input Text    ${DEPARTEMENT}    Quality Assurance
    Click Button    ${SUBMIT}

Edit Item
    Click Element    ${EDIT}
    Clear Element Text    ${FIRST NAME}
    Input Text    ${FIRST NAME}    Gilang Edit
    Click Element    ${SUBMIT}

Search Item
    [Documentation]    Mocking search item
    Input Text    ${SEARCH}    Gilang
    Element Should Not Contain    ${BODY}    Cierra
    Element Should Contain    ${BODY}    Gilang Edit
    Clear Element Text    ${SEARCH}

Check Data
    [Documentation]    Checking data
    ${list item}    Get WebElements    ${ROW}
    FOR    ${index}    ${element}    IN ENUMERATE    @{list item}
        ${text}    Get Text    ${element}
        Should Be Equal    ${text}    ${LIST FORM}[${index}]
    END

*** Settings ***
Documentation       Mocking behaviour user against bookstore application

Library             SeleniumLibrary
Resource            ../../keywords/resource.resource

Suite Setup         Begin Test
Suite Teardown      End Test

*** Variables ***
# Menu
${BOOK STORE APPLICATION}       xpath=//h5[.='Book Store Application']
${MENU BOOK STORE}              xpath=//span[.='Book Store']
# Search
${SEARCH}                       id=searchBox
${BOOK NAME}                    xpath=//a[.='Git Pocket Guide']
${BOOK TABLE}                   xpath=//div[@class='col-12 mt-4 col-md-6']
@{LIST BOOK}                    Learning JavaScript Design Patterns    Designing Evolvable Web APIs with ASP.NET
...                             Speaking JavaScript    You Don't Know JS    Programming JavaScript Applications    Eloquent JavaScript, Second Edition
...                             Understanding ECMAScript 6
# Data Book
${FILED DATA}                   xpath=//div[@class='profile-wrapper']
${BOOK STORE}                   id=addNewRecordButton

*** Test Cases ***
Book Store Application
    [Documentation]    Performing bookstore testing
    Enter Bookstore
    Search Book

*** Keywords ***
Enter Bookstore
    [Documentation]    Enter page bookstore menu
    Execute Javascript    window.scrollTo(0,350)
    Click Then Verify Text    ${BOOK STORE APPLICATION}    Book Store
    Execute Javascript    window.scrollTo(0,350)
    Click Then Verify Text    ${MENU BOOK STORE}    Book Store

Search Book
    [Documentation]    Search book
    Scroll Element Into View    ${SEARCH}
    Input Text    ${SEARCH}    Git
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST BOOK}
        Element Should Not Contain    ${BOOK TABLE}    ${element}
    END
    Click Element    ${SEARCH}
    Click Element    ${BOOK NAME}
    Element Should Contain    ${FILED DATA}    9781449325862
    Click Element    ${BOOK STORE}

*** Settings ***
Documentation  This resource contain setup keyword
Library           SeleniumLibrary


*** Variables ***
${BROWSER}        edge
${URL DEFAULT}    about:blank
${URL}            https://demoqa.com


*** Keywords ***
Begin Test
    [Documentation]    Setup before test execution
    Open Browser    ${URL DEFAULT}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5
    Home Page

End Test
    [Documentation]    Clean up test setting
    Close All Browsers

Home Page
    [Documentation]    Home page load properly
    Go To    ${URL}            

*** Settings ***
Documentation     Date picker
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${WIDGET}         xpath=//h5[.='Widgets']
${DATE PICKER}    xpath=//span[.='Date Picker']
# Date
${DOB}            id=datePickerMonthYearInput
${PICKER YEAR}    xpath=//select[@class='react-datepicker__year-select']
${OPTION YEAR}    xpath=//option[.='1993']
${PICKER MONTH}    xpath=//select[@class='react-datepicker__month-select']
${OPTION MONTH}    xpath=//option[.='March']
${PICK DATE}      xpath=//div[@class='react-datepicker__day react-datepicker__day--007 react-datepicker__day--weekend']
# Date and Time
${DATE AND TIME}    id=dateAndTimePickerInput
${DATE YEAR}      css=.react-datepicker__year-read-view
${ARROW YEAR}     css=.react-datepicker__navigation--years-previous\
${YEAR 93}        xpath=//div[.='1993']
${DATE MONTH}     xpath=//span[@class='react-datepicker__month-read-view--selected-month']
${MARCH}          xpath=//div[.='March']
${DAY}            xpath=//div[.='78910111213']/div[text()="7"]
${HOURS}          xpath=//li[text()="12:00"]

*** Test Cases ***
Menu Robot
    [Documentation]    Performing testing date picker
    Enter Page Menu
    Date Picker
    Type Picker

*** Keywords ***
Enter Page Menu
    [Documentation]    Enter date picker page
    Click Then Verify Text    ${WIDGET}    Widgets
    Execute Javascript    window.scrollTo(0,300)
    Click Then Verify Text    ${DATE PICKER}    Date Picker

Date Picker
    [Documentation]    Picker date picker
# Choose Date of birth
    Click Element    ${DOB}
    Click Element    ${PICKER YEAR}
    Click Element    ${OPTION YEAR}
# Choose Month
    Click Element    ${PICKER MONTH}
    Click Element    ${OPTION MONTH}
# Choose Date
    Click Element    ${PICK DATE}
# Check attribute
    ${attribute}    Get Element Attribute    ${DOB}    value
    Should Be Equal    ${attribute}    03/07/1993

Type Picker
    [Documentation]    Typing for set date
# Choose type path
    Click Element    ${DATE AND TIME}
    Click Element    ${DATE YEAR}
    FOR    ${counter}    IN RANGE    1    25    1
        Click Element    ${ARROW YEAR}
    END
    Click Element    ${YEAR 93}
# Choose month
    Click Element    ${DATE MONTH}
    Click Element    ${MARCH}
# Choose Day
    Click Element    ${DAY}
# Choose Hour
    Scroll Element Into View    ${HOURS}
    Click Element    ${HOURS}
# Check date format
    ${attribute}    Get Element Attribute    ${DATE AND TIME}    value
    Should Be Equal    ${attribute}    March 7, 1993 12:00 PM

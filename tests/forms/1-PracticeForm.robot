*** Settings ***
Documentation     Form
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Menu
${FORMS}          //div[.='Forms']
${PRACTICE FORM}    //span[.='Practice Form']
# Form
${NAME}           id=firstName
${LAST NAME}      id=lastName
${EMAIL}          id=userEmail
${GENDER MALE}    css=[for='gender-radio-1']
${GENDER FEMALE}    css=[for='gender-radio-2']
${GENDER OTHER}    css=[for='gender-radio-3']
${MOBILE}         id=userNumber
# Date
${OPEN DOB}       id=dateOfBirthInput
${YEAR}           xpath=//select[@class='react-datepicker__year-select']
${OPTION YEAR}    xpath=//option[.='1993']
${MONTH}          xpath=//select[@class='react-datepicker__month-select']
${OPTION MONTH}    xpath=//option[.='March']
${DATE}           css=[aria-label='Choose Sunday, March 7th, 1993']
${SUBJECT}        id=subjectsInput
${SUBJECT OPTION}    id=react-select-2-option-0
# Hobbise
${SPORTS}         xpath=//label[.='Sports']
${READING}        xpath=//label[.='Reading']
${MUSIC}          xpath=//label[.='Music']
# Upload
${UPLOAD}         id=uploadPicture
# Address
${CURRENT ADDRESS}    id=currentAddress
${CURRENT ADDRESS DATA}    Jalan Wonosari km6 Banguntapan Bantul
# State
${SELECT STATE}    xpath=//div[text()="Select State"]
${OPTION STATE}    id=react-select-3-option-0
# Select City
${SELECT CITY}    xpath=//div[text()="Select City"]
${CITY OPTION}    id=react-select-4-option-0
${SUBMIT}         id=submit
# Form Result
@{LIST VALUES}    Student Name Gilang Romadhan    Student Email gilang.romadhan@outlook.com    Gender Male    Mobile 8995097652
...               Date of Birth 07 March,1993    Subjects English, Chemistry    Hobbies Sports, Reading, Music    Picture Selenium_Logo.png
...               Address Jalan Wonosari km6 Banguntapan Bantul    State and City NCR Delhi
# Table
${TABLE}          xpath=//tbody/tr
${CLOSE}          id=closeLargeModal

*** Test Cases ***
Practice Form
    [Documentation]    Performing form testing
    Enter Page Form
    Fill Form
    Check Result

*** Keywords ***
Enter Page Form
    [Documentation]    Enter page form
    Click Then Verify Text    ${FORMS}    Forms
    Click Then Verify Text    ${PRACTICE FORM}    Practice Form

Fill Form
    [Documentation]    Fill form testing
# Name
    Input Text    ${NAME}    Gilang
    Input Text    ${LAST NAME}    Romadhan
# Email
    Input Text    ${EMAIL}    gilang.romadhan@outlook.com
# Gender
    Click Element    ${GENDER MALE}
# Phone Number
    Input Text    ${MOBILE}    89950976520
# Date of Birth
    Click Element    ${OPEN DOB}
    Click Element    ${YEAR}
    Click Element    ${OPTION YEAR}
    Click Element    ${MONTH}
    Click Element    ${OPTION MONTH}
    Click Element    ${DATE}
# Subject
    Click Element    ${SUBJECT}
    Input Text    ${SUBJECT}    English
    Click Element    ${SUBJECT OPTION}
    Input Text    ${SUBJECT}    Chemistry
    Click Element    ${SUBJECT OPTION}
# Hobbies
    Click Element    ${SPORTS}
    Click Element    ${READING}
    Click Element    ${MUSIC}
# Upload File
    Choose File    ${UPLOAD}    ${EXECDIR}/resource/Selenium_Logo.png
# Current Address
    Input Text    ${CURRENT ADDRESS}    ${CURRENT ADDRESS DATA}
# City
    Click Element    ${SELECT STATE}
    Click Element    ${OPTION STATE}
    Click Element    ${SELECT CITY}
    Click Element    ${CITY OPTION}
# Submit
    Click Element    ${SUBMIT}

Check Result
    [Documentation]    Check result Form
    @{LIST}    Get WebElements    ${TABLE}
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST}
        ${attribute}    Get Text    ${element}
        Should Be Equal    ${attribute}    ${LIST VALUES}[${index}]
    END
    Click Element    ${CLOSE}

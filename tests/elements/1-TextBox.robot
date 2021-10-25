*** Settings ***
Documentation                           Text Box
Library                                 Collections
Library                                 SeleniumLibrary
Resource                                ../../keywords/resource.resource
Suite Setup                             Begin Test
Suite Teardown                          End Test

*** Variables ***
# Heading 1
${H5 ELEMENTS}                          xpath=//h5[.='Elements']
${H1 ELEMENTS}                          Elements
${TEXT BOX}                             xpath=//li[.='Text Box']
# Form
${FULL NAME}                            xpath=//input[@id='userName']
${EMAIL}                                xpath=//input[@id='userEmail']
${CURRENT ADDRESS}                      xpath=//textarea[@id='currentAddress']
${PERMANENT ADDRESS}                    xpath=//textarea[@id='permanentAddress']
${SUBMIT BTN}                           xpath=//button[@id='submit']
#Result
${LIST PARAGRAPH}                       xpath=//div[@class='border col-md-12 col-sm-12']//p
${TEXT PARAGRAPH}                       xpath=//p[@class="mb-1"]
${BORDER}                               css=.border
#List
@{LIST TEST}                            Name:Gilang Romadhan                        Email:gilang.parjiyo@gmail.com           Current Address :Jalan Wonosari km6    Permananet Address :Nusawungu Cilacap
@{LIST LOCATOR}                         ${FULL NAME}                                ${EMAIL}                                 ${CURRENT ADDRESS}                     ${PERMANENT ADDRESS}
@{LIST VALUE}                           Gilang Romadhan                             gilang.parjiyo@gmail.com                 Jalan Wonosari km6                     Nusawungu Cilacap


*** Test Cases ***
Test Cases
    [Documentation]                             Performing textbox testing
    Enter Page Element
    Fill Form Then Check Result


*** Keywords ***
Enter Page Element
    [Documentation]                             Enter page textbox testing
    Click Then Verify Text                      ${H5 ELEMENTS}                           ${H1 ELEMENTS}
    Click Then Verify Text                      ${TEXT BOX}                              Text Box

Failed Format Email
    [Documentation]                             Mocking user input wrong format email
    Input Text                                  ${FULL NAME}                             Gilang Romadhan
    Input Text                                  ${EMAIL}                                 gilang.parjiyo@gmail.com
    Input Text                                  ${CURRENT ADDRESS}                       Jalan Wonosari km6
    Input Text                                  ${PERMANENT ADDRESS}                     Nusawungu Cilacap
    Click Button                                ${SUBMIT BTN}

Fill Form Then Check Result
    [Documentation]                             Check result after filling form
    FOR                                         ${counter}                               IN RANGE                               0                                        4                        1
    ####### Input form
        ${value}                                    Get From List                            ${LIST VALUE}                          ${counter}
        Log To Console                              ${value}
        ${locator}                                  Get From List                            ${LIST LOCATOR}                        ${counter}
        Input Text                                  ${locator}                               ${value}
        Click Element                               ${SUBMIT BTN}
    ####### Check value form
        Wait Until Page Contains Element            ${BORDER}
        @{LIST}                                     Get WebElements                          ${LIST PARAGRAPH}
        ${element}                                  Get From List                            ${LIST}                                ${counter}                               # Get elemen for id
        ${id}                                       Get Element Attribute                    ${element}                             id                                       # Get id from element
        ${target}                                   Get Text                                 //p[@id="${id}"]                       # get value id target
        ${source}                                   Get From List                            ${LIST TEST}                           ${counter}                               # get value source
        Log To Console                              Checking value ${source}
        Should Be Equal                             ${target}                                ${source}                              # Get value
    END

*** Comments ***
- Fill form with wrong format email.
- Fill form with correct format

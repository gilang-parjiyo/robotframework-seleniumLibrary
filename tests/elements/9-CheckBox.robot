*** Settings ***
Documentation     Text Box
Library           String
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test

*** Variables ***
# Page Object
${ELEMENTS}       xpath=//h5[.='Elements']
${CHECK BOXES}    xpath=//span[.='Check Box']
# Expand
${ROOT HOME}      xpath=(.//*[normalize-space(text()) and normalize-space(.)='Book Store API'])[1]/following::*[name()='svg'][3]
${FOLDER DESKTOP}    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Home'])[1]/following::*[name()='svg'][1]
${FOLDER DOCUMENTS}    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Commands'])[1]/following::*[name()='svg'][1]
${FOLDER DOWNLOADS}    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Office'])[1]/following::*[name()='svg'][1]
${SUB FOLDER WORKSPACE}    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Documents'])[1]/following::*[name()='svg'][1]
${SUB FOLDER OFFICE}    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Veu'])[1]/following::*[name()='svg'][1]
# List
@{LIST FOLDER}    ${ROOT HOME}    ${FOLDER DESKTOP}    ${FOLDER DOCUMENTS}    ${FOLDER DOWNLOADS}    ${SUB FOLDER WORKSPACE}    ${SUB FOLDER OFFICE}
# Select File
${WORD FILE}      xpath=(.//*[normalize-space(text()) and normalize-space(.)='Word File.doc'])[1]/following::*[name()='svg'][1]
${DOWNLOADS}      xpath=(.//*[normalize-space(text()) and normalize-space(.)='Downloads'])[1]/following::*[name()='svg'][1]
# Office
${PUBLIC}         xpath=(.//*[normalize-space(text()) and normalize-space(.)='Office'])[1]/following::*[name()='svg'][1]
${PRIVATE}        xpath=(.//*[normalize-space(text()) and normalize-space(.)='Public'])[1]/following::*[name()='svg'][1]
${CLASSIFIED}     xpath=(.//*[normalize-space(text()) and normalize-space(.)='Private'])[1]/following::*[name()='svg'][1]
${GENERAL}        xpath=(.//*[normalize-space(text()) and normalize-space(.)='Classified'])[1]/following::*[name()='svg'][1]
# Workspace
${REACT}          xpath=(.//*[normalize-space(text()) and normalize-space(.)='WorkSpace'])[1]/following::*[name()='svg'][1]
${ANGULAR}        xpath=(.//*[normalize-space(text()) and normalize-space(.)='React'])[1]/following::*[name()='svg'][1]
${VEU}            xpath=(.//*[normalize-space(text()) and normalize-space(.)='Angular'])[1]/following::*[name()='svg'][1]
# Desktop
${NOTES}          xpath=(.//*[normalize-space(text()) and normalize-space(.)='Desktop'])[1]/following::*[name()='svg'][1]
${COMMAND}        xpath=(.//*[normalize-space(text()) and normalize-space(.)='Notes'])[1]/following::*[name()='svg'][1]
@{LIST CLICK}     ${DOWNLOADS}    ${WORD FILE}    ${PUBLIC}    ${PRIVATE}    ${CLASSIFIED}    ${GENERAL}    ${REACT}    ${ANGULAR}    ${VEU}    ${NOTES}    ${COMMAND}
# Result
${RESULTS}        xpath=//div[@id='result']
@{LIST EXPECTED}    wordFile    excelFile    public    private    classified    general    react    angular    veu    notes    command
# Folder selection
${HOME UNSELECT}    css=svg.rct-icon.rct-icon-uncheck > path

*** Test Cases ***
Test Cases
    [Documentation]    Performing checkboxtesting
    Enter Page Checkbox
    Performing Expand Folder

*** Keywords ***
Enter Page Checkbox
    [Documentation]    Mocking checkbox
    Click Then Verify Text    ${ELEMENTS}    Elements
    Click Then Verify Text    ${CHECK BOXES}    Check Box

Performing Expand Folder
    [Documentation]    Performing expand folder
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST FOLDER}
        Click Element    ${element}
    END
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST CLICK}
        Click Element    ${element}
        Element Should Contain    ${RESULTS}    ${LIST EXPECTED}[${index}]
    END

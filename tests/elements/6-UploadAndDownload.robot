*** Settings ***
Documentation     Upload and Download
Library           SeleniumLibrary
Resource          ../../keywords/resource.resource
Suite Setup       Begin Test
Suite Teardown    End Test


*** Variables ***
# Page Object
${DOWNLOAD}       id=downloadButton
${UPLOAD}         id=uploadFile
${H5 ELEMENTS}    xpath=//h5[.='Elements']
${UPLOAD DOWNLOAD}    xpath=//li[.='Upload and Download']
${PATH}           id=uploadedFilePath


*** Test Cases ***
Upload And Download
    [Documentation]    Mokcing user uplaod and download
    Enter Page Upload And Dowonload
    Download Image
    Upload Image


*** Keywords ***
Enter Page Upload And Dowonload
    [Documentation]    Enter page upload and download.
    Click Then Verify Text    ${H5 ELEMENTS}    Elements
    Click Then Verify Text    ${UPLOAD DOWNLOAD}    Upload and Download

Download Image
    [Documentation]  Mokcing user download image
    Click Element    ${DOWNLOAD}

Upload Image
    [Documentation]    Upload image
    Choose File    ${UPLOAD}    ${EXECDIR}/resource/Selenium_Logo.png
    ${text path}    Get Text    ${PATH}
    Should Be Equal    ${text path}    C:\\fakepath\\Selenium_Logo.png

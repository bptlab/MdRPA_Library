*** Settings ***
Documentation     Get Data from JSON and use that in robot.
Library    RPA.Browser.Selenium  auto_close=${FALSE}
Library    RPA.HTTP
Library    OperatingSystem
Library    BuiltIn
Library    RPA.JSON
Library    RPA.Desktop
Library    Collections
Resource   ./utils/utils.robot


*** Variables ***
${API_ALL_MODELS}   http://localhost:8000/all-models



*** Keywords *** 

Get UiModels
    [Arguments]     ${API_ALL_MODELS}
    ${response} =    GET    ${API_ALL_MODELS} 
    [Return]    ${response.json()}


    


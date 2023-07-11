*** Settings ***
Documentation     Get Data from JSON and use that in robot.
Library    RPA.Browser.Selenium  auto_close=${FALSE}
Library    RPA.HTTP
Library    OperatingSystem
Library    BuiltIn
Library    RPA.JSON
Library    RPA.Desktop
Library    Collections

*** Variables ***
${HTTP_LOCAL_SERVER}   http://localhost:8000/error-handling
${report}     
@{error_list} 

*** Keywords ***

Get ID From Attributes
    [Arguments]   ${attributes}
    Set Suite Variable    ${id}    ${EMPTY}
    FOR    ${attribute}    IN    @{attributes}
        ${name}    Set Variable    ${attribute["name"]}
        ${value}    Set Variable    ${attribute["value"]}
        Run Keyword If    '${name}' == 'id'     Set Suite Variable    ${id}     ${value}
    END
    [Return]    ${id}



Set UI Element
    [Arguments]  ${model_name}   ${page_name}    ${element_name}   ${models}
    Set Suite Variable  ${model_name}
    Set Suite Variable  ${page_name}
    Set Suite Variable  ${element_name}
    ${model}=   Get Model From All Models   ${models}
    ${page}=   Get Page From Model   ${model}
    ${ui_element}=   Get Element From Model   ${page}
    [Return]    ${ui_element}
    
Get Model From All Models
    [Arguments]   ${models}
    Set Suite Variable    ${return_model}    ${EMPTY}
    FOR    ${model}    IN    @{models}
        ${name}    Set Variable    ${model["application_name"]}
        Run Keyword If    '${name}' == '${model_name}'    Set Suite Variable    ${return_model}     ${model}
    END
    [Return]    ${return_model}

Get Page From Model
    [Arguments]   ${model}
    Set Suite Variable    ${return_page}    ${EMPTY}
    Set Suite Variable    ${pages}   ${model["pages"]} 
    FOR    ${page}    IN    @{pages}
        ${name}    Set Variable    ${page["page_name"]}
        Run Keyword If    '${name}' == '${page_name}'   Set Suite Variable    ${return_page}     ${page}
    END
    [Return]    ${return_page}
    
Get Element From Model
    [Arguments]   ${page}
    Set Suite Variable    ${return_element}    ${EMPTY}
    Set Suite Variable    ${elements}   ${page["ui_elements"]}  
    FOR    ${elem}    IN    @{elements}
        ${name}    Set Variable    ${elem["element_name"]}
        Run Keyword If    '${name}' == '${element_name}'   Set Suite Variable    ${return_element}     ${elem}  
    END
    [Return]    ${return_element}
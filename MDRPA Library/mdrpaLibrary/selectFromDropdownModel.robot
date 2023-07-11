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
Resource   sendReportModel.robot

*** Keywords ***


Select Value from Dropdown Model
    [Arguments]   ${application}  ${page}   ${ui_element}    ${model}    ${value}
    Set Suite Variable  ${model_name}    ${application} 
    Set Suite Variable  ${page_name}    ${page} 
    Set Suite Variable  ${element_name}   ${ui_element}
    Set Suite Variable  ${models}    ${model} 
    Set Suite Variable  ${element}  ${EMPTY}
    ${response}=  Set UI Element  ${model_name}   ${page_name}  ${element_name}   ${model} 
    Set Suite Variable  ${element}   ${response} 
    Set Suite Variable  ${current_mode}   ${element["current_mode"]} 
    Set Suite Variable  ${element_locators}     ${element["element_locators"]} 
    @{keyword_list}=    Create List     Select Value By ID     Select Value By Path     Select Value By Label    

    ${id}=   Get ID From Attributes  ${element_locators["dom"]["attributes"]}
    Set Suite Variable  ${id}
    Set Suite Variable  ${path}   ${element_locators["dom"]["path"]}
    Set Suite Variable  ${text}   ${element_locators["dom"]["text"]}
    Set Suite Variable  ${image}  ${element_locators["surface"]["image"]}
    Set Suite Variable  ${value}
    
    ${removed_keyword}=    Run Keyword If    '${current_mode}' == 'id'    Remove From List    ${keyword_list}    0
...    ELSE IF    '${current_mode}' == 'path'    Remove From List    ${keyword_list}    1
...    ELSE IF    '${current_mode}' == 'label'    Remove From List    ${keyword_list}   2 


    Set Suite Variable  ${interaction_status}   ${EMPTY} 

    Run Keyword    ${removed_keyword}    

    FOR    ${keyword}    IN    @{keyword_list}
       Run Keyword If    '${interaction_status}' == 'Fail'    ${keyword}    
    END



Select Value By ID
    ${element_exists}    Run Keyword And Return Status    Element Should Be Visible    id=${id}
    Run Keyword If    '${element_exists}' == 'True'  Run Keywords    Set Suite Variable  ${interaction_status}  Pass  AND    Select From List by Value  id=${id}    ${value}     
    ...  ELSE   Run Keywords   Set Suite Variable    ${interaction_status}  Fail  AND  Create Error  ${model_name}  ${page_name}  ${element_name}   id
    

Select Value By Path
    ${element_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=${path}
    Run Keyword If    '${element_exists}' == 'True'  Run Keywords    Set Suite Variable    ${interaction_status}  Pass  AND   Select From List by Value  xpath=${path}    ${value}      
    ...  ELSE   Run Keywords   Set Suite Variable    ${interaction_status}  Fail  AND  Create Error  ${model_name}  ${page_name}  ${element_name}   path

Select Value By Label
    ${element_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//a[text()='${text}']
    Run Keyword If    '${element_exists}' == 'True'  Run Keywords    Set Suite Variable    ${interaction_status}  Pass  AND   Select From List by Value   xpath=//a[text()='${text}']  ${value} 
    ...  ELSE   Run Keywords   Set Suite Variable    ${interaction_status}  Fail  AND  Create Error  ${model_name}  ${page_name}  ${element_name}   text




   


 




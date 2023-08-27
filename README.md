## Installation

The MdRPA Library has been made available on the official Python Package Index (PyPI), making it easy to install and integrate into your projects.

To install the library, you can use the following command in your terminal or command prompt:

```shell
pip install mdrpaLibrary
```


For more detailed information and updates, you can visit the PyPI page of the MdRPA Library at:
https://pypi.org/project/mdrpaLibrary/
Feel free to explore the library's documentation and features to enhance your Robotic Process Automation workflows.


## Example Usage

Below is an example demonstrating how to leverage the capabilities of the MdRPA Library for your automation tasks. This example showcases the automation of a payroll process using the custom functions provided by the library.

```robotframework
*** Settings ***
Library    mdrpaLibrary.modelDrivenRpa.ModelDrivenRpa

*** Variables ***
${FIRSTNAME}    John
${LASTNAME}     Doe
${EMAIL}        john.doe@example.com
${MONTH}        January
${SALARY}       5000

*** Test Cases ***
Automate Payroll Process

    ${uiModels}=    Get Ui Models    http://localhost:8000/all-models (Your API END POINT)
    
    Set Suite Variable     ${uiModels}
    
    Click Button Model    Payroll    payroll_homepage    addButton    ${uiModels}

    Input Field Model     Payroll    add_payroll    firstName    ${uiModels}    ${FIRSTNAME}
    
    Input Field Model    Payroll    add_payroll    lastName    ${uiModels}    ${LASTNAME}
    
    Input Field Model    Payroll    add_payroll    email    ${uiModels}    ${EMAIL}

    Select From Dropdown Model    Payroll    add_payroll    month    ${uiModels}    ${MONTH}
    
    Input Field Model    Payroll    add_payroll    salary    ${uiModels}    ${SALARY}
    
    Select Checkbox Model    Payroll    add_payroll    terms    ${uiModels}
    
    Click Button Model    Payroll    add_payroll    addButton    ${uiModels}
    
    Close Workbook
```

## License
Licensed under the [MIT license](https://github.com/bptlab/MdRPA_Library/blob/main/LICENSE).





## Available Custom Functions


### 1. Click Button Model

The `Click Button Model` custom function in the ModelDrivenRpa library allows you to interact with UI elements in a streamlined and efficient manner. This function facilitates the process of clicking a button within a specific UI model or application.

```robot
Click Button Model    ${modelName}    ${pageName}    ${elementName}    ${allModels}
```
###  Parameters

1. ${modelName} (string): The UI model name or application name in which the button is located.
2. ${pageName} (string): The name of the page or section containing the button element.
3. ${elementName} (string): The name of the UI button element to be clicked.
4. ${allModels} (list): A list containing all the UI models present in your database.



### 2. Input Field Model

The `Input Field Model` custom function in the ModelDrivenRpa library allows you to efficiently interact with input fields within UI models or applications. This function simplifies the process of entering data into input fields with a specified UI context.


```robot
Input Field Model    ${modelName}    ${pageName}    ${elementName}    ${allModels}    ${inputValue}
```
###  Parameters

1. ${modelName} (string): The UI model or application name in which the input field is located.
2. ${pageName} (string): The name of the page or section containing the input field element.
3. ${elementName} (string): The name of the input field element to interact with.
4. ${allModels} (list): A list containing all the UI models present in your database.
5. ${inputValue} (string): The value to be entered into the input field.


### 3. Select From Dropdown Model

The `Select From Dropdown Model` custom function in the ModelDrivenRpa library empowers you to interact with dropdown elements within UI models or applications. This function simplifies the process of selecting an option from a dropdown menu with a specified UI context.


```robot
Select From Dropdown Model    ${modelName}    ${pageName}    ${elementName}    ${allModels}    ${selectedOption}
```
###  Parameters

1. ${modelName} (string): The UI model or application name in which the dropdown element is located.
2. ${pageName} (string): The name of the page or section containing the dropdown element.
3. ${elementName} (string): The name of the dropdown element to interact with.
4. ${allModels} (list): A list containing all the UI models present in your database.
5. ${selectedOption} (string): The option to be selected from the dropdown.

### 4. Select Checkbox Model

The `Select Checkbox Model` custom function in the ModelDrivenRpa library empowers you to interact with checkboxes within UI models or applications. This function simplifies the process of toggling checkbox states with a specified UI context.


```robot
Select Checkbox Model    ${modelName}    ${pageName}    ${elementName}    ${allModels}
```
###  Parameters

1. ${modelName} (string): The UI model or application name in which the checkbox element is located.
2. ${pageName} (string): The name of the page or section containing the checkbox element.
3. ${elementName} (string): The name of the checkbox element to interact with.
4. ${allModels} (list): A list containing all the UI models present in your database.

### 5. Get Ui Models

The `Get Ui Models` custom function in the ModelDrivenRpa library enables you to retrieve a list of UI models or applications that are available for automation. This function is particularly useful when you need to dynamically access and utilize UI models during your Robotic Process Automation (RPA) tasks.

```robot
${uiModels}=    Get Ui Models    ${apiEndpoint}
```

###  Parameters

1. ${apiEndpoint} (string): The endpoint URL of your own API that returns a list of available UI models.



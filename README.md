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

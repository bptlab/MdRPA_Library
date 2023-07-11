import os
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
import platform

class ModelDrivenRpa:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.builtin = BuiltIn()
        self.resource_dir = os.path.dirname(os.path.abspath(__file__))
        self.resource_files = [
            'clickButtonModel.robot',
            'inputFieldModel.robot',
            'selectCheckboxModel.robot',
            'selectFromDropdownModel.robot',
            'getUiModels.robot',
            'sendReportModel.robot'
        ]  

    def import_resource_file(self, resource_file):
        file_path = os.path.join(self.resource_dir, resource_file)

        if platform.system() == 'Windows':
            file_path = file_path.replace('\\', '\\\\')
        else:
            file_path = file_path.replace('\\', '/')

        self.builtin.import_resource(file_path)

    @keyword
    def click_button_model(self, *args):
        self.import_resource_file(self.resource_files[0])  
        self.builtin.run_keyword('Click Button Model', *args)

    @keyword
    def input_field_model(self, *args):
        self.import_resource_file(self.resource_files[1])  
        self.builtin.run_keyword('Input Field Model', *args)

    @keyword
    def select_checkbox_model(self, *args):
        self.import_resource_file(self.resource_files[2])  
        self.builtin.run_keyword('Select Checkbox Model', *args)

    @keyword
    def select_from_dropdown_model(self, *args):
        self.import_resource_file(self.resource_files[3])  
        self.builtin.run_keyword('Select Value From Dropdown Model', *args)
    
    @keyword
    def get_ui_models(self, *args):
        self.import_resource_file(self.resource_files[4])
        return self.builtin.run_keyword('Get UiModels', *args)
    
    @keyword
    def send_report_to_UI_Modeler(self, *args):
        self.import_resource_file(self.resource_files[5]) 
        self.builtin.run_keyword('Send Report to UI Modeler', *args)


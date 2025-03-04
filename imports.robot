*** Settings ***
    
#### ROBOT LIBRARY ####
Library           SeleniumLibrary      run_on_failure=SeleniumLibrary.CapturePageScreenshot
Library           String
Library           RequestsLibrary
Library           SSHLibrary
Library           Collections
Library           DateTime
Library           OperatingSystem 
Library           DatabaseLibrary
#Library           REST          ssl_verify=${False}

#### PYTHON3 LIBRARY ####
Library           ./0_resources/pythonlibs/convert_list_to_string.py
Library           ./0_resources/pythonlibs/convert_to_json.py
Library           ./0_resources/pythonlibs/createcsvfile.py
Library           ./0_resources/pythonlibs/csv_util.py
Library           ./0_resources/pythonlibs/encodebase64.py
Library           ./0_resources/pythonlibs/excel_util.py
#Library           ./0_resources/pythonlibs/ExcellentLibrary.py
Library           ./0_resources/pythonlibs/filesearch.py
Library           ./0_resources/pythonlibs/javaexecutor.py
Library           ./0_resources/pythonlibs/json_generator.py
Library           ./0_resources/pythonlibs/math_util.py
Library           ./0_resources/pythonlibs/readcsvfile.py
Library           ./0_resources/pythonlibs/remove_quote_string_sql.py
Library           ./0_resources/pythonlibs/rest_util.py
Library           ./0_resources/pythonlibs/urlparse_compat.py
Library           ./0_resources/pythonlibs/sql_db.py

#### ROBOT WEB COMMON KEYWORDS ####
Resource          ./1_common/bdd_web_common_keywords.robot
Resource          ./1_common/sql_common_keywords.robot
Resource          ./1_common/web_common_keywords.robot
Resource          ./1_common/api_common/api_common_keywords.robot          

#### ROBOT ELEMENT ####
Resource     ./2_elements/loginpage.robot
#### ROBOT KEYWORDS ####
Resource     ./3_keywords/login_keywords.robot
#### VARIABLES  ####
Resource     ./5_test_datas/variables.robot
Resource     ./5_test_datas/testData.robot
Resource     config_dev.robot
Resource     config_test.robot
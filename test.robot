*** Settings ***
Library             OperatingSystem
Library             Collections
Library             String
Test Template       example test keyword


*** Test Case ***                                       USERNAME            PAsSWORD                   
Example keyword1                                        standard_           secret_sauce
    [Tags]  test_data_driven1
    [Documentation]     ทำการ login  สำเร็จโดยใช้  username แบบธรรมดา
    # [Template]    Login success

Example keyword2                                        performance_qlitch    secret_sauce
    [Tags]  test_data_driven2
    [Documentation]     ทำการ login  สำเร็จโดยใช้  username แบบโหลดหน้าเพจ
    # [Template]    Login success

*** Keywords ***
example test Keyword
    [Arguments]    ${username}  ${password} 
    log     ${username}     console=true
    log     ${password}     console=true


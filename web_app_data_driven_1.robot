*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     ButltIn
Test Template       Login success



*** Test Case ***                                           USERNAME                    PASSWORD
Example web app data driven success with standard          standard_user             secret_sauce
Example web app data driven success with proble            problem_user              secret_sauce
Example web app data driven success with performance       performance_glitch_user   secret_sauce


*** Keyword ***
Login success
    [Arguments]     ${username}     ${password}
    Open Browser    https://www.saucedemo.com/v1/index.html     chrome
    Input text      id=user-name   ${username}
    Input text      id=password     ${password}
    Click Element       id=login-button
    
    Wait until element is visible   //div[contains(text(),"Products")]      timeout=30s
    
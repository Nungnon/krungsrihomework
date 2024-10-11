*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     ButltIn
Variables   ${CURDIR}/data.yaml
Test Template 
*** Test Case ***
Open web site testing
    Open Browser chrome     ${url}     ${browser}
    Input username       ${name.standard.user}
    Input password      ${name.standard.password}
    Click login
    
    Verify text products
    

*** Keyword ***
Open Browser chrome
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}
Input username
    [Arguments]         ${username}
    Input Text      //*[@id="user-name"]     ${username}
Input password         
    [Arguments]         ${password}
    Input Text      //*[@id="password"]     ${password}
Click login
    Click Button        //*[@id="login-button"]
Click add
    Click Button        //*[@class="btn_primary btn_inventory"]
Click menu
    Click Element        //*[@class="bm-burger-button"]
Click logout
    Click Element        //*[@id="logout_sidebar_link"]
Verify text products        
    Wait Until Element Is Visible       //div[contains(text(),"Products")]  timeout=30s
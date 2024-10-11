*** Settings ***
Library         OperatingSystem
Library         Collections
Library         String
Library         CSVLibrary
Library         SeleniumLibrary
Variables   ${CURDIR}/data.yaml

*** Test Case ***
Get scv testing
    ${CSV_FILE}     Set Variable     ../Test/Book1.csv
    ${DATA_CSV}     Read Csv File To Associative    ${CSV_FILE}
    log to console     ${DATA_CSV}
    FOR     ${row}      IN      @{DATA_CSV}
        Open browser chrome     ${url}  ${browser}
        log to console   ${row}[\ï»¿username]
        log to console   ${row}[password]
        Input username       ${name.standard.user}
        Input password      ${name.standard.password}
        Click login
    
    Verify text products
    END

*** Keyword ***
Open browser chrome
    [Arguments]     ${url}  ${browser}
    Open Browser    ${url}  ${browser}
Input username
    [Arguments]         ${username}
    Input Text      //*[@id="user-name"]     ${username}
Input password         
    [Arguments]         ${password}
    Input Text      //*[@id="password"]     ${password}
Click login
    Click Button        //*[@id="login-button"]

Verify text products        
    Wait Until Element Is Visible       //div[contains(text(),"Products")]  timeout=30s
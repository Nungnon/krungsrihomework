*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    CSVLibrary
Library    SeleniumLibrary
Variables    ./data.yaml

*** Test Cases ***
Get Csv Testing
    ${CSV}    Set Variable    ./Book1.csv
    ${USERDATA_CSV}    Read Csv File To Associative    ${CSV}
    FOR    ${row}    IN    @{USERDATA_CSV}
        Open Browser chrome     ${url}     ${browser}     
        Input Username    ${name.standard.user}
        Input Password    ${name.standard.password}
        Click Login
        Verify alert Products

        Click Add
        Verify Cart
        Click Cart
        Verify alert Cart
        Verify alert Your Products
        Verify alert Products Price

        Click Checkout
        Verify alert Checkout

        # Adjust these lines if necessary
        Input firstname    ${row}[Firstname]  
        Input lastname    ${row}[Lastname]    
        Input Code    [Code]        
        Click Continue
        Verify alert Overview
        Verify alert Your Products


        Click Finish
        Verify alert Thankyou


        Click ButtonButton
        Verify Element Logout


        Click Logout
        Verify alert Login


    END

*** Keywords ***
Open Browser chrome
    [Arguments]     ${url}      ${browser}
    Open Browser    ${url}      ${browser}


Input Username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}
Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}
Input firstname
    [Arguments]    ${Firstname}
    Input Text    //*[@id="first-name"]    ${Firstname}
Input lastname
    [Arguments]    ${Lastname}
    Input Text    //*[@id="last-name"]    ${Lastname}
Input Code
    [Arguments]    ${Code}
    Input Text    //*[@id="postal-code"]    ${Code}


Click Login
    Click Element    //*[@id="login-button"]

Click Add
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button

Click ButtonButton
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
Click Cart
    Click Element    //*[@id="shopping_cart_container"]/a
Click Checkout
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
Click Continue
    Click Element    //*[@id="checkout_info_container"]/div/form/div[2]/input
Click Finish
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
Click Logout
    Click Element    //*[@id="logout_sidebar_link"]
    
Verify alert Thankyou
    Wait Until Element Is Visible    //div[contains(text(),"Finish")]    timeout=30s
Verify Element Logout
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]    timeout=30s
Verify alert Login
    Wait Until Element Is Visible    //*[@id="login-button"]    timeout=30s
Verify alert Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=30s
Verify Cart
    Wait Until Element Is Visible    //*[@id="shopping_cart_container"]/a    timeout=30s
Verify alert Cart
    Wait Until Element Is Visible    //div[contains(text(),"Your Cart")]    timeout=30s
Verify alert Your Products
    Wait Until Element Is Visible    //div[contains(text(),"Sauce Labs Backpack")]    timeout=30s
Verify alert Products Price
    Wait Until Element Is Visible    //div[contains(text(),"29.99")]    timeout=30s
Verify alert Checkout
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Your Information")]    timeout=30s

Verify alert Overview
    Wait Until Element Is Visible    //div[contains(text(),"Checkout: Overview")]    timeout=30s

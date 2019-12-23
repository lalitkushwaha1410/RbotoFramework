*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${password}       14101991
${username}       lalitkush1991@gmail.com

*** Test Cases ***
TC001-Verify Login Page
    Open Browser    http://www.myntra.com    firefox
    Sleep    5
    Element Should Be Visible    xpath://a[contains(text(),'Men')]    Element present = Men
    Element Should Be Visible    xpath://a[contains(text(),'Women')]    Element present = Women
    [Teardown]    Close Browser

TC002-Login
    LoginToMyntra    ${username}    ${password}
    [Teardown]    Close Browser

TC003-Search for Tshirt
    LoginToMyntra    ${username}    ${password}
    Sleep    4
    Input Text    xpath://input[@placeholder='Search for products, brands and more']    tshirt
    Sleep    1
    Click Element    xapth://header[@id='desktop-header-cnt']//a[@href='/tshirt']/span
    Sleep    3
    Click Element    xpath://header[@id='desktop-header-cnt']/div[@class='desktop-bound']//ul[@class='desktop-group']/li[2]
    [Teardown]    Close Browser

*** Keywords ***
LoginToMyntra
    [Arguments]    ${username}    ${password}
    Open Browser    http://www.myntra.com    firefox
    Sleep    5
    Maximize Browser Window
    Mouse Over    xpath://span[contains(text(),'Profile')]
    Sleep    1
    Go To    https://www.myntra.com/login?referer=https://www.myntra.com/
    Input Text    xpath://input[@placeholder='Your Email Address']    ${username}
    Input Text    xpath://input[@placeholder='Enter Password']    ${password}
    Sleep    2
    Click Element    css:.login-login-button

*** Settings ***
Documentation     Test suite verifying login security and positive/negative flows.
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/inventory_keywords.robot

Test Setup        Open SauceDemo Browser
Test Teardown     Close SauceDemo Browser

Default Tags      login_regression


*** Test Cases ***
Successful Login Test
    [Documentation]    Verifies standard user logs in and views inventory successfully.
    [Tags]             smoke    positive
    
    Login To SauceDemo    standard_user    secret_sauce
    Location Should Contain    inventory.html
    Page Should Contain        Products
    Sleep              2s


Locked Out User Test
    [Documentation]    Verifies that locked out users are properly restricted with error messages.
    [Tags]             security    negative
    
    Login To SauceDemo    locked_out_user    secret_sauce
    Element Should Be Visible    css=h3[data-test='error']
    Page Should Contain        Epic sadface: Sorry, this user has been locked out.
    Sleep              2s
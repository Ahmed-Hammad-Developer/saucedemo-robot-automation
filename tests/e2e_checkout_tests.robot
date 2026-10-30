*** Settings ***
Documentation     End-to-end shopping cart and checkout test workflow.
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/inventory_keywords.robot

Test Setup        Open SauceDemo Browser
Test Teardown     Close SauceDemo Browser

Default Tags      e2e


*** Test Cases ***
Complete End To End Checkout Flow
    [Documentation]    Executes a complete purchase flow from login to order confirmation.
    [Tags]             smoke    checkout
    
    # Step 1: Login
    Login To SauceDemo         standard_user    secret_sauce
    Location Should Contain    inventory.html
    
    # Step 2: Add item to cart and verify badge
    Add First Item To Cart
    Element Text Should Be     class=shopping_cart_badge    1
    
    # Step 3: Go to cart and proceed to checkout
    Go To Cart
    Page Should Contain        Sauce Labs Backpack
    Wait Until Element Is Visible    id=checkout    timeout=10s
    Click Button               id=checkout
    
    # Step 4: Fill customer details and continue
    Complete Checkout Form     Ahmed    Testing    12345
    Page Should Contain        Checkout: Overview
    
    # Step 5: Finish order and verify success
    Wait Until Element Is Visible    id=finish    timeout=10s
    Click Button               id=finish
    Page Should Contain        Thank you for your order!
    
    Log To Console             \n[SUCCESS] End-to-End purchase flow completed seamlessly!
    Sleep                      3s
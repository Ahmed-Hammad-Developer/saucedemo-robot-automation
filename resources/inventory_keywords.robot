*** Settings ***
Documentation     Reusable keywords for SauceDemo login, inventory sorting, and checkout.
Library           SeleniumLibrary

*** Keywords ***
Login To SauceDemo
    [Arguments]    ${username}    ${password}
    Input Text     id=user-name    ${username}
    Input Text     id=password    ${password}
    Click Button   id=login-button

Add First Item To Cart
    Click Button   id=add-to-cart-sauce-labs-backpack

Go To Cart
    Click Element  class=shopping_cart_link

Complete Checkout Form
    [Arguments]    ${fname}    ${lname}    ${postal}
    Input Text     id=first-name    ${fname}
    Input Text     id=last-name     ${lname}
    Input Text     id=postal-code   ${postal}
    Click Button   id=continue
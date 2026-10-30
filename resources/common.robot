*** Settings ***
Documentation     Global browser configuration and lifecycle keywords supporting CI/CD.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com/
# Defaults to headlesschrome for CI servers, can be overridden locally with Chrome
${BROWSER}        headlesschrome

*** Keywords ***
Open SauceDemo Browser
    [Documentation]    Opens the e-commerce store in headless mode with optimized window size for CI.
    Open Browser       ${URL}    ${BROWSER}    options=add_argument("--window-size=1920,1080"); add_argument("--disable-gpu"); add_argument("--no-sandbox")
    Maximize Browser Window

Close SauceDemo Browser
    [Documentation]    Closes the active browser session.
    Close Browser
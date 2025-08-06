*** Settings ***
Documentation     A test suite with multiple tests for headless Chrome
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      10

*** Test Cases ***
Open Example.com in Headless Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    chrome_options=${options}
    Go To    https://example.com
    Sleep    ${SLEEP}
    Close Browser

Search on Google
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    chrome_options=${options}
    Go To    https://www.google.com
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Sleep    5
    Page Should Contain    Robot Framework
    Close Browser

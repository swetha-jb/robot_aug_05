*** Settings ***
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    chrome
${SLEEP}      5
*** Test Cases ***
Open Example.com in Headless Chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    "--headless"
    Call Method    ${options}    add_argument    "--no-sandbox"
    Call Method    ${options}    add_argument    "--disable-dev-shm-usage"
    Call Method    ${options}    add_argument    "--disable-gpu"
    ${driver}=     Evaluate    selenium.webdriver.Chrome(options=${options})    selenium.webdriver
    Register Driver    ${driver}    alias=custom
    Go To    https://example.com
    Sleep    ${SLEEP}
    Close Browser


Search on Google
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    ${driver}=     Evaluate    selenium.webdriver.Chrome(options=${options})    selenium.webdriver
    Register Driver    ${driver}    alias=custom
    Go To    https://www.google.com
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Sleep    ${SLEEP}
    Page Should Contain    Robot Framework
    Close Browser

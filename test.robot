*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_OPTIONS}    headless,disable-gpu,no-sandbox,disable-dev-shm-usage

*** Test Cases ***
Open Google In Headless Mode With ChromeOptions
    Open Headless Chrome Browser
    Go To    https://www.google.com
    [Teardown]    Close Browser

*** Keywords ***
Open Headless Chrome Browser
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    selenium.webdriver
    FOR    ${opt}    IN    @{CHROME_OPTIONS.split(',')}
        Call Method    ${options}    add_argument    --${opt}
    END
    Open Browser    https://www.google.com    browser=chrome    options=${options}
*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${BROWSER}  chrome


*** Keywords ***
create session
    Set Selenium Speed    0.5
    Open Browser    about:blank     ${BROWSER}
    Maximize Browser Window

close session
    Close Browser

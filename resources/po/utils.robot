*** Settings ***
Library     SeleniumLibrary




*** Keywords ***
Element Should Have Class
    [Arguments]  ${element}  ${className}
    Wait Until Page Contains Element  ${element}.${className}
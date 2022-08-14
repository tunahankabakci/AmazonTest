*** Settings ***
Library  SeleniumLibrary
Resource    ../resources/utilsApp.robot
Resource    ../resources/AmazonHomeApp.robot


Test Setup      utilsApp.create session
Test Teardown       utilsApp.close session


*** Test Cases ***
Verify Homepage
    [Documentation]     Anasayfa'ya git ve doğrula
    AmazonHomeApp.Go To Amazon
    AmazonHomeApp.Check Homepage



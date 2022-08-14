*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary
Resource    ../resources/utilsApp.robot
Resource    ../resources/AmazonLoginApp.robot
Resource    ../resources/po/AmazonProduct.robot
Resource    ../resources/po/AmazonHome.robot


Test Setup      utilsApp.create session
Test Teardown       utilsApp.close session


*** Test Cases ***
Verify Login
    [Documentation]     Kullancı girişi yap ve "Hesabım" sayfasındaki bilgiler ile
    ...  giriş yapılan hesap bilgileri uyuşuyor mu kontrol et
    AmazonLoginApp.Login Test Account
    AmazonLoginApp.Ckeck Amazon Account

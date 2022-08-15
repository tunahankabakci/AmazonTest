*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/AmazonSearchApp.robot
Resource    ../resources/AmazonLoginApp.robot
Resource    ../resources/utilsApp.robot

Test Setup      utilsApp.create session
Test Teardown       utilsApp.close session


*** Test Cases ***
Test Amazon Search
    [Documentation]     Kullanıcı girisi, sepete ekleme ürün ekleme ve sepet fiyatını ile ürün fiyatı karşılaştırma
    AmazonLoginApp.Login Test Account
    AmazonSearchApp.Search And Check
    AmazonSearchApp.Open And Check Product
    AmazonSearchApp.Add To Basket And Check

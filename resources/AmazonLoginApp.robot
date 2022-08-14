*** Settings ***
Library     SeleniumLibrary
Resource    ./po/AmazonHome.robot
Resource    ./po/AmazonLogin.robot



*** Keywords ***
Login Test Account
    AmazonHome.Go To Homepage
    AmazonHome.Accept Cookies If Visible
    AmazonLogin.Go To Login Page
    AmazonLogin.Login Test Accoount

Ckeck Amazon Account
    AmazonLogin.Check User Credentials

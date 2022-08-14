*** Settings ***
Library     SeleniumLibrary
Resource    ./po/AmazonHome.robot



*** Keywords ***
Go To Amazon
    AmazonHome.Go To Homepage
    AmazonHome.Accept Cookies If Visible

Check Homepage
    [Documentation]     Anasayfa'da yer alan elementlerin test edilmesi
    AmazonHome.Check The Homepage Logo
    AmazonHome.Check The Homepage Search Bar
    AmazonHome.Check The Homepage Nav Bar
    AmazonHome.Check The Homepage Carousel
    AmazonHome.Check The Homepage Footer



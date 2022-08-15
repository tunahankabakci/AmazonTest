*** Settings ***
Library     SeleniumLibrary
Library     String



*** Keywords ***
Go To Basket
    [Documentation]     Sepete git ve kontrol et
    Wait Until Page Contains Element    id=nav-cart
    Click Element    id=nav-cart
    Wait Until Element Contains    css=.sc-compact-bottom    Alışveriş Sepeti

Remove Product
    [Documentation]     Sepetteki ürünü sil
    Wait Until Page Contains Element    css=input[data-action="delete"]
    Click Element    css=input[data-action="delete"]
    Wait Until Page Contains    Amazon sepetiniz boş.

Compare Basket Product Price
    [Documentation]     Parametreden gelen fiyat ile sepet fiyatını karşılaştırır
    [Arguments]     ${PRICE_1}
    ${PRICE_2}    Get Text    css=.sc-product-price
    @{PARTS}    Split String    ${PRICE_2}    #Fiyat bilgisinden "TL" yi kaldırmak için
    Should Be Equal    ${PRICE_1}    ${PARTS}[0]

Compare Basket Product Title
    [Documentation]     Parametreden gelen başlık ile sepette ekli olan ürünün başlıklarını karşılaştırır
    [Arguments]     ${TITLE_1}
    ${TITLE_2}    Get Text    css=[data-a-word-break] [aria-hidden]
    Should Be Equal    ${TITLE_1}    ${TITLE_2}
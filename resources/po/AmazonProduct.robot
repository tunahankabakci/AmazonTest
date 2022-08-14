*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../../config/amazonProd.py


*** Keywords ***
Add Product To Basket
    [Documentation]     Ürün sayfasında hangi ürün açıksa onu sepete ekler ve fiyatı ile Başlığını döndürür
    ${PRICE_WHOLE}      Get Text       css=.a-spacing-micro .a-price-whole
    ${PRICE_FRACTION}      Get Text       css=.a-spacing-micro .a-price-fraction
    ${PRICE} =   Catenate    ${PRICE_WHOLE},${PRICE_FRACTION}
    ${PRODUCT_TITLE}      Get Text    css=#productTitle
    Click Element    id=add-to-cart-button
    Wait Until Element Contains    css=#sw-atc-details-single-container    Sepete Eklendi
    [Return]    ${PRICE}    ${PRODUCT_TITLE}
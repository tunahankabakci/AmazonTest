*** Settings ***
Library     SeleniumLibrary



*** Keywords ***
Amazon Search Word
    [Documentation]     Amazon'da ürün ara
    [Arguments]     ${word}
    Input Text    id=twotabsearchtextbox        ${word}
    Click Element    id=nav-search-submit-button
    Wait Until Element Contains    css=.a-size-medium-plus.a-text-normal    SONUÇLAR

Compare The Searched Word
    [Documentation]     Aranan kelime search bar'da çıkan ile eşleşiyor mu kontrole eder
    [Arguments]     ${word}
    ${SEARCHED_WORD}    Get Element Attribute    css=.nav-search-field [value]    value
    Should Be Equal    ${word}    ${SEARCHED_WORD}


Open Product
    [Documentation]     Aramada çıkan 5. ürüne tıklar ve başlığını kaydeder
    ${PRODUCT_TITLE_1}     Get Text    css=div[data-index="7"]>div>div>div>div>div>div:nth-child(1)>h2>a>span
    Set Global Variable    ${PRODUCT_TITLE_1}
    Click Element    css=div[data-index="7"]>div>div>div>div>div>div:nth-child(1)>h2>a
    Wait Until Page Contains Element    id=add-to-cart-button


Check Product
    [Documentation]     Aramada Tıklanan Başlığı ile açılan ürün sayfasındaki başlık aynı mı kontrol eder
    ${PRODUCT_TITLE_2}      Get Text    css=#productTitle
    Should Be Equal    ${PRODUCT_TITLE_1}    ${PRODUCT_TITLE_2}
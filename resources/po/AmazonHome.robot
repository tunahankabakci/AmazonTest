*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Go To Homepage
    Go To    ${HOMEPAGE_URL}
    Wait Until Location Contains    ${HOMEPAGE_URL}
    Wait Until Page Contains Element    css=div[id="nav-tools"]


Accept Cookies If Visible
    [Documentation]     Çerezler'i kabul et penceresi gözüküyorsa kabul et
    ${IS_COOKIE_POLICY_VISIBLE}     Run Keyword And Return Status       Element Should Be Visible    name = accept
    Run Keyword If    ${IS_COOKIE_POLICY_VISIBLE}    Click Element    name = accept


Check The Homepage Logo
    [Documentation]     Ana sayfaya yonlendiren logo mevcut mu
    Wait Until Page Contains Element    css=a[href="/ref=nav_logo"]


Check The Homepage Carousel
    [Documentation]     Slide element'i mevcut mu
    Wait Until Page Contains Element    id=desktop-banner


Check The Homepage Search Bar
    [Documentation]     Arama textbox mevcut mu
    Wait Until Page Contains Element    css=#nav-search

Check The Homepage Nav Bar
    [Documentation]     Navbar mevcut mu
    Wait Until Page Contains Element    css=#nav-main


Check The Homepage Footer
    [Documentation]     Footer başlıkları Footer içinde mevcut mu
    Scroll Element Into View    id=navFooter
    FOR    ${TITLE}    IN   @{FOOTER_TITLES}
        Wait Until Element Contains     id=navFooter     ${TITLE}
    END











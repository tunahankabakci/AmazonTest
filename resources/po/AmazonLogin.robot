*** Settings ***
Library     SeleniumLibrary
Library    DebugLibrary
Variables   ../../config/amazonProd.py


*** Keywords ***
Go To Login Page
    [Documentation]     Sayfa ilk yüklendiginde tooltip signin butonu aktif oluyor.
    ...     Baska bir yere focus olunduysa bu buton devre disi kaliyor diğeri aktif oluyor.
    ...     O yüzden tooltip button yoksa diğer butona tıklamaya calisiyor
    Wait Until Page Contains Element    id = nav-tools
    ${IS_TOOLTIP_SIGNIN}     Run Keyword And Return Status      Element Should Be Visible    css=a[data-nav-role="signin"]
    IF    ${IS_TOOLTIP_SIGNIN}
        Click Element     css=a[data-nav-role="signin"]
    ELSE
        Click Element    css=a[data-nav-ref="nav_signin"]
    END
    Wait Until Page Contains    Giriş yap
    Wait Until Page Contains Element    id=continue
    Wait Until Page Contains Element    name=email

Login Test Accoount
    [Documentation]     Prod dosyasındaki email ve şifre ile giriş yap
    Wait Until Location Contains        ${SIGN_IN_URL}
    Wait Until Page Contains Element    id=continue
    Wait Until Page Contains Element    name=email
    Input Text    name=email    ${EMAIL}
    Click Element    id = continue
    Wait Until Page Contains Element    name = password
    Wait Until Page Contains Element    css=input[type="submit"]
    Input Text    name = password    ${PASSWORD}
    Click Element    css=input[type="submit"]

Check User Credentials
    [Documentation]     Bazen hesap bilgileri sayfasına gitmeye çalıştığımızda telefona doğrulama kodu istiyor.
    ...  Doğrulama için testçiye süre tanıması için hesap bilgileri okumaya çalışırken 60 saniye timeout var.
    Wait Until Page Does Not Contain Element    id=nav-al-signin
    Click Element    css=a[data-nav-ref="nav_youraccount_btn"]
    Wait Until Page Contains Element    css=div[data-card-identifier="SignInAndSecurity"]
    Click Element    css=div[data-card-identifier="SignInAndSecurity"]
    Wait Until Element Contains    css=#ap_cnep_header    Oturum Açma ve Güvenlik       timeout=60
    FOR    ${TITLE}    IN    @{ACCOUNT_TITLES}
        Wait Until Element Contains    css=.a-unordered-list    ${TITLE}    timeout=60
    END
    Element Should Contain    css=.a-unordered-list    ${EMAIL}
    ${ACC_EMAIL}    Get Text    css=li:nth-of-type(2) .a-fixed-right-grid-col .a-row:nth-of-type(2)
    Should Be Equal    ${EMAIL}    ${ACC_EMAIL}     #Login olunan mail ile hesap bilgilerindeki mail aynı mı

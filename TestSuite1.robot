*** Variables ***
${SleepTime}      5
${Language}       English
${productName}    mobile phone
${minValue}       600
${maxValue}       2500
${Username}       your_email@example.com
${Password}       your_password

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
searchProduct
    Open Browser    https://www.aliexpress.com    chrome
    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=20s
    Click Element    //div[contains(text(), "Don't allow")]
    Wait Until Element Is Visible    //input[@id='search-words']    timeout=20s
    Input Text    //input[@id='search-words']    ${productName}
    Click Element    //input[@type='button' and @title='submit']
    Sleep    ${SleepTime}

filterResults
    Open Browser    https://www.aliexpress.com    chrome
    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=20s
    Click Element    //div[contains(text(), "Don't allow")]
    Wait Until Element Is Visible    //input[@id='search-words']    timeout=20s
    Input Text    //input[@id='search-words']    ${productName}
    Click Element    //input[@type='button' and @title='submit']
    Sleep    ${SleepTime}
    Wait Until Element Is Visible    //div[contains(@class,'hv_hw')]    timeout=20s
    Input Text    //input[@name='minPrice']    ${minValue}
    Input Text    //input[@name='maxPrice']    ${maxValue}
    Click Element    //span[contains(text(), 'OK')]
    Sleep    ${SleepTime}

addItem
    Open Browser    https://www.aliexpress.com    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=20s
    Click Element    //div[contains(text(), "Don't allow")]
    Wait Until Element Is Visible    //input[@id='search-words']    timeout=20s
    Input Text    //input[@id='search-words']    ${productName}
    Click Element    //input[@type='button' and @title='submit']
    Sleep    ${SleepTime}
    Click Element    //div[@class='hm_hn']
    Sleep    3s
    ${newTab}=    Get Window Handles
    Switch Window    ${newTab[1]}
    Click Element    //span[contains(text(),'أضف إلى العربة')]
    Wait Until Element Is Visible    //a[contains(text(),'إذهب إلى سلة التسوق')]    timeout=20s
    Click Element    //a[contains(text(),'إذهب إلى سلة التسوق')]
    Sleep    5s

changeLang
    Open Browser    https://www.aliexpress.com    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=20s
    Click Element    //div[contains(text(), "Don't allow")]
    Wait Until Element Is Visible    //div[@class='ship-to--menuItem--WdBDsYl ship-to--newMenuItem--2Rw-XvE']    timeout=15s
    Scroll Element Into View    //div[@class='ship-to--menuItem--WdBDsYl ship-to--newMenuItem--2Rw-XvE']
    Wait Until Element Is Not Visible    //div[@class='UAEqK']    timeout=10s
    Click Element    //div[@class='ship-to--menuItem--WdBDsYl ship-to--newMenuItem--2Rw-XvE']
    Sleep    ${SleepTime}
    Wait Until Element Is Visible    //span[contains(text(),'العربية')]
    Click Element    //span[contains(text(),'العربية')]
    Sleep    ${SleepTime}
    ${isEnglish}=    Run Keyword And Return Status    Element Should Be Visible    xpath://div[@class='select--text--1b85oDo']//span[normalize-space()='English']
    Run Keyword If    '${isEnglish}' == 'True'    Click Element    xpath://div[contains(text(),'العربية')]
    ...    ELSE    Click Element    xpath://div[contains(text(),'English')]
    Sleep    ${SleepTime}
    Click Element    xpath://div[contains(@class, 'es--saveBtn--w8EuBuy')]
    Sleep    ${SleepTime}

login
    Open Browser    https://www.aliexpress.com    chrome
    Maximize Browser Window
    Sleep    ${SleepTime}
    Run Keyword And Ignore Error    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=5s
    ${popupVisible}=    Run Keyword And Return Status    Element Should Be Visible    //div[contains(text(), "Don't allow")]
    Run Keyword If    '${popupVisible}' == 'True'    Click Element    //div[contains(text(), "Don't allow")]
    Click Element    xpath://div[contains(@class, 'my-account--text--2Yt_prE')]
    sleep    ${SleepTime}
    Click Element    xpath://span[contains(@class, 'comet-icon-chevrondown32') and contains(@class, 'my-account--centerIcon--2yqLRkj')]
    sleep    ${SleepTime}
    Wait Until Element Is Visible    //button[contains(@class, 'my-account--signin--RiPQVPB')]    timeout=30s
    Click Element    //button[contains(@class, 'my-account--signin--RiPQVPB')]
    Sleep    ${SleepTime}
    Input Text    xpath://input[contains(@class, 'cosmos-input') and contains(@class, 'cosmos-input-rtl')]    your_email@example.com
    Sleep    ${SleepTime}
    Click Element    xpath://*[@class='_1e0Ux']
    Sleep    ${SleepTime}

changeCurrency
    [Setup]    Open Browser    https://www.aliexpress.com/    chrome
    Maximize Browser Window
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Sleep    3s
    Click Element    //div[@class='ship-to--menuItem--WdBDsYl ship-to--newMenuItem--2Rw-XvE']
    Wait Until Element Is Visible    //span[contains(text(),'EGP ( الجنيه المصري )')]    timeout=10s
    Click Element    //span[contains(text(),'EGP ( الجنيه المصري )')]
    Sleep    3s
    Click Element    //div[contains(text(),'USD ( الدولار الأمريكي )')]
    Wait Until Element Is Visible    //div[@class='es--saveBtn--w8EuBuy']    timeout=10s
    Click Element    //div[@class='es--saveBtn--w8EuBuy']
    Reload Page
    Sleep    ${SleepTime}
    [Teardown]    Close Browser

zoomImg
    Open Browser    https://www.aliexpress.com    chrome
    Wait Until Element Is Visible    //div[contains(text(), "Don't allow")]    timeout=20s
    Click Element    //div[contains(text(), "Don't allow")]
    Wait Until Element Is Visible    //input[@id='search-words']    timeout=20s
    Input Text    //input[@id='search-words']    mobile phone
    Click Element    //input[@type='button' and @title='submit']
    Sleep    3s
    Click Element    //div[@class='mm_mn']
    Sleep    3s
    ${newTab}=    Get Window Handles
    Switch Window    ${newTab[1]}
    Wait Until Element Is Visible    //div[@class='image-view-v2--wrap--N4InOxs']    timeout=60s
    Click Element    //div[@class='image-view-v2--wrap--N4InOxs']
    Wait Until Element Is Visible    //div[@class='magnifier--behiver--cY4D2TR']    timeout=40s
    Sleep    5s
    Close Browser

changeDest
    Open Browser    https://www.aliexpress.com/    chrome
    Maximize Browser Window
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Sleep    3s
    Click Element    //div[@class='ship-to--menuItem--WdBDsYl ship-to--newMenuItem--2Rw-XvE']
    Wait Until Element Is Visible    //div[@class='select--text--1b85oDo']    timeout=10s
    Click Element    //div[@class='select--text--1b85oDo']
    Sleep    3s
    Click Element    //div[@class='select--item--32FADYB']
    Sleep    5s
    Wait Until Element Is Visible    //div[contains(text(),'حفظ')]    timeout=10s
    Click Element    //div[contains(text(),'حفظ')]
    Sleep    5s
    Close Browser

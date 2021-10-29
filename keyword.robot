*** Settings ***
Library    Selenium2Library
Library    BuiltIn

*** Keywords ***
Открыть сайт
    Open Browser                            http://www.begemotik-tula.ru/            chrome
    maximize browser window

Закрыть браузер
    close browser

Ждать появления элемента
    [Arguments]                             ${locator}
    Wait Until Element Is Visible           ${locator}

ЛКМ в элемент страницы
    [Arguments]                             ${locator}
    Click Element                           ${locator}

Назад
    go back

Каталог Велосипеды
    click element                       //div[@class="nav"]/ul/li[2]/a[@class="_parent"]/span[2]

Каталог Трехколесные детские велосипеды
    click element                       //div[@class="name"]/span

Каталог Велосипеды 3-х колесные без ручки
    click element                       //a[@class="cat_element elem no-margin"]//span

Нажать добавить в корзину
    click element                       //a[@id="detailBuy"]

Каталог Игрушки для девочек
    click element                       //div[@class="nav"]/ul/li[12]/a[@class="_parent"]/span[2]

Каталог Куклы
    click element                       //div[@class="elements-list"]/a[1]//span

Каталог MY LITTLE PONY
    click element                       //div[@class="elements-list"]/a[2]//span

Зайти в корзину
    click element                         //span[@id="goods"]

Поиск "Машинка"
    input text                          //div[@class="search_box"]//input[1]               машинка
    click button                       //div[@class="search_box"]//input[2]

Нажать на кнопку Оформление заказа
    click element                       //*[@id="main"]/div/div/div/div[3]/div/input

Нажать кнопку Подтвердить заказ
    click element                       //*[@id="main"]/div/div/div/div/form/div[4]/div/div/div[6]/input

Radiobutton Доставка курьером
    click element                           //*[@id="main"]/div/div/div/div[1]/form/div[2]/div[2]/div[2]/label/input

Radiobutton Оплата банковской картой при получении
    click element                           //*[@id="main"]/div/div/div/div[1]/form/div[3]/div[2]/div[2]/label/b


Проверка
# Проверяет что текст на странице есть
    [Arguments]                     ${локатор}                    ${текст_ошибки}
    ${status}	         ${value} =      Run Keyword And Ignore Error       Get Text                    ${локатор}
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${текст_ошибки}


Сhecking not text
# Проверяет что текста на странице нет
    [Arguments]                     ${локатор}                 ${текст_ошибки}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Get Text                   ${локатор}
    Run Keyword If	    '${status}' == 'PASS'           FAIL                ${текст_ошибки}

Checking for element
# Проверка что элемент существует
    [Arguments]                     ${локатор}             ${текст_ошибки}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Click Element              ${локатор}
    Run Keyword If	    '${status}' == 'FAIL'           FAIL                ${текст_ошибки}

Checking not element
# Проверка отсутствия элемента
    [Arguments]                     ${локатор}                ${текст_ошибки}
    ${status}	        ${value} =       Run Keyword And Ignore Error       Click Element               ${локатор}
    Run Keyword If	    '${status}' == 'PASS'           FAIL                ${текст_ошибки}




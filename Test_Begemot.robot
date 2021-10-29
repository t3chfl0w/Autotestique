*** Settings ***
Library             Selenium2Library
Resource            keyword.robot
Suite Setup         Открыть сайт
Suite Teardown      Закрыть браузер

*** Test Cases ***

Переход на страницу "Оплата и доставка"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы              //td[2]//span
    Проверка                            //h1[contains(text(),"Оплата и доставка")]                     FAIL Страница недоступна

Переход на страницу "Оплата картой"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы              //span/span/a[1]
    sleep                               2sec
    Проверка                            //h1[contains(text(),"Оплата картой")]                         FAIL Страница недоступна
    Назад

Переход на страницу "Договор оферты"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы               //div[@class="col-12"]//a[2]
    sleep                                2sec
    Проверка                             //h1[contains(text(),"Договор оферты")]                         FAIL Страница недоступна
    Назад

Переход на страницу "Безопасность"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы               //div[@class="col-12"]//a[3]
    sleep                                2sec
    Проверка                             //h1[contains(text(),"Безопасность")]                       FAIL Страница недоступна
    Назад

Переход на страницу "О компании"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы                //td[3]//span
    Проверка                              //h1[contains(text(),"О компании")]                                 FAIL Страница недоступна

Переход на страницу "Новости"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы                 //td[4]//span
    Проверка                               //h1[contains(text(),"Новости")]                                       FAIL Страница недоступна

Переход на страницу "Наши бренды"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы                 //td[5]//span
    Проверка                               //h1[contains(text(),"Наши бренды")]                                    FAIL Страница недоступна

Переход на страницу "Наши магазины"
    [Tags]    Pages,    suite_1
    ЛКМ в элемент страницы                //td[6]//span
    Проверка                              //h1[contains(text(),"Наши магазины")]                                 FAIL Страница недоступна

Логотип
    [Tags]    Logo,    suite_1
    ЛКМ в элемент страницы                //a[@class="logo_link"]
    Проверка                              //h1[contains(text(),"Интернет-магазин игрушек «БЕГЕМОТиК»")]                                FAIL Страница недоступна


#Сценарий 2
Добавление товара №1
    [Tags]    Add.product,    suite_2
    Каталог Велосипеды
    Каталог Трехколесные детские велосипеды
    Каталог Велосипеды 3-х колесные без ручки
    ЛКМ в элемент страницы              //div[@class="elements-list"]/div[2]/div[@class="catalog_item_title"]/a
    Нажать добавить в корзину
    #keyword.Сhecking for text          //h1[contains(text(),"Велосипеды")]                                             FAIL Страница недоступна
    sleep                               2sec
    Проверка                            //div//*[text()='1 товар']                          FAIL Товар не добавлен

Добавление товара №2
    [Tags]    Add.product,    suite_2
    Каталог Игрушки для девочек
    Каталог Куклы
    Каталог MY LITTLE PONY
    ЛКМ в элемент страницы              //div[@class="element "]/div[@class="catalog_item_title"]/a
    Нажать добавить в корзину
    sleep                               2sec
    Проверка                            //div//*[text()='2 товара']                          FAIL Товар не добавлен

Перейти в корзину
    [Tags]    Basket,    suite_2
    Зайти в корзину
    Проверка                              //h1[contains(text(),"Оформление заказа")]          FAIL Вы не перешли в корзину

Изменение количества "Товара №2"
    [Tags]    Vol.product,    suite_2
    sleep                                   3sec
    input text                              //*[@id="basketGoodsList"]/div[1]/table/tbody/tr[2]/td[3]/input         4
    sleep                                   2sec
    click element                           //body
    reload page
    Проверка                                //div//*[text()='5 товаров']                          FAIL Кол-во товара не изменилось
    sleep                                   5sec
    input text                              //*[@id="basketGoodsList"]/div[1]/table/tbody/tr[2]/td[3]/input                3
    sleep                                   2sec
    click element                           //body
    reload page
    Проверка                                 //div//*[text()='4 товара']                          FAIL Кол-во товара не изменилось

Удаление из корзины "Товара №1"
    [Tags]    Del.product,    suite_2
    click element                           //*[@id="basketGoodsList"]/div[1]/table/tbody/tr[1]/td[4]/a
    sleep                                   2sec
    reload page
    sleep                                   2sec
    Проверка                              //div//*[text()='3 товара']                          FAIL Кол-во товара не изменилось

Оформление заказа
    [Tags]    Order,    suite_2
    Radiobutton Доставка курьером
    Radiobutton Оплата банковской картой при получении
    Нажать на кнопку Оформление заказа
    Проверка                               //div//*[text()='Доставка курьером ']                                              FAIL Выбран самовывоз
    Проверка                               //div//*[text()='Оплата банковской картой при получении']                          FAIL Выбран другой вид оплаты
    input text                              //*[@id="ord_name"]                                                         Иван
    input text                              //*[@id="ord_phone"]                                                        9000000000

Подтверждение заказа
    [Tags]    Confirm.order,    suite_2
    Нажать кнопку Подтвердить заказ
    Проверка                                   //div//*[text()='Спасибо за то, что воспользовались нашим интернет магазином!']         FAIL Заказ не оформлен

#Сценарий 3

Поисковое поле
    [Tags]    Search.field,    suite_3
    Поиск "Машинка"
    Проверка                            //div//*[text()='"машинка"']                  FAIL Неверный запрос

Поиск и добавление товара
    [Tags]    Add.product,    suite_3
    ЛКМ в элемент страницы                //a[@class="logo_link"]
    Поиск "Машинка"
    Проверка                            //div//*[text()='"машинка"']                  FAIL Неверный запрос
    ЛКМ в элемент страницы              //*[@id="main"]/div/div/div/div[1]/div[2]/div/div/div[1]/div[1]/a
    sleep                               2sec
    Нажать добавить в корзину
    sleep                               2sec
    Проверка                            //div//*[text()='1 товар']                          FAIL Товар не добавлен

Переход в корзину
    [Tags]    Basket,    suite_3
    Зайти в корзину
    Проверка                              //h1[contains(text(),"Оформление заказа")]          FAIL Вы не перешли в корзину

Оформление заказа
    [Tags]    Order,    suite_2
    sleep                               2sec
    Radiobutton Доставка курьером
    Radiobutton Оплата банковской картой при получении
    Нажать на кнопку Оформление заказа
    sleep                               5sec


Изменение кол-ва товара
    [Tags]    Vol.product,    suite_3
    Зайти в корзину
    sleep                               4sec
    input text                          //*[@id="basketGoodsList"]/div[1]/table/tbody/tr/td[3]/input                    3
    sleep                               4sec
    ЛКМ в элемент страницы              //body
    sleep                               4sec
    Проверка                            //div//*[text()='3 товара']                             FAIL Кол-во товара не изменилось или корзина пуста
    Нажать на кнопку Оформление заказа
    Проверка                            //div//*[text()='3']                                    FAIL Кол-во товара не изменилось

Оформление заказа
    [Tags]    Order,    suite_3
    Radiobutton Доставка курьером
    Radiobutton Оплата банковской картой при получении
    Нажать на кнопку Оформление заказа
    Проверка                               //div//*[text()='Доставка курьером ']                                              FAIL Выбран самовывоз
    Проверка                               //div//*[text()='Оплата банковской картой при получении']                          FAIL Выбран другой вид оплаты
    input text                              //*[@id="ord_name"]                                                         Иван
    input text                              //*[@id="ord_phone"]                                                        9000000000

Подтверждение заказа
    [Tags]    Confirm.order,    suite_3
    Нажать кнопку Подтвердить заказ
    Проверка                                   //div//*[text()='Спасибо за то, что воспользовались нашим интернет магазином!']         FAIL Заказ не оформлен
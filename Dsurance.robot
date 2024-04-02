*** Settings ***
Library           SeleniumLibrary
Library           ExcelRobot
Library           String
Library           Collections

*** Variables ***
${url}            https://webtest.s-sofin.com/lifefront?x=BhVicWtxOqxZRflXy/55/f/7Pf1kUum8k6DRyKJQk/JkNjUQEIObIqMBlNdnT3MN/Uu
${imgFile}        C:/Users/sittipatc/MY_IDCARD.jpg
${me_card}        C:/Users/sittipatc/ME_CARD.jpg
${PolicyType}     ${EMPTY}
${urlshp}         http://automationpractice.com/index.php
${Name}           ${EMPTY}
${Surname}        ${EMPTY}
${email}          ${EMPTY}
${Password}       ${EMPTY}

*** Test Cases ***
Dasving
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    sleep    2s
    Run Keyword And Ignore Error    Click Element    //*[@id="cookieConsent"]/div/div/div[2]/span
    sleep    2s
    Click Element    //img[@data-type="plan-tax"]    \    # Click DSaving
    Click Element    //img[@data-type="tax-1-10/1new"]    \    # Click 10/1
    Sleep    7s
    Run Keyword And Ignore Error    Click Element    //*[@id="cookie"]/div/div[2]/center/button/span
    sleep    5s
    Run Keyword And Ignore Error    Scroll Element Into View    //h3[text()=" รายละเอียดเพิ่มเติม "]    # Scroll down to view gender
    sleep    2s
    Click Element    //*[@id="male"]/img    \    # Click Gender
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="app"]/div[1]/div[3]/div[6]/div[1]/h3    # Scroll down to view birthdate
    Click Element    //*[@id="input-12"]    \    # Click Birthdate
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="policyfaqbtn"]
    sleep    2s
    Click Element    //*[@id="app"]/div[3]/div/div/div/ul/li[45]    \    # Select Year
    sleep    2s
    Click Element    //*[@id="app"]/div[3]/div/div/div/div[2]/table/tbody/tr[1]/td[1]/button/div    \    # Select Month
    sleep    2s
    Click Element    //*[@id="app"]/div[3]/div/div/div/div[2]/table/tbody/tr[4]/td[6]/button/div    \    # Select Date
    sleep    2s
    Click Button    //*[@id="app"]/div[1]/div[3]/div[5]/div/div/center/button    \    #Click Next
    sleep    2s
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="app"]/div[1]/div[3]/div[8]/div[1]/h3
    sleep    2s
    Click element    //*[@id="app"]/div[1]/div[3]/div[7]/div[3]/div/center/button    \    # Click buy online policy
    Wait Until Element Is Visible    //*[@id="app"]/div[4]/div/div/div/div/center/div/div[2]/button/span
    sleep    2s
    Click Element    //*[@id="app"]/div[4]/div/div/div/div/center/div/div[2]/button/span    \    # Click Next
    sleep    2s
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[3]/div[1]/form/center/button
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[1]/form/center/button    \    # Click Accept
    sleep    2s
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="cookie"]/div/div[2]/center/button/span
    sleep    2s
    Click element    //*[@id="selectFileBtn"]    \    # Click eKYC
    sleep    2s
    Wait Until Element Is Visible    //*[@id="selectGalleryBtn"]
    sleep    2s
    Choose File    //input[@id="face"]    ${imgFile}
    sleep    2s
    Press Keys    \    PAGE_DOWN
    sleep    2s
    Click Element    //*[@id="submitIdCardBtn"]    \    # Click Submit button
    sleep    5s
    Click Element    //div[@class="v-input__icon v-input__icon--append"]    \    # Select title
    Click Element    //*[text()="นาย"]    \    # Mr
    Input Text    //*[@id="input-185"]    สิทธิพัฒน์
    Input Text    //*[@id="input-188"]    จำนงศิลป
    Input text    //*[@id="input-194"]    JT3104939056
    Input Text    //*[@id="input-200"]    0802778384
    Input Text    //*[@id="input-203"]    sittipat@gmail.com
    Press Keys    \    PAGE_DOWN
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[2]/form/center/button
    sleep    3s
    Press Keys    \    PAGE_DOWN
    Click Element    //*[@id="app"]/div[1]/div[3]/div[2]/div/button
    sleep    4s
    Click Element    //*[@id="selectGalleryBtn"]
    Choose File    //input[@id="face"]    ${me_card}
    sleep    2s
    Press Keys    \    PAGE_DOWN
    sleep    2s
    Click Element    //*[@id="submitIdCardBtn"]
    sleep    2s
    Comment    Press Keys    \    PAGE_DOWN
    Comment    Press Keys    \    PAGE_DOWN
    sleep    4s
    Run Keyword And Ignore Error    Scroll Element Into View    //span[text()=" ทำการกรอกข้อมูลสุขภาพ "]
    sleep    2s

Dsaving 10/1
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    sleep    2s
    Run Keyword And Ignore Error    Click Element    //*[@id="cookieConsent"]/div/div/div[2]/span
    sleep    2s
    Click Element    //img[@data-type="plan-tax"]
    Click Element    //img[@data-type="tax-1-10/1"]
    Sleep    7s
    Wait Until Element Is Visible    //*[@id="modal-view-letgo"]/span
    Click Element    //*[@id="modal-view-letgo"]/span
    sleep    2s
    Click Element    //*[@id="sec-sex"]/div/div/div/div[1]/img
    sleep    2s
    Select From List By Value    //*[@id="day"]    27
    sleep    2s

SEG-UAT
    Open Browser    http://uat:tyK3EZ@selic.icwdc.com/    Chrome
    Maximize Browser Window
    sleep    5s
    Run Keyword And Ignore Error    Click element    //*[@id="page"]/div[2]/div/div/div[2]/a    # Ignore cokie
    sleep    2s
    Click Element    //*[@id="page"]/header/div[2]/div/div/ul/li[1]/a    # Click All Policy Menu
    sleep    2s
    Click Element    //*[@id="page"]/main/section[3]/div/div/div/div[2]/div[2]/a    # Click Appointment
    sleep    2s
    ${windows}    Get Window Titles    # Variable get titles
    Switch Window    ${windows}[1]    # Switch Windows
    Log To Console    ${windows}[1]    # Display Log
    sleep    2s
    Click Element    //*[@id="mxui_widget_ReferenceSelector_2_input"]/option[3]    # Select Policy
    sleep    2s
    Input Text    //*[@id="mxui_widget_TextInput_1"]    สมพร    # Fill Name
    Input Text    //*[@id="mxui_widget_TextInput_2"]    คงควรคอย    # Fill Surname
    Click element    //*[@id="mxui_widget_EnumSelect_0"]/option[3]    \    # Select gender
    Input Text    //*[@id="mxui_widget_TextInput_3"]    0950821954    # Fill Telephone number
    Select From List By Label    //label[text()="จังหวัด"]/../div//div//select    สมุทรปราการ    # Select Province
    sleep    2s
    Select From List By Label    //label[text()="เขต/อำเภอ"]/..//div//div//select    บางพลี    # Select District
    sleep    2s
    Click Element    //button[text()="ถัดไป"]    \    # Click appoint button
    sleep    2s
    Click Element    //*[@id="mxui_widget_Wrapper_17"]    \    # Back to main page

Verify data
    Open Excel    C://Users//sittipatc//Documents//Customer.xlsx
    ${First_Name}    Read Cell Data    Input    3    1
    ${Last_Name}    Read Cell Data    Input    4    1
    ${GetFirstName}    Set Variable    นงนุช
    ${GetLastName}    Set Variable    อาจหาญ
    # @{Status}    Create List
    Run Keyword If    "${First_Name}" == "${GetFirstName}" and "${Last_Name}" == "${GetLastName}"    Set Suite Variable    ${Status}    Pass
    ...    ELSE    Set Suite Variable    ${Status}    Fail
    Run Keyword If    "${Status}" == "Pass"    Set Suite Variable    ${Message}    Profile is correct
    ...    ELSE    Set Suite Variable    ${Message}    Profile is incorrect
    Open Excel To Write    C://Users//sittipatc//Documents//Customer.xlsx
    Write To Cell By Name    Output    A2    ${Status}
    Write To Cell By Name    Output    B2    ${Message}
    Save Excel

Registration e-Shopping
    [Template]
    Open Browser    ${urlshp}    Chrome    # Registration
    Maximize Browser Window
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a    \    # Click Authorization
    Open Excel    C://Users//sittipatc//Documents//eShopping.xlsx
    ${email}    Read Cell Data    Input    0    1
    ${customer_name}    Read Cell Data    Input    1    1
    ${customer_surname}    Read Cell Data    Input    2    1
    ${Password}    Read Cell Data    Input    3    1
    ${Date}    Read Cell Data    Input    4    1
    ${Month}    Read Cell Data    Input    5    1
    ${Year}    Read Cell Data    Input    6    1
    ${Address}    Read Cell Data    Input    7    1
    ${City}    Read Cell Data    Input    8    1
    ${State}    Read Cell Data    Input    9    1
    ${Zip}    Read Cell Data    Input    10    1
    ${Mobile}    Read Cell Data    Input    11    1
    ${Alias}    Read Cell Data    Input    12    1
    sleep    2s
    Input Text    //*[@id="email_create"]    ${email}
    Click Element    //*[@id="SubmitCreate"]/span
    sleep    4s
    Select Radio Button    id_gender    id_gender1
    Input text    //*[@id="customer_firstname"]    ${customer_name}
    Input text    //*[@id="customer_lastname"]    ${customer_surname}
    Input Password    //*[@id="passwd"]    ${Password}
    Select From List By Value    //*[@id="days"]    ${Date}
    Select From List By Value    //*[@id="months"]    ${Month}
    Select From List By Value    //*[@id="years"]    ${Year}
    Select Checkbox    //*[@id="newsletter"]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="account-creation_form"]/div[2]/p[8]/label
    Input text    //*[@id="address1"]    ${Address}
    input text    //*[@id="city"]    ${City}
    Select From List By Value    //*[@id="id_state"]    ${State}
    input text    //*[@id="postcode"]    ${Zip}
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="submitAccount"]/span
    Input Text    //*[@id="phone_mobile"]    ${Mobile}
    Input Text    //*[@id="alias"]    ${Alias}
    Click Element    //*[@id="submitAccount"]/span

Login
    Open Browser    ${urlshp}    Chrome    # Registration
    Maximize Browser Window
    Open Excel    C://Users//sittipatc//Documents//eShopping.xlsx
    ${email}    Read Cell Data    Input    0    1
    ${Password}    Read Cell Data    Input    3    1
    ${customername}    Read Cell Data    Input    1    1
    ${customesurrname}    Read Cell Data    Input    2    1
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Sleep    2s
    Input Text    //*[@id="email"]    ${email}
    Input Text    //*[@id="passwd"]    ${Password}
    Click Element    //*[@id="SubmitLogin"]/span
    ${Name}    Get Text    //*[@id="header"]/div[2]/div/div/nav/div[1]/a/span    # Login
    ${Name1}    Split String    ${Name}    ${SPACE}
    Log to console    ${Name1}[0]
    Log to console    ${Name1}[1]
    Set Suite Variable    ${Firstname}    ${Name1}[0]
    Set Suite Variable    ${LastName}    ${Name1}[1]
    run keyword if    "${customername}" == "${FirstName}" and "${customesurrname}" == "${LastName}"    Set Suite Variable    ${Status}    PASS
    ...    ELSE    Set Suite Variable    ${Status}    FAIL
    run keyword if    "${Status}" == "PASS"    Set Suite Variable    ${Message}    Profile is correct
    ...    ELSE    Set Suite Variable    ${Message}    Profile is incorrect
    Open Excel To Write    C://Users//sittipatc//Documents//eShopping.xlsx
    Write To Cell By Name    Output    A2    ${Status}
    Write To Cell By Name    Output    B2    ${Message}
    Save Excel

Excel
    ${AllListData}    GetData
    ${Count}    Get Length    ${AllListData}
    FOR    ${i}    IN RANGE    0    ${Count}
        Set Suite Variable    ${First}    ${AllListData}[${i}][0]
        Set Suite Variable    ${Last}    ${AllListData}[${i}][1]
        Write_to_cell    ${i}
    END

Anymine -TC1
    [Documentation]    Chek whether User name is Blank (Negative test case)
    open browser    https://anylogi-recruitment.web.app/login    Chrome
    Maximize Browser Window
    ${Password}    Set variable    //input[@type="password"]
    ${UserNotBlank}    Set variable    User name cannot be blank
    input text    //div[text()="Username:"]//input    ${Empty}
    ${Username}    get text    //div[text()="Username:"]//input
    input text    ${Password}    Bolton123
    Click Element    //*[@id="root"]/div/div/div/div/button[1]
    run keyword if    "${Username}" == ""    set suite variable    ${Status}    Pass
    ...    ELSE    set suite variable    ${Status}     Fail
    run keyword if    "${Status}" == "Pass"    set suite variable    ${Message}    ${UserNotBlank}
    ...    ELSE    set suite variable    ${Message}    User name is valid
    Open Excel To Write    C://Users//sittipatc//Downloads//AnyMine//Anymind.xlsx
    Write To Cell By Name    Output    A2    ${Status}
    Write To Cell By Name    Output    B2    ${Message}
    Save Excel

Anymine -TC2
    [Documentation]    Chek whether User name is Blank (Negative test case)
    open browser    https://anylogi-recruitment.web.app/login    Chrome
    Maximize Browser Window
    ${Password}    Set variable    //input[@type="password"]
    ${UserNotBlank}    Set variable    User name cannot contain whitespaces
    input text    //div[text()="Username:"]//input    ${Space}
    ${Username}    get text    //div[text()="Username:"]//input
    input text    ${Password}    Bolton123
    Click Element    //*[@id="root"]/div/div/div/div/button[1]
    run keyword if    "${Username}" == " "    set suite variable    ${Status}    Pass
    ...    ELSE    set suite variable    ${Status}     Fail
    run keyword if    "${Status}" == "Pass"    set suite variable    ${Message}    ${UserNotBlank}
    ...    ELSE    set suite variable    ${Message}    User name is valid
    Open Excel To Write    C://Users//sittipatc//Downloads//AnyMine//Anymind.xlsx
    Write To Cell By Name    Output    A2    ${Status}
    Write To Cell By Name    Output    B2    ${Message}
    Save Excel

Anymine -TC3
    [Documentation]    Check whether Password less than 8 Character (Negative test case)
    open browser    https://anylogi-recruitment.web.app/login    Chrome
    Maximize Browser Window
    sleep    5s
    #${Password}    set variable    //input[@type="password"]
    input text    //div[text()="Username:"]//input    Fox
    input text    //input[@type="password"]    Bertyuit
    sleep    2s
    Click Element    //button[text()="SIGNUP"]
    ${statuspwd}    ${erorpwd}    Run Keyword And Ignore Error    Wait Until Element Contains    //input[@type="password"]/..//span    10s
    ${PWless}    run keyword if     "${statuspwd}" == "PASS"    get text    //input[@type="password"]/..//span
    run keyword if    "len(${Password})" < 8    set suite variable    ${Status}    Pass
    ...    ELSE    set suite variable    ${Status}    Fail
    run keyword if    "$(Status)" == Pass    Pass    set suite variable    ${Message}    &{PWless}
    ...    ELSE    ${Message}    Password is valid
    Open Excel    C://Users//sittipatc//Downloads//AnyMine//Anymind.xlsx
    Write To Cell By Name    Output    A4    ${Status}
    Write To Cell By Name    Output    B4    ${Message}
    Save Excel

Anymine -TC4
    [Documentation]    Check whether Password More than 8 Character (Negative test case)
    open browser    https://anylogi-recruitment.web.app/login    Chrome
    Maximize Browser Window
    sleep    2s
    ${Password}    set variable    //input[@type="password"]
    &{PWless}    set variable    Password cannot be less than 8 characters
    run keyword if    "len(${Password})" > 32    set suite variable    ${Status}    Pass
    ...    ELSE    set suite variable    ${Status}    Fail
    run keyword if    "&(Status)" == Pass    Pass    set suite variable    ${Message}    &{PWless}
    ...    ELSE    ${Message}    Password is valid
    Open Excel    C://Users//sittipatc//Downloads//AnyMine//Anymind.xlsx
    Write To Cell By Name    Output    A4    ${Status}
    Write To Cell By Name    Output    B4    ${Message}
    Save Excel

*** Keywords ***
GetData
    Open Excel    C://Users//sittipatc//Documents//Customer.xlsx
    ${Countcolumn}    Get Column Count    Input
    ${Countrow}    Get Row Count    Input
    @{AllListData}    Create List
    FOR    ${row}    IN RANGE    1    ${Countrow}
        ${DataAllcolumn}    ReadCell    ${Countcolumn}    ${row}
        Append To List    ${AllListData}    ${DataAllcolumn}
    END
    Log To Console    ${AllListData}
    [Return]    ${AllListData}

ReadCell
    [Arguments]    ${Countcolumn}    ${row}
    ${ListData}    Create List
    FOR    ${column}    IN RANGE    0    ${Countcolumn}
        ${Data}    Read Cell Data    Input    ${column}    ${row}
        Append To List    ${ListData}    ${Data}
    END
    [Return]    ${ListData}

Write_to_cell
    [Arguments]    ${i}
    Open Excel To Write    C://Users//sittipatc//Documents//Customer.xlsx
    Write To Cell By Name    Output    A${${i}+1}    ${First}    TEXT
    Write To Cell By Name    Output    B${${i}+1}    ${Last}    TEXT
    Save Excel

*** Settings ***
Library           C:/Users/boonchaip/AppData/Roaming/Python/Python37/site-packages/SeleniumLibrary
Resource          SETTINGS/AllResource.robot

*** Variables ***
${url}            https://seic-agentportal-uat.tbn.co.th/
${browser}        chrome
${text}           xpath=//*[@id="191.MasterData.Login.loginIdTextBox1"]
${search}         xpath=//*[@id="mxui_widget_LoginButton_0"]
${url1}           https://webtest.s-sofin.com/lifefront?x=BhVicWtxOqxZRflXy/55/f/7Pf1kUum8k6DRyKJQk/JkNjUQEIObIqMBlNdnT3MN/Uu    # D-Surrance

*** Test Cases ***
TestCase1
    open browser    ${url}    ${browser}
    Comment    sleep    3s
    wait until element is visible    ${text}
    Maximize Browser Window
    input_text    ${text}    S00041
    input_text    //h4[text()="Password"]/../input    P@ssw0rd
    click element    ${search}
    sleep    4s
    Comment    click element    //*[@id="mxui_widget_DataView_3"]/div[2]/div/button
    Click Element    //*[@id="mxui_widget_VerticalScrollContainer_0"]/div[2]/div/div/div[3]/div/div[1]/div[2]/div
    sleep    4s
    Click Element    //*[@id="mxui_widget_DataView_3"]/div/div/div[2]/img
    Comment    wait until element is visible    //*[@id="mxui_widget_VerticalScrollContainer_0"]/div[2]/div/div/div[3]/div/div[2]/div[1]/div
    Comment    click element    //*[@id="mxui_widget_VerticalScrollContainer_0"]/div[2]/div/div/div[3]/div/div[2]/div[1]/div
    Comment    Comment    sleep    3s
    Comment    wait until element is visible    //*[@id="mxui_widget_SearchInput_8"]/div[2]/input
    Comment    input_text    //*[@id="mxui_widget_SearchInput_8"]/div[2]/input    chaipingp@gmail.com
    Comment    input_text    //*[@id="mxui_widget_SearchInput_6"]/div[2]/input    บุญชัย พิงพิทยากุล
    Comment    input text    //*[@id="mxui_widget_SearchInput_7"]/div[2]/input    0814818641
    Comment    Click Element    //*[@id="mxui_widget_SearchInput_0"]/div[2]/select
    Comment    Click Element    //option[text()="สมบูรณ์"]
    Comment    input text    //*[@id="mxui_widget_SearchInput_3"]/div[2]/input    33232
    Comment    Click Element    //option[text()="Motor Add On"]
    Comment    input text    //*[@id="mxui_widget_DatePicker_0_input"]    22/02/2022
    Comment    input text    //*[@id="mxui_widget_DatePicker_1_input"]    21/02/2023
    Comment    Click Element    //option[text()="Best Deal 2"]
    Comment    Click Element    //option[text()="อนุมัติ"]
    Comment    Click Element    //option[text()="ชำระเงินแล้ว"]
    Comment    Click Element    //option[text()="วงเงินเครดิตตัวแทน"]
    Comment    Click Element    //option[text()="ใหม่"]

TestCase_DSurSuperSaving
    open browser    ${url1}    ${browser}
    sleep    2s
    click element    //*[@id="cookieConsent"]/div/div/div[2]/span
    Run Keyword And Ignore Error    wait until element is visible    //*[@id="modal-ads"]/div/div/div/div[3]/button
    sleep    1s
    Run Keyword And Ignore Error    click Element    //*[@id="modal-ads"]/div/div/div/div[3]/button
    sleep    2s
    click Element    //*[@id="group-plan-core"]/ul/li/div[1]/div[1]/img
    sleep    1s
    click Element    //*[@id="group-package-core-tax"]/div/div/div/div[1]/img
    Comment    sleep    5s
    Run Keyword And Ignore Error    wait until element is visible    //*[@id="cookie"]/div/div[2]/center/button
    Click Element    //*[@id="cookie"]/div/div[2]/center/button
    Comment    sleep    3s
    Comment    Scroll Element Into View    //*[@id="male"]/h3/../img
    Maximize Browser Window
    Run Keyword And Ignore Error    Scroll Element Into View    //h3[text()=" รายละเอียดเพิ่มเติม "]
    sleep    2s
    Click Element    //*[@id="male"]/img
    Run Keyword And Ignore Error    Scroll Element Into View    //h3[text()=" รายละเอียดเพิ่มเติม "]
    sleep    1s
    Click Element    //*[@placeholder="เลือกวัน/เดือน/ปีเกิด"]
    sleep    1s
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="app"]/div[3]/div/div/div/ul/li[30]
    sleep    1s
    Click Element    //*[@id="app"]/div[3]/div/div/div/ul/li[28]
    sleep    1s
    Click Element    //*[@id="app"]/div[3]/div/div/div/div[2]/table/tbody/tr[3]/td[3]
    sleep    1s
    Click Element    //*[@id="app"]/div[3]/div/div/div/div[2]/table/tbody/tr[2]/td[4]/button/div
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[5]/div/div/center/button
    sleep    2s
    press keys    //*[@id="suminsuredtxt"]    END
    press Keys    //*[@id="suminsuredtxt"]    BACKSPACE
    press keys    //*[@id="suminsuredtxt"]    BACKSPACE
    press Keys    //*[@id="suminsuredtxt"]    BACKSPACE
    press Keys    //*[@id="suminsuredtxt"]    BACKSPACE
    press Keys    //*[@id="suminsuredtxt"]    BACKSPACE
    input Text    //*[@id="suminsuredtxt"]    60000
    Run Keyword And Ignore Error    Scroll Element Into View    //h3[text()=" รายละเอียดเพิ่มเติม "]
    sleep    1s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[7]/div[3]/div/center/button
    Wait Until Element Is Visible    //*[@id="app"]/div[4]/div/div/div/div/center/div/div[2]/button
    Click Element    //*[@id="app"]/div[4]/div/div/div/div/center/div/div[2]/button
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[3]/div[2]/form/div[1]/div[1]/div/div/div[1]/div[1]/div[1]
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[2]/form/div[1]/div[1]/div/div/div[1]/div[1]/div[1]
    sleep    1s
    Click Element    //*[@id="list-item-197-0"]/div/div
    input Text    //*[@id="input-151"]    บุญชัย
    input Text    //*[@id="input-154"]    พิงพิทยากุล
    input Text    //*[@id="input-157"]    3959800094161
    input Text    //*[@id="input-163"]    0814818641
    input Text    //*[@id="input-166"]    chaipingp@gmail.com
    Comment    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="app"]/div[1]/div[3]/div[2]/form/center/button
    press keys    \    PAGE_DOWN
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[2]/form/center/button
    Wait Until Element Is Visible    //*[@id="height"]
    input Text    //*[@id="height"]    167
    input Text    //*[@id="weight"]    59
    Run Keyword And Ignore Error    Scroll Element into View    //*[@id="app"]/div[1]/div[3]/div[4]/h3
    comment    เลือกที่ไม่ใช่สหรัฐคือ 1
    sleep    2s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[1]/div/div/div/div[3]/div/center/button[2]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[1]/div/div/div/div[3]/div/center/button[1]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[2]/div/button[2]
    sleep    1s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[2]/div/div/div/div[3]/div/div/div[1]/div/div[1]/label
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[2]/div/button[3]
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[3]/div/div/div/div[3]/div/center/button[1]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[3]/div/div/div/div[3]/div/center/button[2]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[3]/div/div/div/div[3]/div/center/button[1]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[2]/div/button[4]
    Wait Until Element Is Visible    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[4]/div/div/div/div[3]/div/center/button[1]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[4]/div/div/div/div[3]/div/center/button[2]
    Click Element    //*[@id="app"]/div[1]/div[3]/div[3]/div/div/div[1]/div[4]/div/div/div/div[3]/div/center/button[1]
    press keys    \    PAGE_DOWN
    sleep    1s
    Click Element    //*[@id="app"]/div[1]/div[3]/div[4]/center/button
    Comment    Wait Until Element Is Visible    //*[@id="app"]/div[3]/div/div/div/div/center/div/div[1]/button
    Comment    Click Element    //*[@id="app"]/div[3]/div/div/div/div/center/div/div[1]/button
    Sleep    5s
    Click Element    //*[@id="input-276"]
    Click Element    //*[@id="list-276"]/div[4]
    Click Element    //*[@id="form"]/div[2]/div/div[2]/div/div/div/div[1]/div[1]/div[1]
    Click Element    //*[@id="list-item-402-2"]/div/div
    input Text    //*[@id="input-286"]    10250
    Click Element    //*[@id="app"]/div[6]/div/div/div/div/div[2]/div/div[4]
    input Text    //*[@id="input-304"]    35/45
    input Text    //*[@id="input-307"]    เลควิวพาร์ค
    input Text    //*[@id="input-316"]    กาญจนาภิเษก
    press keys    \    PAGE_DOWN
    sleep    1s
    Click Element    //*[@id="form"]/div[3]/center/button
    press keys    \    PAGE_DOWN
    sleep    1s
    Click Element    //*[@id="form2"]/div/div/div[2]/div[1]/div/div/div[1]/div/div[2]/div/div
    Click Element    //*[@id="form2"]/div/div/center/button
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="form3"]/div[2]/div/div[1]/div/h3
    sleep    2s
    press keys    //*[@id="input-328"]    END
    press Keys    //*[@id="input-328"]    BACKSPACE
    press Keys    //*[@id="input-328"]    BACKSPACE
    press Keys    //*[@id="input-328"]    BACKSPACE
    input Text    //*[@id="input-328"]    50
    Click Element    //*[@id="form3"]/div[1]/div/div[2]/div[2]/div/div/div[1]/div[1]/div[1]
    sleep    1s
    Click Element    //*[@id="list-item-519-3"]
    input Text    //*[@id="input-336"]    ณัฐกมล
    input Text    //*[@id="input-339"]    พิงพิทยากุล
    input Text    //*[@id="input-342"]    18
    Click Element    //*[@id="form3"]/div[1]/div/div[2]/div[6]/div/div/div[1]/div[1]/div[1]
    sleep    1s
    Click Element    //*[@id="list-item-528-2"]
    press keys    \    PAGE_DOWN
    sleep    1s
    Click Element    //*[@id="form3"]/div[2]/div/div[2]/div/div/center/button[1]
    Click Element    //*[@id="form3"]/div[2]/div/center/button

TestCase_DSurSaving101
    Set Suite Variable    ${InputSheetName}    Data test Dsaving 10|1
    Set Suite Variable    ${TEST_DATA}    TEST_DATA/DSurance/Automated_Dsurance_Test_Case.xlsx
    @{AllListData}    [ER] Get Data All Row For Excel    ${TEST_DATA}    ${InputSheetName}
    ${countAllListData}    Get Length    ${AllListData}
    Log to Console    CountAllListData --> ${countAllListData}
    Set Suite Variable    ${AllListData}
    open browser    ${url1}    ${browser}
    sleep    2s
    click element    //*[@id="cookieConsent"]/div/div/div[2]/span
    Run Keyword And Ignore Error    wait until element is visible    //*[@id="modal-ads"]/div/div/div/div[3]/button
    sleep    1s
    Run Keyword And Ignore Error    click Element    //*[@id="modal-ads"]/div/div/div/div[3]/button
    sleep    2s
    click Element    //*[@id="group-plan-core"]/ul/li/div[1]/div[1]/img
    sleep    1s
    click Element    //*[@id="group-package-core-tax"]/div/div/div/div[2]/img
    wait until element is visible    //*[@id="modal-view-letgo"]
    Click Element    //*[@id="modal-view-letgo"]
    Comment    Run Keyword And Ignore Error    wait until element is visible    //*[@id="cookie"]/div/div[2]/center/button
    Comment    Click Element    //*[@id="cookie"]/div/div[2]/center/button
    Comment    sleep    3s
    Comment    Scroll Element Into View    //*[@id="male"]/h3/../img
    Maximize Browser Window
    Comment    Run Keyword And Ignore Error    Scroll Element Into View    //h3[text()=" รายละเอียดเพิ่มเติม "]
    sleep    1s
    Click Element    //*[@id="sec-sex"]/div/div/div/div[2]/img
    Click Element    //*[@id="day"]/option[text()="12"]
    click Element    //*[@id="month"]/option[8]
    Click Element    //*[@id="year"]/option[text()="2534"]
    Click Element    //*[@id="btn-confirm-dob"]
    sleep    1s
    wait until element is visible    //*[@id="suminsured"]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="sec-cover-tax-pension"]/h1
    sleep    1s
    input Text    //*[@id="suminsured"]    60000
    Click Element    //*[@id="suminsured1"]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="nextstepmodal"]
    sleep    1s
    Click Element    //*[@id="nextstepmodal"]
    sleep    1s
    wait until Element is Visible    //*[@id="nextstep"]
    Click Element    //*[@id="nextstep"]
    sleep    1s
    wait until Element is Visible    //*[@id="aggreeall"]
    Click Element    //*[@id="aggreeall"]
    Click Element    //*[@id="aggreePDPA"]
    sleep    1s
    Click Element    //*[@id="sendAnswer"]
    sleep    1s
    Click Element    //*[@id="nextstepmodal"]
    wait Until Element is Visible    //*[@id="nextstep"]
    Click Element    //*[@id="nextstep"]
    wait until Element is visible    //select[@class="sel prefix-title prefix-info"]/option[text()="นาง"]
    Click Element    //select[@class="sel prefix-title prefix-info"]/option[text()="นาง"]
    input Text    //*[@id="fname"]    สมศรี
    input Text    //*[@id="lname"]    สมควร
    input Text    //*[@id="cid"]    3959800094161
    input Text    //*[@id="tel"]    0814818641
    input Text    //*[@id="email"]    chaipingp@gmail.com
    Click Element    //*[@id="btn-confirm-policy"]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="sec-tw"]/div/div/h1
    sleep    1s
    input Text    //*[@id="address"]    334/33
    input Text    //*[@id="addressroad"]    กาญจนาภิเษก
    Click Element    //select[@class="sel "]/option[text()="ชัยนาท"]
    sleep    1s
    Click Element    //select[@class="sel "]/option[text()="หันคา"]
    sleep    1s
    Click Element    //select[@class="sel "]/option[text()="ห้วยงู"]
    Click Element    //*[@id="btn-confirm-policy2"]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="sec-occ"]/div/div/h1
    input Text    //*[@id="p-tall"]    160
    input Text    //*[@id="p-weight"]    48
    click Element    //*[@id="btn-confirm-height-weight"]
    Click Element    //select[@id="occupation"]/option[text()="เจ้าของกิจการทั่วไป"]
    Click Element    //*[@id="sec-status"]/div/div/div[1]/div[1]/figure/img
    Click Element    //*[@id="blog-beneficiary-new"]/div[2]/span[1]
    Click Element    //select[@id="b_new_prefix_1"]/option[text()="นาย"]
    input Text    //*[@id="b_new_fname_1"]    สมควร
    input Text    //*[@id="b_new_lname_1"]    สมหวัง
    input Text    //*[@id="b_new_age_1"]    70
    Click Element    //select[@id="b_new_relation_new_1"]/option[text()="บิดา"]
    Click Element    //*[@id="confirm-ben-new"]
    sleep    1s
    Click Element    //*[@id="sec-choise"]/div/div/div/ul/li[1]/div[3]
    Click Element    //*[@id="rd-check"]/div[1]
    Click Element    //*[@id="nextstepmodal"]
    wait until Element is Visible    //*[@id="nextstep"]
    Click Element    //*[@id="nextstep"]
    wait until Element is Visible    //*[@id="group-payment"]/ul/li/div[2]
    Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="group-payment"]/ul/li/div[2]
    Click Element    //*[@id="group-payment"]/ul/li/div[2]
    sleep    1s
    Click Element    //*[@id="group-payment-channel"]/ul/li[2]
    wait until Element is Visible    //*[@id="modal-payment-credit-channel"]/div/div/div/div[2]/div/ul/li/div[1]
    Click Element    //*[@id="modal-payment-credit-channel"]/div/div/div/div[2]/div/ul/li/div[1]
    wait until Element is Visible    //*[@id="t1-opt-btn-text"]
    Click Element    //*[@id="t1-opt-btn-text"]
    wait until Element is Visible    //*[@id="otp1"]
    sleep    2s
    input Text    //*[@id="otp1"]    1
    input Text    //*[@id="otp2"]    2
    input Text    //*[@id="otp3"]    3
    input Text    //*[@id="otp4"]    4
    input Text    //*[@id="otp5"]    5
    input Text    //*[@id="otp6"]    6
    Click Element    //*[@id="check-otp"]

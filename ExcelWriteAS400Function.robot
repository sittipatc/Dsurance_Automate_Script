*** Settings ***
Resource          ../../SETTINGS/StandardLibrary.robot
Resource          ../../SETTINGS/AllResource.robot

*** Keywords ***
[EW] Write Cell AS400 Clear Rows Data To Excel
    [Arguments]    ${SheetName}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AS400 Clear Rows Data # --> ${TEST_DATA}
    ${CountColumn}    ${CountRow}    [ER] Open Excel    ${TEST_DATA}    ${SheetName}
    Log to Console    CountColumn --> ${CountColumn}
    Log to Console    CountRow --> ${CountRow}
    Open Excel To Write    ${TEST_DATA}
    FOR    ${i}    IN RANGE    1    ${${CountRow} + 1}
        [EW] Write Cell AS400 Clear Columns Data To Excel    ${SheetName}    ${i}    ${CountColumn}
    END
    Save Excel
    Set Suite Variable    ${RUNNING_STEP}    1

[EW] Write Cell AS400 Clear Columns Data To Excel
    [Arguments]    ${SheetName}    ${Row}    ${CountColumn}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AS400 Clear Columns Data # --> ${TEST_DATA} ${SheetName} ${Row}
    FOR    ${i}    IN RANGE    0    ${CountColumn}
        Log To Console    Get Data & Clear [${Row}][${i}]
        Write To Cell    ${SheetName}    ${i}    ${Row}    ${EMPTY}
    END

[EW] Write Cell AS400 QueryPolicy To Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AS400 QueryPolicy # --> ${TEST_DATA}
    Open Excel To Write    ${TEST_DATA}
    Write To Cell By Name    ${SheetName}    A${${Row}+1}    ${TCNumber_INPUT}
    Write To Cell By Name    ${SheetName}    B${${Row}+1}    ${TestCaseType_INPUT}
    Write To Cell By Name    ${SheetName}    C${${Row}+1}    ${Remark_INPUT}
    Write To Cell By Name    ${SheetName}    D${${Row}+1}    ${TS_STATUS}
    Write To Cell By Name    ${SheetName}    E${${Row}+1}    ${TS_MESSAGE}
    Write To Cell By Name    ${SheetName}    F${${Row}+1}    ${START_TIME}
    END TRANSACTION TIME
    Run Keyword If    "${START_TIME}" != ""    Write To Cell By Name    ${SheetName}    G${${Row}+1}    ${END_TIME}
    Write To Cell By Name    ${SheetName}    H${${Row}+1}    ${CAPTURE_SCREEN_SHOT}
    Write To Cell By Name    ${SheetName}    I${${Row}+1}    ${App_Version}
    Comment    Write To Cell By Name    ${SheetName}    H${${Row}+1}    ${Username}
    Comment    Write To Cell By Name    ${SheetName}    I${${Row}+1}    ${Password}
    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${PolicyNumber}
    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${GrossPremium}
    Write To Cell By Name    ${SheetName}    L${${Row}+1}    ${StampDuty}
    Write To Cell By Name    ${SheetName}    M${${Row}+1}    ${VAT}
    Write To Cell By Name    ${SheetName}    N${${Row}+1}    ${PremiumDue}
    Save Excel
    Set Suite Variable    ${AddRow}    ${${AddRow} + 1}
    Set Suite Variable    ${START_TIME}    ${EMPTY}
    Set Suite Variable    ${END_TIME}    ${EMPTY}

[EW] Write Cell AS400 INPUT PolicyTo Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AgentPortal NonMotor Input Policy # --> ${TEST_DATA}
    Open Excel To Write    ${TEST_DATA}
    Write To Cell By Name    ${SheetName}    I${${Row}+1}    ${Policy_OUTPUT}    TEXT
    Save Excel

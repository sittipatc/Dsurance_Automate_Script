*** Settings ***
Resource          ../../SETTINGS/StandardLibrary.robot
Resource          ../../SETTINGS/AllResource.robot

*** Keywords ***
[ER] Get Data Row For Excel
    [Arguments]    ${Filename}    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    ${CountColumn}    ${CountRow}    [ER] Open Excel    ${Filename}    ${SheetName}
    ${Row}    Evaluate    ${Row}-1
    FOR    ${i}    IN    ${Row}
        ${Return}    [ER] Read Cell Data Column For Excel    ${SheetName}    ${CountColumn}    ${i}
    END
    Insert Into List    ${Return}    0    ${EMPTY}
    Set Suite Variable    ${STEP_STATUS}    PASS
    [Teardown]
    [Return]    ${Return}

[ER] Open Excel
    [Arguments]    ${Filename}    ${SheetName}
    Set Library Search Order    ExcelRobot
    ${Filename}    Join Path    ${Filename}
    Comment    ${DIR}    Remove String    ${CURDIR}    Keywork
    ${DIR}    Set Variable    ${Filename}
    Open Excel    ${DIR}
    ${CountColumn}    Get Column Count    ${SheetName}
    ${CountRow}    Get Row Count    ${SheetName}
    [Return]    ${CountColumn}    ${CountRow}

[ER] Read Cell Data Column For Excel
    [Arguments]    ${SheetName}    ${CountColumn}    ${Row}
    Set Library Search Order    ExcelRobot
    ${ListData}    Create List
    FOR    ${i}    IN RANGE    ${CountColumn}
        ${Return}    Read Cell Data    ${SheetName}    ${i}    ${Row}
        Append To List    ${ListData}    ${Return}
    END
    Set Suite Variable    ${ListData}
    [Return]    ${ListData}

[ER] Get Path Test Data on Configuration
    [Arguments]    ${Filename}    ${SheetName}    ${ScriptName}
    Set Library Search Order    ExcelRobot
    Log To Console    File Name --> ${Filename}
    ${CountColumn}    ${CountRow}    [ER] Open Excel    ${Filename}    ${SheetName}
    @{TEST_EXECUTE}    Create List
    FOR    ${i}    IN RANGE    1    ${CountRow}
        ${Return}    [ER] Read Cell Data Column For Excel    ${SheetName}    ${CountColumn}    ${i}
        Append To List    ${TEST_EXECUTE}    ${Return}
    END
    Log To Console    List Script Name --> ${TEST_EXECUTE}
    Comment    ${TestCase}    Replace String    ${TestName}    ${SPACE}    _
    Comment    ${TestCase}    Catenate    SEPARATOR=    ROBOT_S_    ${TestCase}
    Log To Console    ${ScriptName}
    FOR    ${i}    IN    @{TEST_EXECUTE}
        ${Name}    Set Variable    ${i}[0]
        ${TestData}    Set Variable    ${i}[1]
        ${OutputfileData}    Remove String    ${TestData}    .xlsx
        ${VerifyFlag}    Set Variable    ${i}[2]
        ${ClearOutputFlag}    Set Variable    ${i}[3]
        ${CaptureFlag}    Set Variable    ${i}[4]
        ${CapturePath}    Set Variable    ${i}[5]
        Run Keyword If    "${Name}" != "${ScriptName}"    Continue For Loop
        Log To Console    Used --> ${TestData}
        Set Suite Variable    ${TEST_DATA}    ${TestData}
        Set Suite Variable    ${VERIFY_FLAG}    ${VerifyFlag}
        Set Suite Variable    ${CAPTURE_FLAG}    ${CaptureFlag}
        Set Suite Variable    ${CLEAR_OUTPUT_FLAG}    ${ClearOutputFlag}
        Set Suite Variable    ${CAPTURE_PATH}    ${CapturePath}
        Set Suite Variable    ${OUTPUTFILERESULT}    ${OutputfileData}
    END

[ER] Get Data All Row For Excel
    [Arguments]    ${Filename}    ${SheetName}
    Set Library Search Order    ExcelRobot
    ${CountColumn}    ${CountRow}    [ER] Open Excel    ${Filename}    ${SheetName}
    ${ReturnAllListData}    Create List
    FOR    ${i}    IN RANGE    1    ${CountRow}
        ${Return}    [ER] Read Cell Data Column For Excel    ${SheetName}    ${CountColumn}    ${i}
        Append To List    ${ReturnAllListData}    ${Return}
    END
    Insert Into List    ${ReturnAllListData}    0    ${EMPTY}
    Set Suite Variable    ${STEP_STATUS}    PASS
    Comment    Set Suite Variable    ${AA}    ${ReturnAllListData}[3][4]    Row Column
    [Teardown]
    [Return]    ${ReturnAllListData}

*** Settings ***
Resource          ../../SETTINGS/AllResource.robot
Resource          ../../SETTINGS/StandardLibrary.robot

*** Keywords ***
[EW] Write Cell AGENTPORTAL NONMOTOR Clear Rows Data To Excel
    [Arguments]    ${SheetName}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NON MOTOR Clear Rows Data # --> ${TEST_DATA}
    ${CountColumn}    ${CountRow}    [ER] Open Excel    ${TEST_DATA}    ${SheetName}
    Log to Console    CountColumn --> ${CountColumn}
    Log to Console    CountRow --> ${CountRow}
    Open Excel To Write    ${TEST_DATA}
    FOR    ${i}    IN RANGE    1    ${${CountRow} + 1}
        [EW] Write Cell AGENTPORTAL NONMOTOR Clear Columns Data To Excel    ${SheetName}    ${i}    ${CountColumn}
    END
    Save Excel
    Set Suite Variable    ${RUNNING_STEP}    1

[EW] Write Cell AGENTPORTAL NONMOTOR Clear Columns Data To Excel
    [Arguments]    ${SheetName}    ${Row}    ${CountColumn}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NON MOTOR Clear Columns Data # --> ${TEST_DATA} ${SheetName} ${Row}
    FOR    ${i}    IN RANGE    0    ${CountColumn}
        Log To Console    Get Data & Clear [${Row}][${i}]
        Write To Cell    ${SheetName}    ${i}    ${Row}    ${EMPTY}
    END

[EW] Write Cell AGENTPORTAL NONMOTOR Individual FireMicro To Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NONMOTOR Individual FireMicro # --> ${TEST_DATA}
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
    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${Web_TotalInsurancePremium}
    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${ReferenceNumber}
    Write To Cell By Name    ${SheetName}    L${${Row}+1}    ${GetPolicyNumber}
    Write To Cell By Name    ${SheetName}    M${${Row}+1}    ${NetInsurancePremium}
    Write To Cell By Name    ${SheetName}    N${${Row}+1}    ${RevenueStamp}
    Write To Cell By Name    ${SheetName}    O${${Row}+1}    ${Tax}
    Write To Cell By Name    ${SheetName}    P${${Row}+1}    ${TotalPremium}
    Save Excel
    Set Suite Variable    ${AddRow}    ${${AddRow} + 1}
    Set Suite Variable    ${START_TIME}    ${EMPTY}
    Set Suite Variable    ${END_TIME}    ${EMPTY}

[EW] Write Cell AGENTPORTAL NONMOTOR Individual PAAddOn To Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NONMOTOR Individual PAAddOn # --> ${TEST_DATA}
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
    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${Web_TotalInsurancePremium}
    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${ReferenceNumber}
    Write To Cell By Name    ${SheetName}    L${${Row}+1}    ${GetPolicyNumber}
    Write To Cell By Name    ${SheetName}    M${${Row}+1}    ${NetInsurancePremium}
    Write To Cell By Name    ${SheetName}    N${${Row}+1}    ${RevenueStamp}
    Write To Cell By Name    ${SheetName}    O${${Row}+1}    ${Tax}
    Write To Cell By Name    ${SheetName}    P${${Row}+1}    ${TotalPremium}
    Save Excel
    Set Suite Variable    ${AddRow}    ${${AddRow} + 1}
    Set Suite Variable    ${START_TIME}    ${EMPTY}
    Set Suite Variable    ${END_TIME}    ${EMPTY}

[EW] Write Cell AGENTPORTAL NONMOTOR Juristic FireMicro To Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NONMOTOR Juristic FireMicro # --> ${TEST_DATA}
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
    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${Web_TotalInsurancePremium}
    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${ReferenceNumber}
    Write To Cell By Name    ${SheetName}    L${${Row}+1}    ${GetPolicyNumber}
    Write To Cell By Name    ${SheetName}    M${${Row}+1}    ${NetInsurancePremium}
    Write To Cell By Name    ${SheetName}    N${${Row}+1}    ${RevenueStamp}
    Write To Cell By Name    ${SheetName}    O${${Row}+1}    ${Tax}
    Write To Cell By Name    ${SheetName}    P${${Row}+1}    ${TotalPremium}
    Save Excel
    Set Suite Variable    ${AddRow}    ${${AddRow} + 1}
    Set Suite Variable    ${START_TIME}    ${EMPTY}
    Set Suite Variable    ${END_TIME}    ${EMPTY}

[EW] Write Cell AGENTPORTAL NONMOTOR Add Credit Limit To Excel
    [Arguments]    ${SheetName}    ${Row}
    Set Library Search Order    ExcelRobot
    Log to Console    Open Excel To Write AGENTPORTAL NONMOTOR Add Credit Limit # --> ${TEST_DATA}
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
    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${BeforeGetCurrentCreditLimitSebAgent}
    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${CurrentAfterAddCreditLimit}
    Comment    Write To Cell By Name    ${SheetName}    J${${Row}+1}    ${AnnualGrossPremiumCMI_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    K${${Row}+1}    ${StandardGrossPremiumCMI_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    L${${Row}+1}    ${AdjustedGrossPremiumCMI_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    M${${Row}+1}    ${GrossWrittenPremiumCMI_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    N${${Row}+1}    ${GrossWrittenPremiumTotal_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    O${${Row}+1}    ${VMIStampDuty_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    P${${Row}+1}    ${CMIStampDuty_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    Q${${Row}+1}    ${VMIValueAddTax_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    R${${Row}+1}    ${CMIValueAddTax_OUTPUT}
    Comment    Write To Cell By Name    ${SheetName}    S${${Row}+1}    ${TotalAmount_OUTPUT}
    Save Excel
    Set Suite Variable    ${AddRow}    ${${AddRow} + 1}
    Set Suite Variable    ${START_TIME}    ${EMPTY}
    Set Suite Variable    ${END_TIME}    ${EMPTY}

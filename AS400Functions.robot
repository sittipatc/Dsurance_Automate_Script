*** Settings ***
Resource          ../../SETTINGS/StandardLibrary.robot
Resource          ../../SETTINGS/AllResource.robot

*** Keywords ***
[MF] Write Bare In Position
    [Arguments]    ${stepName}    ${PageName}    ${txt}    ${ypos}    ${xpos}
    Set Library Search Order    Mainframe3270
    ${Return}    Wait Until String    ${PageName}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Write Bare In Position    ${txt}    ${ypos}    ${xpos}
    Change Wait Time After Write    0.5
    Run Keyword If    "${Status}" == "PASS"    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step

[MF] Read
    [Arguments]    ${stepName}    ${pageName}    ${ypos}    ${xpos}    ${length}
    Set Library Search Order    Mainframe3270
    ${Status}    ${Error}    Run Keyword And Ignore Error    Wait Until String    ${pageName}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Read    ${ypos}    ${xpos}    ${length}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step
    [Return]    ${Return.strip()}

[MF] Send PF
    [Arguments]    ${stepName}    ${fkey}
    Set Library Search Order    Mainframe3270
    ${Status}    ${Error}    Run Keyword And Ignore Error    Execute Command    PA(1)
    ${Status}    ${Error}    Run Keyword If    '${Status}' == 'PASS'    Run Keyword And Ignore Error    Send PF    ${fkey}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${stepName} Error : ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step

[MF] Capture
    [Arguments]    ${FOLDER_FUNCTION_NAME}    ${TRANS_NAME}
    Set Library Search Order    Mainframe3270
    ${DateTime}    Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${ScreenshotDate}    Convert Date    ${DateTime}    result_format=%Y%m%d%H%M%S
    Log To Console    Screenshot Date --> ${ScreenshotDate}
    ${FOLDER_ROW}    ADD ZERO    ${CAPTURE_ROW}
    ${RUNNING}    ADD ZERO    ${RUNNING_STEP}
    ${OutputScreenshot}    Set Variable    ${FOLDER_CAPTURE_DATE}${/}CaptureScreen_Row_${FOLDER_ROW}
    ${OutputName}    Set Variable    ${FOLDER_CAPTURE_DATE}${/}CaptureScreen_Row_${FOLDER_ROW}${/}${RUNNING}_${FOLDER_FUNCTION_NAME}_${TRANS_NAME}_${ScreenshotDate}
    Sleep    1s
    Create Directory    ${OutputScreenshot}
    Sleep    1
    Set Screenshot Folder    ${OutputScreenshot}
    Take Screenshot    ${OutputName}    height=1080    width=1920
    Set Suite Variable    ${FOLDER_ROW}
    Set Suite Variable    ${RUNNING_STEP}    ${${RUNNING_STEP} + 1}
    Set Suite Variable    ${CAPTURE_SCREEN_SHOT}    ${FOLDER_CAPTURE_DATE}${/}ExcelRowNumber_${FOLDER_ROW}
    [Return]    ${OutputScreenshot}

[MF] Send Enter
    [Arguments]    ${stepName}    ${PageName}
    Set Library Search Order    Mainframe3270
    ${Return}    Run Keyword And Ignore Error    Wait Until String    ${PageName}    timeout=2
    ${Status}    ${Error}    Run Keyword And Ignore Error    Send Enter
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step

[MF] Fail Step
    Set Suite Variable    ${SUITE_STATUS}    FAIL
    Set Suite Variable    ${FAIL_COUNT}    ${${FAIL_COUNT}+1}
    Run Keyword If    "${FolderData}" == "AS400"    Run Keyword    00_FailStep_AS400

[MF] Close Connection
    [Arguments]    ${stepName}
    Set Library Search Order    Mainframe3270
    ${Status}    ${Error}    Run Keyword And Ignore Error    Close Connection
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${stepName} Error : ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step

[MF] Open Connection
    [Arguments]    ${stepName}    ${HOST}
    Set Library Search Order    Mainframe3270
    ${args}    Create List    --oversize    100x25
    ${Status}    ${Error}    Run Keyword And Ignore Error    Open Connection    ${HOST}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${stepName} Error : ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [MF] Fail Step

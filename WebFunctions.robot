*** Settings ***
Resource          ../../SETTINGS/StandardLibrary.robot
Resource          ../../SETTINGS/AllResource.robot

*** Keywords ***
[W] Capture Page Screenshot
    [Arguments]    ${FOLDER_FUNCTION_NAME}    ${TRANS_NAME}
    Set Library Search Order    SeleniumLibrary
    ${DateTime}    Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${ScreenshotDate}    Convert Date    ${DateTime}    result_format=%Y%m%d%H%M%S
    Log To Console    Screenshot Date --> ${ScreenshotDate}
    ${FOLDER_ROW}    ADD ZERO    ${CAPTURE_ROW}
    ${RUNNING}    ADD ZERO    ${RUNNING_STEP}
    ${OutputScreenshot}    Set Variable    ${FOLDER_CAPTURE_DATE}${/}CaptureScreen_Row_${FOLDER_ROW}${/}${RUNNING}_${FOLDER_FUNCTION_NAME}_${TRANS_NAME}_${ScreenshotDate}.png
    Sleep    1s
    Capture Page Screenshot    ${OutputScreenshot}
    Set Suite Variable    ${FOLDER_ROW}
    Set Suite Variable    ${RUNNING_STEP}    ${${RUNNING_STEP} + 1}
    Set Suite Variable    ${CAPTURE_SCREEN_SHOT}    ${FOLDER_CAPTURE_DATE}${/}CaptureScreen_Row_${FOLDER_ROW}
    [Return]    ${OutputScreenshot}

[W] Check Element
    [Arguments]    ${stepName}    ${Element}    ${timeout}=10s
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}    timeout=${timeout}
    ${Status}    ${Error}    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Check Message
    [Arguments]    ${stepName}    ${Value}    ${timeout}=3s
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Value}    timeout=${timeout}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : ${Value} Not found
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Click Element
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Click Element    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Double Click Element
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Double Click Element    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Get Text
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Get Text    ${Element}
    Comment    Log To Console    ${Return}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]
    [Return]    ${Return}

[W] Get Value
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Get Value    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]
    [Return]    ${Return}

[W] Get Element Count
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Get Element Count    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]
    [Return]    ${Return}

[W] Get Element Attribute
    [Arguments]    ${stepName}    ${Element}    ${AttributeName}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Get Element Attribute    ${Element}    ${AttributeName}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]
    [Return]    ${Return}

[W] Get Web Element
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Return}    Run Keyword If    "${Status}" == "PASS"    Get WebElements    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]
    [Return]    ${Return}

[W] Input Password
    [Arguments]    ${stepName}    ${Element}    ${Value}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Input Password    ${Element}    ${Value}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Input Text
    [Arguments]    ${stepName}    ${Element}    ${Value}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Input Text    ${Element}    ${Value}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Mouse Over
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Mouse Over    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Mouse Down
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Mouse Down    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Open Browser
    [Arguments]    ${stepName}    ${URL}    ${Browser}=chrome
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Open Browser    ${URL}    ${Browser}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Execute javascript    document.body.style.zoom="100%"
    Set Window Size    1920    1080
    ${Status}    ${Error}    Run Keyword And Ignore Error    Maximize Browser Window
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${stepName} Error : ${TS_MESSAGE}
    [Teardown]

[W] Close Browser
    [Arguments]    ${stepName}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Close All Browsers
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${stepName} Error : ${TS_MESSAGE}
    [Teardown]

[W] Maximize Browser Window
    [Arguments]    ${stepName}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Maximize Browser Window
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Switch Window
    [Arguments]    ${stepName}    ${Locator}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Switch Window    ${Locator}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Select Frame
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Select Frame    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Unselect Frame
    [Arguments]    ${stepName}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Unselect Frame
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Select From List By Value
    [Arguments]    ${stepName}    ${Element}    ${Value}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Select From List By Value    ${Element}    ${Value}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Select From List By Label
    [Arguments]    ${stepName}    ${Element}    ${Value}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Select From List By Label    ${Element}    ${Value}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Select From List By Index
    [Arguments]    ${stepName}    ${Element}    ${Index}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Select From List By Index    ${Element}    ${Index}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Select From List By Arrow
    [Arguments]    ${StepName}    ${ListLocator}    ${AttributeName}    ${ValueFromList}    ${wait}=0
    Set Library Search Order    SeleniumLibrary
    Set Suite Variable    ${Status}    FAIL
    @{arrows}    Create List
    ${Status}    ${list}    Run Keyword And Ignore Error    Get List Items    ${ListLocator}
    Run Keyword If    '${Status}' == 'PASS'    [W] Select List By Arrow Pass    ${StepName}    ${ListLocator}    ${AttributeName}    ${ValueFromList}    ${list}    ${wait}
    Run Keyword If    "${Status}" == "PASS"    Set Suite Variable    ${Error}    None
    ...    ELSE    Set Suite Variable    ${Error}    No Data in List
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Select List By Arrow Pass
    [Arguments]    ${StepName}    ${ListLocator}    ${AttributeName}    ${ValueFromList}    ${list}    ${wait}=0
    Set Library Search Order    SeleniumLibrary
    Set Suite Variable    ${Status}    FAIL
    @{arrows}    Create List
    ${list_len}    Get Length    ${list}
    ${selected}    Get Selected List Label    ${ListLocator}
    ${start_append}    Set Variable    Initial
    ${target}    Set Variable    Initial
    FOR    ${n}    IN RANGE    0    ${list_len}
        ${start_append}    Set Variable If    "${selected}" == "${list}[${n}]"    ${n}    ${start_append}
        ${target}    Set Variable If    "${ValueFromList}" == "${list}[${n}]"    ${n}    ${target}
        Run Keyword If    "${start_append}" != "Initial" and "${target}" != "Initial"    Exit For Loop
    END
    Run Keyword If    "${start_append}" == "Initial" or "${target}" == "Initial"    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    "${start_append}" == "Initial" or "${target}" == "Initial"    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : No data in list
    Run Keyword If    "${start_append}" == "Initial" or "${target}" == "Initial"    Run Keyword    [W] Fail Step
    ${diff}    Evaluate    ${target}-${start_append}
    ${direction}    Set Variable If    ${diff} >= 0    DOWN    UP
    ${negative}    Evaluate    -1
    ${start_append}    Set Variable If    ${diff} < 0    ${start_append} * ${negative}    ${start_append}
    FOR    ${i}    IN RANGE    0    ${list_len}
        ${index}    Evaluate    abs(${i+${start_append}})
        Run Keyword If    "${list}[${index}]" == "${ValueFromList}"    Run Keywords    Set Suite Variable    ${Status}    PASS
        ...    AND    Press Keys    ${ListLocator}    @{arrows}    ENTER
        ...    AND    Exit For Loop
        Run Keyword If    "${direction}" == "DOWN"    Append To List    ${arrows}    ARROW_DOWN
        ...    ELSE    Append To List    ${arrows}    ARROW_UP
    END

[W] Kill Process IE
    Run    ${DIR}${/}KEYWORDS${/}WEB${/}KillProcess_IEDriver.bat

[W] Kill Process Chrome
    Run    ${DIR}${/}KEYWORDS${/}WEB${/}KillProcess_ChromeDriver.bat

[W] Scroll Element Into View
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Scroll Element Into View    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Choose File
    [Arguments]    ${stepName}    ${Element}    ${FilePath}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Choose File    ${Element}    ${FilePath}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Press Keys
    [Arguments]    ${stepName}    ${Element}    ${Key}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Press Keys    ${Element}    ${Key}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Press Keys 2
    [Arguments]    ${stepName}    ${Element}    ${Key}    ${Key2}=
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Press Keys    ${Element}    ${Key}    ${Key2}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Execute Javascript
    [Arguments]    ${stepName}    ${Code}
    Set Library Search Order    SeleniumLibrary
    ${Status}    ${Error}    Run Keyword And Ignore Error    Execute Javascript    ${Code}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step

[W] Create Folder Online Print
    Run    ${DIR}${/}KEYWORDS${/}WEB${/}CreateFolder.bat

[W] Fail Step
    Set Suite Variable    ${SUITE_STATUS}    FAIL
    Set Suite Variable    ${FAIL_COUNT}    ${${FAIL_COUNT}+1}
    Run Keyword If    "${FolderData}" == "AGENTPORTAL_NONMOTOR"    Run Keyword    00_FailStep_AgentPortal

[W] Message To Slack
    [Arguments]    ${PASS_COUNT}    ${FAIL_COUNT}
    ${TOTAL_COUNT}    Evaluate    ${PASS_COUNT}+${FAIL_COUNT}
    ${PASSPERCENTAGE}    Run Keyword If    "${TOTAL_COUNT}" != "0"    Evaluate    ${PASS_COUNT}/${TOTAL_COUNT}*100
    ...    ELSE    Set Variable    0
    ${PASSPERCENTAGE}    Evaluate    round(${PASSPERCENTAGE},2)
    Create File    ${FileConfigPath}${FolderData}${/}MessageToSlack.txt    Pass Case: ${PASS_COUNT}\nFail Case: ${FAIL_COUNT}\nTotal Case: ${TOTAL_COUNT}\nPass Percentage: ${PASSPERCENTAGE}%
    Create File    ${FileConfigPath}${FolderData}${/}OutputCaptureFolder.txt    ${Output_CapturePath}

[W] Get Selected List Label
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Get Selected List Label    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

[W] Get Selected List Value
    [Arguments]    ${stepName}    ${Element}
    Set Library Search Order    SeleniumLibrary
    ${Return}    WAIT FOR PAGE CONTAINS ELEMENT    ${Element}
    ${Status}    ${Error}    Run Keyword And Ignore Error    Get Selected List Value    ${Element}
    Set Suite Variable    ${TS_STATUS}    ${Status}
    Run Keyword If    '${Status}' == 'PASS'    Set Suite Variable    ${TS_MESSAGE}    ${stepName} Error : None
    ...    ELSE    Set Suite Variable    ${TS_MESSAGE}    Error : Cannot ${stepName}
    Log To Console    ${stepName} Status : ${TS_STATUS}
    Log To Console    ${TS_MESSAGE}
    Run Keyword If    "${Status}" == "FAIL"    Run Keyword    [W] Fail Step
    [Teardown]

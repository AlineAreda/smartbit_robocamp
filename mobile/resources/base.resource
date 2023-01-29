*** Settings ***
Documentation    Arquivo principal

Library    AppiumLibrary
Library    JSONLibrary

*** Variable ***
${API_URL}      http://192.168.15.11:3333

*** Keywords ***
Start App
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=SmartBit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Simulator
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page contains    Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Close Application

#Helpers
Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load JSON From File
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    [return]    ${fixture}


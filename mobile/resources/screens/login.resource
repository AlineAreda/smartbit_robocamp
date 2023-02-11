*** Settings ***
Documentation    Arquivo que repersenta a página de login

Library    AppiumLibrary

*** Variable ***
${API_URL}      http://192.168.100.8:3333

*** Keywords ***
Login With Student id
    [Arguments]    ${student_id}

   
    Input Text      xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${API_URL}
    Input Text      xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${student_id}

    Click Text      Entrar    #exact_match=true

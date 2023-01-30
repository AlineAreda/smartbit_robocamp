*** Settings ***
Documentation    Suite de testes de pedido de ajuda
Resource         ../resources/base.resource

#Test Setup       Start App
#Test Teardown    Finish App


*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}    Get Fixture    admin
    ${ana}      Get Fixture    ana

    Reset student_id    ${ana}[student][email]

    ${token}            Get Service token       ${admin}
    ${student_id}       POST New Student        ${token}         ${ana}[student]
    POST New Enroll     ${token}                ${student_id}
   
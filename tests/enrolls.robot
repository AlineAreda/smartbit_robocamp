*** Settings ***
Documentation    Suite de testes de matrícula de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Teste no banco de dados
    [Tags]    db

    Connect To Postgress
    ${user}                     Select Student Where Email    falcao@gmail.com
    Disconnect from Database

Deve matricular um aluno
    ${admin}    Create Dictionary

    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Connect To Postgress
    Delete Enroll

    Do Login              ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Student        Falcão
    Select Plan           Smart
    Fill Start Date
    Submit Enroll Form
    Verify Toaster        Matrícula cadastrada com sucesso

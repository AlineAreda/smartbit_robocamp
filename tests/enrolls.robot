*** Settings ***
Documentation    Suite de testes de matrícula de alunos
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    ${admin}    Create Dictionary

    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Connect To Postgress
    Delete Enroll By Email      falcao@gmail.com
    Disconnect from Database

    Do Login              ${admin}
    Go To Enrolls
    Go To Enroll Form
    Select Student        Falcão
    Select Plan           Smart
    Fill Start Date
    Submit Enroll Form
    Verify Toaster        Matrícula cadastrada com sucesso

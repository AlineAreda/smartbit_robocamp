*** Settings ***
Documentation    Gerenciando a massa de testes através do banco de dados
Library          DatabaseLibrary

*** Keywords ***
Connect To Postgress
    Connect To Database    psycopg2                            
    ...                    dvjtghxm
    ...                    dvjtghxm
    ...                    c90Yyd_dDruSME54Q-DKVucLQRdtp6To
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where Email
    [Arguments]    ${email}

    ${query}     Set Variable
    ...          SELECT * FROM public.students WHERE email = '${email}';
    ${result}    Query                                                      ${query}

    [return]    ${result}[0]

Delete Enroll By Email
    [Arguments]    ${email}

    ${user}    Select Student Where Email    ${email}    

    ${query}              Set Variable
    ...                   DELETE FROM public.enrollments where student_id = '${user}[0]';
    Execute SQL String    ${query}                                                           

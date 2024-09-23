*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${HOST}    https://viacep.com.br/ws/
${RESPOSTA}

*** Keywords ***
####    Steps

Conecta ao Webservice
    Create Session    consultaCEP    ${HOST}   disable_warnings=True

Informa o CEP
    [Arguments]    ${CEP_CONSULTADO}
    ${RESPOSTA}=    GET    url=${HOST}/${CEP_CONSULTADO}/json
    Log    Resposta: ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Confere o status code
    [Arguments]     ${STATUS_ESPERADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUS_ESPERADO}
    Log             Status Code Retornado: ${RESPOSTA.status_code} -- Status Code Esperado: ${STATUS_ESPERADO}

Confere o endereco do CEP 
    [Arguments]     ${ENDERECO}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  logradouro   ${ENDERECO}

Confere o DDD 
    [Arguments]     ${DDD}
    Dictionary Should Contain Item  ${RESPOSTA.json()}  ddd   ${DDD}
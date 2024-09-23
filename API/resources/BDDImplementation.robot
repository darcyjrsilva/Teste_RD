*** Settings ***
Resource    ../resources/Steps.robot

*** Keywords ***
####    Dado
Dado o usuario consultar o CEP "${CEP_CONSULTADO}"
    Informa o CEP    ${CEP_CONSULTADO}

####    Quando
Quando realizar a chamada da API
    Conecta ao Webservice

####    Entao
Entao devera retornar o logradouro "${ENDERECO}"
    Confere o status code    200
    Confere o endereco do CEP    ${ENDERECO}

####    Entao
Entao devera retornar o DD "${DDD}"
    Confere o status code    200
    Confere o DDD    ${DDD}
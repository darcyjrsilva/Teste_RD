*** Settings ***
Documentation    Teste de api    
Resource    ../resources/BDDImplementation.robot

*** Test Cases ***

Cenario 01: Validar o logradouro
    [Tags]
    Dado o usuario consultar o CEP "07124300"
    Quando realizar a chamada da API
    Entao devera retornar o logradouro "Avenida Rio de Janeiro"


Cenario 02: Validar o DD 
    [Tags]
    Dado o usuario consultar o CEP "07124300"
    Quando realizar a chamada da API
    Entao devera retornar o DD "11"






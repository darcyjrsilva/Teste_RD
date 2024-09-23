*** Settings ***
Documentation    Testes Mobile
Resource    ../resources/stepsmob.robot

Test Setup    Abrir APP
Test Teardown    Fechar APP
Test Timeout    5 minute

*** Test Cases ***
Cadastro
    Cadastrar Usuario
    Login Usuario Valido
    Login Usuario Invalido
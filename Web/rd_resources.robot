*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}    //input[contains(@name,'username')]
${PASSWORD}    //input[contains(@type,'password')]
${LOGIN}    //button[@type='submit'][contains(.,'Login')]
${TOPO}    //h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module'][contains(.,'Dashboard')]
${USUARIO}    Admin
${SENHA}    admin123
${ADMIN}    //a[@class='oxd-main-menu-item'][contains(.,'Admin')]
${ADMIN_TOPO}    //h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module'][contains(.,'Admin')]
${ADD}    //button[@type='button'][contains(.,'Add')]
${CONFIR_CADASTRO}    //h6[@class='oxd-text oxd-text--h6 orangehrm-main-title'][contains(.,'Add User')]
${NEWUSER}    //h6[@class='oxd-text oxd-text--h6 orangehrm-main-title'][contains(.,'Add User')]

${SAVE}    //button[@type='submit'][contains(.,'Save')]
${NEWUSERNAME}    (//input[contains(@autocomplete,'off')])[1]
${NEWPASS}    (//input[@type='password'])[1]
${CONFIRM}    (//input[@autocomplete='off'])[3]

${EMPLOYEENAME}    //input[@placeholder='Type for hints...']
${SELECTEMPLO}    //div[@class='oxd-autocomplete-dropdow.--position-bottom']

${USERROLE}   (//div[contains(.,'-- Select --')])[14]
${ADMIN_ROLE}    div.oxd-select-text.oxd-select-text--active, div.oxd-select-text.oxd-select-text--focus

${ENABLED}    (//div[@tabindex='0'])[2]

${EXCLUIR}    //i[contains(@class,'oxd-icon bi-trash')]

${USER}    //span[@class='oxd-userdropdown-tab']
${LOGOUT}    //a[contains(.,'Logout')]

${SEARCH_ADMIN}    (//input[@class='oxd-input oxd-input--active'])[2]
${BOTAO_SEARCH}    //button[@type='submit'][contains(.,'Search')]

*** Keywords ***

Abrir o navegador
    Open Browser   browser=chrome 

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado o usuario acessou https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${USERNAME}    timeout=100

E informou o username correto
    Input Text    locator=${USERNAME} 
    ...    text=${USUARIO}

E informou o password correto
    Input Password    locator=${PASSWORD} 
    ...    password=${SENHA}

Quando clicar no botão login
    Click Button    locator=${LOGIN}

Então deverá realizar o login com sucesso
    Wait Until Element Is Visible    locator=${TOPO}
    Close Browser


Dado o usuario logado
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${USERNAME}    timeout=100
    Input Text    locator=${USERNAME}    text=${USUARIO}
    Input Password    locator=${PASSWORD}    password=${SENHA}
    Click Button    locator=${LOGIN}
    Wait Until Element Is Visible    locator=${TOPO}    timeout=10


Quando entrar em admin
    Click Element    locator=${ADMIN}

E cadastrado um novo usuario
    Wait Until Element Is Visible    locator=${ADMIN_TOPO}
    Click Button    locator=${ADD}
    Wait Until Element Is Visible    locator=${CONFIR_CADASTRO}
    ### USER ROLE
    Click Element    locator=${USERROLE}    
    Click Element    locator=xpath=//*[contains(text(), 'Admin')]
    # ### Employee Name
    Input Text    locator=${EMPLOYEENAME}    text=teste dj
    Wait Until Element Is Enabled    locator=${EMPLOYEENAME}    timeout=5
    Mouse Down    locator=${EMPLOYEENAME}
    # ### Status
    Click Element    locator=${ENABLED}
    Click Element    locator=xpath=//*[contains(text(), 'Enabled')]
    # ### Username
    Input Text    locator=${NEWUSERNAME}    text=darcy teste
    # ### Password
    Input Password    locator=${NEWPASS}    password=1234567a

    # ### Confirm Password
    Input Password    locator=${CONFIRM}    password=1234567a   


E clicar em Save
    Click Button    locator=${SAVE}


Então deverá ser criado usuario com sucesso
    Alert Should Be Present  
    Close Browser

E pesquisar pelo novo admin
    Input Text    locator=${SEARCH_ADMIN}    text=teste dj
    Click Button    locator=${BOTAO_SEARCH}


Então deverá retornar o resultado com o Username cadastrado
    Page Should Not Contain    text=No Records Found
    Wait Until Page Contains    text=teste dj
    Close Browser

E clicar na lixeira
    Click Element    locator=${EXCLUIR}

Então deverá ser excluido com sucesso
    Alert Should Be Present
    Close Browser

Quando clicar no nome do usuario
    Click Element    locator=${USER}

E clicar em logout
    Click Element    locator=${LOGOUT}

Entao deverá retornar para a tela de login
    Wait Until Element Is Visible    locator=${USERNAME}
    Close Browser
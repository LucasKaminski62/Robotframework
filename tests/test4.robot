*** Settings ***
Documentation       Test Amazon

Library             Collections
Library             SeleniumLibrary
Resource            ../resources/homepage.resource    # Importer les ressources
Resource            ../resources/header.resource    # Importer les ressources
Resource            ../resources/connexion.resource    # Importer les ressources
Variables           ../data/account.py    # Importer les variables
Variables           ../data/product.py    # Importer les variables
#alt shift f pour formater le code
Test Teardown       Close All Browsers


*** Test Cases ***
Test If Nobody Connected
    [Documentation]    Connect if nobody connected
    Browser Init    ${amazon}
    Accept Cookies
    # Go To Login
    # Login    ${Dict['mail']}    ${Dict['mdp']}    ${Dict['nom']}
    ${connectStat} =    Get Text    id=nav-link-accountList-nav-line-1
    IF    '${connectStat}' == 'Bonjour, Identifiez-vous'
        Go To Login
        Login    ${Dict['mail']}    ${Dict['mdp']}    ${Dict['nom']}
    END
    # ELSE
    #    Log To Console    Already connected
    # END

Test With Run Keyword
    [Documentation]    Connect if nobody connected
    Browser Init    ${amazon}
    Accept Cookies
    ${var} =    Run Keyword And Return Status
    ...    Wait Until Element Contains    id=nav-link-accountList-nav-line-1    Bonjour, Identifiez-vous
    IF    ${var}
        Go To Login
        Login    ${Dict['mail']}    ${Dict['mdp']}    ${Dict['nom']}
    END

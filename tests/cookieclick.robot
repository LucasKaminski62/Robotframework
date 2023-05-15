*** Settings ***
Documentation  Test Amazon
Library  SeleniumLibrary
Resource  ../resources/homepage.resource  # Importer les ressources
Resource  ../resources/header.resource  # Importer les ressources
Resource  ../resources/connexion.resource  # Importer les ressources
Variables  ../data/account.py  # Importer les variables
Resource  ../resources/get_value.resource  # Importer les ressources


*** Test Cases ***
Bot Clicker
    [Documentation]  Click cookies
    Browser Init  https://orteil.dashnet.org/cookieclicker/
    Maximize Browser Window
    Click Element  class=fc-button-label
    Wait Until Element Is Visible  id=langSelect-FR
    Click Element  id=langSelect-FR
    Sleep  3s
    Wait Until Element Is Visible  id=bigCookie

    WHILE  True  limit=100000
        Click Element  id=bigCookie
        Get Value0
    END

    Close All Browsers

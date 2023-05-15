*** Settings ***
Documentation  Test Amazon
Library  SeleniumLibrary
Resource  ../resources/homepage.resource  # Importer les ressources
Resource  ../resources/header.resource  # Importer les ressources
Resource  ../resources/connexion.resource  # Importer les ressources
Variables  ../data/account.py  # Importer les variables
Test Setup  Run Keywords  Browser Init  ${amazon}  AND  Maximize Browser Window  AND  Accept Cookies
# Test Setup permet de lancer des keywords avant chaque test et Run keywords pour lancer plusieurs keywords
Test Teardown  Close All Browsers


*** Test Cases ***
Test Select List
    [Documentation]  Choisir element dans une liste
    Select Category  Bricolage
    Search Product  Visseuse
    Element Should Be Visible  //option[text()='Bricolage' and @selected='selected']
    Close All Browsers
    [Teardown]  Close All Browsers
    # Pour fermer en cas d'echec

Test Select List2
    [Documentation]  Odre decroissant
    Search Product  Livre
    Select Order  Prix : Ordre décroissant
    # Element Should Contain  id=s-result-sort-select  Ordre décroissant
    # Le point xpath est un raccourci pour dire text
    Close All Browsers
    # [Teardown]  Close All Browsers
    # Pour fermer en cas d'echec

Test Select List3
    [Documentation]  Odre decroissant
    Search Product  Livres
    Select First Product
    ${title}=  Get Text  //span[@id='productTitle']
    Add To Cart
    Go To Cart
    Wait Until Element Is Visible  //span[@class='a-truncate-cut' and contains(text(),'${title}')]

    # [Teardown]  Close All Browsers
    # Pour fermer en cas d'echec

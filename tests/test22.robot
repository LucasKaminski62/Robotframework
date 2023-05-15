*** Settings ***
Documentation  Nouveaux tests
Library  SeleniumLibrary

Resource  ../resources/homepage.resource  # Importer les ressources
Resource  ../resources/header.resource  # Importer les ressources
Resource  ../resources/connexion.resource  # Importer les ressources

Variables  ../data/account.py
Variables  ../data/product.py

Test Teardown  Close All Browsers


*** Test Cases ***
Test 6 Add to cart - pro
    [Documentation]  Ajoute un produit au panier
    Browser Init  ${amazon}
    Accept Cookies
    Search Product  Livres
    Select First Product
    ${productTitle}  Get Text  ${ID_PRODUCT_TITLE}
    Add To Cart
    Element Text Should Be  ${COUNT_CART}  1
    Go To Cart
    Check Presence Product  ${productTitle}


*** Keywords ***
Check Presence Product
    [Documentation]  Vérifie la présence d'un produit dans la panier
    ...  productTitle: Le nom du produit que l'on souhaite vérifier
    [Arguments]  ${productTitle}
    Element Should Contain  class=a-truncate-cut  ${productTitle}

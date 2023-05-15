*** Settings ***
Documentation  Test Amazon
Library  SeleniumLibrary
Resource  ../resources/homepage.resource  # Importer les ressources
Resource  ../resources/header.resource  # Importer les ressources
Resource  ../resources/connexion.resource  # Importer les ressources
Variables  ../data/account.py  # Importer les variables


*** Test Cases ***
Test Amazon 1
    [Documentation]  Click cookies
    Browser Init  ${amazon}
    Accept Cookies
    Close All Browsers

Test Amazon 2
    [Documentation]  Click products
    Browser Init  ${amazon}
    Accept Cookies
    Search Product  iphone
    Close All Browsers

Test Amazon 3
    [Documentation]  Connexion
    Browser Init  ${amazon}
    Accept Cookies
    Go To Login
    Login  ${email}  ${password}  ${name}
    Logout
    Close All Browsers

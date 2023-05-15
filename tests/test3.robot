*** Settings ***
Documentation  Test Amazon
Library  Collections
Library  SeleniumLibrary
Resource  ../resources/homepage.resource  # Importer les ressources
Resource  ../resources/header.resource  # Importer les ressources
Resource  ../resources/connexion.resource  # Importer les ressources
Variables  ../data/account.py  # Importer les variables
Variables  ../data/product.py  # Importer les variables
Test Teardown  Close All Browsers


*** Test Cases ***
Test 1 Add To Cart - TNR
    [Documentation]  Ajoute 2 produit au panier
    Browser Init  ${amazon}/gp/product/${idProduct1}
    Accept Cookies
    Add To Cart
    Go To  ${amazon}/gp/product/${idProduct2}
    Add To Cart

Test 2 Product List - TNR
    [Documentation]  Afficher bons produits
    Browser Init  ${amazon}
    Accept Cookies
    Search Product  Livre
    FOR  ${I}  IN  @{tabLE}
        Wait Until Element Is Visible  //div[contains(@class,'s-card-container')]//h2//span[contains(text(),'${I}')]
    END

Test 3 Create List
    [Documentation]  Créer une liste
    Browser Init  ${amazon}
    Accept Cookies
    ${BOOKS_LIST}  Create List
    Search Product  Livre
    FOR    ${i}    IN RANGE  1  11
        ${books}  Get Text    (//div[contains(@class,'s-card-container')]//h2//span)[${i}]
        Append To List   ${BOOKS_LIST}    ${books}
    END
    Length Should Be  ${BOOKS_LIST}  10
    Log  ${BOOKS_LIST}

Test4 Create Dictionnary
    [Documentation]  Afficher bons produits
    Browser Init  ${amazon}
    Accept Cookies
    Go To Login
    Login  ${Dict['mail']}  ${Dict['mdp']}  ${Dict['nom']}

Test5 Create Dictionnary List Add 1 Book
    [Documentation]  Creer une liste de dictionnaire de produits
    Browser Init  ${amazon}gp/product/${Book1['ref']}
    Accept Cookies
    Add To Cart
    Go To Cart
    Wait Until Element Is Visible  //span[@class='a-truncate-cut' and contains(text(),'${Book1['title']}')]

Test6 Create Dictionnary List Add 2 Books
    [Documentation]  Creer une liste de dictionnaire de produits
    Browser Init  ${amazon}
    Accept Cookies
    FOR  ${book}  IN  @{ListBook}
        Go To  ${amazon}/gp/product/${book['ref']}
        Add To Cart
        Go To Cart
        Wait Until Element Is Visible  //span[@class='a-truncate-cut' and contains(text(),'${book['title']}')]
    END
    [Teardown]  Close All Browsers

Test6/5 Create Dictionnary List Add 2 Types Products
    [Documentation]  Creer une liste de dictionnaire de produits
    Browser Init  ${amazon}
    Accept Cookies
    FOR  ${prd}  IN  @{ListProduct}
        Search Product  ${prd['type']}
        Wait Until Element Is Visible  //div[contains(@class,'s-card-container')]//h2//span[contains(text(),'${prd['title']}')]
    END
    [Teardown]  Close All Browsers

Test7 Create Dictionnary List From Page Product
    [Documentation]  Creer une liste de dictionnaire depuis la page produit
    Browser Init  ${amazon}
    Accept Cookies
    Search Product  Livre
    FOR    ${i}    IN RANGE  1  4
        ${books}  Get Text    (//div[contains(@class,'s-card-container')]//h2//span)[${i}]
        ${reference}  Get Text  (//span[contains(@class,'a-price-whole')])[${i}]
        ${prix}  Catenate  ${reference}  €
        ${dct}  Create Dictionary
        Set To Dictionary  ${dct}  title  ${books}
        Set To Dictionary  ${dct}  ref  ${prix}
        Append To List  ${ListeLivre}  ${dct}
    END
    Log  ${ListeLivre}

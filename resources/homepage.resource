*** Settings ***
Documentation  Keyword page d'acceuil
Library  SeleniumLibrary


*** Variables ***
${ID_PRODUCT_TITLE}  id=productTitle
${COUNT_CART}  id=nav-cart-count


*** Keywords ***
Browser Init
    [Documentation]  Ouvrir le navigateur
    [Arguments]  ${url}  ${browser}=chrome
    Open Browser  ${url}  ${browser}  options=add_experimental_option("detach", True)
    Maximize Browser Window

Accept Cookies
    [Documentation]  Accepter les cookies
    Click Element  id=sp-cc-accept
    Wait Until Element Is Not Visible  id=sp-cc-accept

Select First Product
    [Documentation]  Selectionner le premier produit
    Wait Until Element Is Enabled  class=puis-padding-right-small
    # Click Element  css=div.puis-padding-right-small span.a-color-secondary:contains('poche')
    Click Element  //a[contains(text(), 'Poche') or contains(text(), 'Broché') or contains(text(), 'Relié')]

Select Product
    [Documentation]  Sélectionne un produit
    ...  index: Numéro du produit sur la page
    [Arguments]  ${index}=1
    Click Element  (//div[contains(@class, "s-card-container")])[${index}]
    Wait Until Element Is Visible  id=dp

Select Similar Product
    [Documentation]  Sélectionne un produit similaire
    ...  index: Numéro du produit sur la page
    [Arguments]  ${index}=1
    Click Element  (//li[contains(@class, "a-carousel-card")])[${index}]
    Wait Until Element Is Visible  id=dp

Add To Cart
    [Documentation]  Ajouter au panier
    Wait Until Element Is Enabled  id=add-to-cart-button
    Click Element  id=add-to-cart-button
    Wait Until Element Is Visible  //span[contains(.,"Ajouté au panier")]
    # Wait Until Element Is Visible  //span[contains(.,"1")]

Go To Cart
    [Documentation]  Aller au panier
    Wait Until Element Is Enabled  id=sw-gtc
    Click Element  id=sw-gtc

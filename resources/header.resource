*** Settings ***
Documentation  Keyword champ de recherche
Library  SeleniumLibrary


*** Keywords ***
Search Product
    [Documentation]  Chercher un produit
    [Arguments]  ${product}
    Input Text  id=twotabsearchtextbox  ${product}
    Click Element  id=nav-search-submit-button
    Wait Until Element Is Visible  id=p_36-title

Select Category
    [Documentation]  Selectionner une categorie
    [Arguments]  ${category}
    Select From List By Label  id=searchDropdownBox  ${category}

Select Order
    [Documentation]  Selectionner un ordre
    [Arguments]  ${order}
    # Odre décroissant / Ordre croissant
    Wait Until Element Is Visible  id=s-result-sort-select
    Select From List By Label  id=s-result-sort-select  ${order}
    # Wait Until Element Is Visible  //option[contains(.,"${order}") and @selected]
    # Wait Until Element Is Visible  //option[contains(.,"Prix&nbsp;: ${order}") and @selected]
    List Selection Should Be  id=s-result-sort-select  ${order}

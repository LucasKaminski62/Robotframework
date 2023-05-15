*** Settings ***
Documentation  Keyword connexion
Library  SeleniumLibrary


*** Keywords ***
Get Value0
    [Documentation]  Get value of the product price 0
    ${is_clickable}=    Run Keyword And Return Status    Wait Until Element Is Visible  //div[class='product unlocked enabled']  0.2s
    IF   ${is_clickable}==${True}  Click Element  id=product-price-0
    
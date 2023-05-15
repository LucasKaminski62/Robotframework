*** Settings ***
Documentation  A test suite to automate cookie clicker
Library  SeleniumLibrary
Resource  ../resources/homepage.resource
Variables  ../data/variable.py


*** Test Cases *** 
Test 1
    [Documentation]  A test case to automate cookie clicker
    Browser Init  https://orteil.dashnet.org/cookieclicker/
    Wait Until Element Is Visible  //p[contains(text(),'Consent')]  10s
    Click Element  //p[contains(text(),'Consent')]
    Wait Until Element Is Visible  id:langSelect-FR  10s
    Click Element  id:langSelect-FR
    Sleep   5s
    Wait Until Element Is Visible  id:bigCookie
    Wait Until Element Is Visible  id:product0

    WHILE  True
        FOR  ${product}  IN  @{LSTPROD}
            ${statut} =  Get Element Attribute  id:${product}  class
            ${statutStr} =  Get Length  ${statut}
            # Exit For Loop If  ${statutStr}=! ${Clikk}
            ${clickable} =  Evaluate  ${statutStr} == ${Clikk}
            IF  ${clickable}==${True}
                Click Element  id:${product}
            END
        END
        Click Element  id:bigCookie
    END
    Close All Browsers

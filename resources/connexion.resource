*** Settings ***
Documentation  Keyword connexion
Library  SeleniumLibrary


*** Keywords ***
Go To Login
    [Documentation]  Aller sur page de connexion
    Mouse Over  id=nav-link-accountList
    Click Element  id=nav-flyout-ya-signin

Logout
    [Documentation]  Se deconnecter
    Mouse Over  id=nav-link-accountList
    Click Element  id=nav-item-signout

Login
    [Documentation]  Se connecter
    [Arguments]  ${email}  ${password}  ${name}
    Wait Until Element Is Visible  id=ap_email
    Input Text  id=ap_email  ${email}
    Click Element  id=continue
    Wait Until Element Is Visible  id=ap_password
    Input Text  id=ap_password  ${password}
    Click Element  id=signInSubmit
    Wait Until Element Contains  id=nav-link-accountList  ${name}

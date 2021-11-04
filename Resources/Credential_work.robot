*** Settings ***
Library  RPA.Dialogs
Library           RPA.JSON
*** Keyword ***

Get Credential From User
    Add heading    Get Credential From user
    Add text input    email    label=E-mail address
    Add text input    password  label=Password
    ${result}=    Run dialog
    Log  ${result.email} ${result.password}
    Create Json File and Wirte data  ${result}
Create Json File and Wirte data
    [Arguments]  ${result}
#    &{before}=    Convert string to JSON   {"credentials": [{"username": ${result.email}}, {"password": ${result.password}}]}
    &{person}=    Create dictionary      username=${result.email}  password=${result.password}
#    &{after}=     Add to JSON    ${person}

    Save JSON to file    ${person}    valut.json
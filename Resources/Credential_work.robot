*** Settings ***
Library     Collections
Library  RPA.Dialogs
Library           RPA.JSON
Library    RPA.Robocorp.Vault


*** Keyword ***
Get Credential From User
    Add heading    Get Credential From user
    Add text input    email    label=E-mail address
    Add text input    password  label=Password
    ${result}=    Run dialog
    Log  ${result.email} ${result.password}
    Create Json File and Wirte data  ${result}
*** Keyword ***
Create Json File and Wirte data
    [Arguments]  ${result}
#    &{before}=    Convert string to JSON   {"credentials": [{"username": ${result.email}}, {"password": ${result.password}}]}
    &{person}=    Create dictionary      username=${result.email}  password=${result.password}
#    &{after}=     Add to JSON    ${person}

    Save JSON to file    ${person}    vault.json

*** Keyword ***
Get and log the value of the vault secrets using the Get Secret keyword
    Add heading    Get User Credentials
    Add text input    username    label=Username
    Add text input    password  label=Password
    ${dialog}=    Run dialog
    ${vault}=  Load JSON from file  vault.json
    set to dictionary    ${vault["credentials"]}    username=${dialog.username}
    set to dictionary    ${vault["credentials"]}    password=${dialog.password}
    ${json_new}=      evaluate        json.dumps(${vault})                 json
    Save JSON to file    ${json_new}    vault.json

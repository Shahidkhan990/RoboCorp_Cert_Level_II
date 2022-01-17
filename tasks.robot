# +
*** Settings ***
Documentation   This code is written by Shahid Khan, Completed this task for Robocorp Certification
...             This process will Order robots from robotsparebin industries
...             Save the receipt HTML in a pdf  and ake screenshot of robot and attach in pdf file
...             This process will take screenshot of robot and attach in pdf file
...             This process will zip the all reciepts


Library         RPA.HTTP
Library         Dialogs
Library         RPA.Browser.Selenium
Library         RPA.FileSystem
Library         RPA.Archive
Library         RPA.core.notebook
Variables       variables.py
Library         RPA.Tables
Library         RPA.PDF
Library         RPA.Robocloud.Secrets
Resource        Resources/Start_Robot_Work_From_Here.robot
Resource        Resources/Credential_work.robot




# +

*** Test Cases ***
ROBOCORP Certification Task
    #Get Credential From User
    Get and log the value of the vault secrets using the Get Secret keyword
    Start Order Processing Work From Here



# -



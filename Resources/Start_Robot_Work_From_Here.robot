*** Settings ***
Resource  DirectoryWork.robot
Resource  ExceptionHandling.robot
Resource  CsvFile_Work.robot
Resource  Creation_Of_Bots_And_Receipts.robot
Resource  VariableFile.robot
*** Keywords ***
Start Order Processing Work From Here
    Is Directory and File Exist
    Csv File Downloding To Directory
    ${Data_Table}  Get Data From Order CSV File and Return
    Order The Bot And Get The Receipt  ${Data_Table}
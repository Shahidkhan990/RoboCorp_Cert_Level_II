
*** Keywords ***
Get Data From Order CSV File and Return
    # read the csv file and return the table.
    ${Table}  Read Table from Csv  ${CSV_File_Name}  header=True
    Return From Keyword  ${Table}

*** Keywords ***
Csv File Downloding To Directory
    # download the order csv file
    Download  ${CSV_Url}  ${CSV_File_Name}
*** Settings ***
Documentation   Here i just want to download the file, if directory not exist then download first

*** Keywords ***
Is Directory and File Exist
    # emtpy the directory and then check the pdf and image directory exist if not then create the directories
    Remove File  ${orders_file}
    ${reciept_folder}=  Does Directory Exist  ${PDF_Dir}
    log  ${reciept_folder}
    ${robots_folder}=  Does Directory Exist  ${Image_Dir}
    log  ${robots_folder}
    IF    '${reciept_folder}'=='False'
    Create Directory  ${PDF_Dir}
    ELSE
    log  ${PDF_Dir} Directory Already Exists
    END
    IF    '${robots_folder}'=='False'
    Create Directory  ${Image_Dir}
    ELSE
    log  ${Image_Dir} Directory Already Exists
    END

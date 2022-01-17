*** Settings ***
Documentation   Here i just want to open the browser to start our challange

*** Keywords ***
Creating the PDF files and Create pdf zip file
    [Arguments]  ${PDF_File}  ${Image_File}  ${reciept_data}
    Html To Pdf  ${reciept_data}  ${PDF_Dir}${/}${PDF_File}
    Add Watermark Image To Pdf  ${Image_Dir}${/}${Image_File}  ${PDF_Dir}${/}${PDF_File}  ${PDF_Dir}${/}${PDF_File}
    Close PDF           ${PDF_Dir}${/}${PDF_FILE}
    Open PDF        ${PDF_Dir}${/}${PDF_FILE}
    @{myfiles}=       Create List     ${Image_Dir}${/}${Image_File}
    Add Files To PDF    ${myfiles}    ${PDF_Dir}${/}${PDF_FILE}     ${True}
    Close PDF           ${PDF_Dir}${/}${PDF_FILE}



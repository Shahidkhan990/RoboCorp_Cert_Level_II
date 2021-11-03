*** Settings ***
Documentation   Here i just want to open the browser to start our challange
Resource  ExceptionHandling.robot
Resource  PDF_And_Zip_Files.robot
Resource  FillTheForm.robot

*** Keywords ***
Order The Bot And Get The Receipt
    [Arguments]  ${table}
    Goto The Order URL Website
    FOR  ${row}  IN  @{table}
        Fill Data To Form  ${row}
        Check Exception if occured
        ${orderid}=  Get Text  //*[@id="receipt"]/p[1]
        Set Local Variable  ${PDF_File}  ${orderid}.pdf
        Set Local Variable  ${Image_File}  ${orderid}.png
        Capture Element Screenshot      //*[@id="robot-preview-image"]    ${Image_Dir}${/}${Image_File}
        ${reciept_data}=  Get Element Attribute  //div[@id="receipt"]  outerHTML
        Sleep  5 seconds
        Creating the PDF files and Create pdf zip file  ${PDF_File}  ${Image_File}  ${reciept_data}
        Sleep  5 seconds
        # click on the next order after creating the receipts
        Click Button  //button[@id="order-another"]
    END
    Bot Have Completed The Task Now Close The Browser
    # Zip the pdf folder
    Archive Folder With ZIP     ${PDF_Dir}  ${zip_file}   recursive=True  include=*.pdf

*** Keywords ***
Goto The Order URL Website
    # Open the Order processing website and maximize the browser
     Open Available Browser  ${URL_website}
     Maximize Browser Window


*** Keywords ***
Bot Have Completed The Task Now Close The Browser
    Close Browser

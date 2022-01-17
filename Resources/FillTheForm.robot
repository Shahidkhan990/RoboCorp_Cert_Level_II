*** Settings ***
Documentation   Here i just want to Fill the form




*** Keywords ***
Fill Data To Form
    # after reading the values from the csv file select the values from the head, body and leg
    # write the address and click on the preview button then click on order
    [Arguments]  ${row}
    # select the okay button on the loading of the page
    Wait Until Page Contains Element  //button[@class="btn btn-dark"]
    Click Button  //button[@class="btn btn-dark"]
    # select the head value
    Select From List By Value  //select[@name="head"]  ${row}[Head]
    # select the body value
    Click Element  //input[@value="${row}[Body]"]
    # input the leg value
    Input Text  //input[@placeholder="Enter the part number for the legs"]  ${row}[Legs]
    # input the address
    Input Text  //input[@name="address"]  ${row}[Address]
    # Preview the robot
    Click Button  //button[@id="preview"]
    Sleep  5 seconds
    # click on order
    Click Button    //*[@id="order"]

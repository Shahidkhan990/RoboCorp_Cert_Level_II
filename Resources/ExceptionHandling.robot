*** Settings ***
Documentation   Here i just want to handle exception handling if occure

*** Keywords ***
Check Exception if occured
    # If there is any server error or exception then it will again click on the Order button.
    # if there is no server error then it will end the loop.
    # after iteration there is again the server error then it will close the browser and end the process
    FOR  ${i}  IN RANGE  ${50}
            ${server_error}=  Is Element Visible  //div[@class="alert alert-danger"]
            Run Keyword If  '${server_error}'=='True'  Click Button  //button[@id="order"]
            Exit For Loop If  '${server_error}'=='False'
        END
        Run Keyword If  '${server_error}'=='True'  Close the browser

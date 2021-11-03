*** Variables ***
${CSV_Url}  https://robotsparebinindustries.com/orders.csv
${URL_website}  https://robotsparebinindustries.com/#/robot-order
${CSV_File_Name}  orders.csv
${orders_file}    ${CURDIR}${/}${CSV_File_Name}
${OUTPUT_DIR}  Reciepts
${Image_Dir}  ${CURDIR}${/}Images_robot
${PDF_Dir}  ${CURDIR}${/}PDF_reciepts
${zip_file}       ${CURDIR}${/}pdf_files_archived.zip
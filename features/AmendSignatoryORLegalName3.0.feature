@AmendSignatory @PCM @Regression
Feature: AmendSignatory
  As an authorised user,
  I want to be able to download, complete and upload a signed ACM Request Form through Digital Self Service,
  so that I can Amend the name or signature of your signatories.
  #-----------------------------------------------------------------------------------------------------------------------


  @SmokeTestingMockUI
  Scenario:Amend Signatory or Legal Name - Create and View service request
    Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
    When The user navigate to the "Amend Signatory or Legal Name" service request screen
    Then The application should display the "service request Header details" for "Amend Signatory or Legal Name"
      | Title       | Amend Signatory or Legal Name (AU)                    |
      | Description | Amend the name or signature of your signatories. |
    Then The application shows the "cancel" button
    Then The application should display the "Instructions to download and complete the form" for "Add User to Digital Channel"
      | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
      | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
      | instructions_step1.1_text   | Download the form by clicking the button below.                                                                                                                                                                                                        |
      | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
      | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
      | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
      | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
      | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
    Then The application should display the "download form button" for "Amend Signatory or Legal Name"
      | download_form | Download the Amend Signatory form |
    Then The user click on the Download Form button
    Then The application should allow user to select and upload one or more files from computer
      | filepath1 | //resources//input//Test-pdf.pdf    |
      | filepath2 | //resources//input//Test-pdf1.pdf   |
      | filepath3 | //resources//input//Test-Excel.xlsx |
    Then The application should display following fields "under Your Reference section"
      | field_name             |
      | Your_Reference_textbox |
    Then The application should display the "Your Reference section" for "Amend Signatory or Legal Name"
      | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    Then The application should display following fields "under Select Legal Entity section"
      | field_name                   |
      | Legal_Entity_select_dropdown |
      | Legal_Entity_search_icon     |
      | LegalEntity-field            |
    Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name service request"
      | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | NSWG |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "Amend Signatory or Legal Name SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "service request Header detailsin view mode" for "Amend Signatory or Legal Name SR"
      | Title       | Amend Signatory or Legal Name (AU)                    |
      | Description | Amend the name or signature of your signatories. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name SR"
      | Legal_Entity_Summary | Legal Entity |
      | Legal_Entity_Name    | Legal Entity |
      | Legal_Entity_Value   | NSWG         |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Amend Signatory or Legal Name SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Amend Signatory or Legal Name service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |

  @SmokeTestingMockUI
  Scenario:Amend Signatory or Legal Name - Create and Search service request
    Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
    When The user navigate to the "Amend Signatory or Legal Name" service request screen
    Then The application should display the "service request Header details" for "Amend Signatory or Legal Name"
      | Title       | Amend Signatory or Legal Name (AU)                    |
      | Description | Amend the name or signature of your signatories. |
    Then The application should allow user to select and upload one or more files from computer
      | filepath1 | //resources//input//Test-pdf.pdf    |
      | filepath2 | //resources//input//Test-pdf1.pdf   |
      | filepath3 | //resources//input//Test-Excel.xlsx |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    Then The user select a legal entity from the search legal entity pop up
     | legalEntity | NSWG |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request and selects it
    Then The application should display the "service request Header detailsin view mode" for "Amend Signatory or Legal Name SR"
      | Title       | Amend Signatory or Legal Name (AU)                    |
      | Description | Amend the name or signature of your signatories. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name SR"
      | Legal_Entity_Summary | Legal Entity |
      | Legal_Entity_Name    | Legal Entity |
      | Legal_Entity_Value   | NSWG         |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Amend Signatory or Legal Name SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Amend Signatory or Legal Name service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |


#    Scenario:Amend Signatory or Legal Name - Header and Description
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should display the "service request Header details" for "Amend Signatory or Legal Name"
#       | Title       | Amend Signatory or Legal Name                                                                                |
#       | Description | Amend the name or signature of your signatories.|
#     Then The application shows the "cancel" button



#     Scenario:Amend Signatory or Legal Name - Step 1: Download and Complete Content
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#  Then The application should display the "Instructions to download and complete the form" for "Add User to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#    # Then The user click on the Download Form button


#     Scenario:Amend Signatory or Legal Name - Display Your Reference section
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-Excel.xlsx |
#     Then The application should display following fields "under Your Reference section"
#       | field_name             |
#       | Your_Reference_textbox |
#     Then The application should display the "Your Reference section" for "Amend Signatory or Legal Name"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       #| Your_Reference_placeholder      | Enter a description to help you identify your request (for your own use)|
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     And The application should allow only valid characters in the reference field
#       | ValidData | test reference validation data 12-&',:;# |
#     And The application should not allow more than 40 characters in the reference field
#       | MoreThan40InputData    | more than 40 characters test by the DSSAutomationTesting team |
#       | MoreThan40AcceptedData | more than 40 characters test by the DSSA                      |
#     And The application should not allow unsupported characters in the reference field
#       | InvalidCharacters | `~!@$%^*()+={}[]\"?><,./ |

#     Scenario:Amend Signatory or Legal Name - Display the legal entity
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-Excel.xlsx |
#     Then The application should display following fields "under Your Reference section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |



#      Scenario:Amend Signatory or Legal Name - Select the legal entity from drop down
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |

#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Amend Signatory or Legal Name SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The user waiting to load "View details page"
#     Then The application should display the "service request Header detailsin view mode" for "Amend Signatory or Legal Name SR"
#       | Title       | Amend Signatory or Legal Name                                                                                |
#       | Description | Add authorised signatories to accounts with the option of nominating them as authorised persons and/or users for your digital channels. |
#     Then The application should display the "Summary Information" for "Amend Signatory or Legal Name service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |


#     Scenario:Amend Signatory or Legal Name - Select the legal entity from search pop-up
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | Health |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The user waiting to load "View details page"
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Amend Signatory or Legal Name SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The user waiting to load "View details page"
#     Then The application should display the "service request Header detailsin view mode" for "Amend Signatory or Legal Name SR"
#        | Title       | Amend Signatory or Legal Name                                                                                |
#       | Description | Add authorised signatories to accounts with the option of nominating them as authorised persons and/or users for your digital channels. |
#     Then The application should display the "Summary Information" for "Amend Signatory or Legal Name service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name SR"
#       | Legal_Entity_Summary | Legal Entity         |
#       | Legal_Entity_Name    | Legal Entity         |
#       | Legal_Entity_Value   | Department of Health |


#     Scenario:Amend Signatory or Legal Name -  Upload Form - Display Upload File Component
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should display following fields "under file upload component"
#       | field_name              |
#       | File_upload_header      |
#       | File_upload_icon        |
#       | File_upload_Drag&Drop   |
#       | File_upload_Browser     |
#       | File_upload_fileToolTip |
#     Then The application should display the "file upload component details" for "Amend Signatory or Legal Name service request"
#       | File_upload_header        | Step 2: Upload Completed Form & Required Documentation |
#       | File_upload_Drag&Drop_txt | Drag and drop your files here, or                      |
#   #   // TO DO not working
#   # Then The application should display the 'file tooltip text' as follows "title"
#   #   | File_upload_fileToolTip_txt | A file must not exceed 10MB and must be one of the following formats: .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. A maximum of 10 files can be uploaded. |



#     Scenario:Amend Signatory or Legal Name - Confirmation Pop-Up Message - View SR Details
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Amend Signatory or Legal Name SR"
#       | Title       | Amend Signatory or Legal Name                                                                                |
#       | Description | Add authorised signatories to accounts with the option of nominating them as authorised persons and/or users for your digital channels. |
#      Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Amend Signatory or Legal Name service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     #   | Summary_Info_YourReference_txt | Your Reference  |
#     Then The application should display the "Legal Entity details" for "Amend Signatory or Legal Name SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     When The user click on the "View Audit History" button
#     Then The application should display the "Audit History Pop-up details" for "Amend Signatory or Legal Name SR"
#       | SR_Audit_History_header | Service Request Audit History |
#       | SR_Audit_History_Date   | Date / Time                   |
#       | SR_Audit_History_Status | Request Status                |
#       | SR_Audit_History_User   | User                          |
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | SR_Audit_History_status | In Progress |
#     Then The application should display the "Comments and Supporting Documents section" for "Amend Signatory or Legal Name service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#


#     Scenario:Amend Signatory or Legal Name - Confirmation Pop-Up Message - OK
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The application shows "Cash Management Service Requests" screen


#      Scenario: Amend Signatory or Legal Name - Confirmation Pop-Up Message - Raise Another Service Request
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "Raise another Service Request" link
#     Then The application shows "Create Service Request" screen


#      Scenario: Amend Signatory or Legal Name - Multiple files upload
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf2.pdf   |
#       | filepath3 | //resources//input//Test-pdf3.pdf   |
#       | filepath4 | //resources//input//Test-pdf4.pdf   |
#       | filepath5 | //resources//input//Test-pdf5.pdf   |
#       | filepath6 | //resources//input//Test-pdf6.pdf   |
#       | filepath7 | //resources//input//Test-Excel.xlsx |
#       | filepath8 | //resources//input//Test-word.docx  |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Amend Signatory or Legal Name SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The application shows "Cash Management Service Requests" screen


#      Scenario: Amend Signatory or Legal Name - Duplicate files upload
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#       | filepath4 | //resources//input//Test-pdf.pdf  |
#       | filepath5 | //resources//input//Test-pdf5.pdf |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-pdf.pdf - A file with the same name already exists. |


#      Scenario: Amend Signatory or Legal Name - Mixed files upload
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#       | filepath4 | //resources//input//Test-webfont.woff |
#       | filepath5 | //resources//input//Compressed.zip |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-webfont.woff - File format must be one of .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. |
#    Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |       |
#       | fileRemoveIcon2 |        |
#       | File_Name1      | Test-pdf.pdf ( 444.82 KB ) |
#       | File_Name2      | Test-pdf2.pdf ( 444.82 KB ) |

#      Scenario: Amend Signatory or Legal Name - All Bad files upload
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-webfont.woff |
#       | filepath2 | //resources//input//Compressed.zip |
#       | filepath3 | //resources//input//Test-7z.7z|
#       | filepath4 | //resources//input//sample.rar |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-7z.7z - File format must be one of .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. |



#    Scenario:32 Amend Signatory or Legal Name - Submit Request - Submit with No File(s) Uploaded
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     And The user navigate to the "Amend Signatory or Legal Name" service request screen
#     When The user Clicks the "Submit" button
#     Then The application should display error message under "file upload" component
#       | error_message | A file has not been uploaded. Please upload at least one file to proceed. |


#     Scenario:Amend Signatory or Legal Name - Morethan 10 files
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1  | //resources//input//Test-pdf.pdf    |
#       | filepath2  | //resources//input//Test-pdf2.pdf   |
#       | filepath3  | //resources//input//Test-pdf3.pdf   |
#       | filepath4  | //resources//input//Test-pdf4.pdf   |
#       | filepath5  | //resources//input//Test-pdf5.pdf   |
#       | filepath6  | //resources//input//Test-rtf.rtf    |
#       | filepath7  | //resources//input//Test-Excel.xlsx |
#       | filepath8  | //resources//input//Test-word.docx  |
#       | filepath9  | //resources//input//Test-csv.csv    |
#       | filepat10  | //resources//input//Test-ppt.pptx   |
#       | filepath11 | //resources//input//Test-pdf1.pdf   |
#       | filepath11 | //resources//input//Test-pdf6.pdf   |
#       | filepath13 | //resources//input//Test-PNG.PNG    |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-JPG.JPG |
#       | filepath2 | //resources//input//Test-TIF.TIF |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-JPG.JPG - Maximum number of 10 files has been reached. |


#   #   Scenario:Amend Signatory or Legal Name - Morethan 10 MB file size
#   #   Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#   #   When The user navigate to the "Amend Signatory or Legal Name" service request screen
#   #   Then The application should allow user to select and upload one or more files from computer
#   #     | filepath1 | //resources//input//MoreThan10mb.xlsx |
#   #     | filepath2 | //resources//input//MoreThan10mb.xlsx |
#   #     | filepath3 | //resources//input//Test-pdf3.pdf     |
#   #   Then The application should display error message under "file-upload" component
#   #     | error_message | The following file(s) failed to upload: |
#   #   And The application should display error message under "file-upload-errorDetails" component
#   #     | error_message | MoreThan10mb.xls - Individual file size cannot exceed 10MB. |


#      Scenario: Amend Signatory or Legal Name - Without Legal Entity
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |

#     When The user click on the "Submit" button
#     Then The application should display error message under "Legal_Entity_error_msg" component
#       | error_message | Please select a Legal Entity. |


#    Scenario:Amend Signatory or Legal Name - Remove Uploaded File
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |       |
#       | fileRemoveIcon2 |        |
#       | File_Name1      | Test-pdf.pdf ( 444.82 KB ) |
#       | File_Name2      | Test-pdf2.pdf ( 444.82 KB ) |
#     When The user click on the "fileRemoveIcon1" button
#     Then The application does not show "files uploaded under fileupload" section




#    Scenario:Amend Signatory or Legal Name - User does not have email address
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#      And The user select a legal entity from the search legal entity pop up
#           | legalEntity | NSWG |
#     When The user Clicks the "Submit" button
#    Then The application shows "Manual email modal" dialog


#    Scenario:Amend Signatory or Legal Name - User does not enter an email address
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#      And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "" in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then The application should display error message in "email verification" dialog
#       | error_message | Please enter a valid email address |


#     Scenario:Amend Signatory or Legal Name - User enters invalid email address
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |

#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz." in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then The application should display error message in "email verification" dialog
#       | error_message | Please enter a valid email address |

#     Scenario:Amend Signatory or Legal Name - Closing the email modal
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |

#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz.com" in "EmailId" textbox
#     When The user clicks the 'X' icon
#     Then "Manual email" modal window must close


#    Scenario:Amend Signatory or Legal Name - Closing the email modal
#     Given I am an authorised user with permission to create an "Amend Signatory or Legal Name" service request
#     When The user navigate to the "Amend Signatory or Legal Name" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |

#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz.com" in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then "Manual email" modal window must close

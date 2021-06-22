@ManageBureau @PCM @Regression
Feature:  Manage Bureau (Payments)
  As an authorised user,
  I want to be able to download, complete and upload a signed ACM Request Form through Digital Self Service,
  so that user can Manage a Bureau Facility authorised to make Direct Entry payments on your behalf.
  #-----------------------------------------------------------------------------------------------------------------------


  @SmokeTestingMockUI
  Scenario: Manage Bureau (Payments) - Create and View service request
    Given I am an authorised user with permission to create an "Manage Bureau (Payments)" service request
    When The user navigate to the "Manage Bureau (Payments)" service request screen
    Then The application should display the "service request Header details" for "Manage Bureau (Payments)"
      | Title       | Manage Bureau Facility (Payments) (AU)          |
      | Description | Manage a Bureau Facility authorised to make Direct Entry payments on your behalf. |
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
    Then The application should display the "download form button" for "Manage Bureau (Payments)"
      | download_form | Download the ANZ Bureau lodgement form |
    Then The user click on the Download Form button
    Then The application should allow user to select and upload one or more files from computer
      | filepath1 | //resources//input//Test-pdf.pdf    |
      | filepath2 | //resources//input//Test-pdf1.pdf   |
      | filepath3 | //resources//input//Test-Excel.xlsx |
    Then The application should display following fields "under Your Reference section"
      | field_name             |
      | Your_Reference_textbox |
    Then The application should display the "Your Reference section" for "Manage Bureau (Payments)"
      | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    Then The application should display following fields "under Select Legal Entity section"
      | field_name                   |
      | Legal_Entity_select_dropdown |
      | Legal_Entity_search_icon     |
      | LegalEntity-field            |
    Then The application should display the "Legal Entity details" for "Manage Bureau (Payments) service request"
      | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
       | legalEntity | NSWG |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display following fields "Manage Bureau (Payments) SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "Manage Bureau (Payments) SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "service request Header detailsin view mode" for "Manage Bureau (Payments) SR"
      | Title       | Manage Bureau Facility (Payments) (AU)                  |
      | Description | Manage a Bureau Facility authorised to make Direct Entry payments on your behalf. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
   Then The application should display the "Legal Entity details" for "Manage Bureau (Payments) SR"
      | Legal_Entity_Summary | Legal Entity |
      | Legal_Entity_Name    | Legal Entity |
      | Legal_Entity_Value   | NSWG         |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Manage Bureau (Payments) SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Manage Bureau (Payments) service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |

 @ManageBPAYFacility @PCM.1 @Regression
  Scenario: Manage Bureau (Payments) - Create and Search service request
    Given I am an authorised user with permission to create an "Manage Bureau (Payments)" service request
    When The user navigate to the "Manage Bureau (Payments)" service request screen
    Then The application should display the "service request Header details" for "Manage Bureau (Payments)"
      | Title       | Manage Bureau Facility (Payments) (AU)                       |
      | Description | Manage a Bureau Facility authorised to make Direct Entry payments on your behalf. |
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
    Then The application should display the "service request Header detailsin view mode" for "Manage Bureau (Payments) SR"
      | Title       | Manage Bureau Facility (Payments) (AU)                       |
      | Description | Manage a Bureau Facility authorised to make Direct Entry payments on your behalf. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Legal Entity details" for "Manage Bureau (Payments) SR"
      | Legal_Entity_Summary | Legal Entity |
      | Legal_Entity_Name    | Legal Entity |
      | Legal_Entity_Value   | NSWG         |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Manage Bureau (Payments) SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Manage Bureau (Payments) service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |


@ASW_E2E
Feature: DSS-ASW-DSS E2E scripts to update the status
@addUser-requestPending
  Scenario: Creating case for Add User to Digital service
    Given I am an authorised user with permission to create a "Add User to Digital Channel" service request
    Given I am logging in as user "AUTODSS5" with permission to create "Add User to Digital Channel" service request
    When The user navigate to the "Add User to Digital Channel" service request screen
    Then The application should display following fields "Add User Service request"
      | field_name             |
      # | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The "responseId" for the "Add User" is detail is saved to a file
    Then I click on "Ok"
    Then User waits for '2' minutes
    Then The user searches the stored service request with request type "Add User" search req type "Channel User Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Add User" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add User SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
@pending-status
Scenario: ASW - Update Service Request status to Pending
    Given I am logging in to ASW to update the status of service request
    When User enters Service Request ID 'Request ID' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'
    Then User verify status is 'Open'
    Then User clicks the searched Work Item ID 'Case ID'
    Then User clicks Other Action Button and selects 'Pend Case' action
    Then User selects the date
    Then Enter comment 'pendingComment' in comment section 'noteText'
    Then Click 'Submit' Button
    Then User waits for '3' minutes
    When User enters Service Request ID 'Request ID' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'        
    Then User verify status is 'Pending-RequestPended'

@updateMoreInfo-asw
Scenario: ASW - Update Service Request With More Information Required
Given I am logging in as user "AUTODSS5" with permission to create "Add User to Digital Channel" service request
Then The user searches the stored service request with request type "Add User" search req type "Channel User Maintenance" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "add user service request"
      | Comment_Section_header   | Comments and Supporting Documents                                                            |
      | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentTitle  | New comment / attachment                                                                     |
      | additional_Comment-field | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
    Then The application should display following fields "under file upload component"
      | field_name                        |
      | File_upload_icon                  |
      | File_upload_Drag&Drop             |
      | File_upload_Browser               |
      | File_upload_fileToolTip           |
      | additional_upload_fileToolTip_txt |
    And The application should display the "Submit" button
    When The user entered "Comments provided" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "DDR service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | ANZ                        |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |
    Then The application should display the "request status as More Information Required" for "DDR SR"
            | Summary_Info_RequestStatus_value | More Information Required |
    When The user Clicks the "Close" button
    Then User waits for '3' minutes       
    Then The user searches the stored service request with request type "Add User" search req type "Channel User Maintenance" and selects it     
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |        
#@VerifyStatus 
Scenario: ASW - Verify The Case-ID status
    Given I am logging in to ASW to update the status of service request
    When User enters Service Request ID 'TGAAAU-000122201' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'        
    Then User verify status is 'Open'            

#---------------Update the Serice Request as Completed--------------------------------

@RequestCompletedStatus 
Scenario: ASW - Update Service Request status to Pending
    Given I am logging in to ASW to update the status of service request
    When User enters Service Request ID 'TGAAAU-000122201' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'
    Then User verify status is 'Open'
    Then User clicks the searched Work Item ID 'I-55932'
    Then User clicks Other Action Button and selects 'Investigate Step' action
    Then User selects Resolve Service Request Check Box
    Then Enter comment 'resolutionComment' in comment section 'resolutionDetails'
    Then User choose reason for Request Completed
    Then User uncheck Is Notification Required Check Box
    Then Click 'Complete Step' Button        

@RequestCompleted-view
  Scenario: Viewing case, checking the status for Add user
    Given I am logging in as user "AUTODSS5" with permission to create "Add User to Digital Channel" service request
    Then The user searches the stored service request with request type "Add User" search req type "Channel User Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Add User" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add User SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Completed in Audit history" for "service request"
      | AuditHistoryStatus | Completed |    

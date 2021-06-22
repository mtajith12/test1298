Feature: DSS-ASW E2E scripts to update the status
@dss-create-SR-Without-ImpInfoField
  Scenario Outline: DSS - Creating Service Request which goes to ASW from Digital service
    Given I am an authorised user with permission to create a "<service_request>" service request
    When I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    When The user navigate to the "<service_request>" service request screen    
    Then The application should display following fields "<service_request>"
      | field_name             |
      # | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      #| importantInfo_checkbox |
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
    Then The "responseId" for the "<request_type>" is detail is saved to a file
    Then I click on "Ok"
    
    Examples:
    | service_request                                     | request_type                                         |    
    | Amend Digital Channel Details                       | Amend Digital Channel                                |
    | Close Digital Channel                               | Close Digital Channel                                |
    | Amend Billing Details                               | Amend Billing Details                                |
    | Delete User from Digital Channel                    | Delete User                                          |
    | Delete Account from Digital Channel                 | Delete Account                                       |
    | Add Legal Entity to Digital Channel                 | Add Legal Entity to Digital Channel                  |
    | Amend Legal Entity on Digital Channel               | Amend Legal Entity on Digital Channel                |
    | Delete Legal Entity from Digital Channel            | Delete Legal Entity from Digital Channel             |
    | Close Account                                       | Close Account                                        |
    | Amend Statement Address                             | Amend Statement Address                              |
    | Amend Legal Entity Name                             | Amend Legal Entity Name                              |
    | Amend Legal Entity Administrator/Liquidator/Receiver| Amend Legal Entity Administrator/Liquidator/Receiver |
    | Amend Group Mandate                                 | Amend Group Mandate                                  |
    | Manage BPAY Facility                                | Manage BPAY Facility                                 |
    | Manage Bureau Facility (Payments)                   | Manage Bureau                                        |    
    | Amend Signatory or Legal Name                       | Amend Signatory or Legal Name                        |
    | Delete Signatory                                    | Delete Signatory                                     |


@dss-create-SR-With-ImpInfoField
  Scenario Outline: DSS - Creating Service Request which goes to ASW from Digital service
    Given I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    When The user navigate to the "<service_request>" service request screen    
    Then The application should display following fields "<service_request>"
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
    Then The "responseId" for the "<request_type>" is detail is saved to a file
    Then I click on "Ok"
    
    Examples:
    | service_request                  | request_type                     |
    | Add User to Digital Channel      | Add User                         |    
    | Amend User of Digital Channel    | Amend User                       |
    | Add Account to Digital Channel   | Add Account to Digital Channel   |
    | Amend Account on Digital Channel | Amend Account                    |
    | Add Loan Deal to Digital Channel | Add Loan Deal to Digital Channel |
    | Open Account                     | Open Account                     |
    | Add Signatory                    | Add Signatory                    |


@view-complete-servicerequest-details-InProgress
  Scenario Outline: DSS - Viewing Audit History and checking the status for Serive Request
    Given I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    Then The user searches the stored service request with request type "<service_request>" search req type "Channel User Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "<request_id>" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "<view_details>"
      #| Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |    

Examples:
| service_request                          | request_id                               | view_details                             |
| Add User                                 | Add User                                 | Add User SR                              |
| Amend Digital Channel                    | Amend Digital Channel                    | Amend Digital Channel Details            |     
| Amend User                               | Amend User                               | Amend User SR                            | 
| Add Account to Digital Channel           | Add Account to Digital Channel           | Add Account to digital channel SR        |
| Amend Account                            | Amend Account                            | Amend account on digital channel SR      |
| Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel SR      |
| Open Account                             | Open Account                             | open Account SR                          |
| Close Digital Channel                    | Close Digital Channel                    | Close digital Channel                    |
| Amend Billing Details                    | Amend Billing Details                    | Amend billin details                     |
| Delete User                              | Delete User                              | Delete User from digital channel         |
| Delete Account                           | Delete Account                           | Delete Account from digital channel      |
| Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      |
| Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    |
| Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel |

@asw-update-status-pending 
Scenario Outline: ASW - Update Service Request status to Pending
    Given I am logging in to ASW to update the status of service request
    When User enters Service Request ID '<request_id>' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'
    Then User verify status is 'Open'
    Then User clicks the searched Work Item ID 'I-55932'
    Then User clicks Other Action Button and selects 'Pend Case' action
    Then User selects the date
    Then Enter comment 'pendingComment' in comment section 'noteText'
    Then Click 'Submit' Button

Examples:
 | request_id                               | 
 | Add User                                 | 
 | Amend Digital Channel                    | 
 | Amend User                               |
 | Add Account to Digital Channel           |
 | Amend Account                            |
 | Add Loan Deal to Digital Channel         |
 | Open Account                             |
 | Close Digital Channel                    |
 | Amend Billing Details                    |
 | Delete User                              |
 | Delete Account                           |
 | Add Legal Entity to Digital Channel      |
 | Delete Legal Entity from Digital Channel |
 | Amend Legal Entity on Digital Channel    |

@dss-updateMoreInfo
Scenario Outline: DSS - Update Service Request With More Information Required
Given I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    Then The user searches the stored service request with request type "<service_request>" search req type "Channel User Maintenance" and selects it
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
    #Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
     # | Date        | 19/07/2019 01:37:32        |
      #| Added by    | ANZ                        |
      #| Attachments | Test-pdf.pdf ( 444.82 KB ) |
    Then The application should display the "request status as More Information Required" for "DDR SR"
            | Summary_Info_RequestStatus_value | More Information Required |
    When The user Clicks the "Close" button    

Examples:
| service_request                          | request_id                               | view_details                             |
| Add User                                 | Add User                                 | Add User SR                              |
| Amend Digital Channel                    | Amend Digital Channel                    | Amend Digital Channel Details            |     
| Amend User                               | Amend User                               | Amend User SR                            | 
| Add Account to Digital Channel           | Add Account to Digital Channel           | Add Account to digital channel SR        |
| Amend Account                            | Amend Account                            | Amend account on digital channel SR      |
| Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel SR      |
| Open Account                             | Open Account                             | open Account SR                          |
| Close Digital Channel                    | Close Digital Channel                    | Close digital Channel                    |
| Amend Billing Details                    | Amend Billing Details                    | Amend billin details                     |
| Delete User                              | Delete User                              | Delete User from digital channel         |
| Delete Account                           | Delete Account                           | Delete Account from digital channel      |
| Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      |
| Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    |
| Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel |

@asw-update-SR-CompletedStatus 
Scenario Outline: ASW - Update Service Request status to completed
    Given I am logging in to ASW to update the status of service request
    When User enters Service Request ID '<request_id>' in Search Box 'inputSearch'
    Then User clicks search Button 'searchButton'
    Then User verify status is 'Open'
    Then User clicks the searched Work Item ID 'I-55932'
    Then User clicks Other Action Button and selects 'Investigate Step' action
    Then User selects Resolve Service Request Check Box
    Then Enter comment 'resolutionComment' in comment section 'resolutionDetails'
    Then User choose reason for Request Completed
    Then User uncheck Is Notification Required Check Box
    Then Click 'Complete Step' Button    

Examples:
 | request_id                               | 
 | Add User                                 | 
 | Amend Digital Channel                    | 
 | Amend User                               |
 | Add Account to Digital Channel           |
 | Amend Account                            |
 | Add Loan Deal to Digital Channel         |
 | Open Account                             |
 | Close Digital Channel                    |
 | Amend Billing Details                    |
 | Delete User                              |
 | Delete Account                           |
 | Add Legal Entity to Digital Channel      |
 | Delete Legal Entity from Digital Channel |
 | Amend Legal Entity on Digital Channel    |

 @view-servicerequest-details-completed
  Scenario Outline: DSS - verify the status for Service Request as completed on details page
    Given I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    Then The user searches the stored service request with request type "<service_request>" search req type "Channel User Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "<request_id>" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "<view_details>"
      #| Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Completed |    

Examples:
| service_request                          | request_id                               | view_details                             |
| Add User                                 | Add User                                 | Add User SR                              |
| Amend Digital Channel                    | Amend Digital Channel                    | Amend Digital Channel Details            |     
| Amend User                               | Amend User                               | Amend User SR                            | 
| Add Account to Digital Channel           | Add Account to Digital Channel           | Add Account to digital channel SR        |
| Amend Account                            | Amend Account                            | Amend account on digital channel SR      |
| Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel SR      |
| Open Account                             | Open Account                             | open Account SR                          |
| Close Digital Channel                    | Close Digital Channel                    | Close digital Channel                    |
| Amend Billing Details                    | Amend Billing Details                    | Amend billin details                     |
| Delete User                              | Delete User                              | Delete User from digital channel         |
| Delete Account                           | Delete Account                           | Delete Account from digital channel      |
| Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      | Add Legal Entity to Digital Channel      |
| Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    | Amend Legal Entity on Digital Channel    |
| Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel | Delete Legal Entity from Digital Channel |

# Not all the service Request applicable for Reopen
@Reopen-completedServiceRequest
Scenario Outline: DSS - Reopening the Eligible Service Request
Given I am logging in as user "AUTODSS6" with permission to create "<service_request>" service request
    Then The user searches the stored service request with request type "<service_request>" search req type "Channel User Maintenance" and selects it
    Then The application should display the "updated status" for "DDR service request"
      | Summary_Info_RequestStatus_txt   | Request Status |
      | Summary_Info_RequestStatus_value | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    When The user select the "Further Investigation Required" from "reopenReasonType" drop down
    Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
    #When The user entered "test@anz.com" in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "Confirmation pop-up" for "reopen submitted request"
      | reopen_submit_confirm_msg1 | Your Service Request has been |
      | reopen_submit_confirm_msg2 | Reopened.                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user Clicks the "Ok" button

Examples:
| service_request                          | request_id                               | view_details                             |
| Add User                                 | Add User                                 | Add User SR                              |
| Amend Digital Channel                    | Amend Digital Channel                    | Amend Digital Channel Details            |     
| Add Account to Digital Channel           | Add Account to Digital Channel           | Add Account to digital channel SR        |
| Amend Account                            | Amend Account                            | Amend account on digital channel SR      |
| Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel SR      |
| Open Account                             | Open Account                             | open Account SR                          |
| Close Digital Channel                    | Close Digital Channel                    | Close digital Channel                    |
| Amend Billing Details                    | Amend Billing Details                    | Amend billin details                     |
| Delete User                              | Delete User                              | Delete User from digital channel         |
| Delete Account						               | Delete Account                           | Delete Account from digital channel      |
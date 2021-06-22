@isRestricted
Feature: is Restricted
  User should able to initiate new Recall Payment from your nominated accounts

  @isRestricted
  Scenario Outline: DSS - Creating Service Request which goes to ASW from Digital service
    Given I am logging in as user "<user>" with permission to create "<service_request>" service request
    When The user navigate to the "<service_request>" service request screen
    Then The application should display following fields "Add User Service request"
      | field_name             |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
   Then The application should allow user to select and upload one or more files from computer
      | filepath0 | //resources//input//Test-pdf.pdf  |
      | filepath1 | //resources//input//Test-pdf1.pdf |
      | filepath2 | //resources//input//Test-pdf2.pdf |
    Then The application should display the "uploaded files under" the "file upload section"
      | fileRemoveIcon1 |                             |
      | fileRemoveIcon2 |                             |
      | File_Name1      | Test-pdf1.pdf ( 444.82 KB )  |
      | File_Name2      | Test-pdf2.pdf ( 444.82 KB ) |
      | fileRemoveIcon3 |                             |
      | File_Name3      | Test-pdf.pdf ( 444.82 KB )  |
    Then I click on "isRestricted1"
    Then I click on "isRestricted2"
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
      | user     | service_request             | request_type |
      | AUTODSS5 | Add User to Digital Channel | Add User     |
  #| DSSUSR4                  | Amend User of Digital Channel    | Amend User                       |
  #| DSSUSR4               | Add Account to Digital Channel   | Add Account to Digital Channel   |
  #| DSSUSR4                 | Amend Account on Digital Channel | Amend Account                    |
  #| DSSUSR4                  | Add Loan Deal to Digital Channel | Add Loan Deal to Digital Channel |



  @isRestricted
  Scenario Outline: DSS - Viewing Audit History and checking the status for Serive Request
    Given I am logging in as user "<user>" with permission to create "<service_request>" service request
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
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


    Examples:
      | user     | service_request | request_id | view_details |
      | AUTODSS5 | Add User        | Add User   | Add User SR  |
#| Amend User        | Amend User                               | Amend User SR                            |
#| service_request   | Add Account to Digital Channel           | Add Account to Digital Channel           | Add Account to digital channel SR        |
#| service_request   | Amend Account                            | Amend Account                            | Amend account on digital channel SR      |
#| service_request   | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel         | Add Loan Deal to Digital Channel SR      |
#| service_request   | Open Account                             | Open Account                             | open Account SR                          |

@shakeout-SIT
Feature: SIT Shakeout


  @shakeout-online
  Scenario: Clearing the service request details from the previous automation run
    Given The previously stored service request values are cleared in the file


  @shakeout-Trace1 @shakeout-online
  Scenario: Creating case for TTR using online transaction search
    Given I am logging in as user "AUTODSS5" with permission to create "Trace a Transaction" service request
    When The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount    |               |
      | transtype | Credit        |
      | PostDate  | March 9, 2019 |
    Then The count of "Transaction search result" should be "14"
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account,Transaction details" for "TraceTransaction on review page"
      | AccountHeaderLabel          | Account Details  |
      | AccountName                 | LE COMPANY SIT 5 |
      | AccountDefaultCurrency      | AUD              |
      | TrnstnGridHedr_Date         | Post Date        |
      | TrnstnGridHedr_Amount       | Amount           |
      | TrnstnGridHedr_Debit/Credit | Debit/Credit     |
      | TrnstnGridHedr_Narrative    | Narrative        |
      | TrnstnGridHedr_Auxdom       | Auxdom           |
      | TrnstnGridHedr_TranType     | Tran Type        |
      | TrnstnGridHedr_Traceline    | Traceline        |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Trace Transaction" and selects it
    Then The application should display the "Service Request Header,Summary Information,Account,Important Information and Transaction " for "Trace a Transaction in View mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                       |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
      | Summary_Info_header          | Summary Information                                                                                          |
      | Summary_Info_RequestID_txt   | Request ID                                                                                                   |
      | Summary_Info_Requestedon_txt | Requested on                                                                                                 |
      | Summary_Info_Requestedby_txt | Requested by                                                                                                 |
      | Important_Information        | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.    |
      | AccountHeaderLabel           | Account Details                                                                                              |
      | AccountName                  | LE COMPANY SIT 5                                                                                             |
      | AccountDefaultCurrency       | AUD                                                                                                          |
      | TrnstnGridHedr_Date          | Post Date                                                                                                    |
      | TrnstnGridHedr_Amount        | Amount                                                                                                       |
      | TrnstnGridHedr_Debit/Credit  | Debit/Credit                                                                                                 |
      | TrnstnGridHedr_Narrative     | Narrative                                                                                                    |
      | TrnstnGridHedr_Auxdom        | Auxdom                                                                                                       |
      | TrnstnGridHedr_TranType      | Tran Type                                                                                                    |
      | TrnstnGridHedr_Traceline     | Traceline                                                                                                    |
    # | searchResults_Date            | Mar 09, 2019                                                                                                 |
    # | searchResults_Amount          | 2,204.00                                                                                                     |
    # | searchResults_DebitCreditType | Dr                                                                                                           |
    # | searchResults_Narrative       | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00                                                            |
    # | searchResults_TranType        | P PAYMENT                                                                                                    |
    # | searchResults_Auxdom          | 0000000302                                                                                                   |
    # | searchResults_TraceLine       | 22040155CX20                                                                                                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |



  @shakeout-Tracebulk @shakeout-online
  Scenario: Creating case for TTR using online transaction with Bulk Transaction
    Given I am logging in as user "AUTODSS5" with permission to create "Trace a Transaction" service request
    When The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount    |               |
      | transtype | Credit        |
      | PostDate  | March 9, 2019 |
    Then The count of "Transaction search result" should be "9"
    When The user select a "Transaction_Results_Row2" by clicking on the search result Grid
    Then The user Clicks the "bulkTransactionCheckBox" checkbox
    Then The application should display following fields "SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "984321.11" into the "beneficiaryAmount" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                       |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display following fields "Trace a Transaction SR Beneficiary Details"
      | field_name                |            |
      | beneficiaryDetails_Header |            |
      | beneficiaryAccountName    | ABC INC    |
      | beneficiaryBsb            | 234561     |
      | beneficiaryAccount        | 324342432  |
      | beneficiaryAmount         | 984,321.11 |
    When The user click on the "importantInformationCheckBox" button
    Then The application should display the "Important Information" for "Trace a Transaction Service Request"
      | imp_info_header | Important Information |
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Trace Transaction" and selects it
    Then The application should display the "Service Request Header,Summary Information and Beneficiary Details" for "Trace a Transaction"
      | TraceTransaction_Title         | Trace Transaction (AU)                                                                                       |
      | TraceTransaction_Description   | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
      | Summary_Info_header            | Summary Information                                                                                          |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                   |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                 |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                 |
      | Summary_Info_RequestStatus_txt | Request Status                                                                                               |
    Then The application should display following fields "Trace a Transaction  SR Beneficiary Details"
      | field_name                |            |
      | beneficiaryDetails_Header |            |
      | beneficiaryAccountName    | ABC INC    |
      | beneficiaryBsb            | 234561     |
      | beneficiaryAccount        | 324342432  |
      | beneficiaryAmount         | 984,321.11 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-searchttr @shakeout-online
  Scenario: validating different search criteria for transactions
    Given I am logging in as user "AUTODSS5" with permission to create "Trace a Transaction" service request
    When The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    | 1/10000                     |
      | transtype |                             |
      | PostDate  | March 1, 2019/March 9, 2019 |
    Then The count of "Transaction search result" should be "14"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount    | 60000         |
      | transtype | Credit        |
      | PostDate  | March 9, 2019 |
    #If pointed to stub search filter won't work and count will always 14
    Then The count of "Transaction search result" should be "14"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount    | 90000/99000   |
      | transtype |               |
      | PostDate  | March 9, 2019 |
    #If pointed to stub search filter won't work and count will always 14
    Then The count of "Transaction search result" should be "14"

  #@shakeout-Trace-ExcludeTrns
  #e2e2Does'tHaveaccount
  Scenario: Trace transaction - Check exclude transaction
    Given I am logging in as user "AUTODSS5" with permission to create "Trace a Transaction" service request
    When The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "JUSSEAUME HOLDING MANAGEMENT GENER" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @shakeout-adduser
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
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Add User" is detail is saved to a file
    Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel User Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Add User SR"
  #   | Important_Information          | Product Fee Schedule for any Fee and/or Charges that may apply to this service. that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-openAccount
  Scenario: Creating case for Open Account
    Given I am logging in as user "AUTODSS5" with permission to create "Open Account" service request
    When The user navigate to the "Open Account" service request screen
    Then The application should display following fields "Open Account"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
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
    Then The "responseId" for the "Open Account" is detail is saved to a file
    Then I click on "Ok"
  # Then The user searches stored service request with request type "Open Account" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "open Account SR"
  #   | Important_Information          | Product Fee Schedule for any Fee and/or Charges that may apply to this service. that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |




  @shakeout-AddSignatory
  Scenario: Creating case for Add Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Add Signatory" service request
    When The user navigate to the "Add Signatory" service request screen
    Then The application should display following fields "Add Signatory"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
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
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Add Signatory" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Manage Authorised Person" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Add Signatory SR"
  #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |



  @shakeout-AddAccounttoDigitalChannel @sit1
  Scenario: Creating case for Add Account to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Account to Digital Channel" service request
    When The user navigate to the "Add Account to Digital Channel" service request screen
    Then The application should display following fields "Add Account to Digital Channel"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
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
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Add Account to Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel Account Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Add Account to digital channel SR"
  #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendGroupMandate
  Scenario: Creating case for Amend Group Mandate
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Group Mandate" service request
    When The user navigate to the "Amend Group Mandate" service request screen
    Then The application should display following fields "Amend Group Mandate"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Group Mandate" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Group Mandate" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend Group Mandate"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendSignatory
  Scenario: Creating case for Amend Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Signatory" service request
    When The user navigate to the "Amend Signatory or Legal Name" service request screen
    Then The application should display following fields "Amend Signatory"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Signatory" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Manage Authorised Person" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend Signatory"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendUserofDigitalChannel
  Scenario: Creating case for Amend User of Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend User of Digital Channel" service request
    When The user navigate to the "Amend User of Digital Channel" service request screen
    Then The application should display following fields "Amend User of Digital Channel"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
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
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend User" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel User Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend User SR"
  #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendAccountonDigitalChannel
  Scenario: Creating case for Amend Account on Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Account on Digital Channel" service request
    When The user navigate to the "Amend Account on Digital Channel" service request screen
    Then The application should display following fields "Amend Account on Digital Channel"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
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
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Account" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel Account Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend account on digital channel SR"
  #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendBillingDetails
  Scenario: Creating case for Amend Billing Details
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Billing Details" service request
    When The user navigate to the "Amend Billing Details" service request screen
    Then The application should display following fields "Amend Billing Details"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Billing Details" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Billing Details" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend billin details"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |


  @shakeout-AmendDigitalChannelDetails
  Scenario: Creating case for Amend Digital Channel Details
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Digital Channel Details" service request
    When The user navigate to the "Amend Digital Channel Details" service request screen
    Then The application should display following fields "Amend Digital Channel Details"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Channel Details" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend Digital Channel Details"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-CloseAccount
  Scenario: Creating case for Close Account
    Given I am logging in as user "AUTODSS5" with permission to create "Close Account" service request
    When The user navigate to the "Close Account" service request screen
    Then The application should display following fields "Close Account"
      | field_name         |
      | dowload_form       |
      | browse_upload      |
      | your_reference     |
      | AccountHeaderLabel |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Close Account" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Close Account" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Close Account"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-CloseDigitalChannel
  Scenario: Creating case for Close Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Close Digital Channel" service request
    When The user navigate to the "Close Digital Channel" service request screen
    Then The application should display following fields "Close Digital Channel"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Close Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Close Channel" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Close digital Channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |



  @shakeout-DeleteSignatory
  Scenario: Creating case for Delete Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Signatory" service request
    When The user navigate to the "Delete Signatory" service request screen
    Then The application should display following fields "Delete Signatory"
      | field_name     |
      | dowload_form   |
      | browse_upload  |
      | your_reference |
    # | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Delete Signatory" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Manage Authorised Person" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Delete Signatory"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  #  @shakeout-DeleteSignatory @ForReject
  #   Scenario: Creating case for Delete Signatory
  #     Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
  #     When The user navigate to the "Delete Signatory" service request screen
  #     Then The application should display following fields "Delete Signatory"
  #       | field_name           |
  #       | dowload_form         |
  #       | browse_upload        |
  #       | your_reference       |
  #       | legalEntity_dropdown |
  #     Then The application should allow user to select and upload single file
  #       | filepath | //resources//input//Test-pdf.pdf |
  #     Then The user enter the following text in corresponding textboxes
  #       | field_name     | field_value |
  #       | your_reference | testpurpose |
  #     #Then The user select "AutoLegal1" from "legalEntity_dropdown"
  #     Then The user select a legal entity from the search legal entity pop up
  #       | legalEntity | AutoLegal1 |
  #     Then I click on "Submit"
  #     Then The application should display following fields "Add User SR confirmation pop-up"
  #       | field_name                 |
  #       | request_status             |
  #       | requestId                  |
  #       | view_request_link          |
  #       | raise_another_request_link |
  #     #Then The request id is stored from the element "responseId"
  #     Then The "responseId" for the "Delete Signatory Reject" is detail is saved to a file

  # @shakeout-DeleteUserfromDigitalChannel
  # Scenario: Creating case for Delete User from Digital Channel
  #   Given I am logging in as user "AUTODSS5" with permission to create "Delete User from Digital Channel" service request
  #   When The user navigate to the "Delete User from Digital Channel" service request screen
  #   Then The application should display following fields "Delete User from Digital Channel"
  #     | field_name           |
  #     | dowload_form         |
  #     | browse_upload        |
  #     | your_reference       |
  #     | legalEntity_dropdown |
  #   Then The application should allow user to select and upload single file
  #     | filepath | //resources//input//Test-pdf.pdf |
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | your_reference | testpurpose |
  #   #Then The user select "AutoLegal1" from "legalEntity_dropdown"
  #   Then The user select a legal entity from the search legal entity pop up
  #     | legalEntity | AutoLegal1 |
  #   Then I click on "Submit"
  #   Then The application should display following fields "Add User SR confirmation pop-up"
  #     | field_name                 |
  #     | request_status             |
  #     | requestId                  |
  #     | view_request_link          |
  #     | raise_another_request_link |
  #   #Then The request id is stored from the element "responseId"
  #   Then The "responseId" for the "Delete User" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel User Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Delete User form digital channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  #  @shakeout-DeleteUserfromDigitalChannel @rejectPcm @jj
  #   Scenario: Creating case for Delete User from Digital Channel for rejection
  #     Given I am logging in as token user "AUTODSS8" with permission to create "Delete User from Digital Channel" service request
  #     When The user navigate to the "Delete User from Digital Channel" service request screen
  #     Then The application should display following fields "Delete User from Digital Channel"
  #       | field_name           |
  #       | dowload_form         |
  #       | browse_upload        |
  #       | your_reference       |
  #       | legalEntity_dropdown |
  #     Then The application should allow user to select and upload single file
  #       | filepath | //resources//input//Test-pdf.pdf |
  #     Then The user enter the following text in corresponding textboxes
  #       | field_name     | field_value |
  #       | your_reference | testpurpose |
  #     #Then The user select "AutoLegal1" from "legalEntity_dropdown"
  #     Then The user select a legal entity from the search legal entity pop up
  #       | legalEntity | AutoLegal1 |
  #     Then I click on "Submit"
  #     Then The application should display following fields "Add User SR confirmation pop-up"
  #       | field_name                 |
  #       | request_status             |
  #       | requestId                  |
  #       | view_request_link          |
  #       | raise_another_request_link |
  #     #Then The request id is stored from the element "responseId"
  #     Then The "responseId" for the "Delete User reject" is detail is saved to a file

  @shakeout-DeleteAccountfromDigitalChannel
  Scenario: Creating case for Delete Account from Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Account from Digital Channel" service request
    When The user navigate to the "Delete Account from Digital Channel" service request screen
    Then The application should display following fields "Delete Account from Digital Channel"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Delete Account" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Channel Account Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Delete Account from digital channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendLegalEntityName
  Scenario: Creating case for Amend Legal Entity Name
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity Name" service request
    When The user navigate to the "Amend Legal Entity Name" service request screen
    Then The application should display following fields "Amend Legal Entity Name"
      | field_name     |
      | dowload_form   |
      | browse_upload  |
      | your_reference |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Legal Entity Name" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Legal Entity" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend legal entity name"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendStatementAddress
  Scenario: Creating case for Amend Statement Address
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Statement Address" service request
    When The user navigate to the "Amend Statement Address" service request screen
    Then The application should display following fields "Amend Statement Address"
      | field_name         |
      | dowload_form       |
      | browse_upload      |
      | your_reference     |
      | AccountHeaderLabel |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Statement Address" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Statement Address" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Amend statement address"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-AmendLegalEntityAdministrator/Liquidator/Receiver
  Scenario: Creating case for Amend Legal Entity Administrator/Liquidator/Receiver
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity Administrator/Liquidator/Receiver" service request
    When The user navigate to the "Amend Legal Entity Administrator/Liquidator/Receiver" service request screen
    Then The application should display following fields "Amend Legal Entity Administrator/Liquidator/Receiver"
      | field_name         |
      | dowload_form       |
      | browse_upload      |
      | your_reference     |
      | AccountHeaderLabel |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Legal Entity Administrator" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Amend Legal Entity" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "AmendLegalEntityAdministrator/Liquidator/Receiver"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-orderChequeBook
  Scenario: User should able to initiate new Order Cheque Book Request
    Given I am logging in as user "AUTODSS5" with permission to create "Order Cheque Book" service request
    When The user navigated to the "Order Cheque Book" service request screen
    When The user types Account Name "MELLING TRADING PROFESSIONAL GENERA" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display following fields "Cheque Book Details section"
      | field_name               |
      | NumberofBooks            |
      | BookSize                 |
      | OrderChequeMailingTitle1 |
      | personalizationLine2     |
      | personalizationLine3     |
      | personalizationLine4     |
      | mailingTitle2            |
    Then The user select the "2" from "NumberofBooks" drop down
    Then The user select the "50" from "BookSize" drop down
    And I am entering below detail in "Order Cheque Book" section
      | Attention To | Attention@test.com                    |
      | Line3        | incididunt ut labore et dolore magna  |
      | Line4        | aliqua. Ut enim ad minim veniam, quis |
    And The user Clicks the "Review & Submit" button
    Then The application should display following fields "Order Cheque Book submission Review Page"
      | field_name              |
      | accountContainer        |
      | chqBookDetailsContainer |
      | Cancel                  |
      | previous                |
      | submit                  |
    When The user Clicks the "Previous" button
    Then The application shows previously entered details
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application should display following fields "Order Cheque Book SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    And The user Clicks the "Submit" button
    Then The "responseId" for the "Order Cheque Book" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Order Cheque Book" search req type "Order Cheque Book" and selects it
    Then The application should display following fields "view service request screen"
      | field_name               |
      | NumberofBooks            |
      | BookSize                 |
      | OrderChequeMailingTitle1 |
      | personalizationLine2     |
      | personalizationLine3     |
      | personalizationLine4     |
      | mailingTitle2            |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @shakeout-orderDepositeBook
  Scenario: User should able to initiate new Order Deposit Book Request
    Given I am logging in as user "AUTODSS5" with permission to create "Order Deposit Book" service request
    When The user navigate to the "Order Deposit Book" service request screen
    When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user selects the 'Book Type' as "Standard"
    Then The application should display following fields "Deposit Book Details section"
      | field_name              |
      | quantity                |
      | bookSize                |
      | DepositBookMailingTitle |
      | personalizationLine2    |
      | personalizationLine3    |
      | personalizationLine4    |
      | mailingTitle2           |
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1                                     |
      | Book Size    | 50                                    |
      | Line3        | incididunt ut labore et dolore magna  |
      | Line4        | aliqua. Ut enim ad minim veniam, quis |
      | Attention To | Attention                             |
    And The user Clicks the "Review & Submit" button
    Then The application should display following fields "Order Deposit Book submission Review Page"
      | field_name              |
      | Order a Deposit Book    |
      | accountContainer        |
      | StandardBookTypeDetails |
      | previous                |
      | submit                  |
      | Cancel                  |
    And The user Clicks the "Submit" button
    Then The application should display following fields "Order Deposit Book SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The "responseId" for the "Order Deposit Book" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Order Deposit Book" search req type "Order Deposit Book" and selects it
    Then The application should display following fields "view service request screen"
      | field_name              |
      | quantity                |
      | bookSize                |
      | DepositBookMailingTitle |
      | personalizationLine2    |
      | personalizationLine3    |
      | personalizationLine4    |
      | mailingTitle2           |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @shakeout-AddLoanDealtoDigitalChannel
  Scenario: Creating case for Add Loan Deal to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Loan Deal to Digital Channel" service request
    When The user navigate to the "Add Loan Deal to Digital Channel" service request screen
    Then The application should display following fields "Add Loan Deal to Digital Channel"
      | field_name             |
      | dowload_form           |
      | browse_upload          |
      | your_reference         |
      | legalEntity_dropdown   |
      | importantInfo_checkbox |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Add Loan Deal to Digital Channel SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Add Loan Deal to Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Add Loan Deal" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Add Loan Deal to Digital Channel SR"
  #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
  #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |


  @shakeout-ManageBPAYFacility
  Scenario: Creating case for Manage BPAY Facility
    Given I am logging in as user "AUTODSS5" with permission to create "Manage BPAY Facility" service request
    When The user navigate to the "Manage BPAY Facility" service request screen
    Then The application should display following fields "Manage BPAY Facility"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Manage BPAY Facility SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Manage BPAY Facility" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Manage BPAY Facility" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Manage BPAY Facility"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-InvestigateDirectDebitTransaction1
  Scenario: Creating case for Investigate Direct Debit Transaction (Block direct debit user id)
    Given I am logging in as user "AUTODSS5" with permission to create "Investigate Direct Debit Transaction" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Block direct debit user id" from "Select Direct Debit Request Type" drop down
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "MELLING TRADING PROFESSIONAL GENERA" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    |             |
      | transtype |             |
      | PostDate  | May 2, 2019 |
    Then I click on "Transaction_Results_Row1"
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Investigate direct debit SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request with request type "Investigate Direct Debits" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_Requestedon_value   |
      | Summary_Info_RequestStatus_value |
      | transactionGridDateValue         |
      | transactionGridAmountValue       |
      | transactionGridDebit/CreditValue |
      | transactionGridAuxdomValue       |
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_RequestStatus_value | testpurpose |
      | Summary_Info_YourReference_val   | Successful  |
    #| Summary_Info_TypeofEnquiry_value | Block direct debit user id |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Successful |

  @shakeout-InvestigateDirectDebitTransaction1
  Scenario: Creating case for Investigate Direct Debit Transaction (Cancel direct debit)
    Given I am logging in as user "AUTODSS5" with permission to create "Investigate Direct Debit Transaction" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    |             |
      | transtype |             |
      | PostDate  | May 2, 2019 |
    Then I click on "Transaction_Results_Row1"
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Investigate direct debit SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request with request type "Investigate Direct Debits" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_Requestedon_value   |
      | Summary_Info_RequestStatus_value |
      | transactionGridDateValue         |
      | transactionGridAmountValue       |
      | transactionGridDebit/CreditValue |
      | transactionGridAuxdomValue       |
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_RequestStatus_value | testpurpose |
      | Summary_Info_YourReference_val   | In Progress |
    # #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-InvestigateDirectDebitTransaction2
  Scenario: Creating case for Investigate Direct Debit Transaction (Dispute direct debit transaction)
    Given I am logging in as user "AUTODSS5" with permission to create "Investigate Direct Debit Transaction" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Unauthorised transaction" from "RequestTypeReasonCode" drop down
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    |             |
      | transtype |             |
      | PostDate  | May 2, 2019 |
    Then I click on "Transaction_Results_Row1"
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Investigate direct debit SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request with request type "Investigate Direct Debits" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_Requestedon_value   |
      | Summary_Info_RequestStatus_value |
      | transactionGridDateValue         |
      | transactionGridAmountValue       |
      | transactionGridDebit/CreditValue |
      | transactionGridAuxdomValue       |
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_RequestStatus_value | testpurpose |
      | Summary_Info_YourReference_val   | In Progress |
    #  #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-InvestigateDirectDebitTransaction3
  Scenario: Creating case for Investigate Direct Debit Transaction (Request direct debit authorisation)
    Given I am logging in as user "AUTODSS5" with permission to create "Investigate Direct Debit Transaction" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Request direct debit authorisation" from "Select Direct Debit Request Type" drop down
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    |             |
      | transtype |             |
      | PostDate  | May 2, 2019 |
    Then I click on "Transaction_Results_Row1"
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    Then I click on "importantInfo_checkbox"
    Then I click on "Submit"
    Then The application should display following fields "Investigate direct debit SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request with request type "Investigate Direct Debits" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_Requestedon_value   |
      | Summary_Info_RequestStatus_value |
      | transactionGridDateValue         |
      | transactionGridAmountValue       |
      | transactionGridDebit/CreditValue |
      | transactionGridAuxdomValue       |
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_RequestStatus_value | testpurpose |
      | Summary_Info_YourReference_val   | In Progress |
    #  #| Summary_Info_TypeofEnquiry_value | Request direct debit authorisation |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-ManageBureauPayments
  Scenario: Creating case, search and view the created case for Manage Bureau Payments
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bureau (Payments)" service request
    When The user navigate to the "Manage Bureau (Payments)" service request screen
    Then The application should display following fields "Manage Bureau (Payments)"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Manage Bureau (Payments) SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Manage Bureau" is detail is saved to a file
    Then I click on "Ok"
  # Then The user searches stored service request with request type "Manage Bureau" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Manage BPAY Facility"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |




  @shakeout-AddLegalEntitytoDigitalChannel
  Scenario: Creating case for Add Legal Entity to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Legal Entity to Digital Channel" service request
    When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
    Then The application should display following fields "Add Legal Entity to Digital Channel"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "Add User SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Add Legal Entity to Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Close Channel" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Close digital Channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |



  @shakeout-AmendLegalEntitytoDigitalChannel
  Scenario: Creating case for Amend Legal Entity on Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity on Digital Channel" service request
    When The user navigate to the "Amend Legal Entity on Digital Channel" service request screen
    Then The application should display following fields "Amend Legal Entity on Digital Channel"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Amend Legal Entity on Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Close Channel" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Close digital Channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |


  @shakeout-deleteLegalEntity
  Scenario: Creating case for Delete Legal Entity from Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Legal Entity from Digital Channel" service request
    When The user navigate to the "Delete Legal Entity from Digital Channel" service request screen
    Then The application should display following fields "Delete Legal Entity from Digital Channel"
      | field_name           |
      | dowload_form         |
      | browse_upload        |
      | your_reference       |
      | legalEntity_dropdown |
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then I click on "Submit"
    Then The application should display following fields "SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
    #Then The request id is stored from the element "responseId"
    Then The "responseId" for the "Delete Legal Entity from Digital Channel" is detail is saved to a file
  #  Then I click on "Ok"
  # Then The user searches stored service request with request type "Close Channel" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the stored id
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Close digital Channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Submitted |

  @shakeout-UploadDocuments @UD1
  Scenario: Upload Documents - Create case for upload documents with AU jurisdiction
    Given I am logging in as user "AUTODSS5" with permission to create "Upload Documents" service request
    When The user navigate to the "Upload Documents" service request screen
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    #Then The user select "Melling Trading" from "AccountDropDown"
    When The user types Account Name "Melling Trading" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | your_reference | testpurpose |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up detail" for "Upload Documents"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
      | Ok                         | Ok                            |
    Then The "responseId" for the "Upload Documents" is detail is saved to a file

  @shakeout-UploadDocuments @UD2
  Scenario: Upload Documents - Create case for upload documents with NZ jurisdiction
    Given I am logging in as user "AUTODSS5" with permission to create "Upload Documents" service request
    When The user click on the "NewRequest_Button" button
    Then The user select "NZ" from the dropdown "Jurisdiction_dropdown"
    When The user click on the "Upload Documents" button
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    #Then The user select "AutoLegal1" from "legalEntity_dropdown"
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then The user enter the following text in corresponding textboxes
      | your_reference | testpurpose |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up detail" for "Upload Documents"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
      | Ok                         | Ok                            |
    Then The "responseId" for the "Upload Documents NZ" is detail is saved to a file



  @Shakeout-FCEECheque @FC
  Scenario: Fix Cheque Encoding Error - Create 'Cheque Encode Error' by specifing the Cheque number
    Given I am logging in as user "AUTODSS6" with permission to create "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "Melling Trading" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2019 |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate         | Post Date    |
      | transactionGridAmount       | Amount       |
      | transactionGridDebit/Credit | Debit/Credit |
      | transactionGridTransType    | Tran Type    |
      | transactionGridNarrative    | Narrative    |
      | transactionGridAuxdom       | Auxdom       |
      | transactionGridTraceline    | Traceline    |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value                        |
      | chequeNumber   | 123456                             |
      | your_reference | testFCEE authorisation with cheque |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                     |
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
      | AccountDescription     | AutoLegal1                          |
    Then The application should display the "Transaction details" for "FCEE on review page"
      | TrnstnGridHedr_Date           | Post Date            |
      | TrnstnGridHedr_Amount         | Amount               |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit         |
      | TrnstnGridHedr_Narrative      | Narrative            |
      | TrnstnGridHedr_TranType       | Tran Type            |
      | TrnstnGridHedr_Auxdom         | Auxdom               |
      | TrnstnGridHedr_Traceline      | Traceline            |
      | searchResults_Date            | Mar 09, 2019         |
      | searchResults_Amount          | 15,000.00            |
      | searchResults_DebitCreditType | Dr                   |
      | searchResults_TranType        | CHEQUE               |
      | searchResults_Narrative       | CHEQUE TENNANT CREEK |
      | searchResults_Auxdom          | 0000000000           |
      | searchResults_TraceLine       | 5889T0902570         |
    And The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Fix Cheque Encoding Error" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Fix Cheque Encoding Error" search req type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                     |
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
      | AccountDescription     | AutoLegal1                          |
    Then The application should display the "Transaction details" for "FCEE on view page"
      # | TrnstnGridHedr_Date           | Post Date            |
      # | TrnstnGridHedr_Amount         | Amount               |
      # | TrnstnGridHedr_Debit/Credit   | Debit/Credit         |
      # | TrnstnGridHedr_Narrative      | Narrative            |
      # | TrnstnGridHedr_TranType       | Tran Type            |
      # | TrnstnGridHedr_Auxdom         | Auxdom               |
      # | TrnstnGridHedr_Traceline      | Traceline            |
      | searchResults_Date            | Mar 09, 2019         |
      | searchResults_Amount          | 15,000.00            |
      | searchResults_DebitCreditType | Dr                   |
      #  | searchResults_TranType        | 14                   |
      | searchResults_Narrative       | CHEQUE TENNANT CREEK |
      | searchResults_Auxdom          | 0000000000           |
      | searchResults_TraceLine       | 5889T0902570         |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @Shakeout-FCEEAmount @FC
  Scenario: Fix Cheque Encoding Error - Create 'Cheque Encode Error' by specifing  Amount
    Given I am logging in as user "AUTODSS5" with permission to create "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "Melling Trading" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2019 |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate         | Post Date    |
      | transactionGridAmount       | Amount       |
      | transactionGridDebit/Credit | Debit/Credit |
      | transactionGridTransType    | Tran Type    |
      | transactionGridNarrative    | Narrative    |
      | transactionGridAuxdom       | Auxdom       |
      | transactionGridTraceline    | Traceline    |
    # | transactionGridDateValue         | Mar 09, 2020            |
    # | transactionGridAmountValue       | 15,000.00               |
    # | transactionGridDebit/CreditValue | Dr                      |
    # | transactionGridNarrativeValue    | CHEQUE TENNANT CREEK    |
    # | transactionGridAuxdomValue       | 0000000000              |
    # | transactionGridTracelineValue    | 5889T0902570            |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "ChequeAmount" checkbox
    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value           |
      | chequeAmountInput | 71234567              |
      | your_reference    | testFCEEauthorisation |
    When The user Clicks the "Next" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Fix Cheque Encoding Error" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Fix Cheque Encoding Error" search req type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                     |
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
      | AccountDescription     | AutoLegal1                          |
    Then The application should display the "Transaction details" for "FCEE on view page"
      | TrnstnGridHedr_Date           | Post Date            |
      | TrnstnGridHedr_Amount         | Amount               |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit         |
      | TrnstnGridHedr_Narrative      | Narrative            |
      | TrnstnGridHedr_TranType       | Tran Type            |
      | TrnstnGridHedr_Auxdom         | Auxdom               |
      | TrnstnGridHedr_Traceline      | Traceline            |
      | searchResults_Date            | Mar 09, 2019         |
      | searchResults_Amount          | 15,000.00            |
      | searchResults_DebitCreditType | Dr                   |
      | searchResults_TranType        | CHEQUE               |
      | searchResults_Narrative       | CHEQUE TENNANT CREEK |
      | searchResults_Auxdom          | 0000000000           |
      | searchResults_TraceLine       | 5889T0902570         |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "ATM" - Cash
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #Then The user select "775021122" from "AccountDropDown"
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3008        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value |
      | OriginalCashAmount | 500         |
      | MissingcashAmount  | 499.98      |
      | your_reference     | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_RequestStatus_value | testpurpose                    |
      | DepositDateL                     | Deposit Date                   |
      | DepositDateValue                 | Feb 12, 2020                   |
      | DepositTypeL                     | Deposit Type                   |
      | DepositType                      | Cash                           |
      | DepositMethodL                   | Deposit Method                 |
      | DepositMethod                    | ATM                            |
      | DepositedviaL                    | Deposited Via                  |
      | DepositLocationValue             | Branch                         |
      | BranchAddrL                      | Branch                         |
      | OriginalCashAmountL              | Original Cash Amount Deposited |
      | OriginalCashAmount               | AUD 500.00                     |
      | MissingcashAmountL               | Missing Cash Amount            |
      | MissingcashAmount                | AUD 499.98                     |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-MD1
  Scenario: Claim Missing Deposit- Create case with depo method "Counter" - Cash
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "Over The Counter" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3000        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value |
      | OriginalCashAmount | 500         |
      | MissingcashAmount  | 499.98      |
      | your_reference     | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_RequestStatus_value | testpurpose                    |
      | DepositDateL                     | Deposit Date                   |
      | DepositDateValue                 | Feb 12, 2020                   |
      | DepositTypeL                     | Deposit Type                   |
      | DepositType                      | Cash                           |
      | DepositMethodL                   | Deposit Method                 |
      | DepositMethod                    | Over The Counter               |
      | DepositedviaL                    | Deposited Via                  |
      | DepositLocationValue             | Branch                         |
      | BranchAddrL                      | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL              | Original Cash Amount Deposited |
      | OriginalCashAmount               | AUD 500.00                     |
      | MissingcashAmountL               | Missing Cash Amount            |
      | MissingcashAmount                | AUD 499.98                     |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "Fast Depo Bag" - Cash
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value |
      | OriginalCashAmount | 500         |
      | MissingcashAmount  | 499.98      |
      | FastDepoBagNum     | 123376376   |
      | your_reference     | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress                    |
      | Summary_Info_RequestStatus_value | testpurpose                    |
      | DepositDateL                     | Deposit Date                   |
      | DepositDateValue                 | Feb 12, 2020                   |
      | DepositTypeL                     | Deposit Type                   |
      | DepositType                      | Cash                           |
      | DepositMethodL                   | Deposit Method                 |
      | DepositMethod                    | Fast Deposit Bag               |
      | DepositedviaL                    | Deposited Via                  |
      | DepositLocationValue             | Direct to Depot                |
      | OriginalCashAmountL              | Original Cash Amount Deposited |
      | OriginalCashAmount               | AUD 500.00                     |
      | MissingcashAmountL               | Missing Cash Amount            |
      | MissingcashAmount                | AUD 499.98                     |
      | FastDepoBagNum                   | 123376376                      |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "ATM" - Cheque
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3000        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
    When The user select the "1" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 646547      |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Cheque                 |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | ATM                    |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Branch                 |
      | BranchAddrL                      | Branch                 |
      #| BranchAddress                                |                                    |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 1                      |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | ChequeNum1                       | 646547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "Over the Counter" - Cheque
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    # Then The user select "775021122" from the dropdown "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    When The user select the "Over The Counter" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3008        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
    When The user select the "3" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 46547       |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | ChequeNum2     | 7654        |
      | ChequeAmt2     | 100         |
      | PayerBank2     | were        |
      | PayerName2     | ewff        |
      | ChequeNum3     | 436456      |
      | ChequeAmt3     | 100         |
      | PayerBank3     | dfgfg       |
      | PayerName3     | dfgdfg      |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Cheque                 |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | Over The Counter       |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Branch                 |
      | BranchAddrL                      | Branch                 |
      #| BranchAddress                                |                                    |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 3                      |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | ChequeNum1                       | 046547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
      | ChequeNum2                       | 007654                 |
      | ChequeAmt2                       | AUD 100.00             |
      | PayerBank2                       | were                   |
      | PayerName2                       | ewff                   |
      | ChequeNum3                       | 436456                 |
      | ChequeAmt3                       | AUD 100.00             |
      | PayerBank3                       | dfgfg                  |
      | PayerName3                       | dfgdfg                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "Fast Depo Bag" - Cheque
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
      | FastDepoBagNum       | 123376376   |
    When The user select the "5" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 46547       |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | ChequeNum2     | 7654        |
      | ChequeAmt2     | 100         |
      | PayerBank2     | were        |
      | PayerName2     | ewff        |
      | ChequeNum3     | 436456      |
      | ChequeAmt3     | 100         |
      | PayerBank3     | dfgfg       |
      | PayerName3     | dfgdfg      |
      | ChequeNum4     | 987877      |
      | ChequeAmt4     | 100         |
      | PayerBank4     | dfgdfg      |
      | PayerName4     | dfgsdgf     |
      | ChequeNum5     | 414155      |
      | ChequeAmt5     | 102         |
      | PayerBank5     | asdfgh      |
      | PayerName5     | dshgshj123  |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Cheque                 |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | Fast Deposit Bag       |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Direct to Depot        |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 5                      |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | FastDepoBagNum                   | 123376376              |
      | ChequeNum1                       | 046547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
      | ChequeNum2                       | 007654                 |
      | ChequeAmt2                       | AUD 100.00             |
      | PayerBank2                       | were                   |
      | PayerName2                       | ewff                   |
      | ChequeNum3                       | 436456                 |
      | ChequeAmt3                       | AUD 100.00             |
      | PayerBank3                       | dfgfg                  |
      | PayerName3                       | dfgdfg                 |
      | ChequeNum4                       | 987877                 |
      | ChequeAmt4                       | AUD 100.00             |
      | PayerBank4                       | dfgdfg                 |
      | PayerName4                       | dfgsdgf                |
      | ChequeNum5                       | 414155                 |
      | ChequeAmt5                       | AUD 102.00             |
      | PayerBank5                       | asdfgh                 |
      | PayerName5                       | dshgshj123             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  # @shakeout-MD7
  # Scenario: Claim Missing Deposit- Create case with depo method "Fast Depo Envelope" - Cheque
  #   Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   Then The user select "775021122" from "AccountDropDown"
  #   Then The user enters deposit date value
  #     | DepositDate | February 12, 2020 |
  #   When The user select the "Cheque" from "DepositType" drop down
  #   When The user select the "Fast Deposit Envelope" from "DepositMethod" drop down
  #   When The user Clicks the "DirectDepotOption" button
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name           | field_value |
  #     | OriginalChequeAmount | 5000        |
  #     | MissingchequeAmount  | 1200        |
  #   When The user select the "6+" from "MissingChequeCount" drop down
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | ChequeNum1     | 46547       |
  #     | ChequeAmt1     | 100         |
  #     | PayerBank1     | wer         |
  #     | PayerName1     | ert         |
  #     | ChequeNum2     | 7654        |
  #     | ChequeAmt2     | 100         |
  #     | PayerBank2     | were        |
  #     | PayerName2     | ewff        |
  #     | ChequeNum3     | 436456      |
  #     | ChequeAmt3     | 100         |
  #     | PayerBank3     | dfgfg       |
  #     | PayerName3     | dfgdfg      |
  #     | ChequeNum4     | 987877      |
  #     | ChequeAmt4     | 100         |
  #     | PayerBank4     | dfgdfg      |
  #     | PayerName4     | dfgsdgf     |
  #     | ChequeNum5     | 414155      |
  #     | ChequeAmt5     | 102         |
  #     | PayerBank5     | asdfgh      |
  #     | PayerName5     | dshgshj123  |
  #     | your_reference | testpurpose |
  #   When The user Clicks the "Next" button
  #   When The user Clicks the "Submit" button
  #   Then The request id is stored from the element "responseId"
  #   When The user Clicks the "Ok" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
  #   Then The "Summary_Info_RequestID_value" value displays the stored id
  #   Then The application should display the "Account details" for "claim missing on review page"
  #     | AccountHeaderLabel     | Account Details                          |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
  #     | Summary_Info_YourReference_val   | In Progress                  |
  #     | Summary_Info_RequestStatus_value | testpurpose                  |
  #     | DepositDateL                     | Deposit Date                 |
  #     | DepositDateValue                 | 2020-02-12                   |
  #     | DepositTypeL                     | Deposit Type                 |
  #     | DepositType                      | Cheque                       |
  #     | DepositMethodL                   | Deposit Method               |
  #     | DepositMethod                    | Fast Deposit Envelope        |
  #     | DepositedviaL                    | Deposited Via                |
  #     | DepositLocationValue             | Direct to Depot              |
  #     | MissingChequeDetailsL            | Missing Cheque Details |
  #     | MissingChequeCount               | 6+                           |
  #     | OriginalChequeAmount             | AUD 5,000.00                 |
  #     | MissingchequeAmount              | AUD 1,200.00                 |
  #     | ChequeNum1                       | 046547                       |
  #     | ChequeAmt1                       | AUD 100.00                   |
  #     | PayerBank1                       | wer                          |
  #     | PayerName1                       | ert                          |
  #     | ChequeNum2                       | 007654                       |
  #     | ChequeAmt2                       | AUD 100.00                   |
  #     | PayerBank2                       | were                         |
  #     | PayerName2                       | ewff                         |
  #     | ChequeNum3                       | 436456                       |
  #     | ChequeAmt3                       | AUD 100.00                   |
  #     | PayerBank3                       | dfgfg                        |
  #     | PayerName3                       | dfgdfg                       |
  #     | ChequeNum4                       | 987877                       |
  #     | ChequeAmt4                       | AUD 100.00                   |
  #     | PayerBank4                       | dfgdfg                       |
  #     | PayerName4                       | dfgsdgf                      |
  #     | ChequeNum5                       | 414155                       |
  #     | ChequeAmt5                       | AUD 102.00                   |
  #     | PayerBank5                       | asdfgh                       |
  #     | PayerName5                       | dshgshj123                   |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | In Progress |

  @shakeout-MD8
  Scenario: Claim Missing Deposit- Create case with depo method "ATM" - Both
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3000        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalCashAmount   | 5000        |
      | MissingcashAmount    | 501         |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
    When The user select the "2" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 46547       |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | ChequeNum2     | 7654        |
      | ChequeAmt2     | 100         |
      | PayerBank2     | were        |
      | PayerName2     | ewff        |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Both                   |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | ATM                    |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Branch                 |
      | BranchAddrL                      | Branch                 |
      #| BranchAddress                                |                                    |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 2                      |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | OriginalCashAmount               | AUD 5,000.00           |
      | MissingcashAmount                | AUD 501.00             |
      | ChequeNum1                       | 046547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
      | ChequeNum2                       | 007654                 |
      | ChequeAmt2                       | AUD 100.00             |
      | PayerBank2                       | were                   |
      | PayerName2                       | ewff                   |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "Over The Counter" - Both
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    When The user select the "Over The Counter" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3008        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalCashAmount   | 5000        |
      | MissingcashAmount    | 501         |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
    When The user select the "4" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 46547       |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | ChequeNum2     | 7654        |
      | ChequeAmt2     | 100         |
      | PayerBank2     | were        |
      | PayerName2     | ewff        |
      | ChequeNum3     | 436456      |
      | ChequeAmt3     | 100         |
      | PayerBank3     | dfgfg       |
      | PayerName3     | dfgdfg      |
      | ChequeNum4     | 987877      |
      | ChequeAmt4     | 100         |
      | PayerBank4     | dfgdfg      |
      | PayerName4     | dfgsdgf     |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Both                   |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | Over The Counter       |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Branch                 |
      | BranchAddrL                      | Branch                 |
      #| BranchAddress                                |                                    |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 4                      |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | OriginalCashAmount               | AUD 5,000.00           |
      | MissingcashAmount                | AUD 501.00             |
      | ChequeNum1                       | 046547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
      | ChequeNum2                       | 007654                 |
      | ChequeAmt2                       | AUD 100.00             |
      | PayerBank2                       | were                   |
      | PayerName2                       | ewff                   |
      | ChequeNum3                       | 436456                 |
      | ChequeAmt3                       | AUD 100.00             |
      | PayerBank3                       | dfgfg                  |
      | PayerName3                       | dfgdfg                 |
      | ChequeNum4                       | 987877                 |
      | ChequeAmt4                       | AUD 100.00             |
      | PayerBank4                       | dfgdfg                 |
      | PayerName4                       | dfgsdgf                |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-MD
  Scenario: Claim Missing Deposit- Create case with depo method "Fast Depo Bag" - Both
    Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    #Then The user select "775021122" from "AccountDropDown"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters deposit date value
      | DepositDate | February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The user enter the following text in corresponding textboxes
      | field_name      | field_value |
      | Branch_text_val | 3008        |
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value |
      | OriginalCashAmount   | 5000        |
      | MissingcashAmount    | 501         |
      | OriginalChequeAmount | 5000        |
      | MissingchequeAmount  | 1200        |
      | FastDepoBagNum       | 123376376   |
    When The user select the "6+" from "MissingChequeCount" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | ChequeNum1     | 46547       |
      | ChequeAmt1     | 100         |
      | PayerBank1     | wer         |
      | PayerName1     | ert         |
      | ChequeNum2     | 7654        |
      | ChequeAmt2     | 100         |
      | PayerBank2     | were        |
      | PayerName2     | ewff        |
      | ChequeNum3     | 436456      |
      | ChequeAmt3     | 100         |
      | PayerBank3     | dfgfg       |
      | PayerName3     | dfgdfg      |
      | ChequeNum4     | 987877      |
      | ChequeAmt4     | 100         |
      | PayerBank4     | dfgdfg      |
      | PayerName4     | dfgsdgf     |
      | ChequeNum5     | 414155      |
      | ChequeAmt5     | 102         |
      | PayerBank5     | asdfgh      |
      | PayerName5     | dshgshj123  |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | Summary_Info_YourReference_val   | In Progress            |
      | Summary_Info_RequestStatus_value | testpurpose            |
      | DepositDateL                     | Deposit Date           |
      | DepositDateValue                 | Feb 12, 2020           |
      | DepositTypeL                     | Deposit Type           |
      | DepositType                      | Both                   |
      | DepositMethodL                   | Deposit Method         |
      | DepositMethod                    | Fast Deposit Bag       |
      | DepositedviaL                    | Deposited Via          |
      | DepositLocationValue             | Branch                 |
      | BranchAddrL                      | Branch                 |
      #| BranchAddress                                |                                    |
      | MissingChequeDetailsL            | Missing Cheque Details |
      | MissingChequeCount               | 6+                     |
      | OriginalChequeAmount             | AUD 5,000.00           |
      | MissingchequeAmount              | AUD 1,200.00           |
      | OriginalCashAmount               | AUD 5,000.00           |
      | MissingcashAmount                | AUD 501.00             |
      | FastDepoBagNum                   | 123376376              |
      | ChequeNum1                       | 046547                 |
      | ChequeAmt1                       | AUD 100.00             |
      | PayerBank1                       | wer                    |
      | PayerName1                       | ert                    |
      | ChequeNum2                       | 007654                 |
      | ChequeAmt2                       | AUD 100.00             |
      | PayerBank2                       | were                   |
      | PayerName2                       | ewff                   |
      | ChequeNum3                       | 436456                 |
      | ChequeAmt3                       | AUD 100.00             |
      | PayerBank3                       | dfgfg                  |
      | PayerName3                       | dfgdfg                 |
      | ChequeNum4                       | 987877                 |
      | ChequeAmt4                       | AUD 100.00             |
      | PayerBank4                       | dfgdfg                 |
      | PayerName4                       | dfgsdgf                |
      | ChequeNum5                       | 414155                 |
      | ChequeAmt5                       | AUD 102.00             |
      | PayerBank5                       | asdfgh                 |
      | PayerName5                       | dshgshj123             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  # @shakeout-MD11
  # Scenario: Claim Missing Deposit- Create case with depo method "Fast Depo Envelope" - Both
  #   Given I am logging in as user "AUTODSS5" with permission to create "Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   Then The user select "775021122" from "AccountDropDown"
  #   Then The user enters deposit date value
  #     | DepositDate | February 12, 2020 |
  #   When The user select the "Both" from "DepositType" drop down
  #   When The user select the "Fast Deposit Envelope" from "DepositMethod" drop down
  #   When The user Clicks the "DirectDepotOption" button
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name           | field_value |
  #     | OriginalCashAmount   | 5000        |
  #     | MissingcashAmount    | 501         |
  #     | OriginalChequeAmount | 5000        |
  #     | MissingchequeAmount  | 1200        |
  #   When The user select the "1" from "MissingChequeCount" drop down
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | ChequeNum1     | 46547       |
  #     | ChequeAmt1     | 100         |
  #     | PayerBank1     | wer         |
  #     | PayerName1     | ert         |
  #     | your_reference | testpurpose |
  #   When The user Clicks the "Next" button
  #   When The user Clicks the "Submit" button
  #   Then The request id is stored from the element "responseId"
  #   When The user Clicks the "Ok" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
  #   Then The "Summary_Info_RequestID_value" value displays the stored id
  #   Then The application should display the "Account details" for "claim missing on review page"
  #     | AccountHeaderLabel     | Account Details                          |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
  #     | Summary_Info_YourReference_val   | In Progress                  |
  #     | Summary_Info_RequestStatus_value | testpurpose                  |
  #     | DepositDateL                     | Deposit Date                 |
  #     | DepositDateValue                 | 2020-02-12                   |
  #     | DepositTypeL                     | Deposit Type                 |
  #     | DepositType                      | Both                         |
  #     | DepositMethodL                   | Deposit Method               |
  #     | DepositMethod                    | Fast Deposit Envelope        |
  #     | DepositedviaL                    | Deposited Via                |
  #     | MissingChequeDetailsL            | Missing Cheque Details |
  #     | MissingChequeCount               | 1                            |
  #     | OriginalChequeAmount             | AUD 5,000.00                 |
  #     | MissingchequeAmount              | AUD 1,200.00                 |
  #     | OriginalCashAmount               | AUD 5,000.00                 |
  #     | MissingcashAmount                | AUD 501.00                   |
  #     | ChequeNum1                       | 046547                       |
  #     | ChequeAmt1                       | AUD 100.00                   |
  #     | PayerBank1                       | wer                          |
  #     | PayerName1                       | ert                          |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | In Progress |


  ###    Approval flow is temporarily disabled for recall payment & return of funds.   ###


  # @shakeout-RecallPayment @firstApproval
  # Scenario: Recall Payment - Create Recall Payment request, search based on requestId and First approval
  #   Given I am logging in as token user "AUTODSS8" with permission to create "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
  #     | amount   | Amount    |
  #     | postDate | Post Date |
  #     | Reset    | Reset     |
  #     | Search   | Search    |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2019 |
  #     | amount   |                  |
  #   # Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
  #   #   | transactionGridDate                    | Post Date                                         |
  #   #   | transactionGridAmount                  | Amount                                            |
  #   #   | transactionGridDebit/Credit            | Debit/Credit                                      |
  #   #   | transactionGridNarrative               | Narrative                                         |
  #   #   | transactionGridAuxdom                  | Auxdom                                            |
  #   #   | transactionGridLodgementReference      | Lodgement Reference                               |
  #   #   | transactionGridTraceline               | Traceline                                         |
  #   #   | transactionGridDateValue               | Feb 09, 2020                                      |
  #   #   | transactionGridAmountValue             | 1,204.00                                          |
  #   #   | transactionGridDebit/CreditValue       | Dr                                                |
  #   #   | transactionGridNarrativeValue          | 0000000000                                        |
  #   #   | transactionGridAuxdomValue             | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
  #   #   | transactionGridLodgementReferenceValue | ANZ BANK                                          |
  #   #   | transactionGridTracelineValue          | 22040155CX22                                      |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | your_reference | testpurpose |
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Recall Payment on review page"
  #     | AccountHeaderLabel     | Account Details  |
  #     | AccountName            | LE COMPANY SIT 5 |
  #     | AccountDefaultCurrency | AUD              |
  #     | AccountDescription     | AutoLegal1       |
  #   Then The application should display the "Your Reference details" for "Recall Payment on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testpurpose               |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   Then The "responseId" for the "RecallPayment" is detail is saved to a file
  #   Then I click on "Ok"
  #   Then The user searches the stored service request with request type "RecallPayment" search req type "Recall Payment" and selects it
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "Recall Payment service request in view mode"
  #     | AccountHeaderLabel     | Account Details  |
  #     | AccountName            | LE COMPANY SIT 5 |
  #     | AccountDefaultCurrency | AUD              |
  #     | AccountDescription     | AutoLegal1       |
  #   Then The application should display the "TransactionHeaderLabel" for "Recall Payment Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "Recall Payment service request in view mode"
  #     | TrnstnGridHedr_Date               | Post Date           |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   # | searchResults_Date                | Feb 09, 2020                                      |
  #   # | searchResults_Amount              | 1,204.00                                          |
  #   # | searchResults_DebitCreditType     | Dr                                                |
  #   # | searchResults_Narrative           | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
  #   # | searchResults_Auxdom              | 0000000000                                        |
  #   # | searchResults_LodgementReference  | ANZ BANK                                          |
  #   # | searchResults_TraceLine           | 22040155CX22                                      |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Pending Approval |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Approve" button
  #   When The user click on the "approvechkbox" button
  #   Then The user click on the "approveBtn" button
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | summary_status | Pending Approval |

  # @shakeout-RecallPayment @finalApproval
  # Scenario: Recall Payment - View and final approval
  #   Given I am logging in as token user "AUTODSS9" with permission to create "Recall Payment" service request
  #   Then The user searches the stored service request with request type "RecallPayment" search req type "Recall Payment" and selects it
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "Recall Payment service request in view mode"
  #     | AccountHeaderLabel     | Account Details  |
  #     | AccountName            | LE COMPANY SIT 5 |
  #     | AccountDefaultCurrency | AUD              |
  #     | AccountDescription     | AutoLegal1       |
  #   Then The application should display the "TransactionHeaderLabel" for "Recall Payment Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "Recall Payment service request in view mode"
  #     | TrnstnGridHedr_Date               | Post Date           |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   # | searchResults_Date                | Feb 09, 2020                                      |
  #   # | searchResults_Amount              | 1,204.00                                          |
  #   # | searchResults_DebitCreditType     | Dr                                                |
  #   # | searchResults_Narrative           | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
  #   # | searchResults_Auxdom              | 0000000000                                        |
  #   # | searchResults_LodgementReference  | ANZ BANK                                          |
  #   # | searchResults_TraceLine           | 22040155CX22                                      |
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Approve" button
  #   When The user click on the "approvechkbox" button
  #   When The user click on the "Continue" button
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name    | field_value |
  #     | authoriseCode | 8754328     |
  #   Then The user click on the "approveBtn" button
  #   Then The application should display the "status as Approved" for "SR"
  #     | summary_status | Approved |
  #   When The user click on the "Close" button
  #   Then The user searches the stored service request with request type "RecallPayment" search req type "Recall Payment" and selects it
  #   Then The application should display the "status as Approved" for "SR"
  #     | summary_status | In Progress |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | In Progress |

  # @shakeout-RecallPayment @Reject
  # Scenario: Recall Payment - Create Recall Payment request, search based on requestId and Reject it
  #   Given I am logging in as token user "AUTODSS7" with permission to create "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
  #     | amount   | Amount    |
  #     | postDate | Post Date |
  #     | Reset    | Reset     |
  #     | Search   | Search    |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | October 9, 2020 |
  #     | amount   |                 |
  #   # Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
  #   #   | transactionGridDate                    | Post Date                                         |
  #   #   | transactionGridAmount                  | Amount                                            |
  #   #   | transactionGridDebit/Credit            | Debit/Credit                                      |
  #   #   | transactionGridNarrative               | Narrative                                         |
  #   #   | transactionGridAuxdom                  | Auxdom                                            |
  #   #   | transactionGridLodgementReference      | Lodgement Reference                               |
  #   #   | transactionGridTraceline               | Traceline                                         |
  #   #   | transactionGridDateValue               | Feb 09, 2020                                      |
  #   #   | transactionGridAmountValue             | 1,204.00                                          |
  #   #   | transactionGridDebit/CreditValue       | Dr                                                |
  #   #   | transactionGridNarrativeValue          | 0000000000                                        |
  #   #   | transactionGridAuxdomValue             | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
  #   #   | transactionGridLodgementReferenceValue | ANZ BANK                                          |
  #   #   | transactionGridTracelineValue          | 22040155CX22                                      |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | your_reference | testpurpose |
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Recall Payment on review page"
  #     | AccountHeaderLabel     | Account Details                   |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   Then The application should display the "Your Reference details" for "Recall Payment on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testpurpose               |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   Then The "responseId" for the "RecallPayment" is detail is saved to a file
  #   Then I click on "Ok"
  #   Then The user searches the stored service request with request type "RecallPayment" search req type "Recall Payment" and selects it
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "Recall Payment service request in view mode"
  #     | AccountHeaderLabel     | Account Details                   |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   Then The application should display the "TransactionHeaderLabel" for "Recall Payment Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "Recall Payment service request in view mode"
  #     | TrnstnGridHedr_Date               | Post Date           |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   # | searchResults_Date                | Feb 09, 2020                                      |
  #   # | searchResults_Amount              | 1,204.00                                          |
  #   # | searchResults_DebitCreditType     | Dr                                                |
  #   # | searchResults_Narrative           | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
  #   # | searchResults_Auxdom              | 0000000000                                        |
  #   # | searchResults_LodgementReference  | ANZ BANK                                          |
  #   # | searchResults_TraceLine           | 22040155CX22                                      |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Pending Approval |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title  | Reject Service Request |
  #     | cancelBtn           | Cancel                 |
  #     | rejectBtn           | Reject                 |
  #     | rejectComment-label | Reason For Rejection   |
  #     | rejectComment       |                        |
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   And The user click on the "rejectBtn" button
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | summary_status | Rejected |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Rejected |


  @shakeout-RecallPaymentBulk
  Scenario: Recall Payment - Create Recall Payment request and search based on requestId
    Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2019 |
      | amount   | 984321.12     |
    # Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
    #   | transactionGridDate                    | Post Date                                         |
    #   | transactionGridAmount                  | Amount                                            |
    #   | transactionGridDebit/Credit            | Debit/Credit                                      |
    #   | transactionGridNarrative               | Narrative                                         |
    #   | transactionGridAuxdom                  | Auxdom                                            |
    #   | transactionGridLodgementReference      | Lodgement Reference                               |
    #   | transactionGridTraceline               | Traceline                                         |
    #   | transactionGridDateValue               | Feb 09, 2020                                      |
    #   | transactionGridAmountValue             | 1,204.00                                          |
    #   | transactionGridDebit/CreditValue       | Dr                                                |
    #   | transactionGridNarrativeValue          | 0000000000                                        |
    #   | transactionGridAuxdomValue             | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
    #   | transactionGridLodgementReferenceValue | ANZ BANK                                          |
    #   | transactionGridTracelineValue          | 22040155CX22                                      |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Claim Missing Deposit SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter the following text in corresponding textboxes
      | field_name              | field_value |
      | your_reference          | testpurpose |
      | beneficiaryAccountName  | ABC INC     |
      | beneficiaryBsb          | 234561      |
      | beneficiaryAccount      | 324342432   |
      | beneficiaryAmount       | 984321.10   |
      | beneficiaryLodgementRef | test123     |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "Your Reference details" for "Recall Payment on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testpurpose               |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "RecallPaymentB" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "RecallPaymentB" search req type "Recall Payment" and selects it
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "Recall Payment service request in view mode"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal1                        |
    Then The application should display the "TransactionHeaderLabel" for "Recall Payment Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "Recall Payment service request in view mode"
      | TrnstnGridHedr_Date               | Post Date                                         |
      | TrnstnGridHedr_Amount             | Amount                                            |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                      |
      | TrnstnGridHedr_Narrative          | Narrative                                         |
      | TrnstnGridHedr_Auxdom             | Auxdom                                            |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                               |
      | TrnstnGridHedr_Traceline          | Traceline                                         |
      # | searchResults_Date                | Feb 09, 2020                                      |
      | searchResults_Amount              | 984,321.12                                        |
      | searchResults_DebitCreditType     | Dr                                                |
      | searchResults_Narrative           | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00 |
      | searchResults_Auxdom              | 0000011102                                        |
      | searchResults_LodgementReference  | ANZ BANK                                          |
      | searchResults_TraceLine           | 32040155CX20                                      |
    Then The application should display following fields "Recall Payment  SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-RecallPaymentExcludeTrns
  Scenario: Recall payment - Check exclude transaction
    Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "JUSSEAUME HOLDING MANAGEMENT GENER" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @shakeout-RetunOfFunds @singleApprovalforReject
  Scenario: Return Incorrectly Received Funds - Create ROF request, search and view the details and first approval
    Given I am logging in as token user "AUTODSS9" with permission to create "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | October 9, 2020 |
      | amount   |                 |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Search for Transaction |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value |
      | your_reference | testpurpose |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details  |
      | AccountName            | LE COMPANY SIT 5 |
      | AccountDefaultCurrency | AUD              |
      | AccountDescription     | AutoLegal1       |
    Then The application should display the "TransactionHeaderLabel" for "ROF Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "ROF on review page"
      | TrnstnGridHedr_Date               | Date                |
      | TrnstnGridHedr_Amount             | Amount              |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
      | TrnstnGridHedr_Narrative          | Narrative           |
      | TrnstnGridHedr_Auxdom             | Auxdom              |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference |
      | TrnstnGridHedr_Traceline          | Traceline           |
    #| searchResults_Date                | 09/03/2020              |
    # | searchResults_Amount              | 3,400.00                     |
    # | searchResults_DebitCreditType     | Cr                           |
    # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
    # | searchResults_Auxdom              | 0000000121                   |
    # | searchResults_LodgementReference  |                              |
    # | searchResults_TraceLine           | 61120155CX60                 |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Return of funds" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Return of funds" search req type "Return Incorrectly Received Fund" and selects it
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "ROF service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Important Information Section" for "ROF service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "ROF service request in view mode"
      | AccountHeaderLabel     | Account Details  |
      | AccountName            | LE COMPANY SIT 5 |
      | AccountDefaultCurrency | AUD              |
      | AccountDescription     | AutoLegal1       |
    And The application should display the "TransactionHeaderLabel" for "ROF Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "ROF on view page"
      | TrnstnGridHedr_Date               | Date                |
      | TrnstnGridHedr_Amount             | Amount              |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
      | TrnstnGridHedr_Narrative          | Narrative           |
      | TrnstnGridHedr_Auxdom             | Auxdom              |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference |
      | TrnstnGridHedr_Traceline          | Traceline           |
  #| searchResults_Date                | 09/03/2020              |
  # | searchResults_Amount              | 3,400.00                     |
  # | searchResults_DebitCreditType     | Cr                           |
  # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
  # | searchResults_Auxdom              | 0000000121                   |
  # | searchResults_LodgementReference  |                              |
  # | searchResults_TraceLine           | 61120155CX60                 |
  # Then The application should display following fields "Return of funds view details screen"
  #   | field_name |
  #   | Approve    |
  #   | Reject     |
  # When The user click on the "Approve" button
  # When The user click on the "approvechkbox" button
  # Then The user click on the "approveBtn" button
  # Then The application should display the "status as Approved" for "SR"
  #   | summary_status | Pending Approval |
  # When The user click on the "Close" button
  # Then The user searches the stored service request with request type "Return of funds" search req type "Return Incorrectly Received Fund" and selects it
  # Then The application should display the "status as Approved" for "SR"
  #   | summary_status | Pending Approval |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as In progress in Audit history" for "service request"
  #   | AuditHistoryStatus | Pending Approval |

  # @shakeout-RetunOfFunds @RejectAfterSingleApproval
  # Scenario: Return Incorrectly Received Funds - Create ROF request, search and view the details and first approval
  #   Given I am logging in as token user "AUTODSS8" with permission to create "Return Incorrectly Received Funds" service request
  #   Then The user searches the stored service request with request type "Return of funds" search req type "Return Incorrectly Received Fund" and selects it
  #   Then The application should display the "Summary Information" for "ROF service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "ROF service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "ROF service request in view mode"
  #     | AccountHeaderLabel     | Account Details  |
  #     | AccountName            | LE COMPANY SIT 5 |
  #     | AccountDefaultCurrency | AUD              |
  #     | AccountDescription     | AutoLegal1       |
  #   And The application should display the "TransactionHeaderLabel" for "ROF Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "ROF on view page"
  #     | TrnstnGridHedr_Date               | Date                |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   #| searchResults_Date                | 09/03/2020              |
  #   # | searchResults_Amount              | 3,400.00                     |
  #   # | searchResults_DebitCreditType     | Cr                           |
  #   # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
  #   # | searchResults_Auxdom              | 0000000121                   |
  #   # | searchResults_LodgementReference  |                              |
  #   # | searchResults_TraceLine           | 61120155CX60                 |
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title  | Reject Service Request |
  #     | cancelBtn           | Cancel                 |
  #     | rejectBtn           | Reject                 |
  #     | rejectComment-label | Reason For Rejection   |
  #     | rejectComment       |                        |
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   And The user click on the "rejectBtn" button
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | summary_status | Rejected |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Rejected |


  #outof scope
  # @shakeout-RetunOfFunds @singleApproval
  # Scenario: Return Incorrectly Received Funds - Create ROF request, search, Approved and view the details
  #   Given I am logging in as token user "AUTODSS7" with permission to create "Return Incorrectly Received Funds" service request
  #   When The user navigate to the "Return Incorrectly Received Funds" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | October 9, 2020 |
  #     | amount   |                 |
  #   Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
  #     | TransactionHeaderLabel | Search for Transaction |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | your_reference | testpurpose |
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                   |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   Then The application should display the "TransactionHeaderLabel" for "ROF Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "ROF on review page"
  #     | TrnstnGridHedr_Date               | Date                |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   #| searchResults_Date                | 09/03/2020              |
  #   # | searchResults_Amount              | 3,400.00                     |
  #   # | searchResults_DebitCreditType     | Cr                           |
  #   # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
  #   # | searchResults_Auxdom              | 0000000121                   |
  #   # | searchResults_LodgementReference  |                              |
  #   # | searchResults_TraceLine           | 61120155CX60                 |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application should display the "Confirmation pop-up" for "ROF Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   Then The "responseId" for the "Return of funds" is detail is saved to a file
  #   Then I click on "Ok"
  #   Then The user searches the stored service request with request type "Return of funds" search req type "Return Incorrectly Received Fund" and selects it
  #   Then The application should display the "Service Request Header" for "ROF service request in view mode"
  #     | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
  #     | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "ROF service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "ROF service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "ROF service request in view mode"
  #     | AccountHeaderLabel     | Account Details                   |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #     | AccountDescription     | AutoLegal1                        |
  #   And The application should display the "TransactionHeaderLabel" for "ROF Service Request" text
  #     | TransactionHeaderLabel | Transaction |
  #   Then The application should display the "Transaction details" for "ROF on view page"
  #     | TrnstnGridHedr_Date               | Date                |
  #     | TrnstnGridHedr_Amount             | Amount              |
  #     | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
  #     | TrnstnGridHedr_Narrative          | Narrative           |
  #     | TrnstnGridHedr_Auxdom             | Auxdom              |
  #     | TrnstnGridHedr_LodgementReference | Lodgement Reference |
  #     | TrnstnGridHedr_Traceline          | Traceline           |
  #   #| searchResults_Date                | 09/03/2020              |
  #   # | searchResults_Amount              | 3,400.00                     |
  #   # | searchResults_DebitCreditType     | Cr                           |
  #   # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
  #   # | searchResults_Auxdom              | 0000000121                   |
  #   # | searchResults_LodgementReference  |                              |
  #   # | searchResults_TraceLine           | 61120155CX60                 |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Pending Approval |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Approve" button
  #   When The user click on the "approvechkbox" button
  #   When The user click on the "Continue" button
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name    | field_value |
  #     | authoriseCode | 8754328     |
  #   Then The user click on the "approveBtn" button
  #   # Then The application should display the "status as Approved" for "SR"
  #   #   | summary_status | Approved |
  #   When The user click on the "Close" button
  #   Then The user searches the stored service request with request type "Return of funds" search req type "Return Incorrectly Received Fund" and selects it
  #   Then The application should display the "status as Approved" for "SR"
  #     | summary_status | In Progress |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | In Progress |


  @shakeout-RetunOfFundsExcludeTrns
  Scenario: Return of funds - Check exclude transaction
    Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "JUSSEAUME HOLDING MANAGEMENT GENER" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @shakeout-AHS1
  Scenario: AHS submit and view details screen Validation (without Secondary contact details) (opton selected: TG + Logon)
    Given I am logging in as user "AUTODSS5" with permission to create "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "TG_radiobtn"
    Then The application should display the "following fields" for "Primary Contact details"
      | Prim_email_label | Email Address                   |
      | Prim_email_val   | jeyachandran.jeyaseelan@anz.com |
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | lejggr                           |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "logon_radiobtn"
    #Then The user select "AutoLegal1" from "govtLegalEntity_dropdown"
    When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | AutoLegal1  |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Next"
    Then The application should display the "following fields" for "Primary Contact details"
      | Prim_email_label | Email Address                   |
      | Prim_email_val   | jeyachandran.jeyaseelan@anz.com |
    When I click on "Submit"
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Request After Hours Technical Support" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Successful          |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_Requestedon_value |
      | Summary_Info_Requestedby_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Transactive Global           |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Log on/Connectivity          |
      | issueDesc_label          | Issue Description            |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | issueDesc_val | lejggr |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details         |
      | GovtLegEntity_label           | Government Legal Entity         |
      | GovtLegEntity_val             | AutoLegal1                      |
      | Prim_fullname_label           | Full Name                       |
      | Prim_fullname_val             | DSS5 AUTO                       |
      | Prim_contactNum_label         | Contact Number                  |
      | Prim_contactNum_val           | 8754184144                      |
      | Prim_email_label_view         | Email Address                   |
      | Prim_email_val_view           | jeyachandran.jeyaseelan@anz.com |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Successful |

  @shakeout-AHS2
  Scenario: AHS submit and view details screen Validation (with Secondary contact details) (opton selected: TG + Payments)
    Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "TG_radiobtn"
    Then The application should display the "following fields" for "Primary Contact details"
      | Prim_email_label | Email Address                   |
      | Prim_email_val   | jeyachandran.jeyaseelan@anz.com |
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | My payment is not recieved.Test. |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "payments_radiobtn"
    When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | AutoLegal1  |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Sec_Contact_chkbox"
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | Sec_fullname_val   | kartik       |
      | Sec_contactNum_val | 9629257488   |
      | Sec_email_val      | test@anz.com |
    When I click on "Next"
    When I click on "Submit"
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    Then The request id is stored from the element "responseId"
    When The user Clicks the "Ok" button
    Then The user searches stored service request with request type "Request After Hours Technical Support" and selects it
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Successful          |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_RequestID_value   |
      | Summary_Info_Requestedon_value |
      | Summary_Info_Requestedby_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Transactive Global           |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Payments                     |
      | issueDesc_label          | Issue Description            |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | issueDesc_val | My payment is not recieved.Test. |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details         |
      | GovtLegEntity_label           | Government Legal Entity         |
      | GovtLegEntity_val             | AutoLegal1                      |
      | Prim_fullname_label           | Full Name                       |
      | Prim_fullname_val             | DSS5 AUTO                       |
      | Prim_contactNum_label         | Contact Number                  |
      | Prim_contactNum_val           | 8754184144                      |
      | Prim_email_label_view         | Email Address                   |
      | Prim_email_val_view           | jeyachandran.jeyaseelan@anz.com |
    Then The application should display the "following fields" for "Secondary Contact details in Review and submt screen"
      | Sec_fullname_val                | kartik                    |
      | Sec_contactNum_val              | 9629257488                |
      | Sec_email_val                   | test@anz.com              |
      | secondaryContactDetails_heading | Secondary Contact Details |
      | Sec_fullname_label              | Full Name                 |
      | Sec_contactNum_label            | Contact Number            |
      | Sec_email_label                 | Email Address             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Successful |

  @shakeout-AHS3
  Scenario: AHS submit and view details screen Validation (with Secondary contact details) (opton selected: Fileactive + Reporting/fileDelivery)
    Given I am logging in as user "AUTODSS5" with permission to create "Recall Payment" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "Fileactive_radiobtn"
    Then The application should display the "following fields" for "Primary Contact details"
      | Prim_email_label | Email Address                   |
      | Prim_email_val   | jeyachandran.jeyaseelan@anz.com |
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | lejggr                           |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "reporting_radiobtn"
    # Then The user select "AutoLegal1" from "govtLegalEntity_dropdown"
    When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | AutoLegal1  |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Sec_Contact_chkbox"
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | Sec_fullname_val   | kartik       |
      | Sec_contactNum_val | 9629257488   |
      | Sec_email_val      | test@anz.com |
    When I click on "Next"
    When I click on "Submit"
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Successful          |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_RequestID_value   |
      | Summary_Info_Requestedon_value |
      | Summary_Info_Requestedby_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Fileactive                   |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Reporting/File Delivery      |
      | issueDesc_label          | Issue Description            |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | issueDesc_val | lejggr |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details         |
      | GovtLegEntity_label           | Government Legal Entity         |
      | GovtLegEntity_val             | AutoLegal1                      |
      | Prim_fullname_label           | Full Name                       |
      | Prim_fullname_val             | DSS5 AUTO                       |
      | Prim_contactNum_label         | Contact Number                  |
      | Prim_contactNum_val           | 8754184144                      |
      | Prim_email_label_view         | Email Address                   |
      | Prim_email_val_view           | jeyachandran.jeyaseelan@anz.com |
    Then The application should display the "following fields" for "Secondary Contact details in Review and submt screen"
      | Sec_fullname_val                | kartik                    |
      | Sec_contactNum_val              | 9629257488                |
      | Sec_email_val                   | test@anz.com              |
      | secondaryContactDetails_heading | Secondary Contact Details |
      | Sec_fullname_label              | Full Name                 |
      | Sec_contactNum_label            | Contact Number            |
      | Sec_email_label                 | Email Address             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Successful |

  @shakeout-ManageBPAYFacility
  Scenario: Viewing the  case for Manage BPAY Facility
    Given I am logging in as user "AUTODSS5" with permission to create "Manage BPAY Facility" service request
    Then The user searches the stored service request with request type "Manage BPAY Facility" search req type "Manage BPAY Facility" and selects it
    #Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The "Summary_Info_RequestID_value" value displays the id for "Manage BPAY Facility" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Manage BPAY Facility"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-adduser @dryrun
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
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-openAccount
  Scenario: Viewing case, checking the status for open account
    Given I am logging in as user "AUTODSS5" with permission to create "Add User to Digital Channel" service request
    Then The user searches the stored service request with request type "Open Account" search req type "Open Account" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Open Account" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "open Account SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |





  @shakeout-AddSignatory
  Scenario: Viewing case, checking the status for Add Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Add Signatory" service request
    Then The user searches the stored service request with request type "Add Signatory" search req type "Manage Authorised Person" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Add Signatory" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add Signatory SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AddAccounttoDigitalChannel
  Scenario: Viewing case, checking the status for Add Account to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Account to Digital Channel" service request
    Then The user searches the stored service request with request type "Add Account to Digital Channel" search req type "Channel Account Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Add Account to Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add Account to digital channel SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-AmendGroupMandate
  Scenario: Viewing case, checking the status for Amend Group Mandate
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Group Mandate" service request
    Then The user searches the stored service request with request type "Amend Group Mandate" search req type "Amend Group Mandate" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Group Mandate" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend Group Mandate"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendSignatory
  Scenario: Viewing case, checking the status for Amend Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Signatory" service request
    Then The user searches the stored service request with request type "Amend Signatory" search req type "Manage Authorised Person" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Signatory" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend User SR"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendUserofDigitalChannel
  Scenario: Viewing case, checking the status for Amend User of Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend User of Digital Channel" service request
    Then The user searches the stored service request with request type "Amend User" search req type "Channel User Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend User" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend User SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendAccountonDigitalChannel
  Scenario: Viewing case, checking the status for Amend Account on Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Account on Digital Channel" service request
    Then The user searches the stored service request with request type "Amend Account" search req type "Channel Account Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Account" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend account on digital channel SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendBillingDetails
  Scenario: Viewing case, checking the status for Amend Billing Details
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Billing Details" service request
    Then The user searches the stored service request with request type "Amend Billing Details" search req type "Amend Billing Details" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Billing Details" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend billin details"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendDigitalChannelDetails
  Scenario: Viewing case, checking the status for Amend Digital Channel Details
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Digital Channel Details" service request
    Then The user searches the stored service request with request type "Amend Digital Channel" search req type "Amend Channel Details" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend Digital Channel Details"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-CloseAccount
  Scenario: Viewing case, checking the status for Close Account
    Given I am logging in as user "AUTODSS5" with permission to create "Close Account" service request
    Then The user searches the stored service request with request type "Close Account" search req type "Close Account" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Close Account" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Close Account SR"
      # | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency         | AUD                               |
      | Summary_Info_YourReference_val | testpurpose                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-CloseDigitalChannel
  Scenario: Viewing case, checking the status for Close Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Close Digital Channel" service request
    Then The user searches the stored service request with request type "Close Digital Channel" search req type "Close Channel" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Close Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Close digital Channel"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |




  # @shakeout-DeleteSignatory @firstapprover
  # Scenario: Viewing case, checking the status for Delete Signatory
  #   Given I am logging in as token user "AUTODSS8" with permission to create "Recall Payment" service request
  #   Then The user searches the stored service request with request type "Delete Signatory" search req type "Manage Authorised Person" and selects it
  #   Then The "Summary_Info_RequestID_value" value displays the id for "Delete Signatory" SR
  #   Then The application should display following fields "in view details screen"
  #     | field_name                       |
  #     | commentsTable                    |
  #     | Summary_Info_RequestID_value     |
  #     | Summary_Info_Requestedby_value   |
  #     | Summary_Info_RequestStatus_value |
  #   Then The application should display the "fields with text in view details" for "Delete Signatory"
  #     | Legal_Entity_Value             | AutoLegal1  |
  #     | Summary_Info_YourReference_val | testpurpose |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | Pending Approval |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display following fields "Return of funds view details screen"
  #     | field_name |
  #     | Approve    |
  #     | Reject     |
  #   When The user click on the "Approve" button
  #   When The user click on the "approvechkbox" button
  #   Then The user click on the "approveBtn" button
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | Summary_Info_RequestStatus_value | Pending Approval |

  @shakeout-DeleteSignatory
  Scenario: Viewing case, checking the status for Delete Signatory
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Signatory" service request
    Then The user searches the stored service request with request type "Delete Signatory" search req type "Manage Authorised Person" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Delete Signatory" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Delete Signatory"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    # Then The application should display following fields "Return of funds view details screen"
    #   | field_name |
    #   | Approve    |
    #   | Reject     |
    # When The user click on the "Approve" button
    # When The user click on the "approvechkbox" button
    # When The user click on the "Continue" button
    # Then The user enter the following text in corresponding textboxes
    #   | field_name    | field_value |
    #   | authoriseCode | 8754328     |
    # Then The user click on the "approveBtn" button
    # Then The application should display the "status as Approved" for "SR"
    #   | Summary_Info_RequestStatus_value | Approved |
    # When The user click on the "Close" button
    # Then The user searches the stored service request with request type "Delete Signatory" search req type "Manage Authorised Person" and selects it
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_RequestStatus_value | In Progress |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus1 | In Progress |


  # @shakeout-DeleteSignatory @Reject @jk
  #   Scenario: Viewing case, checking the status for Delete Signatory
  #     Given I am logging in as token user "AUTODSS7" with permission to create "Recall Payment" service request
  #     Then The user searches the stored service request with request type "Delete Signatory Reject" search req type "Manage Authorised Person" and selects it
  #     Then The "Summary_Info_RequestID_value" value displays the id for "Delete Signatory" SR
  #     Then The application should display following fields "in view details screen"
  #       | field_name                       |
  #       | commentsTable                    |
  #       | Summary_Info_RequestID_value     |
  #       | Summary_Info_Requestedby_value   |
  #       | Summary_Info_RequestStatus_value |
  #     Then The application should display the "fields with text in view details" for "Delete Signatory"
  #       | Legal_Entity_Value             | AutoLegal1  |
  #       | Summary_Info_YourReference_val | testpurpose |
  #     Then The application should display following fields "Return of funds view details screen"
  #       | field_name |
  #       | Approve    |
  #       | Reject     |
  #     When The user click on the "Reject" button
  #     Then The application should display the "Reject model window" for "SR"
  #       | rejectDialog-title  | Reject Service Request |
  #       | cancelBtn           | Cancel                 |
  #       | rejectBtn           | Reject                 |
  #       | rejectComment-label | Reason For Rejection   |
  #       | rejectComment       |                        |
  #     Then The user enter "Rejection comments text" into the "rejectComment" text field
  #     And The user click on the "rejectBtn" button
  #     Then The application should display the "Service Request Header and Status" for "Delete User from digital channel"
  #       | summary_status               | Rejected                |

  @shakeout-DeleteUserfromDigitalChannel
  Scenario:Delete User from Digital Channel  PCM - Create and Search service request
    Given I am logging in as token user "AUTODSS5" with permission to create "Delete User from Digital Channel" service request
    When The user navigate to the "Delete User from Digital Channel" service request screen
    Then The application should display the "service request Header details" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel service request"
      | Legal_Entity_header          | Select Legal Entity                             |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | AutoLegal1 |
    Then The application should allow user to select and upload one or more files from computer
      | filepath1 | //resources//input//Test-pdf.pdf    |
      | filepath2 | //resources//input//Test-pdf1.pdf   |
      | filepath3 | //resources//input//Test-Excel.xlsx |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request and selects it
    Then The application should display the "service request Header detailsin view mode" for "Delete User from Digital Channel SR"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel SR"
      | Legal_Entity_Name  | Legal entity applicable to this request |
      | leLabel            | Legal entity applicable to this request |
      | Legal_Entity_Value | AutoLegal1                              |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Delete User from Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Delete User from Digital Channel service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |


  # @shakeout-DeleteUserfromDigitalChannel @pcmsingleapproval
  # Scenario: Viewing case, checking the status for Delete User from Digital Channel
  #   Given I am logging in as token user "AUTODSS7" with permission to create "Recall Payment" service request
  #   Then The user searches the stored service request with request type "Delete User" search req type "Channel User Maintenance" and selects it
  #   Then The "Summary_Info_RequestID_value" value displays the id for "Delete User" SR
  #   Then The application should display following fields "in view details screen"
  #     | field_name                       |
  #     | commentsTable                    |
  #     | Summary_Info_RequestID_value     |
  #     | Summary_Info_Requestedby_value   |
  #     | Summary_Info_RequestStatus_value |
  #   Then The application should display the "fields with text in view details" for "Delete User form digital channel"
  #     | Legal_Entity_Value             | AutoLegal1  |
  #     | Summary_Info_YourReference_val | testpurpose |
  #   # Then I click on "viewAuditHistory"
  #   # Then The application should display the "status as In progress in Audit history" for "service request"
  #   #   | AuditHistoryStatus | Pending Approval |
  #   # When The user click on the "cancelBtn" button
  #   # Then The application should display following fields "Return of funds view details screen"
  #   #   | field_name |
  #   #   | Approve    |
  #   #   | Reject     |
  #   # When The user click on the "Approve" button
  #   # When The user click on the "approvechkbox" button
  #   # When The user click on the "Continue" button
  #   # Then The user enter the following text in corresponding textboxes
  #   #   | field_name    | field_value |
  #   #   | authoriseCode | 8754328     |
  #   # Then The user click on the "approveBtn" button
  #   # Then The application should display the "status as Approved" for "SR"
  #   #   | Summary_Info_RequestStatus_value | Approved |
  #   # When The user click on the "Close" button
  #   # Then The user searches the stored service request with request type "Delete User" search req type "Channel User Maintenance" and selects it
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_RequestStatus_value | In Progress |
  #   Then I click on "viewAuditHistory"
  #   Then The application should display the "status as In progress in Audit history" for "service request"
  #     | AuditHistoryStatus | In Progress |

  # @shakeout-DeleteUserfromDigitalChannel @ApprovalForRejection
  # Scenario: View and reject the case for Delete User from Digital Channel
  # Given I am logging in as token user "AUTODSS8" with permission to create "Delete User from Digital Channel" service request
  # Then The user searches the stored service request with request type "Delete User reject" search req type "Channel User Maintenance" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the id for "Delete User reject" SR
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Delete User from digital channel"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as Pending Approval in Audit history" for "service request"
  #   | AuditHistoryStatus | Pending Approval |
  # When The user click on the "cancelBtn" button
  # Then The application should display following fields "Return of funds view details screen"
  #   | field_name |
  #   | Approve    |
  #   | Reject     |
  # When The user click on the "Approve" button
  # When The user click on the "approvechkbox" button
  # Then The user click on the "approveBtn" button
  # Then The application should display the "status as Pending Approval" for "SR"
  #   | summary_status | Pending Approval |

  # @shakeout-DeleteUserfromDigitalChannel @RejectAfterApproval
  # Scenario: View and reject the case for Delete User from Digital Channel
  # Given I am logging in as token user "AUTODSS9" with permission to create "Delete User reject" service request
  # Then The user searches the stored service request with request type "Delete User reject" search req type "Manage Authorised Person" and selects it
  # Then The "Summary_Info_RequestID_value" value displays the id for "Delete User reject" SR
  # Then The application should display following fields "in view details screen"
  #   | field_name                       |
  #   | commentsTable                    |
  #   | Summary_Info_RequestID_value     |
  #   | Summary_Info_Requestedby_value   |
  #   | Summary_Info_RequestStatus_value |
  # Then The application should display the "fields with text in view details" for "Delete Signatory"
  #   | Legal_Entity_Value             | AutoLegal1  |
  #   | Summary_Info_YourReference_val | testpurpose |
  # Then I click on "viewAuditHistory"
  # Then The application should display the "status as Pending Approval in Audit history" for "service request"
  #   | AuditHistoryStatus | Pending Approval |
  # When The user click on the "cancelBtn" button
  # Then The application should display following fields "on Delete Signatory (AU) screen"
  #   | field_name |
  #   | Approve    |
  #   | Reject     |
  # When The user click on the "Reject" button
  # Then The application should display the "Reject model window" for "SR"
  #   | rejectDialog-title  | Reject Service Request |
  #   | cancelBtn           | Cancel                 |
  #   | rejectBtn           | Reject                 |
  #   | rejectComment-label | Reason For Rejection   |
  #   | rejectComment       |                        |
  # Then The user enter "Rejection comments text" into the "rejectComment" text field
  # And The user click on the "rejectBtn" button
  #   | summary_status               | Rejected                |



  @shakeout-DeleteAccountfromDigitalChannel
  Scenario: Viewing case, checking the status for Delete Account from Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Account from Digital Channel" service request
    Then The user searches the stored service request with request type "Delete Account" search req type "Channel Account Maintenance" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Delete Account" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Delete Account from digital channel"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendLegalEntityName
  Scenario: Viewing case, checking the status for Amend Legal Entity Name
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity Name" service request
    Then The user searches the stored service request with request type "Amend Legal Entity Name" search req type "Amend Legal Entity" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Legal Entity Name" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add Legal Entity SR"
      # | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency         | AUD                               |
      | Summary_Info_YourReference_val | testpurpose                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendStatementAddress
  Scenario: Viewing case, checking the status for Amend Statement Address
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Statement Address" service request
    Then The user searches the stored service request with request type "Amend Statement Address" search req type "Amend Statement Address" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Statement Address" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend statement SR"
      #  | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency         | AUD                               |
      | Summary_Info_YourReference_val | testpurpose                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-AmendLegalEntityAdministrator/Liquidator/Receiver
  Scenario: viewing case, checking the status for Amend Legal Entity Administrator/Liquidator/Receiver
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity Administrator/Liquidator/Receiver" service request
    Then The user searches the stored service request with request type "Amend Legal Entity Administrator" search req type "Amend Legal Entity" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Legal Entity Administrator" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "AmendLegalEntityAdministrator/Liquidator/Receiver SR"
      #  | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency         | AUD                               |
      | Summary_Info_YourReference_val | testpurpose                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-UploadDocuments
  Scenario: Viewing case, checking the status for Upload documents (AU)
    Given I am logging in as user "AUTODSS5" with permission to create "Upload Documents" service request
    Then The user searches the stored service request with request type "Upload Documents" search req type "Upload Documents" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Upload Documents" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                     |
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
      | AccountDescription     | AutoLegal1                          |
    Then The application should display the "fields with text in view details" for "Close Account SR"
      | Summary_Info_YourReference_val   | testpurpose |
      | Summary_Info_RequestStatus_value | In Progress |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-UploadDocuments
  Scenario: Viewing case, checking the status for Upload documents (NZ)
    Given I am logging in as user "AUTODSS5" with permission to create "Upload Documents NZ" service request
    Then The user searches the stored service request with request type "Upload Documents NZ" search req type "Upload Documents" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Upload Documents NZ" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                     |
      | AccountName            | MELLING TRADING PROFESSIONAL GENERA |
      | AccountDefaultCurrency | AUD                                 |
      | AccountDescription     | AutoLegal1                          |
    Then The application should display the "fields with text in view details" for "Close Account SR"
      | Summary_Info_YourReference_val   | testpurpose |
      | Summary_Info_RequestStatus_value | Delivered   |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Delivered |




  @shakeout-AddLoanDealtoDigitalChannel
  Scenario: viewing case, checking the status for Add Loan Deal to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Loan Deal to Digital Channel" service request
    Then The user searches the stored service request with request type "Add Loan Deal to Digital Channel" search req type "Add Loan Deal" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Add Loan Deal to Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add Loan Deal to Digital Channel SR"
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
      | Legal_Entity_Value             | AutoLegal1                                                                                                |
      | Summary_Info_YourReference_val | testpurpose                                                                                               |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout-ManageBureauPayments
  Scenario: viewing case, checking the status for Manage Bureau Payments
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bureau (Payments)" service request
    Then The user searches the stored service request with request type "Manage Bureau" search req type "Manage Bureau" and selects it
    Then The "Summary_Info_RequestID_value" value displays the id for "Manage Bureau" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Manage BPAY Facility"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |




  @shakeout-BackdateTransaction
  Scenario: Backdate Transaction - Create 'Backdate Transaction' request, search and view the details
    Given I am logging in as user "AUTODSS5" with permission to create "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    Then The application should display the "Service Request Header" for "Backdate Transaction"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | May 7, 2021 |
      | amount   |             |
    Then The application should display the "TransactionHeaderLabel" for "Backdate SR" text
      | TransactionHeaderLabel | Search for Transaction |
    # Then The application should display the "transaction search results grid" for "Backdate Transaction Service Request"
    #   | transactionGridDate               | Post Date                    |
    #   | transactionGridAmount             | Amount                       |
    #   | transactionGridDebit/Credit       | Debit/Credit                 |
    #   | transactionGridNarrative          | Narrative                    |
    #   | transactionGridAuxdom             | Auxdom                       |
    #   | transactionGridLodgementReference | Lodgement Reference          |
    #   | transactionGridTraceline          | Traceline                    |
    #   | transactionGrid1                  | Apr 09, 2020                 |
    #   | transactionGrid2                  | 3,400.00                     |
    #   | transactionGrid3                  | Cr                           |
    #   | transactionGrid4                  | DEPOSIT TEST RETURN OF FUNDS |
    #   | transactionGrid9                  | 0000000121                   |
    #   | transactionGrid5                  |                              |
    #   | transactionGrid6                  | 61120155CX60                 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user picks date to Backdate transaction
      | PostDate | May 7, 2021 |
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value                |
      | backdatereason | backdatereason sample text |
      | your_reference | testpurpose                |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      | AccountName            | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal2                        |
    Then The application should display the "TransactionHeaderLabel" for "Backdate SR" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "Backdate SR on review page"
      | TrnstnGridHedr_Date               | Post Date           |
      | TrnstnGridHedr_Amount             | Amount              |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
      | TrnstnGridHedr_Narrative          | Narrative           |
      | TrnstnGridHedr_Auxdom             | Auxdom              |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference |
      | TrnstnGridHedr_Traceline          | Traceline           |
    # | searchResults_Date                | Sep 24, 2020                 |
    # | searchResults_Amount              | 3,400.00                     |
    # | searchResults_DebitCreditType     | Cr                           |
    # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
    # | searchResults_Auxdom              | 0000000121                   |
    # | searchResults_LodgementReference  |                              |
    # | searchResults_TraceLine           | 61120155CX60                 |
    Then The application should display the "Backdate Details" for "Backdate SR in review mode"
      | backdateDetails         | Backdate Details                                                   |
      | backdateValue-field-txt | Backdate Transaction to                                            |
      | backdateValue-field     | May 07, 2021                                                       |
      | reason-field            | Please tell us why you are requesting to backdate this transaction |
      | backdatereason          | backdatereason sample text                                         |
    Then The application should display the "Your Reference details" for "Backdate SR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testpurpose               |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Backdate Transaction" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "Service Request Header" for "Backdate Transaction"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header              | Summary Information |
      | Summary_Info_RequestID_txt       | Request ID          |
      | Summary_Info_Requestedon_txt     | Requested on        |
      | Summary_Info_Requestedby_txt     | Requested by        |
      | Summary_Info_RequestStatus_txt   | Your Reference      |
      | Summary_Info_YourReference_txt   | Request Status      |
      | Summary_Info_YourReference_value | testpurpose         |
    Then The application should display the "Account details" for "Backdate Transaction service request in view mode"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | COOPER PRIVATE INDUSTRIAL GENERAL |
      | AccountDefaultCurrency | AUD                               |
      | AccountDescription     | AutoLegal2                        |
    And The application should display the "TransactionHeaderLabel" for "Backdate Transaction Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "Backdate Transaction on view page"
      | TrnstnGridHedr_Date               | Post Date           |
      | TrnstnGridHedr_Amount             | Amount              |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit        |
      | TrnstnGridHedr_Narrative          | Narrative           |
      | TrnstnGridHedr_Auxdom             | Auxdom              |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference |
      | TrnstnGridHedr_Traceline          | Traceline           |
    # | searchResults_Date                | Jul 24, 2020                 |
    # | searchResults_Amount              | 3,400.00                     |
    # | searchResults_DebitCreditType     | Cr                           |
    # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
    # | searchResults_Auxdom              | 0000000121                   |
    # | searchResults_LodgementReference  |                              |
    # | searchResults_TraceLine           | 61120155CX60                 |
    Then The application should display the "Backdate Details" for "Backdate Transaction SR in view mode"
      | backdateDetails         | Backdate Details                                                   |
      | backdateValue-field-txt | Backdate Transaction to                                            |
      | backdateValue-field     | May 07, 2021                                                       |
      | reason-field            | Please tell us why you are requesting to backdate this transaction |
      | backdatereason          | backdatereason sample text                                         |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @shakeout-GE#Transaction
  Scenario: General Enquiry - Create General Enquiry request by selecting Transaction and search and view the details
    Given I am logging in as user "AUTODSS5" with permission to create "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The user click on the "transaction" radioButton
    Then The application should display the "SearchforTransactionLabel" for "General Enquiry request"
      | enquiryTypeDescription | Note: only raise a general enquiry on a transaction if your enquiry is not covered by one of our Payment & Transaction service requests. |
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "General Enquiry request" text
      | SearchforTransactionHeader | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "General Enquiry request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | February 23, 2021 |
      | amount   |                   |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date           |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Aux Dom             |
      | transactionGridTraceline          | Traceline           |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    #   # | searchResults_Date                | Feb 09, 2020                 |
    #   # | searchResults_Amount              | 3,400.00                     |
    #   # | searchResults_DebitCreditType     | Cr                           |
    #   # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS |
    #   # | searchResults_Auxdom              | 0000000121                   |
    #   # | searchResults_LodgementReference  |                              |
    #   # | searchResults_TraceLine           | 61120155CX60                 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value          |
      | enquiryDetails | enquiry Details text |
      | contactNumber  | 9876543287           |
      | your_reference | testpurpose          |
    When The user Clicks the "Next" button
    Then The application should display the "Account,Transaction and Enquiry details" for "General Enquiry request on review page"
      | titleL                            | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL                      | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
      | enquiryTypeDescription            | Note: only raise a general enquiry on a transaction if your enquiry is not covered by one of our Payment & Transaction service requests.                                                                |
      | enquiryTypeHeader                 | Enquiry Type                                                                                                                                                                                            |
      | enquiryTypeL                      | Enquiry Type                                                                                                                                                                                            |
      | AccountL                          | Transaction                                                                                                                                                                                             |
      | AccountName                       | COOPER PRIVATE INDUSTRIAL GENERAL                                                                                                                                                                       |
      | AccountDefaultCurrency            | AUD                                                                                                                                                                                                     |
      | AccountDescription                | AutoLegal2                                                                                                                                                                                              |
      | enquiryTypeContainer              | Enquiry Type                                                                                                                                                                                            |
      | enquiryDetails-field              | Please provide the details of your enquiry below                                                                                                                                                        |
      | contactNumber                     | 9876543287                                                                                                                                                                                              |
      | Your_Reference_header             | Your Reference (optional)                                                                                                                                                                               |
      | your_reference                    | testpurpose                                                                                                                                                                                             |
      | TransactionHeader                 | Transaction                                                                                                                                                                                             |
      | TrnstnGridHedr_Date               | Post Date                                                                                                                                                                                               |
      | TrnstnGridHedr_Amount             | Amount                                                                                                                                                                                                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                                                                                                            |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                                                                                                               |
      | TrnstnGridHedr_Auxdom             | Aux Dom                                                                                                                                                                                                 |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                                                                                                                     |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                                                                                                               |
    # | searchResults_Date                | Feb 09, 2020                                                                                                                                                                                            |
    # | searchResults_Amount              | 3,400.00                                                                                                                                                                                                |
    # | searchResults_DebitCreditType     | Cr                                                                                                                                                                                                      |
    # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS                                                                                                                                                                            |
    # | searchResults_Auxdom              | 0000000121                                                                                                                                                                                              |
    # | searchResults_LodgementReference  |                                                                                                                                                                                                         |
    # | searchResults_TraceLine           | 61120155CX60                                                                                                                                                                                            |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "General Enquiry" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "General Enquiry" search req type "General Enquiry" and selects it
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information,Account,Transaction and Enquiry details" for "General Enquiry request in view mode"
      | Summary_Info_header               | Summary Information                                                                                                                      |
      | Summary_Info_RequestID_txt        | Request ID                                                                                                                               |
      | Summary_Info_Requestedon_txt      | Requested on                                                                                                                             |
      | Summary_Info_Requestedby_txt      | Requested by                                                                                                                             |
      | Summary_Info_RequestStatus_txt    | Your Reference                                                                                                                           |
      | Summary_Info_YourReference_txt    | Request Status                                                                                                                           |
      | enquiryTypeDescription            | Note: only raise a general enquiry on a transaction if your enquiry is not covered by one of our Payment & Transaction service requests. |
      | enquiryTypeHeader                 | Enquiry Type                                                                                                                             |
      | enquiryTypeL                      | Enquiry Type                                                                                                                             |
      | optionAccount                     | Transaction                                                                                                                              |
      | AccountName                       | COOPER PRIVATE INDUSTRIAL GENERAL                                                                                                        |
      | AccountDefaultCurrency            | AUD                                                                                                                                      |
      | AccountDescription                | AutoLegal2                                                                                                                               |
      | enquiryDetailsHeader_Transaction  | Enquiry Details                                                                                                                          |
      | enquiryDetails-field              | Please provide the details of your enquiry below                                                                                         |
      | contactNumber                     | 9876543287                                                                                                                               |
      | TransactionHeader                 | Transaction                                                                                                                              |
      | TrnstnGridHedr_Date               | Post Date                                                                                                                                |
      | TrnstnGridHedr_Amount             | Amount                                                                                                                                   |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                                             |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                                                |
      | TrnstnGridHedr_Auxdom             | Aux Dom                                                                                                                                  |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                                                      |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                                                |
    # | searchResults_Date                | Feb 09, 2020                                                                                                                             |
    # | searchResults_Amount              | 3,400.00                                                                                                                                 |
    # | searchResults_DebitCreditType     | Cr                                                                                                                                       |
    # | searchResults_Narrative           | DEPOSIT TEST RETURN OF FUNDS                                                                                                             |
    # | searchResults_Auxdom              | 0000000121                                                                                                                               |
    # | searchResults_LodgementReference  |                                                                                                                                          |
    # | searchResults_TraceLine           | 61120155CX60                                                                                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |

  @shakeout-GE#Account
  Scenario: General Enquiry - Create 'General Enquiry' request by selecting account and search and view the details
    Given I am logging in as user "AUTODSS5" with permission to create "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The select service type marked as complete with tick symbol
    Then The user click on the "account" radioButton
    When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name     | field_value          |
      | enquiryDetails | enquiry Details text |
      | contactNumber  | 9876543287           |
      | your_reference | testpurpose          |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "General Enquiry on review page"
      | titleL                   | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL             | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
      | enquiryTypeHeader        | Enquiry Type                                                                                                                                                                                            |
      | enquiryTypeL             | Enquiry Type                                                                                                                                                                                            |
      | AccountHeaderLabel       | Account Details                                                                                                                                                                                         |
      | AccountName              | COOPER PRIVATE INDUSTRIAL GENERAL                                                                                                                                                                       |
      | AccountDefaultCurrency   | AUD                                                                                                                                                                                                     |
      | AccountDescription       | AutoLegal2                                                                                                                                                                                              |
      | enquiryTypeContainer     | Enquiry Type                                                                                                                                                                                            |
      | enquiryDetails-field     | Please provide the details of your enquiry below                                                                                                                                                        |
      | enquiryDetailsFieldValue | enquiry Details text                                                                                                                                                                                    |
      | contactNumber            | 9876543287                                                                                                                                                                                              |
    Then The application should display the "Your Reference details" for "General Enquiry on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testpurpose               |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "General Enquiry request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "General Enquiry" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "General Enquiry" search req type "General Enquiry" and selects it
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "General Enquiry request in view mode"
      | Summary_Info_header              | Summary Information                              |
      | Summary_Info_RequestID_txt       | Request ID                                       |
      | Summary_Info_Requestedon_txt     | Requested on                                     |
      | Summary_Info_Requestedby_txt     | Requested by                                     |
      | Summary_Info_RequestStatus_txt   | Your Reference                                   |
      | Summary_Info_YourReference_txt   | Request Status                                   |
      | Summary_Info_YourReference_value | testpurpose                                      |
      | enquiryTypeHeader                | Enquiry Type                                     |
      | enquiryTypeL                     | Enquiry Type                                     |
      | optionAccount                    | Account                                          |
      | AccountName                      | COOPER PRIVATE INDUSTRIAL GENERAL                |
      | AccountDefaultCurrency           | AUD                                              |
      | AccountDescription               | AutoLegal2                                       |
      | enquiryDetailsHeader_Account     | Enquiry Details                                  |
      | enquiryDetails-field             | Please provide the details of your enquiry below |
      | enquiryDetailsFieldValue         | enquiry Details text                             |
      | contactNumber                    | 9876543287                                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout#View-AddLegalEntity
  Scenario: Viewing the  case for Add Legal Entity to Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Add Legal Entity to Digital Channel" service request
    Then The user searches the stored service request with request type "Add Legal Entity to Digital Channel" search req type "Add Legal Entity to Digital Channel" and selects it
    #Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The "Summary_Info_RequestID_value" value displays the id for "Add Legal Entity to Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Add Legal Entity to Digital Channel"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @shakeout#View-AmendLegalEntity
  Scenario: Viewing the  case for Amend Legal Entity on Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Legal Entity on Digital Channel" service request
    Then The user searches the stored service request with request type "Amend Legal Entity on Digital Channel" search req type "Amend Legal Entity on Digital Channel" and selects it
    #Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The "Summary_Info_RequestID_value" value displays the id for "Amend Legal Entity on Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Amend Legal Entity on Digital Channel"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |



  @shakeout#View-deleteLegalEntity
  Scenario: Viewing the  case for Delete Legal Entity from Digital Channel
    Given I am logging in as user "AUTODSS5" with permission to create "Delete Legal Entity from Digital Channel" service request
    Then The user searches the stored service request with request type "Delete Legal Entity from Digital Channel" search req type "Delete Legal Entity from Digital Channel" and selects it
    #Then The "Summary_Info_RequestID_value" value displays the stored id
    Then The "Summary_Info_RequestID_value" value displays the id for "Delete Legal Entity from Digital Channel" SR
    Then The application should display following fields "in view details screen"
      | field_name                       |
      | commentsTable                    |
      | Summary_Info_RequestID_value     |
      | Summary_Info_Requestedby_value   |
      | Summary_Info_RequestStatus_value |
    Then The application should display the "fields with text in view details" for "Delete Legal Entity from Digital Channel"
      | Legal_Entity_Value             | AutoLegal1  |
      | Summary_Info_YourReference_val | testpurpose |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @Shakeout-ViewTransaction
  Scenario: View Transaction Details -view
    Given I am logging in as user "AUTODSS5" with permission to create "View Transaction Details" service request
    When The user navigate to the "View Transaction Details" service request screen
    Then The application should display the "Service Request Header" for "View Transaction Details"
      | TraceTransaction_Title       | View Transaction Details (AU)                                                       |
      | TraceTransaction_Description | View additional remitter details relating to your Direct Entry credit transactions. |
    Then The application shows the "cancel" button
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    # Then The application should display the "Account details" for "claim missing on review page"
    #   | AccountHeaderLabel | Account Details                   |
    #   | AccountName        | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
    #   | AccountDescription | AutoLegal1                        |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Trace Transaction Service Request"
      | trasactionTableNote | Double click on a transaction to view additional remitter details. |
    # | TrnstnGridHedr_Date           | Post Date                                                          |
    # | TrnstnGridHedr_Amount         | Amount                                                             |
    # | TrnstnGridHedr_Debit/Credit   | Debit/Credit                                                       |
    # | TrnstnGridHedr_Narrative      | Narrative                                                          |
    # | TrnstnGridHedr_Auxdom         | Auxdom                                                             |
    # | TrnstnGridHedr_TranType       | Tran Type                                                          |
    # | TrnstnGridHedr_Traceline      | Traceline                                                          |
    # | searchResults_Date            | Mar 09, 2019                                                       |
    # | searchResults_Amount          | 2,204.00                                                           |
    # | searchResults_DebitCreditType | Dr                                                                 |
    # | searchResults_Narrative       | PAYMENT ANZ BANK TO PAYEE NAME INCLUDES FEE $4.00                  |
    # | searchResults_TranType        | P PAYMENT                                                          |
    # | searchResults_Auxdom          | 0000000302                                                         |
    # | searchResults_TraceLine       | 22040155CX20                                                       |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The count of "Transaction search result" should be "5"


  @shakeout-ChequeBook
  Scenario: Cheque Book User should able to initiate new Stop Cheque Book Request
    Given I am logging in as user "AUTODSS5" with permission to create "Stop Cheque" service request
    When The user navigated to the "Stop Cheque" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Cheque Book" as Request Type
    And The user Clicks the "Review & Submit" button
    Then The application should display the "chqBookSize-error messages" in the "Stop Cheque Book Creation Page"
      | chqBookSize-error | Cheque Book Size is mandatory |
    Then The application should display the "Serial-error messages" in the "Order Cheque Book Creation Page"
      | Serial-error | First Serial Number is mandatory |
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The "responseId" for the "Stop Cheque" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Stop Cheque" search req type "Stop Cheque" and selects it
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus        | Submitted to Core system |
      | AuditHistoryStatus_sucess | Successful               |

  @shakeout-MultipleCheques
  Scenario: Stop Individual Cheque - Multiple - Successful Request
    Given I am logging in as user "AUTODSS5" with permission to create "Stop Cheque" service request
    When The user navigated to the "Stop Cheque" service request screen
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And The user Clicks the "Add" button "Twice" in Cheque Details section
    And I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum | chqAmt   | chqIssDt     | payeeName      | note          |
      | 123456 | 1,000.00 | Oct 20, 2020 | Testing Payee1 | Testing Note1 |
      | 456789 | 2,000.00 | Oct 20, 2020 | Testing Payee2 | Testing Note2 |
      | 123789 | 3,000.00 | Oct 20, 2020 | Testing Payee3 | Testing Note3 |
    And The user Clicks the "Review & Submit" button
    Then The application should display following fields "Order Cheque Book submission Review Page"
      | field_name       |
      | accountContainer |
      | Cancel           |
      | previous         |
      | submit           |
    Then The application accepts input and move to Stop Individual Cheque submission Review Page
    When The user Clicks the "previous" button
    Then The application shows previously entered details
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application should display following fields "SR confirmation pop-up"
      | field_name                 |
      | viewRequest                |
      | view_request_link          |
      | raise_another_request_link |
    Then I click on "viewRequest"
    Then The application should display the "Cash Management Service Requests for Stop Cheque request"
      | field_name                       |
      | Cash Management Service Requests |
      | summaryGrid-RequestType1         |
      | summaryGrid-RequestType2         |
      | summaryGrid-RequestType3         |


  @shakeout-CancelRequest#Webform
  Scenario: Return Incorrectly Received Funds - Webform - Instant Cancel Service Request
    Given I am logging in as user "AUTODSS5" with permission to create "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#PendingApproval" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                   |
      | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency | AUD                               |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      #   | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    Then The application should display the "Cancel Request" button
    When The user Clicks the "Cancel Request" button
    Then The application should display the "Cancel Request model window" for "SR"
      | cancelDialog-title | Cancel Service Request                                                                        |
      | reason-label       | Cancel Reason                                                                                 |
      | notes-label        | Please provide cancellation details                                                           |
      | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
      | reasonoption1 |                            |
      | reasonoption2 | Duplicate Request          |
      | reasonoption3 | Request No Longer Required |
      | reasonoption4 | Request Resolved           |
    Then The application should display the "SubmitBtn" button
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "following Cancel Request type" for "SR under cancel model window"
      | reason-error | Cancellation Reason is mandatory   |
      | notes-error  | Cancellation details are mandatory |
    When The user Clicks the "cancel" button
    Then The application does not show "cancelDialog" dialog
    When The user Clicks the "Cancel Request" button
    When The user select the "Duplicate Request" from "cancelReasonType" drop down
    Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "(.*)" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Cancelled           |


  # @shakeout-CancelRequestPCM Half Done
  # Scenario: Delete Signatory - PCM- Instant Cancel Service Request
  #   Given I am logging in as user "AUTODSS5" with permission to create "Delete Signatory" service request
  #   When The user navigate to the "Delete Signatory" service request screen
  #   Then The application should display following fields "Delete Signatory"
  #     | field_name           |
  #     | dowload_form         |
  #     | browse_upload        |
  #     | your_reference       |
  #     | legalEntity_dropdown |
  #   Then The application should allow user to select and upload single file
  #     | filepath | //resources//input//Test-pdf.pdf |
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value |
  #     | your_reference | testpurpose |
  #   Then The user select a legal entity from the search legal entity pop up
  #     | legalEntity | AutoLegal1 |
  #   Then I click on "Submit"
  #   Then The application should display following fields "Add User SR confirmation pop-up"
  #     | field_name                 |
  #     | request_status             |
  #     | requestId                  |
  #     | view_request_link          |
  #     | raise_another_request_link |
  #   Then I click on "view_request_link"
  #   Then The application should display following fields "in view details screen"
  #     | field_name                       |
  #     | commentsTable                    |
  #     | Summary_Info_RequestID_value     |
  #     | Summary_Info_Requestedby_value   |
  #     | Summary_Info_RequestStatus_value |
  #   Then The application should display the "fields with text in view details" for "Delete Signatory"
  #     | Legal_Entity_Value             | AutoLegal1  |
  #     | Summary_Info_YourReference_val | testpurpose |
  #   Then The application should display the "Cancel Request" button
  #   When The user Clicks the "Cancel Request" button
  #   Then The application should display the "Cancel Request model window" for "SR"
  #     | cancelDialog-title | Cancel Service Request                                                                        |
  #     | reason-label       | Cancel Reason                                                                                 |
  #     | notes-label        | Please provide cancellation details                                                           |
  #     | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #   Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
  #     | reasonoption1 |                            |
  #     | reasonoption2 | Duplicate Request          |
  #     | reasonoption3 | Request No Longer Required |
  #     | reasonoption4 | Request Resolved           |
  #   Then The application should display the "SubmitBtn" button
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "following Cancel Request type" for "SR under cancel model window"
  #     | reason-error | Cancellation Reason is mandatory   |
  #     | notes-error  | Cancellation details are mandatory |
  #   When The user Clicks the "cancel" button
  #   Then The application does not show "cancelDialog" dialog
  #   When The user Clicks the "Cancel Request" button
  #   When The user select the "Duplicate Request" from "cancelReasonType" drop down
  #   Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "(.*)" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "service request Header details" for "Delete Signatory"
  #     | Title       | Delete Signatory                                                                                                                           |
  #     | Description | Delete authorised signatories from accounts with the option of removing them as authorised persons and/or users for your digital channels. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Cancelled           |


  # @shakeout-RetunOfFunds @CancelAfterApproval Half Done
  # Scenario: Return Incorrectly Received Funds - Webform - Pending Cancel Request
  #   Given I am logging in as user "AUTODSS7" with permission to create "Return Incorrectly Received Funds" service request
  #   When The user navigate to the "Return Incorrectly Received Funds" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   |               |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#PendingApproval" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                   |
  #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
  #     | AccountDefaultCurrency | AUD                               |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The request id is stored from the element "responseId"
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "ROF service request in view mode"
  #     | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
  #     | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
  #   Then The application should display the "request status as More Information Required" for "ROF SR"
  #     | Summary_Info_header              | Summary Information     |
  #     | Summary_Info_RequestID_txt       | Request ID              |
  #     | Summary_Info_Requestedon_txt     | Requested on            |
  #     | Summary_Info_Requestedby_txt     | Requested by            |
  #     | summary_status                   | Pending Approval        |
  #     | Summary_Info_YourReference_value | testROF#PendingApproval |
  #   When The user click on the "Approve" button
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name    | field_value |
  #     | authoriseCode | 8754328     |
  #   Then The user click on the "approveBtn" button
  #   Then The application should display the "Approve" toast notification
  #   Then The application should display the "status as Approved" for "SR"
  #     | summary_status | Approved |
  #   Then The application should display the "Cancel Request" button
  #   When The user Clicks the "Cancel Request" button
  #   Then The application should display the "Cancel Request model window" for "SR"
  #     | cancelDialog-title | Cancel Service Request                                                                        |
  #     | reason-label       | Cancel Reason                                                                                 |
  #     | notes-label        | Please provide cancellation details                                                           |
  #     | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #   Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
  #     | reasonoption1 |                            |
  #     | reasonoption2 | Duplicate Request          |
  #     | reasonoption3 | Request No Longer Required |
  #     | reasonoption4 | Request Resolved           |
  #   Then The application should display the "SubmitBtn" button
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "following Cancel Request type" for "SR under cancel model window"
  #     | reason-error | Cancellation Reason is mandatory   |
  #     | notes-error  | Cancellation details are mandatory |
  #   When The user Clicks the "cancel" button
  #   Then The application does not show "cancelDialog" dialog
  #   When The user Clicks the "Cancel Request" button
  #   When The user select the "Duplicate Request" from "cancelReasonType" drop down
  #   Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "(.*)" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header" for "ROF service request in view mode"
  #     | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
  #     | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Cancelled           |



  @SIT_MBF
  Scenario: Manage Bank Feeds - Activate Bank Feeds -Intuit Quickbooks
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "INTUIT" from "accountSoftwarePlatform" drop down
    Then The user enter "testcompanyId123" into the "companyId" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | accountsLabel                   | Account(s)                                                                               |
      | accountNumber                   | Account Name                                                                             |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |


  @SIT_MBF
  Scenario: Manage Bank Feeds - Adding multiple accounts - INTUIT
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "INTUIT" from "accountSoftwarePlatform" drop down
    Then The user enter "testcompanyId123" into the "companyId" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      #| myobBankFeedReferenceNo-label   | MYOB Bank Feed Reference Number                                                          |
      # | myobBankFeedReferenceNo         | myobBankFeedReferenceNo123                                                               |
      | accountsLabel                   | Account(s)                                                                               |
      | accountTableLabel-1             | Account Number                                                                           |
      | accountTableLabel-2             | Account Name                                                                             |
      # | accountTableLabel-3             | Historical Data                                                                          |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
      | importantInfoContainer-title    | Important Information                                                                    |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display following fields "Cash Management Service Requests for Manage Bank Feeds request"
      | field_name                       |
      | Cash Management Service Requests |
      | summaryGrid-RequestType1         |
      | summaryGrid-RequestType2         |
      | summaryGrid-RequestType3         |
    When The user click on the "summaryGrid-RequestType1" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |


  @SIT_MBF
  Scenario: Manage Bank Feeds - Deactivate Bank Feeds - RECKON
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "RECKON" from "accountSoftwarePlatform" drop down
    Then The user enter "userId123" into the "userId" text field
    Then The user enter "emailAddress@anz.com" into the "email-Address" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user click on the "historicalData-1" button
    When The user select the "No historical data" from "historicalData-cell.active-1" drop down
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | userId                          | userId123                                                                                |
      | email-Address                   | emailAddress@anz.com                                                                     |
      | accountsLabel                   | Account(s)                                                                               |
      | accountTableLabel-1             | Account Number                                                                           |
      | accountTableLabel-2             | Account Name                                                                             |
      | accountTableLabel-3             | Historical Data                                                                          |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
      | importantInfoContainer-title    | Important Information                                                                    |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Manage Bank Feeds" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Manage Bank Feeds" search req type "Manage Bank Feeds" and selects it
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | userId                           | userId123                                                                                |
      | email-Address                    | emailAddress@anz.com                                                                     |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |



  @SIT_MBF
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAASU
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "SAASU" from "accountSoftwarePlatform" drop down
    Then The user enter "fileId123" into the "fileId" text field
    Then The user enter "username123" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user click on the "historicalData-1" button
    When The user select the "No historical data" from "historicalData-cell.active-1" drop down
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | username                        | username123                                                                              |
      | fileId                          | fileId123                                                                                |
      | accountsLabel                   | Account(s)                                                                               |
      | accountTableLabel-1             | Account Number                                                                           |
      | accountTableLabel-2             | Account Name                                                                             |
      | accountTableLabel-3             | Historical Data                                                                          |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
      | importantInfoContainer-title    | Important Information                                                                    |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | username                         | username123                                                                              |
      | fileId                           | fileId123                                                                                |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |





  @SIT_MBF
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAGE
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "SAGE" from "accountSoftwarePlatform" drop down
    Then The user enter "practiceId123" into the "practiceId" text field
    Then The user enter "clientId123" into the "clientId" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user click on the "historicalData-1" button
    When The user select the "No historical data" from "historicalData-cell.active-1" drop down
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | practiceId                      | practiceId123                                                                            |
      | clientId                        | clientId123                                                                              |
      | accountsLabel                   | Account(s)                                                                               |
      | accountTableLabel-1             | Account Number                                                                           |
      | accountTableLabel-2             | Account Name                                                                             |
      | accountTableLabel-3             | Historical Data                                                                          |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
      | importantInfoContainer-title    | Important Information                                                                    |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | practiceId                       | practiceId123                                                                            |
      | clientId                         | clientId123                                                                              |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |





  @SIT_MBF
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SISS
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "SISS" from "accountSoftwarePlatform" drop down
    Then The user enter "practiceId123" into the "practiceId" text field
    Then The user enter "clientId123" into the "clientId" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user click on the "historicalData-1" button
    When The user select the "No historical data" from "historicalData-cell.active-1" drop down
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | practiceId                      | practiceId123                                                                            |
      | clientId                        | clientId123                                                                              |
      | accountsLabel                   | Account(s)                                                                               |
      | accountTableLabel-1             | Account Number                                                                           |
      | accountTableLabel-2             | Account Name                                                                             |
      | accountTableLabel-3             | Historical Data                                                                          |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
      | importantInfoContainer-title    | Important Information                                                                    |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | practiceId                       | practiceId123                                                                            |
      | clientId                         | clientId123                                                                              |
      | accountNumber                    | Account Name                                                                             |
      | accountDetailVal-3               | No historical data                                                                       |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |



  @SIT_MBF_1
  Scenario: Manage Bank Feeds - Activate Bank Feeds - XERO - Create- Search
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform      |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following account Software Platform" for "account Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title               | Request Type                                                                             |
      | manageBankFeedRequestType-label | Request Type                                                                             |
      | accountSoftwarePlatform-label   | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title | Accounting Software Details                                                              |
      | organisationName                | organisationName123                                                                      |
      | username                        | username                                                                                 |
      | accountsLabel                   | Account(s)                                                                               |
      | accountNumber                   | Account Name                                                                             |
      | Your_Reference_header           | Your Reference (optional)                                                                |
      | your_reference                  | test your reference                                                                      |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Manage Bank Feeds" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Manage Bank Feeds" search req type "Manage Bank Feeds" and selects it
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information                                                                      |
      | Summary_Info_RequestID_txt       | Request ID                                                                               |
      | Summary_Info_Requestedon_txt     | Requested on                                                                             |
      | Summary_Info_Requestedby_txt     | Requested by                                                                             |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                           |
      | Summary_Info_YourReference_txt   | Request Status                                                                           |
      | Summary_Info_YourReference_value | test your reference                                                                      |
      | amendStatementTitle              | Manage Bank Feeds (AU)                                                                   |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software. |
      | requestType-title                | Request Type                                                                             |
      | manageBankFeedRequestType-label  | Request Type                                                                             |
      | accountSoftwarePlatform-label    | Accounting Software Platform                                                             |
      | accountingSoftwareDetails-title  | Accounting Software Details                                                              |
      | organisationName                 | organisationName123                                                                      |
      | username                         | username                                                                                 |
      | accountNumber                    | Account Name                                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                                        |
      | Comment_Section_Date_txt         | Date                                                                                     |
      | Comment_Section_AddedBy_txt      | Added by                                                                                 |
      | Comment_Section_Comments_txt     | Comments                                                                                 |
      | Comment_Section_Attachments_txt  | Attachments                                                                              |
      | viewAuditHistory                 | View Audit History                                                                       |
      | Close                            | Close                                                                                    |
    Then I click on "viewAuditHistory"
    Then The application should display the "Audit History Pop-up details" for "Add User to Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
      | AuditHistoryStatus      | In Progress                   |




  @SIT_ASP
  Scenario: Amend Statement Preferences - Stop Paper Statements - Enter and view
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
    Then The user click on the "StopPaperStatements" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
    #   | accountDetail-1 | 010201 - 123456201     |
    #   | accountDetail-2 |  OSTOJIC PUBLIC FEDERAL GOVERNMENT |
    #   | accountDetail-3 | AUD                    |
    Then The application should display the "Your Reference section" for "Amend Statement Preferences request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Stop Paper Statements                              |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      # | accountDetail-1       | 010201 - 123456201                                 |
      # | accountDetail-2       |  OSTOJIC PUBLIC FEDERAL GOVERNMENT                             |
      # | accountDetail-3       | AUD                                                |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Amend Statement Preferences" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Amend Statement Preferences" search req type "Amend Statement Preferences" and selects it
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | amendmentType-label              | Amendment Type                                     |
      | amendmentType-field              | Stop Paper Statements                              |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      # | accountDetail-1                  | 010201-123456201                                 |
      # | accountDetail-2                  |  OSTOJIC PUBLIC FEDERAL GOVERNMENT                             |
      # | accountDetail-3                  | AUD                                                |
      # | currency                         | Currency                                           |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |
    Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
      | amendmentTypeNote | Note: by stopping paper statements, only e-Statements will be issued for your account(s). |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @SIT_ASP11
  Scenario: Amend Statement Preferences - Resume Paper Statements - Create with multiple accounts
    Given I am logging in as user "AUTODSS5" with permission to create "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
    Then The user click on the "ResumePaperStatements" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "addBtn" button
    Then The application should display the "Your Reference section" for "Amend Statement Preferences request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Resume Paper Statements                            |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display following fields "Cash Management Service Requests "
      | field_name                       |
      | Cash Management Service Requests |
      | summaryGrid-RequestType1         |
      | summaryGrid-RequestType2         |
      | summaryGrid-RequestType3         |
    When The user click on the "summaryGrid-RequestType1" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | amendmentType-label              | Amendment Type                                     |
      | amendmentType-field              | Resume Paper Statements                            |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      # | accountDetail-1                  | 010201-123456201                                 |
      # | accountDetail-2                  |  OSTOJIC PUBLIC FEDERAL GOVERNMENT                             |
      # | accountDetail-3                  | AUD                                                |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |
    Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
      | amendmentTypeNote | Note: paper statements will resume back to the existing frequency and address for each Account. |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - daily : -  Enter values ,Search and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 123456       |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "daily" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Periodical (Automatic) Payments"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Manage Periodical (Automatic) Payments" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Manage Periodical (Automatic) Payments" search req type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Daily (every business day)        |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - weekly : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 123456       |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "weekly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Weekly                            |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - fortnightly : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "fortnightly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Fortnightly                       |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - twice Per Month : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "1" from "day1" drop down
    When The user select the "2" from "day2" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | May 02, 2021 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | frequency                      | Twice per month                   |
      | day1                           | 1                                 |
      | day2                           | 2                                 |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Twice per month                   |
      | day1                             | 1                                 |
      | day2                             | 2                                 |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - monthly-specific date : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "monthly-specificdate" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Monthly (on specific date)        |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout-bussiness
  Scenario: Add Periodical Payments - Frequency - Monthly (on business day) : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "monthly-businessday" from "frequency" drop down
    When The user select the "1st" from "businessDay" drop down
    When The user select the "Yes (first payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value  |
      | amount            | 1000000      |
      | paymentReference  | MPP#ref      |
      | paymentStartDate  | Feb 18, 2022 |
      | lastPaymentDate   | Feb 28, 2022 |
      | variablePayAmount | 1000000      |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | frequency                      | Monthly (on business day)         |
      | businessDay                    | 1                                 |
      | fromAmount                     | AUD 1,000,000.00                  |
      | variablePayAmountRequired      | Yes (first payment)               |
      | variablePayAmount              | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Monthly (on business day)         |
      | businessDay                      | 1                                 |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | Yes (first payment)               |
      | variablePayAmount                | AUD 1,000,000.00                  |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - Bi-monthly : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "Bi-monthly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Bi-monthly                        |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - six-monthly : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "six-monthly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Six monthly                       |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - quarterly : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "quarterly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Quarterly                         |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - annually : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "annually" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amount           | 1000000      |
      | paymentReference | MPP#ref      |
      | paymentStartDate | Feb 18, 2022 |
      | lastPaymentDate  | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | No                                |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Annually                          |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | No                                |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Add Periodical Payments - Frequency - Every 'n' weeks : - Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter New Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "Every 'n' weeks" from "frequency" drop down
    When The user select the "1" from "week" drop down
    When The user select the "Yes (last payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value  |
      | amount            | 1000000      |
      | paymentReference  | MPP#ref      |
      | paymentStartDate  | Feb 18, 2022 |
      | lastPaymentDate   | Feb 28, 2022 |
      | variablePayAmount | 1000000      |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details                   |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency         | AUD                               |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details             |
      | payeeBSB                       | 123456                            |
      | payeeAccountName               | Account Name                      |
      | payeeAccountNumber             | 323131333                         |
      | periodicalPaymentDetails-title | Periodical Payment Details        |
      | frequency                      | Every 'n' weeks                   |
      | week                           | 1                                 |
      | fromAmount                     | AUD 1,000,000.00                  |
      | paymentReference               | MPP#ref                           |
      | paymentStartDate-label         | Payment Start Date                |
      | lastPaymentDate-label          | Last Payment Date                 |
      | variablePayAmountRequired      | Yes (last payment)                |
      | variablePayAmount              | AUD 1,000,000.00                  |
      | Your_Reference_header          | Your Reference (optional)         |
      | your_reference                 | testAMPP#yourreference            |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | testAMPP#yourreference            |
      | RequestTypeHeaderLabel           | Request Type                      |
      | reqType                          | Request Type                      |
      | AccountHeaderLabel               | Account Details                   |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      | AccountDefaultCurrency           | AUD                               |
      | periodicalPaymentDetails-title   | Periodical Payment Details        |
      | frequency                        | Every 'n' weeks                   |
      | week                             | 1                                 |
      | fromAmount                       | AUD 1,000,000.00                  |
      | variablePayAmountRequired        | Yes (last payment)                |
      | variablePayAmount                | AUD 1,000,000.00                  |
      | paymentStartDate-label           | Payment Start Date                |
      | lastPaymentDate-label            | Last Payment Date                 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @MPP_shakeout
  Scenario: Amend Periodical Payments - Payee Account Details -  Enter values and Search verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PayeeAccountDetailsCkbx"
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountName-label   | Payee Account Name   |
      | payeeAccountNumber-label | Payee Account Number |
      | payeeBSB-label           | Payee BSB            |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value       |
      | payeeBSB           | 823456            |
      | payeeAccountName   | Test Account Name |
      | payeeAccountNumber | 567576            |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT   |
      | AccountDefaultCurrency         | AUD                                 |
      | payeeBSB                       | 823456                              |
      | payeeAccountName               | Test Account Name                   |
      | payeeAccountNumber             | 567576                              |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Manage Periodical (Automatic) Payments"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Manage Periodical (Automatic) Payments" is detail is saved to a file
    Then I click on "Ok"
    Then The user searches the stored service request with request type "Manage Periodical (Automatic) Payments" search req type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information                 |
      | Summary_Info_RequestID_txt       | Request ID                          |
      | Summary_Info_Requestedon_txt     | Requested on                        |
      | Summary_Info_Requestedby_txt     | Requested by                        |
      | Summary_Info_RequestStatus_txt   | Your Reference                      |
      | Summary_Info_YourReference_txt   | Request Status                      |
      | Summary_Info_YourReference_value | testAMPP#yourreference              |
      | RequestTypeHeaderLabel           | Request Type                        |
      | reqType                          | Request Type                        |
      | requestSubType                   | Amend Periodical Payment            |
      | AccountHeaderLabel               | Account Details                     |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT   |
      | AccountDefaultCurrency           | AUD                                 |
      | periodicalPaymentDetails-title   | New Periodical Payment Details      |
      | payeeBSB                         | 823456                              |
      | payeeAccountName                 | Test Account Name                   |
      | payeeAccountNumber               | 567576                              |
      | existingAccountDetails-title     | Existing Periodical Payment Details |
      | periodicalPaymentDetails-title   | New Periodical Payment Details      |
      | serialNumber                     | 1234567                             |
      | recurringReference               | AMPP#ref 123                        |
      | amendPeriodicalAmount            | AUD 213,312.02                      |
      | Comment_Section_header           | Comments and Supporting Documents   |
      | Comment_Section_Date_txt         | Date                                |
      | Comment_Section_AddedBy_txt      | Added by                            |
      | Comment_Section_Comments_txt     | Comments                            |
      | Comment_Section_Attachments_txt  | Attachments                         |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @MPP_shakeout
  Scenario: Amend Periodical Payments - Frequency - only -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "FrequencyCkbx"
    When The user select the "daily" from "frequency" drop down
    Then The application should display the "Select Amendment Date" for "Amend PP Service Request"
      | lastPaymentDateLabel      | Please select the date you would like your frequency and/or requested amendment(s) to start from |
      | selectAmendmentDate-title | Select Amendment Date                                                                            |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | paymentAmendDate | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT                     |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | frequency                      | Daily (every business day)                            |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | Feb 28, 2022                                          |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information                                   |
      | Summary_Info_RequestID_txt       | Request ID                                            |
      | Summary_Info_Requestedon_txt     | Requested on                                          |
      | Summary_Info_Requestedby_txt     | Requested by                                          |
      | Summary_Info_RequestStatus_txt   | Your Reference                                        |
      | Summary_Info_YourReference_txt   | Request Status                                        |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                |
      | RequestTypeHeaderLabel           | Request Type                                          |
      | reqType                          | Request Type                                          |
      | requestSubType                   | Amend Periodical Payment                              |
      | AccountHeaderLabel               | Account Details                                       |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                     |
      | AccountDefaultCurrency           | AUD                                                   |
      | existingAccountDetails-title     | Existing Periodical Payment Details                   |
      | serialNumber                     | 1234567                                               |
      | recurringReference               | AMPP#ref 123                                          |
      | amendPeriodicalAmount            | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                        |
      | frequency                        | Daily (every business day)                            |
      | selectAmendmentDate-title        | Amendment Date                                        |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field           | Feb 28, 2022                                          |
      | Comment_Section_header           | Comments and Supporting Documents                     |
      | Comment_Section_Date_txt         | Date                                                  |
      | Comment_Section_AddedBy_txt      | Added by                                              |
      | Comment_Section_Comments_txt     | Comments                                              |
      | Comment_Section_Attachments_txt  | Attachments                                           |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Amend Periodical Payments - Amount only : -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "AmountCkbx"
    Then The application should display the "Select Amendment Date" for "Amend PP Service Request"
      | lastPaymentDateLabel      | Please select the date you would like your frequency and/or requested amendment(s) to start from |
      | selectAmendmentDate-title | Select Amendment Date                                                                            |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | amendmentAmount  | 32131.99     |
      | paymentAmendDate | Feb 28, 2022 |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT                     |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | amount-label                   | Amount                                                |
      | amendmentAmount                | AUD 32,131.99                                         |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | Feb 28, 2022                                          |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The "responseId" for the "Manage Periodical (Automatic) Payments" is detail is saved to a file
    # Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | selectAmendmentDate-title        | Amendment Date                                                     |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from              |
      | paymentAmendDate-field           | Feb 28, 2022                                                       |
      | amount-label                     | Amount                                                             |
      | amendmentAmount                  | AUD 32,131.99                                                      |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout
  Scenario: Amend Periodical Payments - Payment Reference only : -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PaymentReferenceCkbx"
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value             |
      | paymentReference | paymentReference#213213 |
      | your_reference   | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT   |
      | AccountDefaultCurrency         | AUD                                 |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | paymentReference-label         | Payment Reference                   |
      | paymentReference               | paymentReference#2                  |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | paymentReference-label           | Payment Reference                                                  |
      | paymentReference                 | paymentReference#2                                                 |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @MPP_shakeout123
  Scenario: Amend Periodical Payments - Payment Reference only : -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    #   | lastPaymentDate-label          | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "LastPaymentDateCkbx"
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value             |
      | amendlastPaymentDate | Feb 28, 2022            |
      | your_reference       | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT   |
      | AccountDefaultCurrency         | AUD                                 |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | lastPaymentDate-label          | Last Payment Date                   |
      | amendlastPaymentDate           | Feb 28, 2022                        |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | amendlastPaymentDate             | Feb 28, 2022                                                       |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @MPP_shakeout
  Scenario: Amend Periodical Payments - All options -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    #   | lastPaymentDate-label          | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PayeeAccountDetailsCkbx"
    When I click on "FrequencyCkbx"
    When I click on "AmountCkbx"
    When I click on "PaymentReferenceCkbx"
    When I click on "LastPaymentDateCkbx"
    When The user select the "daily" from "frequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value             |
      | amendlastPaymentDate | Feb 18, 2022            |
      | your_reference       | testAMPP#your_reference |
      | payeeBSB             | 823456                  |
      | payeeAccountName     | Test Account Name       |
      | payeeAccountNumber   | 567576                  |
      | paymentAmendDate     | Feb 28, 2022            |
      | amendmentAmount      | 32131.99                |
      | paymentReference     | paymentReference#213213 |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT                     |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | Feb 28, 2022                                          |
      | amount-label                   | Amount                                                |
      | amendmentAmount                | AUD 32,131.99                                         |
      | paymentReference               | paymentReference#2                                    |
      | lastPaymentDate-label          | Last Payment Date                                     |
      | amendlastPaymentDate           | Feb 18, 2022                                          |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | payeeBSB                         | 823456                                                             |
      | payeeAccountName                 | Test Account Name                                                  |
      | payeeAccountNumber               | 567576                                                             |
      | frequency                        | Daily (every business day)                                         |
      | selectAmendmentDate-title        | Amendment Date                                                     |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from              |
      | paymentAmendDate-field           | Feb 28, 2022                                                       |
      | amount-label                     | Amount                                                             |
      | amendmentAmount                  | AUD 32,131.99                                                      |
      | paymentReference                 | paymentReference#2                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @MPP_shakeout
  Scenario: Amend Periodical Payments - Payment Reference only : -  Enter values and verify view page
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "suspend PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title | Enter Existing Periodical Payment Details |
      | serialNumber-label           | Serial Number                             |
      | suspendReference-label       | Payment Reference                         |
      | suspendAmount-label          | Amount                                    |
      | suspendDates-title           | Select Suspend Dates                      |
      | suspendDate-label            | Suspend On                                |
      | unsuspendDate-label          | Unsuspend On                              |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value             |
      | serialNumber     | 12345678                |
      | suspendReference | AMPP#ref 123            |
      | suspendAmount    | 213312.02               |
      | suspendDate      | Feb 18, 2022            |
      | unsuspendDate    | Feb 28, 2022            |
      | your_reference   | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel       | Request Type                        |
      | reqType                      | Request Type                        |
      | AccountHeaderLabel           | Account Details                     |
      | AccountName                  | OSTOJIC PUBLIC FEDERAL GOVERNMENT   |
      | AccountDefaultCurrency       | AUD                                 |
      | existingAccountDetails-title | Existing Periodical Payment Details |
      | serialNumber                 | 1234567                             |
      | suspendReference-label       | Payment Reference                   |
      | suspendReference             | AMPP#ref 123                        |
      | suspendAmount                | AUD 213,312.02                      |
      | suspendDates-title           | Suspend Dates                       |
      | suspendDate-value            | Feb 18, 2022                        |
      | unsuspendDate-value          | Feb 28, 2022                        |
      | Your_Reference_header        | Your Reference (optional)           |
      | your_reference               | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Suspend Periodical Payment                                         |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | suspendReference                 | AMPP#ref 123                                                       |
      | suspendAmount                    | AUD 213,312.02                                                     |
      | suspendDates-title               | Suspend Dates                                                      |
      | suspendDate-value                | Feb 18, 2022                                                       |
      | unsuspendDate-value              | Feb 28, 2022                                                       |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @CPP_shakeout
  Scenario: Close Periodical Payments - Create and view
    Given I am logging in as user "AUTODSS5" with permission to create "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Periodical Payment Details" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                |                    |
      | payeeAccountName            |                    |
      | paymentReference            |                    |
      | closePeriodicalAmount       |                    |
      | closeDate                   |                    |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | payeeAccountName      | Account Name |
      | closePeriodicalAmount | 213312.02    |
      | closeDate             | Apr 28, 2022 |
      | paymentReference      | MPP#ref      |
    # Then The user picking the "closeDate" from calender
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "SR details" for "review page"
      | AccountName                 | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
      # | periodicalPaymentDetailsLabel | Periodical Payment Details        |
      | serialNumber-label          | Serial Number                     |
      | payeeAccountName-label      | Payee Account Name                |
      | paymentReference-label      | Payment Reference                 |
      | closePeriodicalAmount-label | Amount                            |
      | closeDate-label             | Close Date                        |
      | closeDate-label             | Close Date                        |
      | serialNumber                | 1234567                           |
      | payeeAccountName            | Account Name                      |
      | paymentReference            | MPP#ref                           |
      | closePeriodicalAmount       | AUD 213,312.02                    |
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Service Request HeaderSummary Information and Account details," for "AMPP service request in view mode"
      | paymentsTitle                   | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                    | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header             | Summary Information                                                |
      | Summary_Info_RequestID_txt      | Request ID                                                         |
      | Summary_Info_Requestedon_txt    | Requested on                                                       |
      | Summary_Info_Requestedby_txt    | Requested by                                                       |
      | Summary_Info_RequestStatus_txt  | Your Reference                                                     |
      | Summary_Info_YourReference_txt  | Request Status                                                     |
      | AccountHeaderLabel              | Account Details                                                    |
      | AccountName                     | OSTOJIC PUBLIC FEDERAL GOVERNMENT                                  |
      | serialNumber-label              | Serial Number                                                      |
      | payeeAccountName-label          | Payee Account Name                                                 |
      | paymentReference-label          | Payment Reference                                                  |
      | closePeriodicalAmount-label     | Amount                                                             |
      | closeDate-label                 | Close Date                                                         |
      | serialNumber                    | 1234567                                                            |
      | payeeAccountName                | Account Name                                                       |
      | paymentReference                | MPP#ref                                                            |
      | closePeriodicalAmount           | AUD 213,312.02                                                     |
      | Comment_Section_header          | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt        | Date                                                               |
      | Comment_Section_AddedBy_txt     | Added by                                                           |
      | Comment_Section_Comments_txt    | Comments                                                           |
      | Comment_Section_Attachments_txt | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @SITACB
  Scenario: Request Account Closing Balance - Create with 1 account and View
    Given I am logging in as user "AUTODSS5" with permission to create "Request Account Closing Balance" service request
    When The user navigate to the "Request Account Closing Balance" service request screen
    Then The application should display the "Service Request enter details" for "Request Account Closing Balance"
      | amendStatementTitle | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
    Then The application should display the "Select Account(s)" for "Request Account Closing Balance enter screen"
      | accountTableContainer-title | Select Account(s)      |
      | addAccountbtn               | Add                    |
      | removeBtn                   | Remove                 |
      | accountNumber               | Account Number         |
      | accountName                 | Account Name           |
      | currency                    | Currency               |
      | NoOfaccountselected         | No account(s) selected |
      | accountTableWarning         | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Request Account Closing Balance enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account       |
      | account_Name                           | Account Name      |
      | accNum                                 | Account Number    |
      | Currency                               | Currency          |
      | LegalEntityName                        | Legal Entity Name |
      | cancelBtn                              | Cancel            |
      | addBtn                                 | Add               |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Your Reference section" for "Request Account Closing Balance request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Request Account Closing Balance on review page"
      | amendStatementTitle   | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc    | Submit a request to receive the closing balance for your Account(s). |
      | accountsLabel         | Account(s)                                                           |
      | accountNumber         | Account Number                                                       |
      | Your_Reference_header | Your Reference (optional)                                            |
      | your_reference        | test your reference                                                  |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Request Account Closing Balance request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Request Account Closing Balance"
      | amendStatementTitle | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Request Account Closing Balance request in view mode"
      | Summary_Info_header              | Summary Information                                                  |
      | Summary_Info_RequestID_txt       | Request ID                                                           |
      | Summary_Info_Requestedon_txt     | Requested on                                                         |
      | Summary_Info_Requestedby_txt     | Requested by                                                         |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                       |
      | Summary_Info_YourReference_txt   | Request Status                                                       |
      | Summary_Info_YourReference_value | test your reference                                                  |
      | amendStatementTitle              | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc               | Submit a request to receive the closing balance for your Account(s). |
      | accountsLabel                    | Account(s)                                                           |
      | accountNumber                    | Account Number                                                       |
      | accountName                      | Account Name                                                         |
      | currency                         | Currency                                                             |
      | AccountClosingBalance            | Account Closing Balance                                              |
      # | accountDetailVal-2               | 012395-836691833                                                     |
      # | accountDetailVal-3               | MELLING TRADING PROFESSIONAL GENERA                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                    |
      | Comment_Section_Date_txt         | Date                                                                 |
      | Comment_Section_AddedBy_txt      | Added by                                                             |
      | Comment_Section_Comments_txt     | Comments                                                             |
      | Comment_Section_Attachments_txt  | Attachments                                                          |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |



  @SITACB
  Scenario: Request Account Closing Balance - Create with Multiple accounts and search
    Given I am logging in as user "AUTODSS5" with permission to create "Request Account Closing Balance" service request
    When The user navigate to the "Request Account Closing Balance" service request screen
    Then The application should display the "Service Request Header" for "Request Account Closing Balance"
      | amendStatementTitle | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
    Then The application shows the "cancel" button
    Then  The application should display the "Select Enquiry Type" for "Request Account Closing Balance Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | accountTableContainer-title | Select Account(s)      |
      | addAccountbtn               | Add                    |
      | removeBtn                   | Remove                 |
      | accountNumber               | Account Number         |
      | accountName                 | Account Name           |
      | currency                    | Currency               |
      | NoOfaccountselected         | No account(s) selected |
      | accountTableWarning         | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Request Account Closing Balance enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account       |
      | account_Name                           | Account Name      |
      | accNum                                 | Account Number    |
      | Currency                               | Currency          |
      | LegalEntityName                        | Legal Entity Name |
      | cancelBtn                              | Cancel            |
      | addBtn                                 | Add               |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel4" button
    Then The user click on the "addBtn" button
    Then The application should display the "Your Reference section" for "Request Account Closing Balance request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Request Account Closing Balance on review page"
      | amendStatementTitle   | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc    | Submit a request to receive the closing balance for your Account(s). |
      | accountsLabel         | Account(s)                                                           |
      | accountName           | Account Name                                                         |
      | accountNumber         | Account Number                                                       |
      | currency              | Currency                                                             |
      # | accountDetailVal-2    | 012395 - 836691833                                                  |
      #  | accountDetailVal-3    | MELLING TRADING PROFESSIONAL GENERA                                  |
      | currency              | Currency                                                             |
      | Your_Reference_header | Your Reference (optional)                                            |
      | your_reference        | test your reference                                                  |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The "responseId" for the "Request Account Closing Balance" is detail is saved to a file
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Request Account Closing Balance" and selects it
    Then The application should display the "Service Request Header" for "Request Account Closing Balance"
      | amendStatementTitle | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Request Account Closing Balance request in view mode"
      | Summary_Info_header              | Summary Information                                                  |
      | Summary_Info_RequestID_txt       | Request ID                                                           |
      | Summary_Info_Requestedon_txt     | Requested on                                                         |
      | Summary_Info_Requestedby_txt     | Requested by                                                         |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                       |
      | Summary_Info_YourReference_txt   | Request Status                                                       |
      | Summary_Info_YourReference_value | test your reference                                                  |
      | amendStatementTitle              | Request Account Closing Balance (AU)                                 |
      | amendStatementDesc               | Submit a request to receive the closing balance for your Account(s). |
      | accountsLabel                    | Account(s)                                                           |
      | accountName                      | Account Name                                                         |
      | accountNumber                    | Account Number                                                       |
      | currency                         | Currency                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                    |
      | Comment_Section_Date_txt         | Date                                                                 |
      | Comment_Section_AddedBy_txt      | Added by                                                             |
      | Comment_Section_Comments_txt     | Comments                                                             |
      | Comment_Section_Attachments_txt  | Attachments                                                          |
    Then The application should display following fields "SR Beneficiary Details"
      | field_name          |
      | accountDetailVal-1  |
      | accountDetailVal-2  |
      | accountDetailVal-3  |
      | accountDetailVal2-1 |
      | accountDetailVal2-2 |
      | accountDetailVal2-3 |
      | accountDetailVal3-1 |
      | accountDetailVal3-2 |
      | accountDetailVal3-3 |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @DeleteUserTG_sit
  Scenario:Delete User from Digital Channel:TG -  Create and Search service request
    Given I am logging in as user "DSSUSR4" with permission to create "Request Account Closing Balance" service request
    When The user navigate to the "Delete User from Digital Channel" service request screen
    Then The application should display the "service request Header details" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application shows the "cancel" button
    Then The application should display following fields "LegalEntity section"
      | field_name                   |
      | Legal_Entity_select_dropdown |
      | Legal_Entity_search_icon     |
      | LegalEntity-field            |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel service request"
      | Legal_Entity_header          | Select Legal Entity                             |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | ANF and Dss Trust In Its own right |
    When The user select the "ANZ Transactive - Digital Channel ID 31052019" from "select_digitalChannel" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName0  | firstName0  |
      | middleName0 | middleName0 |
      | surName0    | surName0    |
      | userId0     | userId000   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName1  | firstName1  |
      | middleName1 | middleName1 |
      | surName1    | surName1    |
      | userId1     | userId111   |
    Then The application should display the "Your Reference section" for "Delete User from Digital Channel"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "Your Reference section" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
      | firstName0  | firstName0                               |
      | middleName0 | middleName0                              |
      | surName0    | surName0                                 |
      | userId0     | userId000                                |
      | firstName1  | firstName1                               |
      | middleName1 | middleName1                              |
      | surName1    | surName1                                 |
      | userId1     | userId111                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request and selects it
    Then The application should display the "Summary Information,Header details in view mode" for "Delete User from Digital Channel SR"
      | Summary_Info_header             | Summary Information                      |
      | Summary_Info_RequestID_txt      | Request ID                               |
      | Summary_Info_Requestedon_txt    | Requested on                             |
      | Summary_Info_Requestedby_txt    | Requested by                             |
      | Summary_Info_RequestStatus_txt  | Request Status                           |
      | title                           | Delete User from Digital Channel         |
      | description                     | Delete users from your digital channels. |
      | firstName0                      | firstName0                               |
      | middleName0                     | middleName0                              |
      | surName0                        | surName0                                 |
      | userId0                         | userId000                                |
      | firstName1                      | firstName1                               |
      | middleName1                     | middleName1                              |
      | surName1                        | surName1                                 |
      | userId1                         | userId111                                |
      | Legal_Entity_Summary            | Legal Entity                             |
      | Legal_Entity_Name               | Legal entity applicable to this request  |
      # | Legal_Entity_Value              | NSWG                                     |
      | Comment_Section_header          | Comments and Supporting Documents        |
      | Comment_Section_Date_txt        | Date                                     |
      | Comment_Section_AddedBy_txt     | Added by                                 |
      | Comment_Section_Comments_txt    | Comments                                 |
      | Comment_Section_Attachments_txt | Attachments                              |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Delete User from Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @DeleteUserTG2
  Scenario:Delete User from Digital Channel:TG -  10 users
    Given I am logging in as user "DSSUSR4" with permission to create "Request Account Closing Balance" service request
    When The user navigate to the "Delete User from Digital Channel" service request screen
    Then The application should display the "service request Header details" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application shows the "cancel" button
    Then The application should display following fields "LegalEntity section"
      | field_name                   |
      | Legal_Entity_select_dropdown |
      | Legal_Entity_search_icon     |
      | LegalEntity-field            |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel service request"
      | Legal_Entity_header          | Select Legal Entity                             |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | ANF and Dss Trust In Its own right |
    When The user select the "ANZ Transactive - Digital Channel ID 31052019" from "select_digitalChannel" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName0  | firstName0  |
      | middleName0 | middleName0 |
      | surName0    | surName0    |
      | userId0     | userId000   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName1  | firstName1  |
      | middleName1 | middleName1 |
      | surName1    | surName1    |
      | userId1     | userId111   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName2  | firstName2  |
      | middleName2 | middleName2 |
      | surName2    | surName2    |
      | userId2     | userId112   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName3  | firstName3  |
      | middleName3 | middleName3 |
      | surName3    | surName3    |
      | userId3     | userId113   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName4  | firstName4  |
      | middleName4 | middleName4 |
      | surName4    | surName4    |
      | userId4     | userId114   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName5  | firstName5  |
      | middleName5 | middleName5 |
      | surName5    | surName5    |
      | userId5     | userId115   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName6  | firstName6  |
      | middleName6 | middleName6 |
      | surName6    | surName6    |
      | userId6     | userId116   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName7  | firstName7  |
      | middleName7 | middleName7 |
      | surName7    | surName7    |
      | userId7     | userId117   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName8  | firstName8  |
      | middleName8 | middleName8 |
      | surName8    | surName8    |
      | userId8     | userId118   |
    When The user click on the "addUser" button
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | firstName9  | firstName9  |
      | middleName9 | middleName9 |
      | surName9    | surName9    |
      | userId9     | userId119   |
    Then The application should display the "Your Reference section" for "Delete User from Digital Channel"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "Your Reference section" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
      | firstName0  | firstName0                               |
      | middleName0 | middleName0                              |
      | surName0    | surName0                                 |
      | userId0     | userId000                                |
      | firstName1  | firstName1                               |
      | middleName1 | middleName1                              |
      | surName1    | surName1                                 |
      | userId1     | userId111                                |
      | firstName2  | firstName2                               |
      | middleName2 | middleName2                              |
      | surName2    | surName2                                 |
      | userId2     | userId112                                |
      | firstName3  | firstName3                               |
      | middleName3 | middleName3                              |
      | surName3    | surName3                                 |
      | userId3     | userId113                                |
      | firstName4  | firstName4                               |
      | middleName4 | middleName4                              |
      | surName4    | surName4                                 |
      | userId4     | userId114                                |
      | firstName5  | firstName5                               |
      | middleName5 | middleName5                              |
      | surName5    | surName5                                 |
      | userId5     | userId115                                |
      | firstName6  | firstName6                               |
      | middleName6 | middleName6                              |
      | surName6    | surName6                                 |
      | userId6     | userId116                                |
      | firstName7  | firstName7                               |
      | middleName7 | middleName7                              |
      | surName7    | surName7                                 |
      | userId7     | userId117                                |
      | firstName8  | firstName8                               |
      | middleName8 | middleName8                              |
      | surName8    | surName8                                 |
      | userId8     | userId118                                |
      | firstName9  | firstName9                               |
      | middleName9 | middleName9                              |
      | surName9    | surName9                                 |
      | userId9     | userId119                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request and selects it
    Then The application should display the "Summary Information,Header details in view mode" for "Delete User from Digital Channel SR"
      | Summary_Info_header             | Summary Information                      |
      | Summary_Info_RequestID_txt      | Request ID                               |
      | Summary_Info_Requestedon_txt    | Requested on                             |
      | Summary_Info_Requestedby_txt    | Requested by                             |
      | Summary_Info_RequestStatus_txt  | Request Status                           |
      | title                           | Delete User from Digital Channel         |
      | description                     | Delete users from your digital channels. |
      | firstName0                      | firstName0                               |
      | middleName0                     | middleName0                              |
      | surName0                        | surName0                                 |
      | userId0                         | userId000                                |
      | firstName1                      | firstName1                               |
      | middleName1                     | middleName1                              |
      | surName1                        | surName1                                 |
      | userId1                         | userId111                                |
      | firstName2                      | firstName2                               |
      | middleName2                     | middleName2                              |
      | surName2                        | surName2                                 |
      | userId2                         | userId112                                |
      | firstName3                      | firstName3                               |
      | middleName3                     | middleName3                              |
      | surName3                        | surName3                                 |
      | userId3                         | userId113                                |
      | firstName4                      | firstName4                               |
      | middleName4                     | middleName4                              |
      | surName4                        | surName4                                 |
      | userId4                         | userId114                                |
      | firstName5                      | firstName5                               |
      | middleName5                     | middleName5                              |
      | surName5                        | surName5                                 |
      | userId5                         | userId115                                |
      | firstName6                      | firstName6                               |
      | middleName6                     | middleName6                              |
      | surName6                        | surName6                                 |
      | userId6                         | userId116                                |
      | firstName7                      | firstName7                               |
      | middleName7                     | middleName7                              |
      | surName7                        | surName7                                 |
      | userId7                         | userId117                                |
      | firstName8                      | firstName8                               |
      | middleName8                     | middleName8                              |
      | surName8                        | surName8                                 |
      | userId8                         | userId118                                |
      | firstName9                      | firstName9                               |
      | middleName9                     | middleName9                              |
      | surName9                        | surName9                                 |
      | userId9                         | userId119                                |
      | Legal_Entity_Summary            | Legal Entity                             |
      | Legal_Entity_Name               | Legal entity applicable to this request  |
      # | Legal_Entity_Value              | NSWG                                     |
      | Comment_Section_header          | Comments and Supporting Documents        |
      | Comment_Section_Date_txt        | Date                                     |
      | Comment_Section_AddedBy_txt     | Added by                                 |
      | Comment_Section_Comments_txt    | Comments                                 |
      | Comment_Section_Attachments_txt | Attachments                              |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Delete User from Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |


  @Deleteuser_otherSIT
  Scenario:Delete User from Digital Channel  PCM- Create and Search service request
    Given I am logging in as user "DSSUSR4" with permission to create "Request Account Closing Balance" service request
    When The user navigate to the "Delete User from Digital Channel" service request screen
    Then The application should display the "service request Header details" for "Delete User from Digital Channel"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel service request"
      | Legal_Entity_header          | Select Legal Entity                             |
      | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
    Then The user select a legal entity from the search legal entity pop up
      | legalEntity | ANF and Dss Trust In Its own right |
    When The user select the "Other" from "select_digitalChannel" drop down
    Then The application should allow user to select and upload one or more files from computer
      | filepath1 | //resources//input//Test-pdf.pdf    |
      | filepath2 | //resources//input//Test-pdf1.pdf   |
      | filepath3 | //resources//input//Test-Excel.xlsx |
    Then The user enter "test#Ref#123" into the "your_reference" text field
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then I click on "Ok"
    Then The user searches stored service request and selects it
    Then The application should display the "service request Header detailsin view mode" for "Delete User from Digital Channel SR"
      | title       | Delete User from Digital Channel         |
      | description | Delete users from your digital channels. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Service request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Legal Entity details" for "Delete User from Digital Channel SR"
      | Legal_Entity_Name  | Legal entity applicable to this request |
      | leLabel            | Legal entity applicable to this request |
      | Legal_Entity_Value | NSWG                                    |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "Delete User from Digital Channel SR"
      | SR_Audit_History_header | Service Request Audit History |
      | SR_Audit_History_Date   | Date / Time                   |
      | SR_Audit_History_Status | Request Status                |
      | SR_Audit_History_User   | User                          |
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | In Progress |
    Then The application should display the "Comments and Supporting Documents section" for "Delete User from Digital Channel service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |

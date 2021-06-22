@ui-mock @api-mock @BDT @Regression @webform
Feature: Backdate Transaction
  User should able to initiate new Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date.

  @BDT2
  Scenario: Backdate Transaction - Display 'Your Reference'section and Populating value in review & view pages
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    Then The application shows the "cancel" button
    Then  The application should display the "progress bar with status" for "Backdate Transaction SR" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The application should display the "Your Reference section" for "Backdate Transaction Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testBackdate SRyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Backdate Transaction SR" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "Backdate SR on review page"
      | Your_Reference_header | Your Reference (optional)    |
      | your_reference        | testBackdate SRyourreference |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header              | Summary Information          |
      | Summary_Info_RequestID_txt       | Request ID                   |
      | Summary_Info_Requestedon_txt     | Requested on                 |
      | Summary_Info_Requestedby_txt     | Requested by                 |
      | Summary_Info_RequestStatus_txt   | Your Reference               |
      | Summary_Info_YourReference_txt   | Request Status               |
      | Summary_Info_YourReference_value | testBackdate SRyourreference |



  @BDT3
  Scenario: Backdate Transaction - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application shows the "cancel" button
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen
    When The user Clicks the "Cancel" button
    * For Acceptance Criteria "Cancel Service Request prior to submission on Review and Submit"
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application shows the "cancel" button
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen
    When The user Clicks the "Cancel" button
    * For Acceptance Criteria " User does not have email-address"
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "Test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    When The user Clicks the "Close" button
    * For Acceptance Criteria " Account Lookup"
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "SR"
      | AccountName | BO-PENDING |
      | amount      | Amount     |
      | postDate    | Post Date  |
      | Reset       | Reset      |
      | Search      | Search     |
    * For Acceptance Criteria " Search Transaction with Amount  < 0"
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
      | amount        | 0           |
    When The user click on the "Search" button
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    * For Acceptance Criteria "Search Transaction with Amount  > 99,999,999,999.99"
    When The user click on the "Reset" button
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value  |
      | postDateField | 22/04/2021   |
      | fromAmount    | 100000000000 |
    When The user click on the "Search" button
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    * For Acceptance Criteria "Search Transaction with Amount range UI verification"
    When The user click on the "Reset" button
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    Then The user enters value in the search criteria fields
      | amount | 0/34 |
    When The user click on the "Search" button
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    * For Acceptance Criteria "Search Transaction with Amount range UI verification"
    When The user click on the "Reset" button
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    Then The user enters value in the search criteria fields
      | amount | 1/100000000000 |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |

    * For Acceptance Criteria "Reset before search"
    When The user click on the "Reset" button
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    Then The user enters value in the search criteria fields
      | amount | 1/100000000000 |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Backdate Transaction Service Request"
      | toAmount |  |
      | fromDate |  |
    * For Acceptance Criteria "Reset After search"
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    Then The application should display the "SearchforTransactionLabel" for "Backdate Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Backdate Transaction Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Backdate Transaction Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               |  |
      | transactionGridAmount             |  |
      | transactionGridDebit/Credit       |  |
      | transactionGridNarrative          |  |
      | transactionGridAuxdom             |  |
      | transactionGridReferenceName      |  |
      | transactionGridLodgementReference |  |
      | transactionGridTraceline          |  |
    * For Acceptance Criteria "Reset After selected the perticular transaction"
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    Then The application should display the "transaction search results grid" for "Backdate Transaction Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Backdate Transaction Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               |  |
      | transactionGridAmount             |  |
      | transactionGridDebit/Credit       |  |
      | transactionGridNarrative          |  |
      | transactionGridAuxdom             |  |
      | transactionGridReferenceName      |  |
      | transactionGridLodgementReference |  |
      | transactionGridTraceline          |  |
    * For Acceptance Criteria "Search -No records found"
    When The user Clicks the "Reset" button
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    Then The user enters value in the search criteria fields
      | amount | 1/2 |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @BDT15
  Scenario: Backdate Transaction - Create 'Backdate Transaction'
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    Then The application should display the "transaction search results grid" for "Backdate Transaction Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "Backdate SR on review page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Backdate Details" for "Backdate SR in review mode"
      | backdateDetails         | Backdate Details                                                   |
      | backdateValue-field-txt | Backdate Transaction to                                            |
      | backdateValue-field     | 22/04/2021                                                         |
      | reason-field            | Please tell us why you are requesting to backdate this transaction |
      | backdatereason          | backdatereason sample text                                         |
    Then The application should display the "Your Reference details" for "Backdate SR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | Ref#text                  |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate Transaction"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "Backdate SR"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "Backdate SR on view page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Backdate Details" for "SR in view mode"
      | backdateDetails         | Backdate Details                                                   |
      | backdateValue-field-txt | Backdate Transaction to                                            |
      | backdateValue-field     | 22/04/2021                                                         |
      | reason-field            | Please tell us why you are requesting to backdate this transaction |
      | backdatereason          | backdatereason sample text                                         |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @BDT16
  Scenario: Backdate Transaction - without Backdate
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    And The application should display error message under "backdateValue-field-error-msg" section
      | error_message | Date is mandatory |
    * For Acceptance Criteria "Reason is mandatory"
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    When The user Clicks the "Next" button
    And The application should display error message under "backdatereason-field-error-msg" section
      | error_message | Reason is mandatory |
    * For Acceptance Criteria "Search without Date"
    When The user Clicks the "Reset" button
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |
    * For Acceptance Criteria "Without transaction selected after search"
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |
    * For Acceptance Criteria "Without transaction selected"
    When The user Clicks the "Reset" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |
    * For Acceptance Criteria "Your Reference value Not display if user not entered"
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen


  @BDT22
  Scenario: Backdate Transaction - Create Backdate SR and search based on requestId
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "Backdate SR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | Ref#text                  |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Backdate Transaction" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "Backdate SR in view mode"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "Backdate SR on view page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |

  @BDT23
  Scenario: Backdate Transaction - Reopen submit and View
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Backdate Transaction" is detail is saved to a file
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information,Account details," for " SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
      #| AccountHeaderLabel             | Account Details                                                                                                           |
      | AccountName                    | BO-PENDING          |
    #| AccountDefaultCurrency         | AUD                                                                                                               |
    #| AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "updated status" for "Backdate Transaction service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen model window" for "Backdate Transaction service request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
    Then The application should display the "following reason type" for "Backdate Transaction under Reopen model window"
      | reopen_dropdown_option1 | Please select a reason         |
      | reopen_dropdown_option2 | Further Investigation Required |
      | reopen_dropdown_option3 | Information Incomplete         |
      | reopen_dropdown_option4 | Information Unclear            |
      | reopen_dropdown_option5 | Other                          |
    When The user select the "Further Investigation Required" from "reopenReasonType" drop down
    Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
    When The user entered "test@anz.com" in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The user waiting to load "reopen Confirmation pop-up"
    Then The application should display the "Confirmation pop-up" for "reopen submitted request"
      | reopen_submit_confirm_msg1 | Your Service Request has been |
      | reopen_submit_confirm_msg2 | Reopened.                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information,Account details,Comments and Supporting Documents" for "Backdate Transaction service request in view mode"
      | Summary_Info_header             | Summary Information               |
      | Summary_Info_RequestID_txt      | Request ID                        |
      | Summary_Info_Requestedon_txt    | Requested on                      |
      | Summary_Info_Requestedby_txt    | Requested by                      |
      | Summary_Info_RequestStatus_txt  | Your Reference                    |
      | Summary_Info_YourReference_txt  | Request Status                    |
      #| AccountHeaderLabel              | Account Details                                                                                                           |
      | AccountName                     | BO-PENDING                        |
      #| AccountDefaultCurrency          | AUD                                                                                                               |
      #| AccountDescription              | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | commentSectionHeader            | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
      | additionalComments_AddedBy      | User Lname                        |
      | additionalComments_Comments     | reopenReasonText                  |


  @BDT24
  Scenario: Backdate Transaction - Submit comments only
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Backdate Transaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Backdate Transaction" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "Backdate SR in view mode"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "Backdate SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "add user service request"
      | Comment_Section_header   | Comments and Supporting Documents                                                            |
      | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentTitle  | New comment / attachment                                                                     |
      | additional_Comment-field | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Additional Comment" textbox
    #Then The element "submit" should be enabled
    When The user entered "Providing the comments only" in "Additional Comment" textbox
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents section" for "Trace a Transaction service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32         |
      | Added by | User Lname                  |
      | Comments | Providing the comments only |


  @BDT25
  Scenario: Backdate Transaction - Submit Attachments only
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "Backdate SR in view mode"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Backdate Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "Backdate SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
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
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "Backdate SR"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |

  @BDT26
  Scenario: Backdate Transaction - Submit comment&Attachments
    Given I am an authorised user with permission to create a "Backdate Transaction" service request
    When The user navigate to the "Backdate Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "Backdate SR"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | postDateField | 22/04/2021  |
    When The user click on the "Search" button
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "22/04/2021" into the "backdateValue" text field
    Then The user enter "backdatereason sample text" into the "backdatereason" text field
    Then The user enter "Ref#text" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Backdate SR on review page"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Backdate SR in view mode"
      | DDR_Title       | Backdate Transaction (AU)                                                                                              |
      | DDR_Description | Request a transaction to be backdated if an ANZ error has caused the transaction to be processed on an incorrect date. |
    Then The application should display the "Summary Information" for "Backdate SR in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "Backdate SR in view mode"
      #| AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName | BO-PENDING |
    #| AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Backdate Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "Backdate SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
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
    When The user entered "Test comments" in "Additional Comment" textbox
    #Then The element "submit" should be enabled
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
     Then The user searches the stored service request with request type "Backdate Transaction" search req type "Backdate Transaction" and selects it
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "Backdate SR"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Comments    | Comments with attachments  |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |




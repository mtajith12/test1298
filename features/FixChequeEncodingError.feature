@ui-mock @api-mock @FixChequeEncodingError @Regression @webform
Feature: Fix Cheque Encoding Error
  User should able to initiate new Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly.

  @smoke-testing @fcee1 @ui-mock
  Scenario: Fix Cheque Encoding Error - Service Request Header and Progress Bar Display 'Your Reference'section and Populating value in review & view pages
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    Then The application should display the "Service Request Header" for "Fix Cheque Encoding Error"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application shows the "cancel" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The application should display the "Your Reference section" for "Fix Cheque Encoding Error Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header              | Summary Information   |
      | Summary_Info_RequestID_txt       | Request ID            |
      | Summary_Info_Requestedon_txt     | Requested on          |
      | Summary_Info_Requestedby_txt     | Requested by          |
      | Summary_Info_RequestStatus_txt   | Your Reference        |
      | Summary_Info_YourReference_txt   | Request Status        |
      | Summary_Info_YourReference_value | testFCEEyourreference |





  @fcee5
  Scenario: Fix Cheque Encoding Error - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
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
    * For Acceptance Criteria "Cancel Service Request prior to submission on 'Review and Submit' screen"
    #Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
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
    * For Acceptance Criteria "Fix Cheque Encoding Error - User does not have emailaddress"
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "Test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button



  @fcee8
  Scenario: Fix Cheque Encoding Error - Account Lookup
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING" into the Search "Account" lookup
    Then The application should display the "Account details" for "error encoding error page"
      | AccountName | BO-PENDING |
    Then The application should display the "Search for Transaction component" for "error encoding Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    * For Acceptance Criteria "Fix Cheque Encoding Error - Search Transaction with Amount  < 0"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 0             |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria " - Search Transaction with Amount  > 99,999,999,999.99"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 100000000000  |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria " Search Transaction with Amount range and Date range UI verification"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 0/100000      |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria " Search Transaction with Amount range and Date range UI verification"
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2020/March 9, 2020 |
      | amount   | 1/100000                    |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate           | Post Date               |
      | transactionGridAmount         | Amount                  |
      | transactionGridDebit/Credit   | Debit/Credit            |
      | transactionGridNarrative      | Narrative               |
      | transactionGridAuxdom         | Auxdom                  |
      | transactionGridTraceline      | Traceline               |
      | transactionGridTransType      | Tran Type               |
      | transactionGrid1              | 15/04/2018              |
      | transactionGrid2              | 25,000.00               |
      | transactionGrid3              | Cr                      |
      | transactionGrid4              | 14                      |
      | transactionGrid5              | 0000009077              |
      | transactionGrid6              | CMO010906290133A000Z1E8 |
      | transactionGridNarrativeValue | LATE PAYMENT FEE        |
    * For Acceptance Criteria "Fix Cheque Encoding Error - Reset before search"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   | 100           |
      | PostDate | March 9, 2020 |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Fix Cheque Encoding Error Service Request"
      | fromAmount |  |
      | fromDate   |  |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria "Fix Cheque Encoding Error - Reset After search"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate           | Post Date               |
      | transactionGridAmount         | Amount                  |
      | transactionGridDebit/Credit   | Debit/Credit            |
      | transactionGridNarrative      | Narrative               |
      | transactionGridAuxdom         | Auxdom                  |
      | transactionGridTraceline      | Traceline               |
      | transactionGridTransType      | Tran Type               |
      | transactionGrid1              | 15/04/2018              |
      | transactionGrid2              | 25,000.00               |
      | transactionGrid3              | Cr                      |
      | transactionGrid4              | 14                      |
      | transactionGrid5              | 0000009077              |
      | transactionGrid6              | CMO010906290133A000Z1E8 |
      | transactionGridNarrativeValue | LATE PAYMENT FEE        |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Fix Cheque Encoding Error Service Request"
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
    * For Acceptance Criteria "Fix Cheque Encoding Error - Reset After selected the perticular transaction"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate           | Post Date               |
      | transactionGridAmount         | Amount                  |
      | transactionGridDebit/Credit   | Debit/Credit            |
      | transactionGridNarrative      | Narrative               |
      | transactionGridAuxdom         | Auxdom                  |
      | transactionGridTraceline      | Traceline               |
      | transactionGridTransType      | Tran Type               |
      | transactionGrid1              | 15/04/2018              |
      | transactionGrid2              | 25,000.00               |
      | transactionGrid3              | Cr                      |
      | transactionGrid4              | 14                      |
      | transactionGrid5              | 0000009077              |
      | transactionGrid6              | CMO010906290133A000Z1E8 |
      | transactionGridNarrativeValue | LATE PAYMENT FEE        |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Fix Cheque Encoding Error Service Request"
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
    * For Acceptance Criteria "Fix Cheque Encoding Error - Search -No records found"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @FCEE-15
  Scenario: Fix Cheque Encoding Error - Create 'Cheque Encode Error' by specifing the Cheque number
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate           | Post Date               |
      | transactionGridAmount         | Amount                  |
      | transactionGridDebit/Credit   | Debit/Credit            |
      | transactionGridNarrative      | Narrative               |
      | transactionGridAuxdom         | Auxdom                  |
      | transactionGridTraceline      | Traceline               |
      | transactionGridTransType      | Tran Type               |
      | transactionGrid1              | 15/04/2018              |
      | transactionGrid2              | 25,000.00               |
      | transactionGrid3              | Cr                      |
      | transactionGrid4              | 14                      |
      | transactionGrid5              | 0000009077              |
      | transactionGrid6              | CMO010906290133A000Z1E8 |
      | transactionGridNarrativeValue | LATE PAYMENT FEE        |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "123456" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "FCEE on review page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_TranType        | 14                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The application should display the "Account details" for "FCEE SR in review mode"
      | chequeEncodingDetails   | Cheque Encoding Details                      |
      | encodingItem-field1     | Which encoding error would you like to fix ? |
      | encodingItem-field2     | Cheque number                                |
      | customerChequeNos-field | Correct cheque number                        |
      | chequeNumber            | 123456                                       |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEauthorisation     |
    When The user click on the "Submit" button
    Then The user waiting to load "Manual email modal"
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
    Then The application should display the "Account details" for "FCEE service request"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "FCEE on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_TranType        | 14                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The application should display the "Account details" for "FCEE SR in view mode"
      | chequeEncodingDetails   | Cheque Encoding Details                      |
      | encodingItem-field1     | Which encoding error would you like to fix ? |
      | encodingItem-field2     | Cheque number                                |
      | customerChequeNos-field | Correct cheque number                        |
      | chequeNumber            | 123456                                       |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @FCEE-16
  Scenario: Fix Cheque Encoding Error - Create 'Cheque Encode Error' by specifing  Amount
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Fix Cheque Encoding Error Service Request"
      | transactionGridDate           | Post Date               |
      | transactionGridAmount         | Amount                  |
      | transactionGridDebit/Credit   | Debit/Credit            |
      | transactionGridNarrative      | Narrative               |
      | transactionGridAuxdom         | Auxdom                  |
      | transactionGridTraceline      | Traceline               |
      | transactionGridTransType      | Tran Type               |
      | transactionGrid1              | 15/04/2018              |
      | transactionGrid2              | 25,000.00               |
      | transactionGrid3              | Cr                      |
      | transactionGrid4              | 14                      |
      | transactionGrid5              | 0000009077              |
      | transactionGrid6              | CMO010906290133A000Z1E8 |
      | transactionGridNarrativeValue | LATE PAYMENT FEE        |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "ChequeAmount" checkbox
    Then The user enter "71234567" into the "chequeAmountInput" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "FCEE on review page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_TranType        | 14                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The application should display the "Account details" for "FCEE SR in review mode"
      | chequeEncodingDetails      | Cheque Encoding Details                      |
      | encodingItem-field1        | Which encoding error would you like to fix ? |
      | encodingItem-field2        | Amount                                       |
      | customerChequeAmount-field | Correct cheque amount                        |
      | customerChequeAmount       | AUD 71,234,567.00                            |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEauthorisation     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
    Then The application should display the "Account details" for "FCEE service request"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "FCEE on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_TranType        | 14                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The application should display the "Account details" for "FCEE SR in review mode"
      | chequeEncodingDetails      | Cheque Encoding Details                      |
      | encodingItem-field1        | Which encoding error would you like to fix ? |
      | encodingItem-field2        | Amount                                       |
      | customerChequeAmount-field | Correct cheque amount                        |
      | customerChequeAmount       | AUD 71,234,567.00                            |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as In progress in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @FCEE-UIvalidation
  Scenario: Fix Cheque Encoding Error - ChequeAmount-field UI validation
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "ChequeAmount" checkbox
    When The user Clicks the "Next" button
    And The application should display error message under "customerChequeAmount-field-errormgs" section
      | error_message | Correct cheque amount is mandatory |
        
* For Acceptance Criteria "Without Enter Cheque Encoding Details"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    And The application should display error message under "encodingItem-field-errormsg" section
      | error_message | Please select an option |
* For Acceptance Criteria "Fix Cheque Encoding Error - Cheque number-field UI validation"
  When The user Clicks the "Reset" button
     Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    When The user Clicks the "Next" button
    And The application should display error message under "customerChequeNos-field-errormgs" section
      | error_message | Correct cheque number is mandatory |

* For Acceptance Criteria "Fix Cheque Encoding Error - Search without Date"
  When The user Clicks the "Reset" button
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |

 * For Acceptance Criteria "Fix Cheque Encoding Error - Without transaction selected after search"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |

  * For Acceptance Criteria "Fix Cheque Encoding Error - Without transaction selected"
   When The user Clicks the "Reset" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |


  @FCEE-WithoutYourReference @FCEE-20
  Scenario: Fix Cheque Encoding Error - Your Reference value Not display if user not entered
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen


  @FCEE-22
  Scenario: Fix Cheque Encoding Error - Create FCEE request and search based on requestId
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEauthorisation     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Fix Cheque Encoding Error" is detail is saved to a file
    Then The user click on the "Ok" button
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "FCEE on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_TranType        | 14                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |



  @FCEE-test
  Scenario: Fix Cheque Encoding Error - Reopen submit and View
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "updated status" for "DDR service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen model window" for "FCEE service request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
    Then The application should display the "following reason type" for "FCEE under Reopen model window"
      | reopen_dropdown_option1 | Please select a reason         |
      | reopen_dropdown_option2 | Further Investigation Required |
      | reopen_dropdown_option3 | Information Incomplete         |
      | reopen_dropdown_option4 | Information Unclear            |
      | reopen_dropdown_option5 | Other                          |
    When The user select the "Further Investigation Required" from "reopenReasonType" drop down
    Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
    When The user entered "test@anz.com" in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "Confirmation pop-up" for "reopen submitted request"
      | reopen_submit_confirm_msg1 | Your Service Request has been |
      | reopen_submit_confirm_msg2 | Reopened.                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "Fix Cheque Encoding Error service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "Fix Cheque Encoding Error service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |


  @FCEE-comment
  Scenario: Fix Cheque Encoding Error - Submit comments only
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "request status as More Information Required" for "FCEE SR"
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
    # Then The element "submit" should be enabled
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


  @FCEE-Attachments
  Scenario: Fix Cheque Encoding Error - Submit Attachments only
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "request status as More Information Required" for "FCEE SR"
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
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "FCEE service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |

  @FCEE-comment&Attachments
  Scenario: Fix Cheque Encoding Error - Submit comment&Attachments
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user click on the "Cheque number" checkbox
    Then The user enter "1234567" into the "chequeNumber" text field
    Then The user enter "testFCEEauthorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "FCEE service request in view mode"
      | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                       |
      | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
    Then The application should display the "Summary Information" for "FCEE service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Account details" for "FCEE service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "request status as More Information Required" for "FCEE SR"
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
    # Then The element "submit" should be enabled
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "FCEE service request"
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




  @FCEE#bulk2
  Scenario: DTFAU-249 : Fix Cheque Encoding Error - bulk - Cheque-submit
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "FCEE Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "bulk Deposit text" for "Fix Cheque Encoding Error SR"
      | bulkDeposit          | I want to Fix a Cheque within a Bulk Deposit |
      | bulkDeposit-checkbox |                                              |
    Then The user click on the "bulkDeposit-checkbox" checkbox
    Then The user click on the "Cheque number" checkbox
    Then The user enter "354353" into the "incorrectChequeNumber" text field
    Then The user enter "123456" into the "customerChequeNos" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Fix Cheque Encoding Error service request in view mode"
      | recallPaymentTitle    | Fix Cheque Encoding Error (AU)                                                                       |
      | recallPaymentDesc     | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
      | chequeEncodingDetails | Cheque Encoding Details                                                                              |
      | encodingItem-field1   | Which encoding error would you like to fix ?                                                         |
      | encodingItem-field2   | Cheque number                                                                                        |
      | incorrectChequeNumber | 354353                                                                                               |
      | customerChequeNos     | 123456                                                                                               |
    When The user click on the "Submit" button
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Fix Cheque Encoding Error Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Fix Cheque Encoding Error service request in view mode"
      | Summary_Info_header            | Summary Information                                                                                  |
      | Summary_Info_RequestID_txt     | Request ID                                                                                           |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                         |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                         |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                                                       |
      | recallPaymentTitle             | Fix Cheque Encoding Error (AU)                                                                       |
      | recallPaymentDesc              | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
      | chequeEncodingDetails          | Cheque Encoding Details                                                                              |
      | encodingItem-field1            | Which encoding error would you like to fix ?                                                         |
      | encodingItem-field2            | Cheque number                                                                                        |
      | incorrectChequeNumber          | 354353                                                                                               |
      | customerChequeNos              | 123456                                                                                               |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button

  @FCEE#bulk
  Scenario: DTFAU-249 : Fix Cheque Encoding Error - bulk - Cheque-UI validations
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "FCEE Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "bulk Deposit text" for "Fix Cheque Encoding Error SR"
      | bulkDeposit          | I want to Fix a Cheque within a Bulk Deposit |
      | bulkDeposit-checkbox |                                              |
    Then The user click on the "bulkDeposit-checkbox" checkbox
    Then The user click on the "Cheque number" checkbox
    And The user Clicks the "Next" button
    Then The application should display error message under "incorrectChequeNumber-error-msg" section
      | error_message | Incorrect cheque number is mandatory |
    Then The application should display error message under "customerChequeNos-error-msg" section
      | error_message | Correct cheque number is mandatory |





  @FCEE#bulk123
  Scenario: DTFAU-249 : Fix Cheque Encoding Error - bulk - Amount-submit
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "FCEE Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "bulk Deposit text" for "Fix Cheque Encoding Error SR"
      | bulkDeposit          | I want to Fix a Cheque within a Bulk Deposit |
      | bulkDeposit-checkbox |                                              |
    Then The user click on the "bulkDeposit-checkbox" checkbox
    Then The user click on the "ChequeAmount" checkbox
    Then The user enter "35435345" into the "customerChequeNumber" text field
    Then The user enter "32432" into the "incorrectChequeAmount" text field
    Then The user enter "2342" into the "customerChequeAmount" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display the "Service Request Header" for "Fix Cheque Encoding Error service request in review mode"
      | recallPaymentTitle    | Fix Cheque Encoding Error (AU)                                                                       |
      | recallPaymentDesc     | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
      | chequeEncodingDetails | Cheque Encoding Details                                                                              |
      | encodingItem-field1   | Which encoding error would you like to fix ?                                                         |
      | encodingItem-field2   | Amount                                                                                               |
      | customerChequeNumber  | 354353                                                                                               |
      | incorrectChequeAmount | AUD 32,432.00                                                                                        |
      | customerChequeAmount  | AUD 2,342.00                                                                                         |
    When The user click on the "Submit" button
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Fix Cheque Encoding Error Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Fix Cheque Encoding Error service request in view mode"
      | Summary_Info_header            | Summary Information                                                                                  |
      | Summary_Info_RequestID_txt     | Request ID                                                                                           |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                         |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                         |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                                                       |
      | recallPaymentTitle             | Fix Cheque Encoding Error (AU)                                                                       |
      | recallPaymentDesc              | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
      | chequeEncodingDetails          | Cheque Encoding Details                                                                              |
      | encodingItem-field1            | Which encoding error would you like to fix ?                                                         |
      | encodingItem-field2            | Amount                                                                                               |
      | customerChequeNumber           | 354353                                                                                               |
      | incorrectChequeAmount          | AUD 32,432.00                                                                                        |
      | customerChequeAmount           | AUD 2,342.00                                                                                         |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button

  @FCEE#bulk
  Scenario: DTFAU-249 : Fix Cheque Encoding Error - bulk - ChequeAmount-UI validations
    Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
    When The user navigate to the "Fix Cheque Encoding Error" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "FCEE Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "FCEE Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "bulk Deposit text" for "Fix Cheque Encoding Error SR"
      | bulkDeposit          | I want to Fix a Cheque within a Bulk Deposit |
      | bulkDeposit-checkbox |                                              |
    Then The user click on the "bulkDeposit-checkbox" checkbox
    Then The user click on the "ChequeAmount" checkbox
    And The user Clicks the "Next" button
    Then The application should display error message under "customerChequeNumber-field-error-msg" section
      | error_message | Cheque number is mandatory |
    Then The application should display error message under "incorrectChequeAmount-field-error-msg" section
      | error_message | Incorrect cheque amount is mandatory |
    Then The application should display error message under "customerChequeAmount-field-error-msg" section
      | error_message | Correct cheque amount is mandatory |



# @FCCE-Comments&Attachments#Close#Yes
# Scenario: Fix Cheque Encoding Error - Comments&Attachments#Close#Yes
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testFEE#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   When The user entered "Comments with attachments" in "Additional Comment" textbox
#   Then The application should allow user to select and upload single file
#     | filepath | //resources//input//Test-pdf.pdf |
#   Then The application should display the "uploaded files under" the "additional file upload section"
#     | fileRemoveIcon1            |                            |
#     | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "Yes" button
#   Then The application does not show "Add Comment" element
#   Then The application shows "Cash Management Service Requests" screen


# @FCCE-Comments&Attachments#Close#No
# Scenario: Fix Cheque Encoding Error - Comments&Attachments#Close#No
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testROF#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountHeaderLabel     | Account Details                                                                                                          |
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |

#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   When The user entered "Comments with attachments" in "Additional Comment" textbox
#   Then The application should allow user to select and upload single file
#     | filepath | //resources//input//Test-pdf.pdf |
#   Then The application should display the "uploaded files under" the "additional file upload section"
#     | fileRemoveIcon1            |                            |
#     | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "No" button
#   Then The application must close the cancel service request alert pop-up message
#   Then The element "#additionalComment" should have the text "Test comments"




# @FCCE-CommentsOnly#Close#Yes
# Scenario: Fix Cheque Encoding Error - CommentsOnly#Close#Yes
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testROF#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountHeaderLabel     | Account Details                                                                                                          |
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |

#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   When The user entered "Comments with attachments" in "Additional Comment" textbox
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "Yes" button
#   Then The application does not show "Add Comment" element
#   Then The application shows "Cash Management Service Requests" screen




# @FCCE-CommentsOnly#Close#No
# Scenario: Fix Cheque Encoding Error - CommentsOnly#Close#No
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testROF#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountHeaderLabel     | Account Details                                                                                                          |
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |

#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   When The user entered "Comments with attachments" in "Additional Comment" textbox
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "No" button
#   Then The application must close the cancel service request alert pop-up message
#   Then The element "#additionalComment" should have the text "Test comments"




# @FCCE-AttachmentsOnly#Close#Yes
# Scenario: Fix Cheque Encoding Error - AttachmentsOnly#Close#Yes
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testROF#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountHeaderLabel     | Account Details                                                                                                          |
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |

#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   Then The application should allow user to select and upload single file
#     | filepath | //resources//input//Test-pdf.pdf |
#   Then The application should display the "uploaded files under" the "additional file upload section"
#     | fileRemoveIcon1            |                            |
#     | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "Yes" button
#   Then The application does not show "Add Comment" element
#   Then The application shows "Cash Management Service Requests" screen




# @FCCE-AttachmentsOnly#Close#No
# Scenario: Fix Cheque Encoding Error - AttachmentsOnly#Close#No
#   Given I am an authorised user with permission to create a "Fix Cheque Encoding Error" service request
#   When The user navigate to the "Fix Cheque Encoding Error" service request screen
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#     | SearchforTransactionLabel | Search for Transaction |
#   Then The user enters value in the search criteria fields
#     | PostDate | March 9, 2020 |
#     | amount   | 25000         |
#   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   Then The user click on the "Cheque number" checkbox
#   Then The user enter "1234567" into the "chequeNumber" text field
#   Then The user enter "testROF#authorisation" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "Account details" for "ROF on review page"
#     | AccountHeaderLabel     | Account Details                                                                                                          |
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |

#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The request id is stored from the element "responseId"
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "FCEE service request in view mode"
#     | FCEE_Title       | Fix Cheque Encoding Error (AU)                                                                            |
#     | FCEE_Description | Request to fix a cheque encoding error when a cheque number or amount has been captured incorrectly. |
#   Then The user update the service request status with following details
#     | requestId     | responseId        |
#     | status        | PENDING_MORE_INFO |
#     | requestStatus | PENDING_MORE_INFO |
#   When The user Clicks the "Close" button
#   Then The user searches stored service request with request type "Fix Cheque Encoding Error" and selects it
#   Then The application should display the "request status as More Information Required" for "ROF SR"
#     | Summary_Info_header          | Summary Information       |
#     | Summary_Info_RequestID_txt   | Request ID                |
#     | Summary_Info_Requestedon_txt | Requested on              |
#     | Summary_Info_Requestedby_txt | Requested by              |
#     | summary_status               | More Information Required |
#   Then The application should display the "Add new comment / attachment" button
#   When The user click on the "Add new comment / attachment" button
#   Then The application should allow user to select and upload single file
#     | filepath | //resources//input//Test-pdf.pdf |
#   Then The application should display the "uploaded files under" the "additional file upload section"
#     | fileRemoveIcon1            |                            |
#     | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#   When The user click on the "Close" button
#   Then The application shows "Alert prompt" dialog
#   When The user Clicks the "No" button
#   Then The application must close the cancel service request alert pop-up message
#   Then The element "#additionalComment" should have the text "Test comments"




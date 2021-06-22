@ui-mock @api-mock @RecallPayment @Regression @webform @20.6.1
Feature: Recall Payment
  User should able to initiate new Recall Payment from your nominated accounts

  @RecallPayment1
  Scenario: Recall Payment - Populating 'Your Reference' value in view page
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    Then The application should display the "Service Request Header" for "Recall Payment"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application shows the "cancel" button
    Then  The application should display the "progress bar with status" for "Recall Payment Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Recall Payment Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testRecall Payment#your_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Recall Payment Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "Recall Payment on review page"
      | Your_Reference_header | Your Reference (optional)        |
      | your_reference        | testRecall Payment#yourreference |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
      | Summary_Info_header              | Summary Information              |
      | Summary_Info_RequestID_txt       | Request ID                       |
      | Summary_Info_Requestedon_txt     | Requested on                     |
      | Summary_Info_Requestedby_txt     | Requested by                     |
      | Summary_Info_RequestStatus_txt   | Your Reference                   |
      | Summary_Info_YourReference_txt   | Request Status                   |
      | Summary_Info_YourReference_value | testRecall Payment#yourreference |

  @RecallPayment4
  Scenario: Recall Payment - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
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
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
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
    * For Acceptance Criteria "User does not have email Recall Payments"
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "Test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Backdate SR"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    When The user Clicks the "Close" button
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user Clicks the "accountSearch" button
    When The user types in "BO-AWAITING-FULFILMENT" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DDR on after selectd account in enter details page"
      | AccountName | BO-AWAITING-FULFILMENT |
    * For Acceptance Criteria " Search Transaction with Amount  < 0"
    Then The user enters value in the search criteria fields
      | PostDate | May 9, 2020 |
      | amount   | 0           |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    * For Acceptance Criteria "Search Transaction with Amount  > 99,999,999,999.99"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | May 9, 2020    |
      | amount   | 99999999999999 |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |

    * For Acceptance Criteria "Search Transaction with Amount range and Date range UI verification"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2020/March 9, 2020 |
      | amount   | 1/9000000                   |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 06/01/2018              |
      | transactionGrid2                  | 1,000.00                |
      | transactionGrid3                  | Dr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009070              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E1 |
    * For Acceptance Criteria "Reset before search"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Recall Payment Service Request"
      | fromAmount |  |
      | fromDate   |  |
    * For Acceptance Criteria "Reset After search"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date           |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Recall Payment Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               |  |
      | transactionGridAmount             |  |
      | transactionGridDebit/Credit       |  |
      | transactionGridNarrative          |  |
      | transactionGridAuxdom             |  |
      | transactionGridLodgementReference |  |
      | transactionGridTraceline          |  |
    * For Acceptance Criteria "Reset After selected the perticular transaction"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Recall Payment Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               |  |
      | transactionGridAmount             |  |
      | transactionGridDebit/Credit       |  |
      | transactionGridNarrative          |  |
      | transactionGridAuxdom             |  |
      | transactionGridLodgementReference |  |
      | transactionGridTraceline          |  |
    * For Acceptance Criteria "Search -No records found"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @RecallPayment13
  Scenario: Recall Payment - Create Recall Payment request
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Recall Payment Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "Recall Payment on review page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "importantInformationCheckBox" button
    Then The application should display the "Important Information" for "Recall Payment Service Request"
      | imp_info_header | Important Information |
    # Then The application should display the "Important_Information_text1" for "Service Request" text
    # | Important_Information_text1 |By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule).I acknowledge that funds will be debited from this account to return the payment.|
    When The user click on the "Submit" button
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "Recall Payment on view page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @RecallPayment14
  Scenario: Recall Payment - Search without Date
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |
    * For Acceptance Criteria "Recall Payment - Without transaction selected"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |
    * For Acceptance Criteria "Recall Payment - Your Reference value Not display if user not entered"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen
    When The user Clicks the "Cancel" button
    * For Acceptance Criteria "Recall Payment - Without Important Information"
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |


  @RecallPayment18
  Scenario: Recall Payment - Create Recall Payment request and search based on requestId
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Recall Payment Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "Recall Payment on review page"
      | Your_Reference_header | Your Reference (optional)        |
      | your_reference        | testRecall Payment#authorisation |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Recall Payment" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Recall Payment" search req type "Recall Payment" and selects it
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "Recall Payment Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "Recall Payment service request in view mode"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |

  @RecallPayment-Reopen
  Scenario: Recall Payment - Reopen submit and View
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Recall Payment" and selects it
    Then The application should display the "updated status" for "Recall Payment service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    When The user Clicks the "Reopen" button
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
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |


  @RecallPayment-additionalDocs
  Scenario: Recall Payment - Submit comments only
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "Recall Payment service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Recall Payment" and selects it
    Then The application should display the "request status as More Information Required" for "Recall Payment SR"
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


  @RecallPayment-additionalDocs
  Scenario: Recall Payment - Submit Attachments only
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "Recall Payment service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Recall Payment" and selects it
    Then The application should display the "request status as More Information Required" for "Recall Payment SR"
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


  @Recall#Payment-additionalDocs
  Scenario: Recall Payment - Submit Attachments only
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testRecall Payment#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Recall Payment on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "Recall Payment service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Recall Payment" and selects it
    Then The application should display the "request status as More Information Required" for "Recall Payment SR"
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
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Additional Comment" textbox
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
      | Date     | 19/07/2019 01:37:32       |
      | Added by | User Lname                |
      | Comments | Comments with attachments |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Comments    | Filled Form uploaded.      |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |


  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk Validation Check
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display the "Beneficiary Details" for "Recall Payment service request"
      | beneficiaryDetails_Header | Enter Beneficiary Details |
      | beneficiaryAccountName    |                           |
      | beneficiaryBsb            |                           |
      | beneficiaryAccount        |                           |
      | beneficiaryAmount         |                           |
      | beneficiaryLodgementRef   |                           |
    When The user enter the 'Beneficiary Details' without 'BSB'
    And The user Clicks the "Next" button
    Then The application should display error message under "BSBErrorMsg" field
      | error_message | BSB is mandatory |

    When The user enter the 'Beneficiary Details' with incorrect 'BSB'
    And The user Clicks the "Next" button
    Then The application should display error message under "BSBErrorMsg" field
      | error_message | BSB must be 6 digits |

    When The user enter the 'Beneficiary Details' with invalid 'BSB'
    And The user Clicks the "Next" button
    Then The application does not accept invalid "BSB"


    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |

    When The user enter the 'Beneficiary Details' with 'Invalid Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | The Account Number must be between 6 and 9 digits |

    When The user enter the 'Beneficiary Details' with 'Non Numeric Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |

    When The user enter the 'Beneficiary Details' without 'Account Name'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNameErrorMsg" field
      | error_message | Account Name is mandatory |

    When The user enter the 'Beneficiary Details' with 'Invalid Account Name'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNameErrorMsg" field
      | error_message | The account name must be 1-32 valid characters |


    When The user enter the 'Beneficiary Details' without 'Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Recall Amount is mandatory |

    When The user enter the 'Beneficiary Details' with 'Invalid Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Recall Amount is mandatory |

    When The user enter the 'Beneficiary Details' with 'Invalid range Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount should be greater than 0.00 and less than 99,999,999,999.99 |

    When The user enter the 'Beneficiary Details' Exceed Maximum Trace Amount
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |



  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk submit
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "1" into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
      | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    When The user click on the "importantInformationCheckBox" button
    Then The application should display the "Important Information" for "Recall Payment Service Request"
      | imp_info_header | Important Information |
    # Then The application should display the "Important_Information_text1" for "Service Request" text
    # | Important_Information_text1 |By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule).I acknowledge that funds will be debited from this account to return the payment.|
    When The user click on the "Submit" button
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
    Then The application should display following fields "Recall Payment  SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |

  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk -beneficiaryAmount whole value
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 1             |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "1.00" into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 1.00      |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Previous" button
    Then The user enter "1.01" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    Then The user enter "1.10" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |


  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk -beneficiaryAmount with decimal
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 1.01          |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "1" into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 1.01      |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Previous" button
    Then The user enter "1.02" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    Then The user enter "1.11" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |



  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk -beneficiaryAmountwith 3 digits with decimal
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 1000.07       |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "1000.07 " into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 1000.07   |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Previous" button
    Then The user enter "1000.08" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    Then The user enter "1000.55 " into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |



  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk -beneficiaryAmountwith 4 digits with decimal
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 10000.08      |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "10000.08" into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 10000.08  |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Previous" button
    Then The user enter "10000.09" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    Then The user enter "10000.10 " into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |

  @bulkrp1
  Scenario: DTFAU-249 : Recall Payment - bulk -beneficiaryAmountwith 5 digits with decimal
    Given I am an authorised user with permission to create a "Recall Payment" service request
    When The user navigate to the "Recall Payment" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 100000.70     |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransaction" checkbox
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |
      | beneficiaryDetails_Header |
      | beneficiaryAccountName    |
      | beneficiaryBsb            |
      | beneficiaryAccount        |
      | beneficiaryAmount         |
      | beneficiaryLodgementRef   |
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    Then The user enter "100000.70 " into the "beneficiaryAmount" text field
    Then The user enter "test123" into the "beneficiaryLodgementRef" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display following fields "Recall Payment SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 100000.70 |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Previous" button
    Then The user enter "100000.71 " into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    Then The user enter "100000.79 " into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Amount must be equal to or less than the selected transaction amount |

  # @RecallPayment#SingleApproval
  # Scenario: Recall Payment - Single Approval
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "Search for Transaction component" for "Recall Payment Service Request"
  #     | amount   | Amount    |
  #     | postDate | Post Date |
  #     | Reset    | Reset     |
  #     | Search   | Search    |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   Then The application should display the "transaction search results grid" for "Recall Payment Service Request"
  #     | transactionGridDate               | Post Date               |
  #     | transactionGridAmount             | Amount                  |
  #     | transactionGridDebit/Credit       | Debit/Credit            |
  #     | transactionGridLodgementReference | Lodgement Reference     |
  #     | transactionGridNarrative          | Narrative               |
  #     | transactionGridAuxdom             | Auxdom                  |
  #     | transactionGridTraceline          | Traceline               |
  #     | transactionGrid1                  | 15/04/2018              |
  #     | transactionGrid2                  | 25,000.00               |
  #     | transactionGrid3                  | Cr                      |
  #     | transactionGrid4                  | LATE PAYMENT FEE        |
  #     | transactionGrid9                  | 0000009077              |
  #     | transactionGrid5                  |                         |
  #     | transactionGrid6                  | CMO010906290133A000Z1E8 |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testRecallPayment#PendingApproval" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Recall Payment on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                   |
  #     | AccountName            | BO-PENDING                                                                                                        |
  #     | AccountDefaultCurrency | AUD                                                                                                               |
  #     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Recall Payment Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                                   |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The application should display the "Summary Information" for "Recall Payment service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #   Then The application should display the "Important Information Section" for "Recall Payment service request in view mode"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Account details" for "Recall Payment service request in view mode"
  #     | AccountHeaderLabel     | Account Details                                                                                                   |
  #     | AccountName            | BO-PENDING                                                                                                        |
  #     | AccountDefaultCurrency | AUD                                                                                                               |
  #     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The user update the service request cobraAdminModel with following details
  #     | requestId                       | responseId |
  #     | approvalDetails.cobraAdminModel | SINGLE     |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
  #   Then The application should display the "request status as Pending Approval" for "Service Request"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "status as Pending Approval" for "Service Request"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The application should display the "following below text on Dual approver model window" for "Service Request"
  #     | approveDialog-title     | Approve Service Request                       |
  #     | cancelBtn               | Cancel                                        |
  #     | approveBtn              | Approve                                       |
  #     | approveDialog-content2  | Step 1: Generate your authorisation code      |
  #     | approveDialog-content3  | Step 2: Enter your authorisation code         |
  #     | approveDialog-content4  | Turn on the token by holding down             |
  #     | approveDialog-content5  | and pressing                                  |
  #     | approveDialog-content7  | Press                                         |
  #     | approveDialog-content8  | and enter the following code into your token: |
  #     | approveDialog-content9  | Press                                         |
  #     | approveDialog-content10 | to display your authorisation code            |
  #     | helpLink                | Click here for Security Device Help           |
  #   Then The application should display the "Approve model important Info Content" for "Service Request" text
  #     | approveDialog-content6 | Enter your 6 digit PIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
  #     | approveDialog-content1 | Token authorisation required                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
  #     | importantInfoContent1  | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
  #     | importantInfoContent2  | By approving this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge ANZ will send a request to the recipient's bank to have the funds returned to this account. It is not guaranteed that the funds will be returned as the recipient has the right to refuse the recall request.\nA request to recall a payment should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments. If the payment has been made to either of these government bodies, please contact the ATO or RBA directly to recall the payment. |
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   And The user click on the "approveBtn" button
  #   Then The application should display the "Approve" toast notification

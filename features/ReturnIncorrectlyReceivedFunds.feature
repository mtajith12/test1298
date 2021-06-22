@ui-mock @api-mock @ReturnOfFunds @Regression @webform
Feature: Return Incorrectly Received Funds
  User should able to initiate new Return Incorrectly Received Funds from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @api-mock @ui-mock @rof
  Scenario: Return Incorrectly Received Funds - Notification Dialog,Header & Progress Bar
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    # Then The application should display the "Service Request Header" for "Return Incorrectly Received Funds" text
    # | notificationDialog-description |                                                                                                                                        |
    #    | notificationDialog1            | A request to return funds should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments.If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment.    |
    #    | notificationDialog2            | If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment. |
    Then The application should display the "confirmButton" button
    When The user Clicks the "confirmButton" button
    Then The application should display the "Service Request Header" for "Return Incorrectly Received Funds"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
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
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |


  @rof
  Scenario: Return Incorrectly Received Funds - Populating 'Your Reference' value in view page
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#your_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "ROF on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testROF#yourreference     |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "Summary Information" for "ROF service request in view mode"
      | Summary_Info_header              | Summary Information   |
      | Summary_Info_RequestID_txt       | Request ID            |
      | Summary_Info_Requestedon_txt     | Requested on          |
      | Summary_Info_Requestedby_txt     | Requested by          |
      | Summary_Info_RequestStatus_txt   | Your Reference        |
      | Summary_Info_YourReference_txt   | Request Status        |
      | Summary_Info_YourReference_value | testROF#yourreference |

  @rof12
  Scenario: Return Incorrectly Received Funds - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
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
    * For Acceptance Criteria "User does not have email Recall Payments"
     When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
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
    * For Acceptance Criteria "Return Incorrectly Received Funds - User does not have email address"
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "Test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button


  @rof-UI
  Scenario: Return Incorrectly Received Funds - Account Lookup
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DDR on after selectd account in enter details page"
      | AccountName | BO-PENDING |
       Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
 * For Acceptance Criteria "Return Incorrectly Received Funds - Search Transaction with Amount  < 0"
     When The user Clicks the "Reset" button
     Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 0             |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
 * For Acceptance Criteria "Return Incorrectly Received Funds - Search Transaction with Amount  > 99,999,999,999.99"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 1000000000000 |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    
 * For Acceptance Criteria "Return Incorrectly Received Funds - Search -No records found"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |
  * For Acceptance Criteria "Return Incorrectly Received Funds - Reset before search"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Return Incorrectly Received Funds Service Request"
      | fromAmount |  |
      | fromDate   |  |
 * For Acceptance Criteria "Return Incorrectly Received Funds - Reset after search"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Return Incorrectly Received Funds Service Request"
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
 * For Acceptance Criteria "Return Incorrectly Received Funds - Reset After selected the perticular transaction"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Return Incorrectly Received Funds Service Request"
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


  @ROF
  Scenario: Return Incorrectly Received Funds - Create ROF request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The application should display the "Your Reference section" for "Return Incorrectly Received Funds Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "ROF on review page"
      | TrnstnGridHedr_Date               | Date                    |
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
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                               |
    #   | Important_Information_text1 | I acknowledge that funds will be debited from this account to return the payment. A Return of funds cannot be initiated for Australian Taxation Office (ATO) or Reserve of Bank of Australia (RBA) payments. If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment. |
    #   | Important_Information_text2 | By submitting this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule).                                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "ROF on view page"
      | TrnstnGridHedr_Date               | Date                    |
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


  @withoutDate
  Scenario: Return Incorrectly Received Funds - Search without Date
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |
 * For Acceptance Criteria "Return Incorrectly Received Funds - Without transaction selected"
 When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |
* For Acceptance Criteria "Return Incorrectly Received Funds - Your Reference value Not display if user not entered"
 When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen



  @ROF-WithoutImportantInformation
  Scenario: Return Incorrectly Received Funds - Without Important Information
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |

  @ROFSearch
  Scenario: Return Incorrectly Received Funds - Create ROF request and search based on requestId
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The application should display the "Your Reference section" for "Return Incorrectly Received Funds Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "ROF on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testROF#authorisation     |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The user click on the "Ok" button
    Then The user searches stored service request and selects it
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "ROF service request in view mode"
      | TrnstnGridHedr_Date               | Date                    |
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


  @ROFsearch2
  Scenario: Return Incorrectly Received Funds - Search based on RequestType Search Criteria
    Given The user on the service request history page
    When The user open the search fields
    And The user click into the "Request type" field
    Then The user should be able to see and select "Return Incorrectly Received Funds"
    When The user Clicks the "summaryGridsearch" button
    Then User should only see request history items that relate to "Return Incorrectly Received Funds"

  @ROF-Reopen
  Scenario: Return Incorrectly Received Funds - Reopen modal/pop-up 'Return Incorrectly Received Funds' request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The application should display the "Your Reference section" for "Return Incorrectly Received Funds Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "updated status" for "ROF service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen" button
    Then The application should display the "Reopen model window" for "ROF request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
    Then The application should display the "SubmitBtn" button
    Then The application should display the "following reason type" for "ROF under Reopen model window"
      | reopen_dropdown_option1 | Please select a reason         |
      | reopen_dropdown_option2 | Further Investigation Required |
      | reopen_dropdown_option3 | Information Incomplete         |
      | reopen_dropdown_option4 | Information Unclear            |
      | reopen_dropdown_option5 | Other                          |
       Then The application should display the "Reopen" button
    Then The application should display the "SubmitBtn" button
    When The user Clicks the "SubmitBtn" button
    Then The application should display error message under "reason_errormsg" component
      | error_message | Reason is mandatory |
    Then The application should display error message under "reasondetail_errormsg" component
      | error_message | Reason detail is mandatory |
    Then The application should display error message under "email_errormsg" component
      | error_message | Please enter a valid email address |
    When The user select the "Further Investigation Required" from "reopenReasonType" drop down
    When The user Clicks the "SubmitBtn" button
    Then The application should display error message under "reasondetail_errormsg" component
      | error_message | Reason detail is mandatory |
    Then The application should display error message under "email_errormsg" component
      | error_message | Please enter a valid email address |
    When The user entered "test@anz.com" in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display error message under "reasondetail_errormsg" component
      | error_message | Reason detail is mandatory |
    Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
    When The user entered " " in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display error message under "email_errormsg" component
      | error_message | Please enter a valid email address |


   

  @ROF-Reopen
  Scenario: Return Incorrectly Received Funds - Reopen submit
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "updated status" for "ROF service request"
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
    When The user Clicks the "Ok" button
    Then The user waiting to load "Account details section"
    Then The application shows "Cash Management Service Requests" screen



  @ROF-Reopen
  Scenario: Return Incorrectly Received Funds - Reopen submit and View
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "updated status" for "ROF service request"
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
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
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
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |





  @ROF-additionalDocs1
  Scenario: Return Incorrectly Received Funds - Submit comments only
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "Summary Information" for "ROF service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "ROF service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "ROF service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
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
    #Then The element "#submit" should be enabled
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





  @ROF-additionalDocs2
  Scenario: Return Incorrectly Received Funds - Submit Attachments only
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "Summary Information" for "ROF service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "ROF service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "ROF service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
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
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "Return of Fund service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |


  @ROF-additionalDocs3
  Scenario: Return Incorrectly Received Funds - Submit Comments and Attachments
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "ROF Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Return Incorrectly Received Funds Service Request"
      | transactionGridDate               | Date                    |
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
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    Then The application should display the "Confirmation pop-up" for "ROF Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "Summary Information" for "ROF service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "ROF service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "ROF service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
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
    # Then The element "submit" should be enabled
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "Return of Fund service request"
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



  @ROF-Comments&Attachments#Close#Yes
  Scenario: Return Incorrectly Received Funds - Comments&Attachments#Close#Yes
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "Yes" button
    Then The application does not show "Add Comment" element
    Then The application shows "Cash Management Service Requests" screen




  @ROF-Comments&Attachments#Close#No
  Scenario: Return Incorrectly Received Funds - Comments&Attachments#Close#No
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    Then The element "#additionalComment" should have the text "Test comments"




  @ROF-CommentsOnly#Close#Yes
  Scenario: Return Incorrectly Received Funds - CommentsOnly#Close#Yes
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "Yes" button
    Then The application does not show "Add Comment" element
    Then The application shows "Cash Management Service Requests" screen




  @ROF-CommentsOnly#Close#No
  Scenario: Return Incorrectly Received Funds - CommentsOnly#Close#No
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    Then The element "#additionalComment" should have the text "Test comments"




  @ROF-AttachmentsOnly#Close#Yes
  Scenario: Return Incorrectly Received Funds - AttachmentsOnly#Close#Yes
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "Yes" button
    Then The application does not show "Add Comment" element
    Then The application shows "Cash Management Service Requests" screen




  @ROF-AttachmentsOnly#Close#No
  Scenario: Return Incorrectly Received Funds - AttachmentsOnly#Close#No
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    Then The element "#additionalComment" should have the text "Test comments"


  @ROF#DualApprove
  Scenario: Return Incorrectly Received Funds - Dual approval Service Request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#PendingApproval" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId       |
      | status        | PENDING_APPROVAL |
      | requestStatus | PENDING_APPROVAL |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ROF request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
  #  Then The application should display the "Approve model important Info Content" for "Service Request"
  #    | importantInfoContent1 | understand that a request to return funds should not be initiated for Australian Taxation Office (ATO) or Reserve of Bank of Australia (RBA) payments. If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment; and |
  #    | importantInfoContent2 | accept any Fees and/or Charges that may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ representative.                                                                                               |
    Then The application should display the "approveBtn" button
    Then The application should display the "cancelBtn" button
    When The user click on the "cancelBtn" button
    Then The application does not show "approveDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ROF request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    When The user click on the "adk-checkbox" button
    When The user click on the "approveBtn" button
    Then The application should display the "SingleApprove" toast notification
    Then The application should display the "status as Pending Approval" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    When The user click on the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    When The user click on the "Approve" button
    Then The application should display the "following below text on Dual approver model window" for "Service Request"
      | approveDialog-title     | Approve Service Request                       |
      | cancelBtn               | Cancel                                        |
      | approveBtn              | Approve                                       |
      | approveDialog-content2  | Step 1: Generate your authorisation code      |
      | approveDialog-content3  | Step 2: Enter your authorisation code         |
      | approveDialog-content4  | Turn on the token by holding down             |
      | approveDialog-content5  | and pressing                                  |
      | approveDialog-content7  | Press                                         |
      | approveDialog-content8  | and enter the following code into your token: |
      | approveDialog-content9  | Press                                         |
      | approveDialog-content10 | to display your authorisation code            |
      | helpLink                | Click here for Security Device Help           |
    Then The application should display the "Approve model important Info Content" for "Service Request" text
      | approveDialog-content6 | Enter your 6 digit PIN       |
      | approveDialog-content1 | Token authorisation required |
    #| importantInfoContent1  | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
    # | importantInfoContent2  | By approving this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge ANZ will send a request to the recipient's bank to have the funds returned to this account. It is not guaranteed that the funds will be returned as the recipient has the right to refuse the recall request.\nA request to recall a payment should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments. If the payment has been made to either of these government bodies, please contact the ATO or RBA directly to recall the payment. |
    Then The user enter "8754328" into the "authoriseCode" text field
    When The user click on the "cancelBtn" button
    Then The application does not show "approveDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    When The user click on the "Approve" button
    Then The user enter "8754328" into the "authoriseCode" text field
    Then The user click on the "approveBtn" button
    #Then The user waiting to load "or refresh the screen"
    Then The application should display the "Approve" toast notification
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Approved                |
      | Summary_Info_YourReference_value | testROF#PendingApproval |



  @ROF#Reject
  Scenario: Return Incorrectly Received Funds - Reject Service Request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#PendingApproval" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId       |
      | status        | PENDING_APPROVAL |
      | requestStatus | PENDING_APPROVAL |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title  | Reject Service Request |
      | cancelBtn           | Cancel                 |
      | rejectBtn           | Reject                 |
      | rejectComment-label | Reason For Rejection   |
      | rejectComment       |                        |
    # Then The application should display the "Reject model important Info Content" for "Service Request" text
    #| reject-importantInfoHeading | Important Information:                                                                                                                                                              |
    #| rejectDialog-infoText       | Please be advised that no further actions can be taken on a request after it has been rejected. If any additional actions are required, a new service request will need to be created.|
    Then The application should display the "rejectBtn" button
    Then The application should display the "cancelBtn" button
    When The user click on the "cancelBtn" button
    Then The application does not show "rejectDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title | Reject Service Request |
      | cancelBtn          | Cancel                 |
      | rejectBtn          | Reject                 |
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    When The user click on the "cancelBtn" button
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    When The user click on the "Reject" button
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    And The user click on the "rejectBtn" button
    Then The application should display the "Reject" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Rejected                |
      | Summary_Info_YourReference_value | testROF#PendingApproval |

  @InstantCancel
  Scenario: Return Incorrectly Received Funds - Instant Cancel Service Request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#PendingApproval" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | returnOffund_title | Return Incorrectly Received Funds (AU)                                                                    |
      | returnOffund_desc  | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
    Then The user update the service request status with following details
      | requestId     | responseId       |
      | status        | PENDING_APPROVAL |
      | requestStatus | PENDING_APPROVAL |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header              | Summary Information     |
      | Summary_Info_RequestID_txt       | Request ID              |
      | Summary_Info_Requestedon_txt     | Requested on            |
      | Summary_Info_Requestedby_txt     | Requested by            |
      | summary_status                   | Pending Approval        |
      | Summary_Info_YourReference_value | testROF#PendingApproval |
    Then The application should display the "Cancel Request" button
    When The user Clicks the "Cancel Request" button
    Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
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



  @CancelRequest
  Scenario: Return Incorrectly Received Funds - Cancel Service Request
    Given I am an authorised user with permission to create a "Return Incorrectly Received Funds" service request
    When The user navigate to the "Return Incorrectly Received Funds" service request screen
    When The user Clicks the "confirmButton" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testROF#PendingApproval" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "ROF on review page"
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
    When The user click on the "view_request_link" link
    Then The user update the service request status with following details
      | requestId     | responseId  |
      | status        | IN_PROGRESS |
      | requestStatus | IN_PROGRESS |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Return Incorrectly Received Funds" and selects it
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | In Progress         |
    Then The application should display the "Cancel Request" button
    When The user Clicks the "Cancel Request" button
    Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
      | cancelDialog-title | Cancel Service Request                                                                        |
      | importantInfoText  | Your request will be reviewed by ANZ before the cancellation can be confirmed.                |
      | reason-label       | Cancel Reason                                                                                 |
      | notes-label        | Please provide cancellation details                                                           |
      | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The application should display the "disclaimer Message" for "Add User service request" text
      | disclaimerMessage | I acknowledge that any Fees and/or Charges already charged for this service request may not be reversed. |
    Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
      | reasonoption1 |                              |
      | reasonoption2 | Duplicate Request            |
      | reasonoption3 | Request No Longer Required   |
      | reasonoption4 | Request Resolved             |
      | reasonoption5 | Partial Request Cancellation |
    Then The application should display the "SubmitBtn" button
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "following Cancel Request type" for "SR under cancel model window"
      | reason-error          | Cancellation Reason is mandatory                      |
      | notes-error           | Cancellation details are mandatory                    |
      | importantErrorMessage | Please read and acknowledge by selecting the checkbox |
    When The user Clicks the "cancel" button
    Then The application does not show "cancelDialog" dialog
    When The user Clicks the "Cancel Request" button
    When The user select the "Duplicate Request" from "cancelReasonType" drop down
    Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
    When The user click on the "legalDisclaimerTC" checkbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "The request has been cancelled" toast notification
    Then The user waiting to load "or refresh the screen"
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



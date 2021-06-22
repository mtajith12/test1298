@ui-mock @api-mock @ManageDirectDebits @Regression @webform
Feature: Investigate Direct Debit Transaction
  User should able to initiate new Investigate direct debits from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @ddr1 @ui-mock
  Scenario: Investigate Direct Debit Transaction - 'Your Reference' value in Enter,review & view page
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Unauthorised transaction" from "RequestTypeReasonCode" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR your_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                       |
      #| requestSubTypeCode     | Dispute direct debit transaction                                                                   |
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR yourreference     |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information      |
      | Summary_Info_RequestID_txt       | Request ID               |
      | Summary_Info_Requestedon_txt     | Requested on             |
      | Summary_Info_Requestedby_txt     | Requested by             |
      | Summary_Info_RequestStatus_txt   | Your Reference           |
      | Summary_Info_YourReference_txt   | Request Status           |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry          |
      | Summary_Info_DisputeReason_txt   | Dispute Reason           |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
      | Summary_Info_DisputeReason_value | Unauthorised transaction |
      | Summary_Info_YourReference_value | testDDR yourreference    |

  @ui-mock-ddr5
  Scenario: Manage Direct Debits - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
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
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
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
    # Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    When The user click on the "importantInformationCheckBox" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "anz@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then "Manual email" modal window must close



  @ui-ddr-errormsg
  Scenario: Investigate Direct Debit Transaction - UI error messages
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user Clicks the "accountSearch" button
    When The user types in "BO-AWAITING-FULFILMENT" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DDR on after selectd account in enter details page"
      | AccountName | BO-AWAITING-FULFILMENT |
      | AccountNo   | 010201 - 123456201  |
    Then The application should display the "Search for Transaction component" for "Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    * For Acceptance Criteria "Amount should be greater than 0 and less than 99,999,999,999.99"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
      | amount   | 0             |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
      | amount   | 100000000000  |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
        * For Acceptance Criteria "Search -No records found"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |
    * For Acceptance Criteria "Reset before search"
    Then The user enters value in the search criteria fields
      | amount   | 100           |
      | PostDate | March 9, 2021 |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Manage Direct Debits Service Request"
      | fromAmount |  |
      | fromDate   |  |
    * For Acceptance Criteria "Reset After search"
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2021 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Manage Direct Debits Service Request"
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
* For Acceptance Criteria "Search Transaction with Amount range and Date range UI verification"
     When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2021/March 9, 2021 |
      | amount   | 1/1000000                   |
      Then The count of "Transaction search result" should be "8"
  * For Acceptance Criteria "Reset After selected the perticular transaction"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Manage Direct Debits Service Request"
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


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Cancel direct debit' DDR request
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "importantInformationCheckBox" button
    Then The application should display the "Important Information" for "DDR Service Request"
      | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to cancel Direct Debit authorisations from your nominated account. The other party will act within their legal rights outlined in the Direct Debit agreement when considering this request. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
      | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                                                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry     |
    #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Request direct debit authorisation' DDR service request
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Request direct debit authorisation" from "Select Direct Debit Request Type" drop down
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                                     |
      #| requestSubTypeCode     | Request direct debit authorisation                                                                                               |
      | requestTypeDescription | Request a copy of the Direct Debit Authorisation Agreement associated with Direct Debit transactions on your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                       |
    #   | Important_Information_text1 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry     |
    #| Summary_Info_TypeofEnquiry_value | Request direct debit authorisation |
 #   Then The application should display the "Important Information Section" for "DDR service request in view mode"
 #  | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |

  @DDR1
  Scenario: Investigate Direct Debit Transaction - Create 'Dispute direct debit transaction' DDR service request
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect debit - double debit" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect debit - double debit                                                                     |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on Review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    #Then The application should display the "Important Information" for "DDR Service Request"
      # | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      # | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
      # | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information            |
      | Summary_Info_RequestID_txt       | Request ID                     |
      | Summary_Info_Requestedon_txt     | Requested on                   |
      | Summary_Info_Requestedby_txt     | Requested by                   |
      | Summary_Info_RequestStatus_txt   | Your Reference                 |
      | Summary_Info_YourReference_txt   | Request Status                 |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                 |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
      | Summary_Info_DisputeReason_value | Incorrect debit - double debit |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Block direct debit user ID' DDR service request
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Block direct debit user id" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Block a Direct Debit User ID from debiting your account for a specific transaction amount. This is effective for 15 months from the date of request. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR blockdirectdebituserid" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                                                         |
      #| requestSubTypeCode     | Block direct debit user id                                                                                                                           |
      | requestTypeDescription | Block a Direct Debit User ID from debiting your account for a specific transaction amount. This is effective for 15 months from the date of request. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional)      |
      | your_reference        | testDDR blockdirectdebituserid |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                       |
    #   | Important_Information_text1 | I acknowledge that blocking a Direct Debit User ID for the specified transaction amount is only effective for 15 months from the date of request and does not cancel any Direct Debit arrangements with the other party. The other party may continue to attempt to draw funds from the nominated account.                  |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry     |
    #| Summary_Info_TypeofEnquiry_value | Block direct debit user id |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Request direct debit authorisation' SR with Reason Code Incorrect amount - overcharged
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect amount - overcharged" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect amount - overcharged                                                                     |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information            |
      | Summary_Info_RequestID_txt       | Request ID                     |
      | Summary_Info_Requestedon_txt     | Requested on                   |
      | Summary_Info_Requestedby_txt     | Requested by                   |
      | Summary_Info_RequestStatus_txt   | Your Reference                 |
      | Summary_Info_YourReference_txt   | Request Status                 |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                 |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
      | Summary_Info_DisputeReason_value | Incorrect amount - overcharged |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |

  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Request direct debit authorisation' SR with Reason Code Incorrect amount - overcharged
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect debit - amount paid off" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect debit - amount paid off                                                                  |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                   |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                    |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction  |
      | Summary_Info_DisputeReason_value | Incorrect debit - amount paid off |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Dispute direct debit transaction' SR with Reason Code Incorrect debit - authority cancelled
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect debit - authority cancelled" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect debit - authority cancelled                                                              |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information                   |
      | Summary_Info_RequestID_txt       | Request ID                            |
      | Summary_Info_Requestedon_txt     | Requested on                          |
      | Summary_Info_Requestedby_txt     | Requested by                          |
      | Summary_Info_RequestStatus_txt   | Your Reference                        |
      | Summary_Info_YourReference_txt   | Request Status                        |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                       |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                        |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction      |
      | Summary_Info_DisputeReason_value | Incorrect debit - authority cancelled |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |



  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Dispute direct debit transaction' SR with Reason Code 'Incorrect debit - multiple debits for once off payment authority'
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect debit - multiple debits for once off payment authority" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect debit - multiple debits for once off payment authority                                   |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information                                              |
      | Summary_Info_RequestID_txt       | Request ID                                                       |
      | Summary_Info_Requestedon_txt     | Requested on                                                     |
      | Summary_Info_Requestedby_txt     | Requested by                                                     |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                   |
      | Summary_Info_YourReference_txt   | Request Status                                                   |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                                                  |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                                                   |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction                                 |
      | Summary_Info_DisputeReason_value | Incorrect debit - multiple debits for once off payment authority |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |



  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Dispute direct debit transaction' SR with Reason Code 'Incorrect account - account details updated'
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Incorrect account - account details updated" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Incorrect account - account details updated                                                        |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information                         |
      | Summary_Info_RequestID_txt       | Request ID                                  |
      | Summary_Info_Requestedon_txt     | Requested on                                |
      | Summary_Info_Requestedby_txt     | Requested by                                |
      | Summary_Info_RequestStatus_txt   | Your Reference                              |
      | Summary_Info_YourReference_txt   | Request Status                              |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry                             |
      | Summary_Info_DisputeReason_txt   | Dispute Reason                              |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction            |
      | Summary_Info_DisputeReason_value | Incorrect account - account details updated |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @DDR
  Scenario: Investigate Direct Debit Transaction - Create 'Dispute direct debit transaction' SR with Reason Code 'Unauthorised transaction'
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Unauthorised transaction" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Unauthorised transaction                                                                           |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "DDR Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
    #   | Important_Information_text1 | I acknowledge that by submitting this request ANZ will send a request to the nominated other party to dispute the Direct Debit transactions from your nominated account and return the funds. The return of funds is not guaranteed as the other party will act within their legal rights outlined in the Direct Debit agreement when reviewing this dispute. Direct Debit requests from this Direct Debit User ID will continue to be processed during this time unless a request has been raised to block the Direct Debit User ID. |
    #   | Important_Information_text2 | By submitting this request I accept Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative. If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative.                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information      |
      | Summary_Info_RequestID_txt       | Request ID               |
      | Summary_Info_Requestedon_txt     | Requested on             |
      | Summary_Info_Requestedby_txt     | Requested by             |
      | Summary_Info_RequestStatus_txt   | Your Reference           |
      | Summary_Info_YourReference_txt   | Request Status           |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry          |
      | Summary_Info_DisputeReason_txt   | Dispute Reason           |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
      | Summary_Info_DisputeReason_value | Unauthorised transaction |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |


  @Validations
  Scenario: Investigate Direct Debit Transaction - Transaction Validations
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |
    * For Acceptance Criteria "Without transaction selected"
     Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |
   * For Acceptance Criteria "Without transaction selected"
     When The user Clicks the "Reset" button
        When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |


  @DDR-WithoutYourReference
  Scenario: Investigate Direct Debit Transaction - Your Reference value Not display if user not entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "DDR on Review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen



  @DDR-WithoutImportantInformation
  Scenario: Investigate Direct Debit Transaction - Without Important Information
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "DDR on Review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |


  @DDR-DDT-8
  Scenario: Manage Direct Debits - Create DDR request and search based on requestId
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Unauthorised transaction" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Auxdom              |
      | transactionGridReferenceName      | Reference Name      |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel     | Request Type                                                                                       |
      #| requestSubTypeCode         | Dispute direct debit transaction                                                                   |
      | requestTypeDescription     | Dispute a Direct Debit transaction on your nominated account and request the funds to be returned. |
      | requestTypeReasonCodelabel | Dispute Reason                                                                                     |
      | RequestTypeReasonCode      | Unauthorised transaction                                                                           |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Transaction details" for "DDR on Review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The application should display the "Your Reference details" for "DDR on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testDDR authorisation     |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Manage Direct Debits" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Manage Direct Debits" search req type "Fix Cheque Encoding Error" and selects it
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header              | Summary Information      |
      | Summary_Info_RequestID_txt       | Request ID               |
      | Summary_Info_Requestedon_txt     | Requested on             |
      | Summary_Info_Requestedby_txt     | Requested by             |
      | Summary_Info_RequestStatus_txt   | Your Reference           |
      | Summary_Info_YourReference_txt   | Request Status           |
      | Summary_Info_TypeofEnquiry_txt   | Type of Enquiry          |
      | Summary_Info_DisputeReason_txt   | Dispute Reason           |
      #| Summary_Info_TypeofEnquiry_value | Dispute direct debit transaction |
      | Summary_Info_DisputeReason_value | Unauthorised transaction |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on Review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |



  @DDR-Reopen
  Scenario: Investigate Direct Debit Transaction - Reopen modal/pop-up 'Manage Direct Debits' request
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Manage Direct Debits Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on review page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title       | Investigate Direct Debit Transaction (AU)              |
      | DDR_Description | Investigate direct debits from your nominated accounts |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "DDR service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry     |
    #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
    Then The application should display the "Important Information Section" for "DDR service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "DDR service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Transaction details" for "DDR on view page"
      | TrnstnGridHedr_Date               | Date                    |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Auxdom                  |
      | TrnstnGridHedr_ReferenceName      | Reference Name          |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_RefName             |                         |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "updated status" for "DDR service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen" button
    Then The application should display the "Reopen model window" for "Direct Debits request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
    Then The application should display the "SubmitBtn" button
    Then The application should display the "following reason type" for "DDR under Reopen model window"
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
    When The user Clicks the "Ok" button
    Then The user waiting to load "SR details"
    Then The application shows "Cash Management Service Requests" screen


  @DDR-Reopen
  Scenario: Investigate Direct Debit Transaction - Reopen modal/pop-up validations
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request details" for "DDR on review page"
      | RequestTypeHeaderLabel            | Request Type                                                                                                      |
      #| requestSubTypeCode                | Cancel direct debit                                                                                               |
      | requestTypeDescription            | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
      | AccountHeaderLabel                | Account Details                                                                                                   |
      | AccountName                       | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency            | AUD                                                                                                               |
      | AccountDescription                | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | TrnstnGridHedr_Date               | Date                                                                                                              |
      | TrnstnGridHedr_Amount             | Amount                                                                                                            |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                      |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                         |
      | TrnstnGridHedr_Auxdom             | Auxdom                                                                                                            |
      | TrnstnGridHedr_ReferenceName      | Reference Name                                                                                                    |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                               |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                         |
      | searchResults_Date                | 15/04/2018                                                                                                        |
      | searchResults_Amount              | 25,000.00                                                                                                         |
      | searchResults_DebitCreditType     | Cr                                                                                                                |
      | searchResults_Narrative           | LATE PAYMENT FEE                                                                                                  |
      | searchResults_Auxdom              | 0000009077                                                                                                        |
      | searchResults_RefName             |                                                                                                                   |
      | searchResults_LodgementReference  |                                                                                                                   |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8                                                                                           |
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "TransactionHeaderLabel" for "DDR Service Request" text
      | TransactionHeaderLabel | Transaction |
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                         | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                   | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header               | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt        | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt      | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt      | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt    | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt    | Request Status                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt    | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value  | Cancel direct debit                                                                                               |
      | AccountHeaderLabel                | Account Details                                                                                                   |
      | AccountName                       | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency            | AUD                                                                                                               |
      | AccountDescription                | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | Important_Information             | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | TrnstnGridHedr_Date               | Date                                                                                                              |
      | TrnstnGridHedr_Amount             | Amount                                                                                                            |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                      |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                         |
      | TrnstnGridHedr_Auxdom             | Auxdom                                                                                                            |
      | TrnstnGridHedr_ReferenceName      | Reference Name                                                                                                    |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                               |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                         |
      | searchResults_Date                | 15/04/2018                                                                                                        |
      | searchResults_Amount              | 25,000.00                                                                                                         |
      | searchResults_DebitCreditType     | Cr                                                                                                                |
      | searchResults_Narrative           | LATE PAYMENT FEE                                                                                                  |
      | searchResults_Auxdom              | 0000009077                                                                                                        |
      | searchResults_RefName             |                                                                                                                   |
      | searchResults_LodgementReference  |                                                                                                                   |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8                                                                                           |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "updated status" for "DDR service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen" button
    Then The application should display the "Reopen model window" for "Direct Debits request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
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


  @DDR-Reopen
  Scenario: Investigate Direct Debit Transaction - Reopen submit
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
   When The user select the "Dispute direct debit transaction" from "Select Direct Debit Request Type" drop down
    When The user select the "Unauthorised transaction" from "RequestTypeReasonCode" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
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
    Then The user waiting to load "SR details"
    Then The application shows "Cash Management Service Requests" screen



  @DDR-Reopen5
  Scenario: Investigate Direct Debit Transaction - Reopen submit and View
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
   When The user select the "Block direct debit user id" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
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
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |


  @DDR-Comments
  Scenario: Investigate Direct Debit Transaction - Submit comments only
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
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
    When The user entered "Providing the comments only" in "Additional Comment" textbox
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents section" for "DDR service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32         |
      | Added by | User Lname                  |
      | Comments | Providing the comments only |


  @DDR-AttachmentsOnly
  Scenario: Investigate Direct Debit Transaction - Submit Attachments only
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "DDR Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
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
      | Added by    | User Lname                 |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |



  @DDR-Comments&Attachments
  Scenario: Investigate Direct Debit Transaction - Submit comments and Attachments
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
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
    Then The application should display the "transaction search results grid" for "Manage Direct Debits Service Request"
      | transactionGridDate               | Date                    |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Auxdom                  |
      | transactionGridTraceline          | Traceline               |
      | transactionGridReferenceName      | Reference Name          |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid5                  |                         |
      | transactionGrid6                  |                         |
      | transactionGridNarrativeValue     | 0000009077              |
      | transactionGrid8                  | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title                      | Investigate Direct Debit Transaction (AU)                                                                         |
      | DDR_Description                | Investigate direct debits from your nominated accounts                                                            |
      | Summary_Info_header            | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt     | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt   | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt   | Requested by                                                                                                      |
      | Summary_Info_YourReference_txt | Request Status                                                                                                    |
      | Summary_Info_RequestStatus_txt | Your Reference                                                                                                    |
      | Summary_Info_TypeofEnquiry_txt | Type of Enquiry                                                                                                   |
      #| Summary_Info_TypeofEnquiry_value | Cancel direct debit |
      | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service.         |
      | AccountHeaderLabel             | Account Details                                                                                                   |
      | AccountName                    | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency         | AUD                                                                                                               |
      | AccountDescription             | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
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
    When The user entered "Comments with attachments" in "Additional Comment" textbox
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
      | Added by    | User Lname                 |
      | Comments    | Comments with attachments  |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |


  @DDR-Comments&Attachments#Close#Yes
  Scenario: Investigate Direct Debit Transaction - Comments&Attachments#Close#Yes
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                                                      |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts.                                       |
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display "New comment / attachment" sub-section
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

  @DDR-Comments&Attachments#Close#No
  Scenario: Investigate Direct Debit Transaction - Close after comments and Attachments entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display "New comment / attachment" sub-section
    When The user entered "Test comments" in "Additional Comment" textbox
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


  @DDR-CommentsOnly#Close#Yes
  Scenario: Investigate Direct Debit Transaction - Close after comments and Attachments entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display "New comment / attachment" sub-section
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "Yes" button
    Then The application does not show "Add Comment" element
    Then The application shows "Cash Management Service Requests" screen

  @DDR-CommentsOnly#Close#No
  Scenario: Investigate Direct Debit Transaction - Close after comments and Attachments entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display "New comment / attachment" sub-section
    When The user entered "Test comments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    Then The element "#additionalComment" should have the text "Test comments"


  @DDR-AttachmentsOnly#Close#Yes
  Scenario: Investigate Direct Debit Transaction - Close after comments and Attachments entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    Then The application should display the "Account details" for "DDR on review page"
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
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user Clicks the "Add new comment / attachment" button
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

  @DDR-AttachmentsOnly#Close#No
  Scenario: Investigate Direct Debit Transaction - Close after comments and Attachments entered
    Given I am an authorised user with permission to create a "Manage Direct Debits" service request
    When The user navigate to the "Investigate Direct Debit Transaction" service request screen
    When The user select the "Cancel direct debit" from "Select Direct Debit Request Type" drop down
    Then The application should display the "Request Type Description" for "DDR Service Request"
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
      | SearchforTransactionLabel | Search for Transaction |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testDDR authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Request Type details" for "DDR on review page"
      | RequestTypeHeaderLabel | Request Type                                                                |
      #| requestSubTypeCode     | Cancel direct debit                                                         |
      | requestTypeDescription | Request to cancel Direct Debit authorisations from your nominated accounts. |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "DDR service request in view mode"
      | DDR_Title             | Investigate Direct Debit Transaction (AU)                                                                 |
      | DDR_Description       | Investigate direct debits from your nominated accounts                                                    |
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Direct Debits" and selects it
    Then The application should display the "request status as More Information Required" for "DDR SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user Clicks the "Add new comment / attachment" button
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



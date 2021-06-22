@ui-mock @api-mock @GE @Regression @webform
Feature: General Enquiry
  User should able to initiate new Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre.



  @GE2
  Scenario: General Enquiry - Header and Progress Bar 'Your Reference' value in Enter,review & view page
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then  The application should display the "Select Enquiry Type" for "General Enquiry Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
    Then The application should display the "selectEnquiryTypeHeader" for "GE Service Request" text
      | selectEnquiryTypeHeader | Select Enquiry Type |
    Then  The application should display the "Enquiry details" for "General Enquiry Service Request"
      | enquiryTypeL       | Enquiry Type |
      | optionAccountL     | Account      |
      | optionTransactionL | Transaction  |
    Then The select service type marked as complete with tick symbol
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "selectEnquiryTypeHeader" for "GE Service Request" text
      | selectEnquiryTypeHeader | Select Enquiry Type |
    Then  The application should display the "Enquiry details" for "General Enquiry Service Request"
      | enquiryTypeL       | Enquiry Type |
      | optionAccountL     | Account      |
      | optionTransactionL | Transaction  |
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    Then The application should display the "Your Reference section" for "General Enquiry request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "General Enquiry Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
    Then The application should display the "selectEnquiryTypeHeader" for "GE Service Request" text
      | selectEnquiryTypeHeader | Enquiry Type |
    Then The application should display the "Account details" for "GE on review page"
      | enquiryTypeL           | Enquiry Type                                                                                                      |
      | AccountL               | Account                                                                                                           |
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeHeader      | Enquiry Type                                                                                                      |
      | contactNumber          | 9876543287                                                                                                        |
      | enquiryTypeContainer   | Enquiry Type                                                                                                      |
      | enquiryDetails-field   | Please provide the details of your enquiry below                                                                  |
      | Your_Reference_header  | Your Reference (optional)                                                                                         |
      | your_reference         | test your reference                                                                                               |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "General Enquiry request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "General Enquiry request in view mode"
      | Summary_Info_header              | Summary Information |
      | Summary_Info_RequestID_txt       | Request ID          |
      | Summary_Info_Requestedon_txt     | Requested on        |
      | Summary_Info_Requestedby_txt     | Requested by        |
      | Summary_Info_RequestStatus_txt   | Your Reference      |
      | Summary_Info_YourReference_txt   | Request Status      |
      | Summary_Info_YourReference_value | test your reference |

  @GE3
  Scenario: General Enquiry - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The user click on the "account" radioButton
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
    When The user navigate to the "General Enquiry" service request screen
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
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
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "anz@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then "Manual email" modal window must close





  @GE7
  Scenario: General Enquiry - Search Transaction with Amount  < 0
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 0             |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria "General Enquiry - Search Transaction with Amount  > 99,999,999,999.99"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 100000000000  |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |

    When The user Clicks the "Reset" button
    * For Acceptance Criteria "General Enquiry - Search Transaction with Amount range and Date range UI verification"
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2020/March 9, 2020 |
      | amount   | 1/1000000                   |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    * For Acceptance Criteria "General Enquiry - Search -No records found"
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |
    When The user Clicks the "Reset" button
    * For Acceptance Criteria "General Enquiry - Reset before search"
    Then The user enters value in the search criteria fields
      | amount   | 100           |
      | PostDate | March 9, 2020 |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "General Enquiry request"
      | fromAmount |  |
      | fromDate   |  |
    * For Acceptance Criteria "General Enquiry - Reset After search"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    Then The application should display the "Reseted UI for search criteria" for "General Enquiry request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               | Post Date           |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Aux Dom             |
      | transactionGridTraceline          | Traceline           |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
      | transactionGrid1                  |                     |
      | transactionGrid2                  |                     |
      | transactionGrid3                  |                     |
      | transactionGrid4                  |                     |
      | transactionGrid9                  |                     |
      | transactionGrid5                  |                     |
      | transactionGrid6                  |                     |
    * For Acceptance Criteria "General Enquiry - Reset After selected the perticular transaction"
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    Then The application should display the "Reseted UI for search criteria" for "General Enquiry request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate               | Post Date           |
      | transactionGridAmount             | Amount              |
      | transactionGridDebit/Credit       | Debit/Credit        |
      | transactionGridNarrative          | Narrative           |
      | transactionGridAuxdom             | Aux Dom             |
      | transactionGridTraceline          | Traceline           |
      | transactionGridLodgementReference | Lodgement Reference |
      | transactionGridTraceline          | Traceline           |
      | transactionGrid1                  |                     |
      | transactionGrid2                  |                     |
      | transactionGrid3                  |                     |
      | transactionGrid4                  |                     |
      | transactionGrid9                  |                     |
      | transactionGrid5                  |                     |
      | transactionGrid6                  |                     |

  @GE15
  Scenario: General Enquiry - Create General Enquiry request by selecting account
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The select service type marked as complete with tick symbol
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Next" button
    Then The application should display error message under "enquiryDetails-error-msg" section
      | error_message | Enquiry details are mandatory |
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |

  @GE15
  Scenario: General Enquiry - Create General Enquiry request by selecting account
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The select service type marked as complete with tick symbol
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    Then The application should display the "Your Reference section" for "General Enquiry request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "GE on review page"
      | enquiryTypeL           | Enquiry Type                                                                                                      |
      | AccountL               | Account                                                                                                           |
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeHeader      | Enquiry Type                                                                                                      |
      | contactNumber          | 9876543287                                                                                                        |
      | enquiryTypeContainer   | Enquiry Type                                                                                                      |
      | enquiryDetails-field   | Please provide the details of your enquiry below                                                                  |
      | Your_Reference_header  | Your Reference (optional)                                                                                         |
      | your_reference         | test your reference                                                                                               |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "General Enquiry request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "General Enquiry request in view mode"
      | Summary_Info_header              | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt       | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt     | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt     | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt   | Request Status                                                                                                    |
      | Summary_Info_YourReference_value | test your reference                                                                                               |
      | enquiryTypeHeader                | Enquiry Type                                                                                                      |
      | enquiryTypeL                     | Enquiry Type                                                                                                      |
      | AccountL                         | Account                                                                                                           |
      | AccountName                      | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency           | AUD                                                                                                               |
      | AccountDescription               | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeContainer             | Enquiry Type                                                                                                      |
      | enquiryDetails-field             | Please provide the details of your enquiry below                                                                  |
      | enquiryDetailsFieldValue         | enquiry Details text                                                                                              |
      | contactNumber                    | 9876543287                                                                                                        |



  @GE16
  Scenario: General Enquiry - Create General Enquiry request by selecting Transaction
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL | General Enquiry (AU) |
    #  | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The user click on the "transaction" radioButton
    Then The application should display the "SearchforTransactionLabel" for "General Enquiry request"
      | enquiryTypeDescription | Note: only raise a general enquiry on a transaction if your enquiry is not covered by one of our Payment & Transaction service requests. |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Search for Transaction component" for "General Enquiry request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "General Enquiry request on review page"
      | enquiryTypeHeader        | Enquiry Type                                                                                                      |
      | enquiryTypeL             | Enquiry Type                                                                                                      |
      | AccountL                 | Transaction                                                                                                       |
      | AccountName              | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency   | AUD                                                                                                               |
      | AccountDescription       | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeContainer     | Enquiry Type                                                                                                      |
      | enquiryDetails-field     | Please provide the details of your enquiry below                                                                  |
      | enquiryDetailsFieldValue | enquiry Details text                                                                                              |
      | contactNumber            | 9876543287                                                                                                        |
      | Your_Reference_header    | Your Reference (optional)                                                                                         |
      | your_reference           | test your reference                                                                                               |
      | TransactionHeader        | Transaction                                                                                                       |
    Then The application should display the "Transaction details" for "General Enquiry request on review page"
      | TrnstnGridHedr_Date               | Post Date               |
      | TrnstnGridHedr_Amount             | Amount                  |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit            |
      | TrnstnGridHedr_Narrative          | Narrative               |
      | TrnstnGridHedr_Auxdom             | Aux Dom                 |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference     |
      | TrnstnGridHedr_Traceline          | Traceline               |
      | searchResults_Date                | 15/04/2018              |
      | searchResults_Amount              | 25,000.00               |
      | searchResults_DebitCreditType     | Cr                      |
      | searchResults_Narrative           | LATE PAYMENT FEE        |
      | searchResults_Auxdom              | 0000009077              |
      | searchResults_LodgementReference  |                         |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8 |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "General Enquiry request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "General Enquiry request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "SearchforTransactionLabel" for "General Enquiry request"
      | enquiryTypeDescription | Note: only raise a general enquiry on a transaction if your enquiry is not covered by one of our Payment & Transaction service requests. |
    Then The application should display the "Account details" for "General Enquiry request on review page"
      | enquiryTypeHeader                 | Enquiry Type                                                                                                      |
      | enquiryTypeL                      | Enquiry Type                                                                                                      |
      | AccountL                          | Transaction                                                                                                       |
      | AccountName                       | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency            | AUD                                                                                                               |
      | AccountDescription                | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeContainer              | Enquiry Type                                                                                                      |
      | enquiryTypeHeader                 | Enquiry Type                                                                                                      |
      | enquiryDetails-field              | Please provide the details of your enquiry below                                                                  |
      | enquiryDetailsFieldValue          | enquiry Details text                                                                                              |
      | contactNumber                     | 9876543287                                                                                                        |
      | TransactionHeader                 | Transaction                                                                                                       |
      | TrnstnGridHedr_Date               | Post Date                                                                                                         |
      | TrnstnGridHedr_Amount             | Amount                                                                                                            |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                      |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                         |
      | TrnstnGridHedr_Auxdom             | Aux Dom                                                                                                           |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                               |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                         |
      | searchResults_Date                | 15/04/2018                                                                                                        |
      | searchResults_Amount              | 25,000.00                                                                                                         |
      | searchResults_DebitCreditType     | Cr                                                                                                                |
      | searchResults_Narrative           | LATE PAYMENT FEE                                                                                                  |
      | searchResults_Auxdom              | 0000009077                                                                                                        |
      | searchResults_LodgementReference  |                                                                                                                   |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8                                                                                           |



  @GE17
  Scenario: General Enquiry - Search without Date
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |

  @GE18
  Scenario: General Enquiry - Transaction - Without transaction selected
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
      | transactionGridLodgementReference | Lodgement Reference     |
      | transactionGridTraceline          | Traceline               |
      | transactionGrid1                  | 15/04/2018              |
      | transactionGrid2                  | 25,000.00               |
      | transactionGrid3                  | Cr                      |
      | transactionGrid4                  | LATE PAYMENT FEE        |
      | transactionGrid9                  | 0000009077              |
      | transactionGrid5                  |                         |
      | transactionGrid6                  | CMO010906290133A000Z1E8 |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |

  @GE19
  Scenario: General Enquiry - Transaction -Without transaction selected
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Next" button
    And The application should display error message under "transactionSelectedErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |


  @GE20
  Scenario: General Enquiry - Your Reference value Not display if user not entered
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application shows the "cancel" button
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "GE on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "General Enquiry request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen

  @GE21
  Scenario: General Enquiry - Transaction-Enquiry Details UI validations
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "transaction search results grid" for "General Enquiry request"
      | transactionGridDate               | Post Date               |
      | transactionGridAmount             | Amount                  |
      | transactionGridDebit/Credit       | Debit/Credit            |
      | transactionGridNarrative          | Narrative               |
      | transactionGridAuxdom             | Aux Dom                 |
      | transactionGridTraceline          | Traceline               |
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
    Then The application should display error message under "enquiryDetails-error-msg" section
      | error_message | Enquiry details are mandatory |
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |

  @GE22
  Scenario: General Enquiry - Account-Enquiry details UI validation
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The user click on the "account" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Next" button
    Then The application should display error message under "enquiryDetails-error-msg" section
      | error_message | Enquiry details are mandatory |
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "contactNumber-error-msg" section
      | error_message | Contact Number is mandatory |


  @GE23
  Scenario: General Enquiry - Transaction - Create General Enquiry search by request type
    Given I am an authorised user with permission to create a "General Enquiry" service request
    When The user navigate to the "General Enquiry" service request screen
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The user click on the "transaction" radioButton
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "enquiry Details text" into the "enquiryDetails" text field
    Then The user enter "9876543287" into the "contactNumber" text field
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "GE on review page"
      | enquiryTypeL           | Enquiry Type                                                                                                      |
      | AccountL               | Transaction                                                                                                       |
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeHeader      | Enquiry Type                                                                                                      |
      | contactNumber          | 9876543287                                                                                                        |
      | enquiryTypeContainer   | Enquiry Type                                                                                                      |
      | enquiryDetails-field   | Please provide the details of your enquiry below                                                                  |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    Then The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "General Enquiry Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "General Enquiry" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "General Enquiry" search req type "General Enquiry" and selects it
    Then The application should display the "Service Request Header" for "General Enquiry"
      | titleL       | General Enquiry (AU)                                                                                                                                                                                    |
      | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "General Enquiry request in view mode"
      | Summary_Info_header               | Summary Information                                                                                               |
      | Summary_Info_RequestID_txt        | Request ID                                                                                                        |
      | Summary_Info_Requestedon_txt      | Requested on                                                                                                      |
      | Summary_Info_Requestedby_txt      | Requested by                                                                                                      |
      | Summary_Info_RequestStatus_txt    | Your Reference                                                                                                    |
      | Summary_Info_YourReference_txt    | Request Status                                                                                                    |
      | enquiryTypeHeader                 | Enquiry Type                                                                                                      |
      | enquiryTypeL                      | Enquiry Type                                                                                                      |
      | AccountL                          | Transaction                                                                                                       |
      #  | AccountHeaderLabel                | Account Details                                                                                                   |
      | AccountName                       | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency            | AUD                                                                                                               |
      | AccountDescription                | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | enquiryTypeContainer              | Enquiry Type                                                                                                      |
      | enquiryTypeHeader                 | Enquiry Type                                                                                                      |
      | enquiryDetails-field              | Please provide the details of your enquiry below                                                                  |
      | contactNumber                     | 9876543287                                                                                                        |
      | TransactionHeader                 | Transaction                                                                                                       |
      | TrnstnGridHedr_Date               | Post Date                                                                                                         |
      | TrnstnGridHedr_Amount             | Amount                                                                                                            |
      | TrnstnGridHedr_Debit/Credit       | Debit/Credit                                                                                                      |
      | TrnstnGridHedr_Narrative          | Narrative                                                                                                         |
      | TrnstnGridHedr_Auxdom             | Aux Dom                                                                                                           |
      | TrnstnGridHedr_LodgementReference | Lodgement Reference                                                                                               |
      | TrnstnGridHedr_Traceline          | Traceline                                                                                                         |
      | searchResults_Date                | 15/04/2018                                                                                                        |
      | searchResults_Amount              | 25,000.00                                                                                                         |
      | searchResults_DebitCreditType     | Cr                                                                                                                |
      | searchResults_Narrative           | LATE PAYMENT FEE                                                                                                  |
      | searchResults_Auxdom              | 0000009077                                                                                                        |
      | searchResults_LodgementReference  |                                                                                                                   |
      | searchResults_TraceLine           | CMO010906290133A000Z1E8                                                                                           |

# @GE24
# Scenario: General Enquiry - Create General Enquiry request by selecting Enquiry type Troubleshooting
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The application shows the "cancel" button
#   Then The user click on the "trobuleshooting" radioButton
#   Then The application should display following fields "under Select Legal Entity section"
#     | field_name                   |
#     | Legal_Entity_select_dropdown |
#     | Legal_Entity_search_icon     |
#     | LegalEntity-field            |
#   Then The application should display the "SelectLegalEntity" for "General Enquiry request" text
#     | SelectLegalEntityHeader | Select Legal Entity |
#   Then The user select a legal entity from the search legal entity pop up
#    | legalEntity | NSWG |
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   Then The user enter "9876543287" into the "contactNumber" text field
#   Then The user enter "test your reference" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "SR Header,Enquiry details" for "General Enquiry request on review page"
#     | titleL                | General Enquiry (AU)                                                                                  |
#     | descriptionL          | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#     | enquiryTypeL          | Enquiry Type                                                                                     |
#     | AccountL              | Troubleshooting                                                                                  |
#     | legalEntityL          | Legal Entity                                                                                     |
#     | legalEntity    | NSWG                                                                                             |
#     | enquiryTypeHeader     | Enquiry Type                                                                                     |
#     | contactNumber         | 9876543287                                                                                       |
#     | enquiryTypeContainer  | Enquiry Type                                                                                     |
#     | enquiryDetails-field  | Please provide the details of your enquiry below                                                 |
#     | Your_Reference_header | Your Reference (optional)                                                                        |
#     | your_reference        | test your reference                                                                              |
#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The application should display the "Confirmation pop-up" for "General Enquiry request"
#     | request_status             | Submitted                     |
#     | view_request_link          | View Request Details          |
#     | raise_another_request_link | Raise another Service Request |
#   When The user click on the "view_request_link" link
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The application should display the "viewAuditHistory" button
#   Then The application should display the "Close" button
#   Then The application should display the "Summary Information" for "General Enquiry request in view mode"
#     | Summary_Info_header            | Summary Information                              |
#     | Summary_Info_RequestID_txt     | Request ID                                       |
#     | Summary_Info_Requestedon_txt   | Requested on                                     |
#     | Summary_Info_Requestedby_txt   | Requested by                                     |
#     | Summary_Info_RequestStatus_txt | Your Reference                                   |
#     | Summary_Info_YourReference_txt | Request Status                                   |
#     | legalEntityName                   | Legal Entity                                     |
#     | Legal_Entity_Value             | NSWG                                             |
#     | enquiryTypeHeader              | Enquiry Type                                     |
#     | enquiryTypeL                   | Enquiry Type                                     |
#     | AccountL                       | Troubleshooting                                  |
#     | enquiryTypeContainer           | Enquiry Type                                     |
#     | enquiryTypeHeader              | Enquiry Type                                     |
#     | enquiryDetails-field           | Please provide the details of your enquiry below |
#     | enquiryDetails                 |                                                  |
#     | contactNumber                  | 9876543287                                       |

# @GE25
# Scenario: General Enquiry - Create General Enquiry request by selecting Enquiry type Navigational Support
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The application shows the "cancel" button
#   Then The user click on the "NavigationalSupport" radioButton
#   Then The application should display the "SearchforTransactionLabel" for "General Enquiry request"
#     | enquiryTypeDescription | Note: you can also visit our online resources page to view a range of ANZ Transactive - Global user guides created to assist with navigational support. |
#   Then The application should display following fields "under Select Legal Entity section"
#     | field_name                   |
#     | Legal_Entity_select_dropdown |
#     | Legal_Entity_search_icon     |
#     | LegalEntity-field            |
#   Then The application should display the "SelectLegalEntity" for "General Enquiry request" text
#     | SelectLegalEntityHeader | Select Legal Entity |
#   Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   Then The user enter "9876543287" into the "contactNumber" text field
#   Then The user enter "test your reference" into the "your_reference" text field
#   When The user Clicks the "Next" button
#   Then The application should display the "SR Header, Enquiry details" for "General Enquiry SRreiew page"
#     | titleL                | General Enquiry (AU)                                                                                  |
#     | descriptionL          | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#     | enquiryTypeL          | Enquiry Type                                                                                     |
#     | AccountL              | Navigational Support                                                                             |
#     | legalEntityL          | Legal Entity                                                                                     |
#     | legalEntity    | NSWG                                                                                             |
#     | enquiryTypeHeader     | Enquiry Type                                                                                     |
#     | contactNumber         | 9876543287                                                                                       |
#     | enquiryTypeContainer  | Enquiry Type                                                                                     |
#     | enquiryDetails-field  | Please provide the details of your enquiry below                                                 |
#     | Your_Reference_header | Your Reference (optional)                                                                        |
#     | your_reference        | test your reference                                                                              |
#   When The user click on the "Submit" button
#   Then The application shows "Manual email modal" dialog
#   When The user entered "test@anz.com" in "EmailId" textbox
#   When The user click on the "Ok" button
#   Then The application should display the "Confirmation pop-up" for "General Enquiry request"
#     | request_status    | Submitted            |
#     | view_request_link | View Request Details |
#   When The user click on the "view_request_link" link
#   Then The application should display the "SR Header,Enquiry details and Legal_Entity" for "General Enquiry"
#     | titleL                         | General Enquiry (AU)                                                                                  |
#     | descriptionL                   | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#     | Summary_Info_header            | Summary Information                                                                              |
#     | Summary_Info_RequestID_txt     | Request ID                                                                                       |
#     | Summary_Info_Requestedon_txt   | Requested on                                                                                     |
#     | Summary_Info_Requestedby_txt   | Requested by                                                                                     |
#     | Summary_Info_RequestStatus_txt | Your Reference                                                                                   |
#     | Summary_Info_YourReference_txt | Request Status                                                                                   |
#     | legalEntityName                   | Legal Entity                                     |
#     | Legal_Entity_Value             | NSWG                                             |
#      | enquiryTypeHeader              | Enquiry Type                                                                                     |
#     | enquiryTypeL                   | Enquiry Type                                                                                     |
#     | AccountL                       | Navigational Support                                                                             |
#     | enquiryTypeContainer           | Enquiry Type                                                                                     |
#     | enquiryTypeHeader              | Enquiry Type                                                                                     |
#     | enquiryDetails-field           | Please provide the details of your enquiry below                                                 |
#     | enquiryDetails                 |                                                                                                  |
#     | contactNumber                  | 9876543287                                                                                       |
#   Then The application should display the "viewAuditHistory" button
#   Then The application should display the "Close" button

# @GE26
# Scenario: General Enquiry -NavigationalSupport- Enquiry details UI validation
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The user click on the "trobuleshooting" radioButton
#   Then The user select a legal entity from the search legal entity pop up
#     | legalEntity | NSWG |
#   When The user Clicks the "Next" button
#   Then The application should display error message under "enquiryDetails-error-msg" section
#     | error_message | Enquiry details are mandatory |
#   Then The application should display error message under "contactNumber-error-msg" section
#     | error_message | Contact Number is mandatory |
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   When The user Clicks the "Next" button
#   Then The application should display error message under "contactNumber-error-msg" section
#     | error_message | Contact Number is mandatory |

# @GE26
# Scenario: General Enquiry -NavigationalSupport- Enquiry details UI validation
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The user click on the "NavigationalSupport" radioButton
#   Then The user select a legal entity from the search legal entity pop up
#     | legalEntity | NSWG |
#   When The user Clicks the "Next" button
#   Then The application should display error message under "enquiryDetails-error-msg" section
#     | error_message | Enquiry details are mandatory |
#   Then The application should display error message under "contactNumber-error-msg" section
#     | error_message | Contact Number is mandatory |
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   When The user Clicks the "Next" button
#   Then The application should display error message under "contactNumber-error-msg" section
#     | error_message | Contact Number is mandatory |


# @GE27
# Scenario: General Enquiry - Toggling Trobuleshooting to Account
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The application shows the "cancel" button
#   Then The user click on the "trobuleshooting" radioButton
#   Then The application should display following fields "under Select Legal Entity section"
#     | field_name                   |
#     | Legal_Entity_select_dropdown |
#     | Legal_Entity_search_icon     |
#     | LegalEntity-field            |
#   Then The application should display the "SelectLegalEntity" for "General Enquiry request" text
#     | SelectLegalEntityHeader | Select Legal Entity |
#   Then The user select a legal entity from the search legal entity pop up
#     | legalEntity | NSWG |
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   Then The user enter "9876543287" into the "contactNumber" text field
#   Then The user click on the "account" radioButton
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The application should display the "Account details" for "GE on review page"
#     | AccountName            | BO-PENDING                                                                                                        |
#     | AccountDefaultCurrency | AUD                                                                                                               |
#     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |


# @GE28
# Scenario: General Enquiry - Toggling  Account to Trobuleshooting
#   Given I am an authorised user with permission to create a "General Enquiry" service request
#   When The user navigate to the "General Enquiry" service request screen
#   Then The application should display the "Service Request Header" for "General Enquiry"
#     | titleL       | General Enquiry (AU)                                                                                  |
#     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#   Then The application shows the "cancel" button
#   Then The select service type marked as complete with tick symbol
#   Then The user click on the "account" radioButton
#   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   When I am selecting an eligible account from Search Account Lookup Dialog
#   Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#   Then The user enter "9876543287" into the "contactNumber" text field
# #   Then The user click on the "trobuleshooting" radioButton
# #   Then The application should display following fields "under Select Legal Entity section"
# #     | field_name                   |
# #     | Legal_Entity_select_dropdown |
# #     | Legal_Entity_search_icon     |
# #     | LegalEntity-field            |


#  @GE1
#   Scenario: General Enquiry - Service Request Header and Progress Bar
#     Given I am an authorised user with permission to create a "General Enquiry" service request
#     When The user navigate to the "General Enquiry" service request screen
#     Then The application should display the "Service Request Header" for "General Enquiry"
#       | titleL       | General Enquiry (AU)                                                                                  |
#       | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent or time sensitive (such as dishonouring a transaction), please contact the ANZ Customer Service Centre. |
#     Then The application shows the "cancel" button
#     Then  The application should display the "Select Enquiry Type" for "General Enquiry Service Request" text
#       | progressBarTxt1    | Select Service Type |
#       | progressBarTxt2    | Enter Details       |
#       | progressBarTxt3    | Review & Submit     |
#       | progressBarStatus1 | Completed           |
#     Then The application should display the "selectEnquiryTypeHeader" for "GE Service Request" text
#       | selectEnquiryTypeHeader | Select Enquiry Type |
#     Then  The application should display the "Enquiry details" for "General Enquiry Service Request"
#       | enquiryTypeL       | Enquiry Type |
#       | optionAccountL     | Account      |
#       | optionTransactionL | Transaction  |
#     Then The select service type marked as complete with tick symbol
#     Then The user click on the "account" radioButton
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter "enquiry Details text" into the "enquiryDetails" text field
#     Then The user enter "9876543287" into the "contactNumber" text field
#     When The user Clicks the "Next" button
#     Then  The application should display the "progress bar with status" for "General Enquiry Service Request" text
#       | progressBarTxt1    | Select Service Type |
#       | progressBarTxt2    | Enter Details       |
#       | progressBarTxt3    | Review & Submit     |
#       | progressBarStatus1 | Completed           |
#       | progressBarStatus2 | Completed           |
#       | progressBarStatus3 | Current             |
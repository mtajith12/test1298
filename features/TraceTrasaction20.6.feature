@ui-mock @api-mock @Trace20.6 @Regression @webform 
Feature: Trace a Transaction
  User should able to initiate new Trace a Transaction from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @api-mock @ui-mock @trace1
  Scenario: Trace a Transaction - Header & Progress Bar
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application shows the "cancel" button
    Then  The application should display the "progress bar with status" for "Trace Trasaction Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2021 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Trace Trasaction Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |
  #--------------------------------------------------------------------------------------------------------------------------------

  @trace7
  Scenario: Trace a Transaction - Populating 'Your Reference' value in view page
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#your_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "TraceTransaction on review page"
      | Your_Reference_header | Your Reference (optional)          |
      | your_reference        | testTraceTransaction#yourreference |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information                |
      | Summary_Info_RequestID_txt     | Request ID                         |
      | Summary_Info_Requestedon_txt   | Requested on                       |
      | Summary_Info_Requestedby_txt   | Requested by                       |
      | Summary_Info_RequestStatus_txt | Request Status                     |
      | Summary_Info_YourReference_txt | Your Reference                     |
      | Summary_Info_value4            | testTraceTransaction#yourreference |




  @trace8
  Scenario: Trace a Transaction - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
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
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
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
 * For Acceptance Criteria "Trace a Transaction - User does not have email address"
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2021 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user click on the "importantInformationCheckBox" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "Test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button


  @trace11
  Scenario: Trace a Transaction - Account Lookup
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "TraceTransaction on after selectd account in enter details page"
      | AccountName | BO-PENDING-APPROVAL |
      | AccountNo   | 010203 - 123456203  |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |



  @trace12v
  Scenario: Trace a Transaction - Search Transaction with Amount  < 0
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 0             |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |

  @trace12v
  Scenario: Trace a Transaction - Search Transaction with Amount  > 99,999,999,999.99
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 1000000000000 |
    Then The application should display error message under "amountErrorMessage" section
      | error_message | Amount should be greater than 0 and less than 99,999,999,999.99 |

  @range->30days
  Scenario: Trace a Transaction - Post date range cannot be more than 30 days
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | Jul 7, 2020/Aug 12, 2020 |
      | amount   |                          |
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post date range cannot be more than 30 days |


  @range->30days

  Scenario: Trace a Transaction - Post date range cannot be more than 30 days
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | Jul 7, 2020/Aug 12, 2020 |
      | amount   |                          |
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post date range cannot be more than 30 days |

  @range-earlierThanStartDate
  Scenario: Trace a Transaction - Post date range earlierThanStartDate
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | May 18, 2013/May 8, 2022 |
      | amount   |                          |
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date range cannot be a future date |


  @r>7yrsPost
  Scenario: Trace a Transaction - Date range cannot be older than 7 years
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | Apr 18, 2010/Apr 8, 2021 |
      | amount   |                          |
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date range cannot be older than 7 years |


  @range>futuredays
  Scenario: Trace a Transaction - Post date range cannot future days
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2021/May 19, 2025 |
      | amount   |                            |
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date range cannot be a future date |



  @manualentry1
  Scenario: Trace a Transaction -Manual entry - Post Date cannot be older than 7 years
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value   |
      | fromDate   | 02/04/2010 |
    When The user click on the "Search" button
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date cannot be older than 7 years |

  @manualentryRange
  Scenario: Trace a Transaction - Manual entry- Post Date range cannot be older than 7 years
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user click on the postDate and selected date range
   #When The user click on the "fromDate" button
    Then The user enter "12/08/2010" into the "fromDate" postDate field
    Then The user enter "13/08/2010" into the "toDate" postDate field
    When The user click on the "Search" button
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date range cannot be older than 7 years |


  @manualentry
  Scenario: Trace a Transaction - Manual entry- Post Date invalid
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | fromDate   | 13/13/1221  |
    When The user click on the "Search" button
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date must be entered in DD/MM/YYYY format |

  @manualentry123
  Scenario: Trace a Transaction - Manual entry-Post Date range invalid
    Given I am an authorised user with permission to create a "Trace Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user click on the postDate and selected date range
    When The user click on the "fromDate" button
    Then The user enter "01/01/2021" into the "fromDate" postDate field
    Then The user enter "13/13/2010" into the "toDate" postDate field
    When The user click on the "Search" button
    Then The application should display error message under "postDateErrorMsg" section
      | error_message | Post Date must be entered in DD/MM/YYYY format |


  @trace12v1
  Scenario: Trace a Transaction - Search Transaction with Amount range and Date range UI verification
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 8, 2020/March 9, 2020 |
      | amount   | 1/1000000                   |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridTransType    | Tran Type               |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |


  @norsult
  Scenario: Trace a Transaction - Search -No records found
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 12345678      |
    Then The application should display error message under "transactionIdMessage" section
      | error_message | No records found |

  @trace12
  Scenario: Trace a Transaction - Reset before search
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user Clicks the "Reset" button
    Then The application should display the "Reset UI for search section" for "Trace a Transaction Service Request"
      | fromAmount |  |
      | fromDate   |  |

  @ui-mock
  Scenario: Trace a Transaction - Reset After search
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date    |
      | transactionGridAmount       | Amount       |
      | transactionGridDebit/Credit | Debit/Credit |
      | transactionGridTransType    | Tran Type    |
      | transactionGridNarrative    | Narrative    |
      | transactionGridAuxdom       | Auxdom       |
      | transactionGridTraceline    | Traceline    |
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Trace a Transaction Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate         |  |
      | transactionGridAmount       |  |
      | transactionGridDebit/Credit |  |
      | transactionGridTransType    |  |
      | transactionGridNarrative    |  |
      | transactionGridAuxdom       |  |
      | transactionGridTraceline    |  |


  @trace12
  Scenario: Trace a Transaction - Reset After selected the perticular transaction
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Reset" button
    Then The application should display the "Reseted UI for search criteria" for "Trace a Transaction Service Request"
      | fromAmount |  |
      | fromDate   |  |
    Then The application should not display the "transaction search results grid"
      | transactionGridDate         |  |
      | transactionGridAmount       |  |
      | transactionGridDebit/Credit |  |
      | transactionGridTransType    |  |
      | transactionGridNarrative    |  |
      | transactionGridAuxdom       |  |
      | transactionGridTraceline    |  |


  @Trace-create
  Scenario: Trace a Transaction - Create TraceTransaction request
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridTransType    | Tran Type               |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Trace a Transaction Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on review page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    When The user click on the "importantInformationCheckBox" button
    # Then The application should display the "Important Information" for "TraceTransaction Service Request"
    #   | imp_info_header             | Important Information                                                                                                                                                                                                                                                                                                                               |
    #   | Important_Information_text1 | I acknowledge that funds will be debited from this account to return the payment. A Return of funds cannot be initiated for Australian Taxation Office (ATO) or Reserve of Bank of Australia (RBA) payments. If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment. |
    #   | Important_Information_text2 | By submitting this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule).                                                                                                                                                                                                                           |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |


  @withoutDate
  Scenario: Trace a Transaction - Search without Date
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Search" button
    And The application should display error message under "postDateErrorMsg" section
      | error_message | Post date is mandatory |

  @withouttransaction1
  Scenario: Trace a Transaction - Without transaction selected
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user Clicks the "Search" button
    When The user Clicks the "Next" button
    And The application should display error message under "selectedRowErrorMessage" section
      | error_message | You have not selected a valid transaction record. Please select a record to move to the next screen. |

  @TraceTransaction-WithoutYourReference
  Scenario: Trace a Transaction - Your Reference value Not display if user not entered
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application does not show "Summary_Info_YourReference_txt" screen
    Then The application does not show "Summary_Info_YourReference_value" screen



  @TraceTransaction-WithoutImportantInformation
  Scenario: Trace a Transaction - Without Important Information
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridTransType    | Tran Type               |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |

  @TraceTransactionSearch
  Scenario: Trace a Transaction - Create TraceTransaction request and search based on requestId
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridTransType    | Tran Type               |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Trace a Transaction Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "TraceTransaction on review page"
      | Your_Reference_header | Your Reference (optional)          |
      | your_reference        | testTraceTransaction#authorisation |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The user click on the "Ok" button
    Then The user searches stored service request and selects it
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Your Reference      |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |

  @TraceTransactionsearch2
  Scenario: Trace a Transaction - Search based on RequestType Search Criteria
    Given The user on the service request history page
    When The user open the search fields
    And The user click into the "Request type" field
    Then The user should be able to see and select "Trace a Transaction"
    When The user Clicks the "summaryGridsearch" button
    Then User should only see request history items that relate to "Trace a Transaction"

  @TraceTransaction-Reopen
  Scenario: Trace a Transaction - Reopen modal/pop-up 'Trace a Transaction' request
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The application should display the "Your Reference section" for "Trace a Transaction Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Your Reference      |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "updated status" for "TraceTransaction service request"
      | Summary_Info_RequestStatus_txt   | Request Status |
      | Summary_Info_RequestStatus_value | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
    Then The application should display the "Reopen" button
    Then The application should display the "Reopen model window" for "TraceTransaction request"
      | reopenModelWindowName            | Reopen Reason                                                                                                 |
      | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
      | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
      | reopenEmailLabel                 | Email                                                                                                         |
      | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
    Then The application should display the "SubmitBtn" button
    Then The application should display the "following reason type" for "TraceTransaction under Reopen model window"
      | reopen_dropdown_option1 | Please select a reason         |
      | reopen_dropdown_option2 | Further Investigation Required |
      | reopen_dropdown_option3 | Information Incomplete         |
      | reopen_dropdown_option4 | Information Unclear            |
      | reopen_dropdown_option5 | Other                          |


  @TraceTransaction-Reopen
  Scenario: Trace a Transaction - Reopen modal/pop-up validations
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Your Reference      |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "updated status" for "TraceTransaction service request"
      | Summary_Info_RequestStatus_txt   | Request Status |
      | Summary_Info_RequestStatus_value | Completed      |
    Then The application should display the "Reopen" button
    When The user Clicks the "Reopen" button
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


  @TraceTransaction-Reopen
  Scenario: Trace a Transaction - Reopen submit
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Your Reference      |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "updated status" for "TraceTransaction service request"
      | Summary_Info_RequestStatus_txt   | Request Status |
      | Summary_Info_RequestStatus_value | Completed      |
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



  @TraceTransaction-Reopen
  Scenario: Trace a Transaction - Reopen submit and View
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
      | Summary_Info_YourReference_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "updated status" for "TraceTransaction service request"
      | Summary_Info_RequestStatus_txt   | Request Status |
      | Summary_Info_RequestStatus_value | Completed      |
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
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Your Reference      |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |





  @TraceTransaction-additionalDocs1
  Scenario: Trace a Transaction - Submit comments only
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
      | Summary_Info_YourReference_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
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





  @TraceTransaction-additionalDocs2
  Scenario: Trace a Transaction - Submit Attachments only
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
      | Summary_Info_YourReference_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
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






  @TraceTransaction-additionalDocs3
  Scenario: Trace a Transaction - Submit Comments and Attachments
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date               |
      | transactionGridAmount       | Amount                  |
      | transactionGridDebit/Credit | Debit/Credit            |
      | transactionGridNarrative    | Narrative               |
      | transactionGridAuxdom       | Auxdom                  |
      | transactionGridTraceline    | Traceline               |
      | transactionGrid1            | 15/04/2018              |
      | transactionGrid2            | 25,000.00               |
      | transactionGrid3            | Cr                      |
      | transactionGrid4            | 14                      |
      | transactionGrid9            | LATE PAYMENT FEE        |
      | transactionGrid5            | 0000009077              |
      | transactionGrid6            | CMO010906290133A000Z1E8 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Confirmation pop-up" for "TraceTransaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "TraceTransaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
      | Summary_Info_YourReference_txt | Your Reference      |
    Then The application should display the "Important Information Section" for "TraceTransaction service request in view mode"
      | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
    Then The application should display the "Account details" for "TraceTransaction service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | Test Account2                                                                                                     |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Transaction |
    Then The application should display the "Transaction details" for "TraceTransaction on view page"
      | TrnstnGridHedr_Date           | Post Date               |
      | TrnstnGridHedr_Amount         | Amount                  |
      | TrnstnGridHedr_Debit/Credit   | Debit/Credit            |
      | TrnstnGridHedr_Narrative      | Narrative               |
      | TrnstnGridHedr_Auxdom         | Auxdom                  |
      | TrnstnGridHedr_TranType       | Tran Type               |
      | TrnstnGridHedr_Traceline      | Traceline               |
      | searchResults_Date            | 15/04/2018              |
      | searchResults_Amount          | 25,000.00               |
      | searchResults_DebitCreditType | Cr                      |
      | searchResults_Narrative       | LATE PAYMENT FEE        |
      | searchResults_TranType        | 14                      |
      | searchResults_Auxdom          | 0000009077              |
      | searchResults_TraceLine       | CMO010906290133A000Z1E8 |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
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



  @TraceTransaction-Comments&Attachments#Close#Yes
  Scenario: Trace a Transaction - Comments&Attachments#Close#Yes
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
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




  @TraceTransaction-Comments&Attachments#Close#No
  Scenario: Trace a Transaction - Comments&Attachments#Close#No
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
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




  @TraceTransaction-CommentsOnly#Close#Yes
  Scenario: Trace a Transaction - CommentsOnly#Close#Yes
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "Yes" button
    Then The application does not show "Add Comment" element
    Then The application shows "Cash Management Service Requests" screen




  @TraceTransaction-CommentsOnly#Close#No
  Scenario: Trace a Transaction - CommentsOnly#Close#No
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    When The user click on the "Close" button
    Then The application shows "Alert prompt" dialog
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    Then The element "#additionalComment" should have the text "Test comments"




  @TraceTransaction-AttachmentsOnly#Close#Yes
  Scenario: Trace a Transaction - AttachmentsOnly#Close#Yes
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
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




  @TraceTransaction-AttachmentsOnly#Close#No
  Scenario: Trace a Transaction - AttachmentsOnly#Close#No
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    When The user navigate to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   | 25000         |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user enter "testTraceTransaction#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "TraceTransaction on review page"
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
    Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Trace a Transaction" and selects it
    Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
      | Summary_Info_header              | Summary Information       |
      | Summary_Info_RequestID_txt       | Request ID                |
      | Summary_Info_Requestedon_txt     | Requested on              |
      | Summary_Info_Requestedby_txt     | Requested by              |
      | Summary_Info_RequestStatus_value | More Information Required |
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


  # @TraceTransaction#DualApprove
  # Scenario: Trace a Transaction - Dual approval Service Request
  #   Given I am an authorised user with permission to create a "Trace a Transaction" service request
  #   When The user navigate to the "Trace a Transaction" service request screen
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
  #     | SearchforTransactionL | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testTraceTransaction#PendingApproval" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "TraceTransaction on review page"
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
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId       |
  #     | status        | PENDING_APPROVAL |
  #     | requestStatus | PENDING_APPROVAL |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Trace a Transaction" and selects it
  #   Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #     Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "TraceTransaction request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   Then The application should display the "Approve model important Info Content" for "Service Request" text
  #     | importantInfoContent1 | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                         |
  #     | importantInfoContent2 | By approving this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge that funds will be debited from this account to return the payment.\nA request to return funds should not be initiated for Australian Taxation Office (ATO) or Reserve of Bank of Australia (RBA) payments. If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment. |
  #   Then The application should display the "approveBtn" button
  #   Then The application should display the "cancelBtn" button
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #      When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "TraceTransaction request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   When The user click on the "approveBtn" button
  #   Then The application should display the "Approve" toast notification
  #   Then The application should display the "status as Submitted" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #      When The user click on the "Approve" button
  #   Then The application should display the "following below text on Dual approver model window" for "SR"
  #     | approveDialog-title     | Approve Service Request                       |
  #     | cancelBtn               | Cancel                                        |
  #     | approveBtn              | Approve                                       |
  #     | approveDialog-content1  | Token authorisation required                  |
  #     | approveDialog-content2  | Step 1: Generate your authorisation code      |
  #     | approveDialog-content3  | Step 2: Enter your authorisation code         |
  #     | approveDialog-content4  | Turn on the token by holding down             |
  #     | approveDialog-content5  | and pressing                                  |
  #     #| approveDialog-content6  | Enter your 6 digit PIN                        |
  #     | approveDialog-content7  | Press                                         |
  #     | approveDialog-content8  | and enter the following code into your token: |
  #     | approveDialog-content9  | Press                                         |
  #     | approveDialog-content10 | to display your authorisation code            |
  #     | approveDialog-content1  | Token authorisation required                  |
  #     | helpLink                | Click here for Security Device Help           |
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #    When The user click on the "Approve" button
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   And The user click on the "approveBtn" button
  #   Then The application should display the "Approve" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |



  # @TraceTransaction#Reject
  # Scenario: Trace a Transaction - Reject Service Request
  #   Given I am an authorised user with permission to create a "Trace a Transaction" service request
  #   When The user navigate to the "Trace a Transaction" service request screen
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
  #     | SearchforTransactionL | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testTraceTransaction#PendingApproval" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "TraceTransaction on review page"
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
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId       |
  #     | status        | PENDING_APPROVAL |
  #     | requestStatus | PENDING_APPROVAL |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Trace a Transaction" and selects it
  #   Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #    Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title  | Reject Service Request |
  #     | cancelBtn           | Cancel                 |
  #     | rejectBtn           | Reject                 |
  #     | rejectComment-label | Reason For Rejection   |
  #     | rejectComment       |                        |
  #   Then The application should display the "Reject model important Info Content" for "Service Request" text
  #     | reject-importantInfoHeading | Important Information:                                                                                                                                                                 |
  #     | rejectDialog-infoText       | Please be advised that no further actions can be taken on a request after it has been rejected. If any additional actions are required, a new service request will need to be created. |
  #   Then The application should display the "rejectBtn" button
  #   Then The application should display the "cancelBtn" button
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "rejectDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #     When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title | Reject Service Request |
  #     | cancelBtn          | Cancel                 |
  #     | rejectBtn          | Reject                 |
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #      When The user click on the "Reject" button
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   And The user click on the "rejectBtn" button
  #   Then The application should display the "Reject" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |


  # @TraceTransaction#CancelRequest
  # Scenario: Trace a Transaction - Cancel Service Request
  #   Given I am an authorised user with permission to create a "Trace a Transaction" service request
  #   When The user navigate to the "Trace a Transaction" service request screen
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
  #     | SearchforTransactionL | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testTraceTransaction#PendingApproval" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "TraceTransaction on review page"
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
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId       |
  #     | status        | PENDING_APPROVAL |
  #     | requestStatus | PENDING_APPROVAL |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Trace a Transaction" and selects it
  #   Then The application should display the "request status as More Information Required" for "TraceTransaction SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title  | Reject Service Request |
  #     | cancelBtn           | Cancel                 |
  #     | rejectBtn           | Reject                 |
  #     | rejectComment-label | Reason For Rejection   |
  #     | rejectComment       |                        |
  #   Then The application should display the "Reject model important Info Content" for "Service Request" text
  #     | reject-importantInfoHeading | Important Information:                                                                                                                                                                 |
  #     | rejectDialog-infoText       | Please be advised that no further actions can be taken on a request after it has been rejected. If any additional actions are required, a new service request will need to be created. |
  #   Then The application should display the "rejectBtn" button
  #   Then The application should display the "cancelBtn" button
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "rejectDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  # When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title | Reject Service Request |
  #     | cancelBtn          | Cancel                 |
  #     | rejectBtn          | Reject                 |
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |
  #  When The user click on the "Reject" button
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   And The user click on the "rejectBtn" button
  #   Then The application should display the "Reject" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header" for "TraceTransaction service request in view mode"
  #     | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
  #     | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header              | Summary Information                  |
  #     | Summary_Info_RequestID_txt       | Request ID                           |
  #     | Summary_Info_Requestedon_txt     | Requested on                         |
  #     | Summary_Info_Requestedby_txt     | Requested by                         |

  @bulk
  Scenario: DTFAU-249 : Trace a Transaction - bulk submit
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    And The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | PostDate | March 9, 2020 |
      | amount   |               |
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "transaction search results grid" for "Trace a Transaction Service Request"
      | transactionGridDate         | Post Date    |
      | transactionGridAmount       | Amount       |
      | transactionGridDebit/Credit | Debit/Credit |
      | transactionGridTransType    | Tran Type    |
      | transactionGridNarrative    | Narrative    |
      | transactionGridAuxdom       | Auxdom       |
      | transactionGridTraceline    | Traceline    |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    Then The user Clicks the "bulkTransactionCheckBox" checkbox
    Then The application should display the "Your Reference section" for "Trace a Transaction Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
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
    Then The user enter "123.01" into the "beneficiaryAmount" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display following fields "Trace a Transaction SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 123.01    |
    When The user click on the "importantInformationCheckBox" button
    Then The application should display the "Important Information" for "Trace a Transaction Service Request"
      | imp_info_header | Important Information |
    # Then The application should display the "Important_Information_text1" for "Service Request" text
    # | Important_Information_text1 |By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule).I acknowledge that funds will be debited from this account to return the payment.|
    When The user click on the "Submit" button
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Trace a Transaction Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Trace a Transaction"
      | TraceTransaction_Title       | Trace Transaction (AU)                                                                                            |
      | TraceTransaction_Description | Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction |
    Then The application should display the "Summary Information" for "Trace a Transaction service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Request Status      |
    Then The application should display following fields "Trace a Transaction  SR Beneficiary Details"
      | field_name                |           |
      | beneficiaryDetails_Header |           |
      | beneficiaryAccountName    | ABC INC   |
      | beneficiaryBsb            | 234561    |
      | beneficiaryAccount        | 324342432 |
      | beneficiaryAmount         | 123.01    |



  @DTFAU-249 @bulk
  Scenario: DTFAU-249 : Trace a Transaction > Check the feature to Trace a transaction with a bulk amount
    * For Acceptance Criteria "DTFAU-249 AC01-Trace a transaction within a bulk amount > Default view"
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    And The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    | 1000          |
      | transtype |               |
      | PostDate  | March 9, 2020 |
    When The user Clicks the "Search" button
    Then The search result grid is displayed with the matching transaction results
    And The system displays the checkbox 'I want a Trace a Transaction within a Bulk Amount'
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is disabled
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is not checked
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount    | 1000          |
      | transtype |               |
      | PostDate  | March 9, 2020 |
    And The user Clicks the "Search" button
    And The user has selected the 'DEBIT' transaction and initiated trace a transaction request
    Then The system displays the checkbox 'I want a Trace a Transaction within a Bulk Amount'
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is enabled
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is not checked

    * For Acceptance Criteria "DTFAU-249 AC01.2-Disabling the checkbox"
    When The user check 'I want a Trace a Transaction within a Bulk Amount' checkbox
    And The user has select the next 'CREDIT' transaction and initiated trace a transaction request
    Then The checkbox 'I want a Trace a Transaction within a Bulk Amount' is disabled
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is not checked

    * For Acceptance Criteria "DTFAU-249 AC02-Trace a transaction within a bulk amount > Display additional fields"
    When The user Clicks the "Reset" button
    Then The user enters value in the search criteria fields
      | amount    | 1000          |
      | transtype |               |
      | PostDate  | March 9, 2020 |
    And The user Clicks the "Search" button
    And The user has selected the transaction and initiated trace a transaction request
    And The system displays the checkbox 'I want a Trace a Transaction within a Bulk Amount'
    And The checkbox 'I want a Trace a Transaction within a Bulk Amount' is enabled
    And The user check 'I want a Trace a Transaction within a Bulk Amount' checkbox
    Then The system displays fields to enter 'Beneficiary Details'

    * For Acceptance Criteria "DTFAU-249 AC03 - Trace a transaction within a bulk amount > No BSB entered"
    When The user enter the 'Beneficiary Details' without 'BSB'
    And The user Clicks the "Next" button
    Then The application should display error message under "BSBErrorMsg" field
      | error_message | BSB is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC04 - Trace a transaction within a bulk amount > Invalid BSB entered"
    When The user enter the 'Beneficiary Details' with incorrect 'BSB'
    And The user Clicks the "Next" button
    Then The application should display error message under "BSBErrorMsg" field
      | error_message | BSB must be 6 digits |
    * For Acceptance Criteria "DTFAU-249 AC05 - Trace a transaction within a bulk amount > Non Numeric BSB entered"
    When The user enter the 'Beneficiary Details' with invalid 'BSB'
    And The user Clicks the "Next" button
    Then The application does not accept invalid "BSB"

    * For Acceptance Criteria "DTFAU-249 AC06 - Trace a transaction within a bulk amount > No Account Number entered"
    When The user enter the 'Beneficiary Details' without 'Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC07 - Trace a transaction within a bulk amount > Invalid Account Number entered"
    When The user enter the 'Beneficiary Details' with 'Invalid Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | The Account Number must be between 6 and 9 digits |
    * For Acceptance Criteria "DTFAU-249 AC07 - Trace a transaction within a bulk amount > Non Numeric Account Number entered"""
    When The user enter the 'Beneficiary Details' with 'Non Numeric Account Number'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNumberErrorMsg" field
      | error_message | Account Number is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC08 - Trace a transaction within a bulk amount > No Account Name entered"
    When The user enter the 'Beneficiary Details' without 'Account Name'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNameErrorMsg" field
      | error_message | Account Name is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC09 - Trace a transaction within a bulk amount > Invalid Account Name entered"
    When The user enter the 'Beneficiary Details' with 'Invalid Account Name'
    And The user Clicks the "Next" button
    Then The application should display error message under "AccountNameErrorMsg" field
      | error_message | The account name must be 1-32 valid characters |

    * For Acceptance Criteria "DTFAU-249 AC10 - Trace a transaction within a bulk amount > No Trace Amount entered"
    When The user enter the 'Beneficiary Details' without 'Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC11 - Trace a transaction within a bulk amount > Invalid Trace Amount entered"
    When The user enter the 'Beneficiary Details' with 'Invalid Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount is mandatory |
    * For Acceptance Criteria "DTFAU-249 AC11 - Trace a transaction within a bulk amount > Invalid Trace Amount entered"
    When The user enter the 'Beneficiary Details' with 'Invalid range Trace Amount'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount should be greater than 0 and less than 99,999,999,999.99 |
    * For Acceptance Criteria "DTFAU-249 AC12 - Trace a transaction within a bulk amount > Exceed Maximum Trace Amount"
    When The user enter the 'Beneficiary Details' Exceed Maximum Trace Amount
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount must be equal to or less than the selected or entered transaction amount |

  @DTFAU-249 @bulk
  Scenario: DTFAU-249 : Trace a Transaction > Check the feature to Trace a transaction with a bulk amount
    Given I am an authorised user with permission to create a "Trace a Transaction" service request
    And The user navigated to the "Trace a Transaction" service request screen
    When The user types Account Name "200-TRANS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enters value in the search criteria fields
      | amount    | 1             |
      | transtype |               |
      | PostDate  | March 9, 2020 |
    When The user Clicks the "Search" button
    Then The search result grid is displayed with the matching transaction results
    And The system displays the checkbox 'I want a Trace a Transaction within a Bulk Amount'
    When The user check 'I want a Trace a Transaction within a Bulk Amount' checkbox
    Then The user enter "ABC INC" into the "beneficiaryAccountName" text field
    Then The user enter "234561" into the "beneficiaryBsb" text field
    Then The user enter "324342432" into the "beneficiaryAccount" text field
    # Then The user enter "123.01" into the "beneficiaryAmount" text field
    Then The user enter "testRecallPayment#123" into the "your_reference" text field
    And The user Clicks the "Next" button
    When The user enter the 'Beneficiary Details' without 'BSB'
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount is mandatory |
    Then The user enter "123.01" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount must be equal to or less than the selected or entered transaction amount |
    Then The user enter "999999999999" into the "beneficiaryAmount" text field
    And The user Clicks the "Next" button
    Then The application should display error message under "TraceAmountErrorMsg" field
      | error_message | Trace Amount must be equal to or less than the selected or entered transaction amount |

  #@ui-mock #@api-mock #@DTFAU-397
  Scenario: DTFAU-397 : Trace a Transaction > Adding 'Request type' attribute to Search Criteria
    Given The user on the service request history page
    When The user open the search fields
    And The user click into the "Request type" field
    Then The user should be able to see and select "Trace Transaction"
    When The user Clicks the "summaryGridsearch" button
    Then User should only see request history items that relate to "Trace Transaction"


@ui-mock @api-mock @Missingdeposit @Regression @webform
Feature: Claim Missing Deposit
  User should able to initiate new Return Incorrectly Received Funds from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @api-mock @ui-mock @md1
  Scenario: Claim Missing Deposit -Header & Progress Bar
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    Then The application should display the "Service Request Header" for "Return Incorrectly Received Funds"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application shows the "cancel" button
    Then  The application should display the "progress bar with status" for "Missing Deposit" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Current             |
      | progressBarStatus3 |                     |
    Then The select service type marked as complete with tick symbol
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | amount      |                              |
      | DepositDate |  June 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Missing Deposit" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |


  @md3
  Scenario: Missing Deposit - Account Lookup
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The application should display the "Enter Missing Deposit Details" for "Missing Deposit SR"
      | EnterMissingDepositDetails_header | Enter Missing Deposit Details |
      | DepositDateL                      | Deposit Date                  |
      | DepositTypeL                      | Deposit Type                  |
      | DepositMethodL                    | Deposit Method                |
      | DepositedviaL                     | Deposited Via                 |
      | BranchL                           | Branch                        |



  @md4
  Scenario: Missing Deposit - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | amount      |                    |
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


  @md5
  Scenario: Missing Deposit - View the information in review details and Cancel Service Request prior to submission on 'Review and Submit' screen
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "claim missing on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | EnterMissingDepositDetails_header | Missing Deposit Details  |
      | DepositDateL                      | Deposit Date                   |
      #| DepositDateValue                             |                                    |
      | DepositTypeL                      | Deposit Type                   |
      | DepositType                       | Cash                           |
      | DepositMethodL                    | Deposit Method                 |
      | DepositMethod                     | ATM                            |
      | DepositedviaL                     | Deposited Via                  |
      | DepositLocationValue              | Branch                         |
      | BranchAddrL                       | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL               | Original Cash Amount Deposited |
      | OriginalCashAmount                | AUD 500.00                     |
      | MissingcashAmountL                | Missing Cash Amount            |
      | MissingcashAmount                 | AUD 499.98                     |
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen

   @md8
  Scenario: Claim Missing Deposit-   Display 'Your Reference'section and Populating value in review & view pages
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
       | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Fix Cheque Encoding Error Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "FCEE Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Return Incorrectly Received Funds"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
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

  @md9
  Scenario: Claim Missing Deposit-  Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The application shows the "cancel" button
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen




  @md10
  Scenario: Claim Missing Deposit-  Cancel Service Request prior to submission on 'Review and Submit' screen
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Fix Cheque Encoding Error Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "No" button
    Then The application must close the cancel service request alert pop-up message
    When The user Clicks the "Cancel" button
    Then The application should display an alert pop-up message
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


  @md11
  Scenario: Claim Missing Deposit-   User does not have emailaddress
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
       | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Fix Cheque Encoding Error Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "FCEE on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Your Reference details" for "FCEE on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button


  @md12
  Scenario: Claim Missing Deposit-   Error Message Validation - Cash
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    When The user click on the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | DepositDate_Error   | Deposit Date is mandatory   |
      | DepositType_Error   | Deposit Type is mandatory   |
      | DepositMethod_Error | Deposit Method is mandatory |
      | Branch_Error        | Branch is mandatory         |
    Then The application should display the "fields with text" for "Missing deposits"
      | opt_cash             | Cash                  |
      | opt_cheque           | Cheque                |
      | opt_both             | Both                  |
      | opt_ATM              | ATM                   |
      | opt_Counter          | Over The Counter      |
      | opt_FastDepoBag      | Fast Deposit Bag      |
      When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    Then The following fields should be disabled
      | field_name        |
      | DirectDepotOption |
    When The user click on the "Next" button
    When The user select the "Over The Counter" from "DepositMethod" drop down
    Then The following fields should be disabled
      | field_name        |
      | DirectDepotOption |
    When The user click on the "Next" button
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user click on the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | orgCashAmt_err       | Original Cash Amount Deposited is mandatory |
      | missCashAmt_err      | Missing Cash Amount is mandatory            |
      | FastDepositBag_Error | Fast Deposit Bag Number is mandatory        |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500 |
      | MissingcashAmount  | 501 |
    When The user click on the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | missCashAmt_err   | Missing Cash Amount entered must not exceed the Original Cash Amount Deposited   |


  @md13
  Scenario: Claim Missing Deposit-   Review and Submit Screen - Cash
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "Over The Counter" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The user enter "reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Fields" for "Missing Deposits on review page"
      | DepositDateL         | Deposit Date                   |
      | DepositDateValue     | 12/02/2020                     |
      | DepositTypeL         | Deposit Type                   |
      | DepositType          | Cash                           |
      | DepositMethodL       | Deposit Method                 |
      | DepositedviaL        | Deposited Via                  |
      | DepositLocationValue | Branch                         |
      | BranchAddrL          | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL  | Original Cash Amount Deposited |
      | OriginalCashAmount   | AUD 500.00                     |
      | MissingcashAmountL   | Missing Cash Amount            |
      | MissingcashAmount    | AUD 499.98                     |
      | DepositMethod        | Over The Counter               |
    When The user Clicks the "Previous" button
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | OriginalCashAmount |  |
      | MissingcashAmount  |  |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500       |
      | MissingcashAmount  | 499.98    |
      | FastDepoBagNum     | 123376376 |
    When The user Clicks the "Next" button
    Then The application should display the "Fields" for "Missing Deposits on review page"
      | DepositDateL         | Deposit Date                   |
      | DepositDateValue     | 12/02/2020                    |
      | DepositTypeL         | Deposit Type                   |
      | DepositType          | Cash                           |
      | DepositMethodL       | Deposit Method                 |
      | DepositedviaL        | Deposited Via                  |
      | DepositLocationValue | Branch                         |
      | BranchAddrL          | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL  | Original Cash Amount Deposited |
      | OriginalCashAmount   | AUD 500.00                     |
      | MissingcashAmountL   | Missing Cash Amount            |
      | MissingcashAmount    | AUD 499.98                     |
      | DepositMethod        | Fast Deposit Bag               |
      | FastDepoBagNum       | 123376376                      |
      | FastDepoBagNumL      | Fast Deposit Bag Number        |

  @md14
  Scenario: Claim Missing Deposit-    View Request Screen (create case with depo method "ATM") - Cash
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The user enter "reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    When The user click on the "view_request_link" link
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | DepositDateL         | Deposit Date                   |
      | DepositDateValue     | 12/02/2020                     |
      | DepositTypeL         | Deposit Type                   |
      | DepositType          | Cash                           |
      | DepositMethodL       | Deposit Method                 |
      | DepositMethod        | ATM                            |
      | DepositedviaL        | Deposited Via                  |
      | DepositLocationValue | Branch                         |
      | BranchAddrL          | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL  | Original Cash Amount Deposited |
      | OriginalCashAmount   | AUD 500.00                     |
      | MissingcashAmountL   | Missing Cash Amount            |
      | MissingcashAmount    | AUD 499.98                     |

  @md15
  Scenario: Claim Missing Deposit-    View Request Screen (create case with depo method "Over The Counter") - Cash
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "Over The Counter" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The user enter "reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    When The user click on the "view_request_link" link
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | DepositDateL         | Deposit Date                   |
      | DepositDateValue     | 12/02/2020                     |
      | DepositTypeL         | Deposit Type                   |
      | DepositType          | Cash                           |
      | DepositMethodL       | Deposit Method                 |
      | DepositMethod        | Over The Counter               |
      | DepositedviaL        | Deposited Via                  |
      | DepositLocationValue | Branch                         |
      | BranchAddrL          | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL  | Original Cash Amount Deposited |
      | OriginalCashAmount   | AUD 500.00                     |
      | MissingcashAmountL   | Missing Cash Amount            |
      | MissingcashAmount    | AUD 499.98                     |

  @md16
  Scenario: Claim Missing Deposit-    View Request Screen (create case with depo method "Fast Deposit Bag" and Depo via "Direct to Depot") - Cash
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500       |
      | MissingcashAmount  | 499.98    |
      | FastDepoBagNum     | 123376376 |
    Then The user enter "reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    When The user click on the "view_request_link" link
    Then The application should display the "Missing Deposit details" for "Missing Deposit on review page"
      | DepositDateL         | Deposit Date                   |
      | DepositDateValue     | 12/02/2020                     |
      | DepositTypeL         | Deposit Type                   |
      | DepositType          | Cash                           |
      | DepositMethodL       | Deposit Method                 |
      | DepositMethod        | Fast Deposit Bag               |
      | DepositedviaL        | Deposited Via                  |
      | DepositLocationValue | Direct to Depot                |
      # | BranchAddrL                       | Branch                         |
      #| BranchAddress                                |                                    |
      | OriginalCashAmountL  | Original Cash Amount Deposited |
      | OriginalCashAmount   | AUD 500.00                     |
      | MissingcashAmountL   | Missing Cash Amount            |
      | MissingcashAmount    | AUD 499.98                     |
      | FastDepoBagNum       | 123376376                      |


  @md17
  Scenario: Claim Missing Deposit- Create Request page validation - Cheque
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    Then The application should display the "Fields" for "MD case creation using Depo Type Cheque"
      | DepositMethodL        | Deposit Method                        |
      | DepositedviaL         | Deposited Via                         |
      | DirectDepotDeposit    | Direct to Depot                       |
      | opt_ATM               | ATM                                   |
      | opt_Counter           | Over The Counter                      |
      | opt_FastDepoBag       | Fast Deposit Bag                      |
         | BranchDeposit         | Branch                                |
      | BranchL               | Branch                                |
      | OriginalChequeAmountL | Original Cheque Amount Deposited      |
      | MissingchequeAmountL  | Missing Cheque Amount                 |
      | OriginalChequeAmount  |                                       |
      | MissingchequeAmount   |                                       |
      | MissingChequeCountL   | Approximate Number of Missing Cheques |
      | MissingChequeDetailsL | Enter Missing Cheque Details          |
      | MissingChequeDetailsL | Enter Missing Cheque Details          |
      | ChequeNumberL         | Cheque Number                         |
      | AmountL               | Amount                                |
      | PayerBankL            | Payer Bank                            |
      | PayerNameL            | Payer Name                            |
      | ChequeNum1            |                                       |
      | ChequeAmt1            |                                       |
      | PayerBank1            |                                       |
      | PayerName1            |                                       |
      | opt_1                 | 1                                     |
      | opt_2                 | 2                                     |
      | opt_3                 | 3                                     |
      | opt_4                 | 4                                     |
      | opt_5                 | 5                                     |
      | opt_6                 | 6+                                    |
    Then The application should display following fields "for mandatory Asterisk symbol in MD create screen"
      | field_name        |
      | DepoDate_mand     |
      | DepoType_mand     |
      | DepoMethod_mand   |
      | DepoLocation_mand |
      | origchqamt_mand   |
      | misschqamt_mand   |
      | misschqcount_mand |
      | chqnum_mand       |
      | chqamt_mand       |

  @md18
  Scenario: Claim Missing Deposit- Error Message validation - Cheque
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    When The user Clicks the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | orgChequeAmt_err          | Original Cheque Amount Deposited is mandatory      |
      | missChequeAmt_err         | Missing Cheque Amount is mandatory                 |
      | MissingChequeCountError   | Approximate Number of Missing Cheques is mandatory |
      | MissingChequeDetailsError | Please enter all mandatory details                 |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 500 |
      | MissingchequeAmount  | 501 |
    When The user Clicks the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | missChequeAmt_err | Missing Cheque Amount entered must not exceed the Original Cheque Amount Deposited |
    When The user select the "6+" from "MissingChequeCount" drop down
    Then The application should display the "Sub Heading" in the "Enter Missing cheque details section"
      | ChequeDetailsSubHeading | We require the details of 5 missing cheques to help process your request |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 5000   |
      | ChequeNum1           | 646547 |
      | ChequeAmt1           | 100    |
      | PayerBank1           |        |
      | PayerName1           |        |
      | ChequeNum2           | 765454 |
      | ChequeAmt2           | 100    |
      | PayerBank2           |        |
      | PayerName2           |        |
      | ChequeNum3           | 436456 |
      | ChequeAmt3           | 100    |
      | PayerBank3           |        |
      | PayerName3           |        |
      | ChequeNum4           | 987877 |
      | ChequeAmt4           | 100    |
      | PayerBank4           |        |
      | PayerName4           |        |
      | ChequeNum5           | 414155 |
      | ChequeAmt5           | 102    |
      | PayerBank5           |        |
      | PayerName5           |        |
    When The user Clicks the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | TotalAmountError | Total Cheque Amount cannot be greater than the Missing Cheque Amount |



  @md19
  Scenario: Claim Missing Deposit- validating review screen and view details - Cheque
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cheque" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 5000    |
      | MissingchequeAmount  | 1200 |
       | FastDepoBagNum | 123376376  |
    When The user select the "6+" from "MissingChequeCount" drop down
    Then The application should display the "Sub Heading" in the "Enter Missing cheque details section"
      | ChequeDetailsSubHeading | We require the details of 5 missing cheques to help process your request |
    And I am entering the "cheque amount details" for "claim missing deposit sr"
      | ChequeNum1 | 646547  |
      | ChequeAmt1 | 100     |
      | PayerBank1 | wer     |
      | PayerName1 | ert     |
      | ChequeNum2 | 765454  |
      | ChequeAmt2 | 100     |
      | PayerBank2 | were    |
      | PayerName2 | ewff    |
      | ChequeNum3 | 436456  |
      | ChequeAmt3 | 100     |
      | PayerBank3 | dfgfg   |
      | PayerName3 | dfgdfg  |
      | ChequeNum4 | 987877  |
      | ChequeAmt4 | 100     |
      | PayerBank4 | dfgdfg  |
      | PayerName4 | dfgsdgf |
      | ChequeNum5 | 414155  |
      | ChequeAmt5 | 102     |
      | PayerBank5 | hfrhg   |
      | PayerName5 | regrg   |
    When The user Clicks the "Next" button
    Then The application should display the "Fields" for "review and submit screen"
      | DepositDateL          | Deposit Date                     |
     # | DepositDateValue      | 12/02/2020                       |
      | DepositTypeL          | Deposit Type                     |
      | DepositType           | Cheque                           |
      | DepositMethodL        | Deposit Method                   |
      | DepositedviaL         | Deposited Via                    |
      | DepositLocationValue  | Direct to Depot                  |
      | OriginalChequeAmountL | Original Cheque Amount Deposited |
      | MissingchequeAmountL  | Missing Cheque Amount            |
      | DepositMethod         | Fast Deposit Bag            |
      | MissingChequeDetailsL | Missing Cheque Details     |
      | MissingChequeCount    | 6+                               |
      | OriginalChequeAmount  | AUD 5,000.00                     |
      | MissingchequeAmount   | AUD 1,200.00                     |
      | ChequeNum1            | 646547                           |
      | ChequeAmt1            | AUD 100.00                       |
      | PayerBank1            | wer                              |
      | PayerName1            | ert                              |
      | ChequeNum2            | 765454                           |
      | ChequeAmt2            | AUD 100.00                       |
      | PayerBank2            | were                             |
      | PayerName2            | ewff                             |
      | ChequeNum3            | 436456                           |
      | ChequeAmt3            | AUD 100.00                       |
      | PayerBank3            | dfgfg                            |
      | PayerName3            | dfgdfg                           |
      | ChequeNum4            | 987877                           |
      | ChequeAmt4            | AUD 100.00                       |
      | PayerBank4            | dfgdfg                           |
      | PayerName4            | dfgsdgf                          |
      | ChequeNum5            | 414155                           |
      | ChequeAmt5            | AUD 102.00                       |
      | PayerBank5            | hfrhg                            |
      | PayerName5            | regrg                            |
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Fields" for "View Details screen"
      | DepositDateL          | Deposit Date                     |
      | DepositDateValue      | 12/02/2020                       |
      | DepositTypeL          | Deposit Type                     |
      | DepositType           | Cheque                           |
      | DepositMethodL        | Deposit Method                   |
      | DepositedviaL         | Deposited Via                    |
      | DepositLocationValue  | Direct to Depot                  |
      | OriginalChequeAmountL | Original Cheque Amount Deposited |
      | MissingchequeAmountL  | Missing Cheque Amount            |
        | DepositMethod         | Fast Deposit Bag            |
      | MissingChequeDetailsL | Missing Cheque Details     |
      | MissingChequeCount    | 6+                               |
      | OriginalChequeAmount  | AUD 5,000.00                     |
      | MissingchequeAmount   | AUD 1,200.00                     |
      | ChequeNum1            | 646547                           |
      | ChequeAmt1            | AUD 100.00                       |
      | PayerBank1            | wer                              |
      | PayerName1            | ert                              |
      | ChequeNum2            | 765454                           |
      | ChequeAmt2            | AUD 100.00                       |
      | PayerBank2            | were                             |
      | PayerName2            | ewff                             |
      | ChequeNum3            | 436456                           |
      | ChequeAmt3            | AUD 100.00                       |
      | PayerBank3            | dfgfg                            |
      | PayerName3            | dfgdfg                           |
      | ChequeNum4            | 987877                           |
      | ChequeAmt4            | AUD 100.00                       |
      | PayerBank4            | dfgdfg                           |
      | PayerName4            | dfgsdgf                          |
      | ChequeNum5            | 414155                           |
      | ChequeAmt5            | AUD 102.00                       |
      | PayerBank5            | hfrhg                            |
      | PayerName5            | regrg                            |


  @md20
  Scenario: Claim Missing Deposit- Create Request page validation - Both
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
       | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    Then The application should display the "Fields" for "MD case creation using Depo Type Cheque"
      | DepositMethodL        | Deposit Method                        |
      | DepositedviaL         | Deposited Via                         |
      | DirectDepotDeposit    | Direct to Depot                       |
      | opt_ATM               | ATM                                   |
      | opt_Counter           | Over The Counter                      |
      | opt_FastDepoBag       | Fast Deposit Bag                      |
      | BranchDeposit         | Branch                                |
      | BranchL               | Branch                                |
      | OriginalCashAmountL   | Original Cash Amount Deposited        |
      | OriginalCashAmount    |                                       |
      | MissingcashAmountL    | Missing Cash Amount                   |
      | MissingcashAmount     |                                       |
      | OriginalChequeAmountL | Original Cheque Amount Deposited      |
      | MissingchequeAmountL  | Missing Cheque Amount                 |
      | OriginalChequeAmount  |                                       |
      | MissingchequeAmount   |                                       |
      | MissingChequeCountL   | Approximate Number of Missing Cheques |
      | MissingChequeDetailsL | Enter Missing Cheque Details          |
      | ChequeNumberL         | Cheque Number                         |
      | AmountL               | Amount                                |
      | PayerBankL            | Payer Bank                            |
      | PayerNameL            | Payer Name                            |
      | ChequeNum1            |                                       |
      | ChequeAmt1            |                                       |
      | PayerBank1            |                                       |
      | PayerName1            |                                       |
      | opt_1                 | 1                                     |
      | opt_2                 | 2                                     |
      | opt_3                 | 3                                     |
      | opt_4                 | 4                                     |
      | opt_5                 | 5                                     |
      | opt_6                 | 6+                                    |
    Then The application should display following fields "for mandatory Asterisk symbol in MD create screen"
      | field_name        |
      | DepoDate_mand     |
      | DepoType_mand     |
      | DepoMethod_mand   |
      | DepoLocation_mand |
      | origchqamt_mand   |
      | misschqamt_mand   |
      | misschqcount_mand |
      | chqnum_mand       |
      | chqamt_mand       |

@md21
  Scenario: Claim Missing Deposit- Error Message validation - Both
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    When The user Clicks the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | orgChequeAmt_err   | Original Cheque Amount Deposited is mandatory   |
      | missChequeAmt_err | Missing Cheque Amount is mandatory |
      | MissingChequeCountError | Approximate Number of Missing Cheques is mandatory |
      | MissingChequeDetailsError | Please enter all mandatory details |
      | orgCashAmt_err   | Original Cash Amount Deposited is mandatory   |
      | missCashAmt_err | Missing Cash Amount is mandatory |
      | FastDepositBag_Error| Fast Deposit Bag Number is mandatory |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 500    |
      | MissingchequeAmount  | 501 |
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 501 |
    When The user Clicks the "Next" button
    Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | missChequeAmt_err   | Missing Cheque Amount entered must not exceed the Original Cheque Amount Deposited   |
      | missCashAmt_err   | Missing Cash Amount entered must not exceed the Original Cash Amount Deposited   |
    When The user select the "6+" from "MissingChequeCount" drop down
    Then The application should display the "Sub Heading" in the "Enter Missing cheque details section"
      | ChequeDetailsSubHeading   | We require the details of 5 missing cheques to help process your request   |
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 5000   |
      | ChequeNum1           | 646547 |
      | ChequeAmt1           | 100    |
      | PayerBank1           |        |
      | PayerName1           |        |
      | ChequeNum2           | 765454 |
      | ChequeAmt2           | 100    |
      | PayerBank2           |        |
      | PayerName2           |        |
      | ChequeNum3           | 436456 |
      | ChequeAmt3           | 100    |
      | PayerBank3           |        |
      | PayerName3           |        |
      | ChequeNum4           | 987877 |
      | ChequeAmt4           | 100    |
      | PayerBank4           |        |
      | PayerName4           |        |
      | ChequeNum5           | 414155 |
      | ChequeAmt5           | 102    |
      | PayerBank5           |        |
      | PayerName5           |        |
     When The user Clicks the "Next" button
     Then The application should display the "Error messages" in the "Missing Deposit Creation Page"
      | TotalAmountError   | Total Cheque Amount cannot be greater than the Missing Cheque Amount   |

@md22
  Scenario: Claim Missing Deposit- validating review screen and view details - Both
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The application should display the "Account details" for "DClaim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Both" from "DepositType" drop down
    When The user select the "Fast Deposit Bag" from "DepositMethod" drop down
    When The user Clicks the "DirectDepotOption" button
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalChequeAmount | 5000    |
      | MissingchequeAmount  | 1200 |
      | OriginalCashAmount | 5000    |
      | MissingcashAmount  | 501 |
      | FastDepoBagNum | 123376376  |
    When The user select the "6+" from "MissingChequeCount" drop down
    Then The application should display the "Sub Heading" in the "Enter Missing cheque details section"
      | ChequeDetailsSubHeading   | We require the details of 5 missing cheques to help process your request   |
    And I am entering the "cheque amount details" for "claim missing deposit sr"
      | ChequeNum1 | 46547   |
      | ChequeAmt1 | 100     |
      | PayerBank1 | wer     |
      | PayerName1 | ert     |
      | ChequeNum2 | 7654    |
      | ChequeAmt2 | 100     |
      | PayerBank2 | were    |
      | PayerName2 | ewff    |
      | ChequeNum3 | 436456  |
      | ChequeAmt3 | 100     |
      | PayerBank3 | dfgfg   |
      | PayerName3 | dfgdfg  |
      | ChequeNum4 | 987877  |
      | ChequeAmt4 | 100     |
      | PayerBank4 | dfgdfg  |
      | PayerName4 | dfgsdgf |
      | ChequeNum5 | 414155  |
      | ChequeAmt5 | 102     |
      | PayerBank5 |         |
      | PayerName5 |         |
    When The user Clicks the "Next" button
    Then The application should display the "Fields" for "review and submit screen"
      | DepositDateL          | Deposit Date                     |
      #| DepositDateValue      | 12/02/2020                       |
      | DepositTypeL          | Deposit Type                     |
      | DepositType           | Both                             |
      | DepositMethodL        | Deposit Method                   |
      | DepositedviaL         | Deposited Via                    |
      | DepositLocationValue  | Direct to Depot                  |
      | OriginalChequeAmountL | Original Cheque Amount Deposited |
      | MissingchequeAmountL  | Missing Cheque Amount            |
      | DepositMethod         | Fast Deposit Bag                 |
      | MissingChequeDetailsL | Missing Cheque Details           |
      | MissingChequeCount    | 6+                               |
      | OriginalChequeAmount  | AUD 5,000.00                     |
      | MissingchequeAmount   | AUD 1,200.00                     |
      | OriginalCashAmount    | AUD 5,000.00                     |
      | MissingcashAmount     | AUD 501.00                       |
      | FastDepoBagNum        | 123376376                        |
      | ChequeNum1            | 046547                           |
      | ChequeAmt1            | AUD 100.00                       |
      | PayerBank1            | wer                              |
      | PayerName1            | ert                              |
      | ChequeNum2            | 007654                           |
      | ChequeAmt2            | AUD 100.00                       |
      | PayerBank2            | were                             |
      | PayerName2            | ewff                             |
      | ChequeNum3            | 436456                           |
      | ChequeAmt3            | AUD 100.00                       |
      | PayerBank3            | dfgfg                            |
      | PayerName3            | dfgdfg                           |
      | ChequeNum4            | 987877                           |
      | ChequeAmt4            | AUD 100.00                       |
      | PayerBank4            | dfgdfg                           |
      | PayerName4            | dfgsdgf                          |
      | ChequeNum5            | 414155                           |
      | ChequeAmt5            | AUD 102.00                       |
      | PayerBank5            |                                  |
      | PayerName5            |                                  |
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Fields" for "View Details screen"
      | DepositDateL          | Deposit Date                     |
      | DepositDateValue      | 12/02/2020                       |
      | DepositTypeL          | Deposit Type                     |
      | DepositType           | Both                             |
      | DepositMethodL        | Deposit Method                   |
      | DepositedviaL         | Deposited Via                    |
      | DepositLocationValue  | Direct to Depot                  |
      | OriginalChequeAmountL | Original Cheque Amount Deposited |
      | MissingchequeAmountL  | Missing Cheque Amount            |
      | DepositMethod         | Fast Deposit Bag                 |
      | MissingChequeDetailsL | Missing Cheque Details           |
      | MissingChequeCount    | 6+                               |
      | OriginalChequeAmount  | AUD 5,000.00                     |
      | MissingchequeAmount   | AUD 1,200.00                     |
      | OriginalCashAmount    | AUD 5,000.00                     |
      | MissingcashAmount     | AUD 501.00                       |
      | FastDepoBagNum        | 123376376                        |
      | ChequeNum1            | 046547                           |
      | ChequeAmt1            | AUD 100.00                       |
      | PayerBank1            | wer                              |
      | PayerName1            | ert                              |
      | ChequeNum2            | 007654                           |
      | ChequeAmt2            | AUD 100.00                       |
      | PayerBank2            | were                             |
      | PayerName2            | ewff                             |
      | ChequeNum3            | 436456                           |
      | ChequeAmt3            | AUD 100.00                       |
      | PayerBank3            | dfgfg                            |
      | PayerName3            | dfgdfg                           |
      | ChequeNum4            | 987877                           |
      | ChequeAmt4            | AUD 100.00                       |
      | PayerBank4            | dfgdfg                           |
      | PayerName4            | dfgsdgf                          |
      | ChequeNum5            | 414155                           |
      | ChequeAmt5            | AUD 102.00                       |
      | PayerBank5            |                                  |
      | PayerName5            |                                  |

  @md#commentsOnly
  Scenario: Claim Missing Deposit-  Submit comments only
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Claim Missing Deposit on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Claim Missing Deposit"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The application should display the "request status as More Information Required" for "Claim Missing Deposit SR"
      | Summary_Info_header            | Summary Information       |
      | Summary_Info_RequestID_txt     | Request ID                |
      | Summary_Info_Requestedon_txt   | Requested on              |
      | Summary_Info_Requestedby_txt   | Requested by              |
      | Summary_Info_YourReference_val | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "Claim Missing Deposit service request"
      | Comment_Section_header   | Comments and Supporting Documents                                                            |
      | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentTitle  | New comment / attachment                                                                     |
      | additional_Comment-field | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Additional Comment" textbox
    # Then The element "#submit" should be enabled
    When The user entered "Providing the comments only" in "Additional Comment" textbox
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents section" for "Claim Missing Deposit service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32         |
      | Added by | User Lname                  |
      | Comments | Providing the comments only |


  @md#AttachmentsOnly
  Scenario: Claim Missing Deposit-  Submit Attachments only
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Claim Missing Deposit on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Claim Missing Deposit"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The application should display the "request status as More Information Required" for "Claim Missing Deposit SR"
      | Summary_Info_header            | Summary Information       |
      | Summary_Info_RequestID_txt     | Request ID                |
      | Summary_Info_Requestedon_txt   | Requested on              |
      | Summary_Info_Requestedby_txt   | Requested by              |
      | Summary_Info_YourReference_val | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "Claim Missing Deposit service request"
      | Comment_Section_header   | Comments and Supporting Documents                                                            |
      | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentTitle  | New comment / attachment                                                                     |
      | additional_Comment-field | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
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




  @md#comments#Attachments
  Scenario: Claim Missing Deposit-  Submit Comments and Attachments submisson
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  February 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Claim Missing Deposit on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Claim Missing Deposit"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The application should display the "request status as More Information Required" for "Claim Missing Deposit SR"
      | Summary_Info_header            | Summary Information       |
      | Summary_Info_RequestID_txt     | Request ID                |
      | Summary_Info_Requestedon_txt   | Requested on              |
      | Summary_Info_Requestedby_txt   | Requested by              |
      | Summary_Info_YourReference_val | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "Claim Missing Deposit service request"
      | Comment_Section_header   | Comments and Supporting Documents                                                            |
      | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentTitle  | New comment / attachment                                                                     |
      | additional_Comment-field | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Additional Comment" textbox
    # Then The element "#submit" should be enabled
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
      | Comments    | Test comments              |
    Then The application should display the "updated status" for "service request"
      | Summary_Info_value4 | In Progress |
    When The user click on the "View Audit History" button
    Then The application should display the "updated status in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  # @md#comments&Attachments#close#yes
  # Scenario: Claim Missing Deposit-  Closing while entering comments Attachments & Attachments - yes
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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

  # @md#comments&Attachments#close#No
  # Scenario: Claim Missing Deposit-  Closing while entering comments Attachments & Attachments - No
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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


  # @md#comments#close#yes
  # Scenario: Claim Missing Deposit-  Closing while entering comments - yes
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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

  # @md#comments#close#No
  # Scenario: Claim Missing Deposit-  Closing while entering comments - No
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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



  # @md#Attachments#close#yes
  # Scenario: Claim Missing Deposit-  Closing while entering Attachments Only - yes
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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

  # @md#AttachmentsOnly#close#No
  # Scenario: Claim Missing Deposit-  Closing while entering Attachments Only - No
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
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


  # @md#Reopen1
  # Scenario: Claim Missing Deposit - Reopen modal/pop-up 'Claim Missing Deposit' request
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit service request in view mode"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Claim Missing Deposit service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Account details" for "Claim Missing Deposit service request in view mode"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
  #     | AccountName            | BO-PENDING                                                                                                        |
  #     | AccountDefaultCurrency | AUD                                                                                                               |
  #     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId         |
  #     | status        | RESOLVED_COMPLETED |
  #     | requestStatus | RESOLVED_COMPLETED |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
  #   Then The application should display the "updated status" for "Claim Missing Deposit service request"
  #     | Summary_Info_YourReference_txt | Request Status |
  #     | Summary_Info_YourReference_val | Completed      |
  #   Then The application should display the "Reopen" button
  #   When The user Clicks the "Reopen" button
  #   Then The application should display the "Reopen" button
  #   Then The application should display the "Reopen model window" for "Direct Debits request"
  #     | reopenModelWindowName            | Reopen Reason                                                                                                 |
  #     | reopenReasonType                 |                                                                                                               |
  #     | reopenReasonNotes                |                                                                                                               |
  #     | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
  #     | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
  #     | reopenEmailLabel                 | Email                                                                                                         |
  #     | reopenEmailInput                 |                                                                                                               |
  #     | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
  #   Then The application should display the "SubmitBtn" button
  #   Then The application should display the "following reason type" for "Claim Missing Deposit under Reopen model window"
  #     | reopen_dropdown_option1 | Please select a reason         |
  #     | reopen_dropdown_option2 | Further Investigation Required |
  #     | reopen_dropdown_option3 | Information Incomplete         |
  #     | reopen_dropdown_option4 | Information Unclear            |


  # @RecallPayment21
  # Scenario: Claim Missing Deposit - Reopen modal/pop-up validations
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "Claim Missing Deposit service request in view mode"
  #     | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
  #     | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Claim Missing Deposit service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Account details" for "Claim Missing Deposit service request in view mode"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
  #     | AccountName            | BO-PENDING                                                                                                        |
  #     | AccountDefaultCurrency | AUD                                                                                                               |
  #     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId         |
  #     | status        | RESOLVED_COMPLETED |
  #     | requestStatus | RESOLVED_COMPLETED |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
  #   Then The application should display the "updated status" for "Claim Missing Deposit service request"
  #     | Summary_Info_YourReference_txt | Request Status |
  #     | Summary_Info_YourReference_val | Completed      |
  #   Then The application should display the "Reopen" button
  #   When The user Clicks the "Reopen" button
  #   Then The application should display the "Reopen" button
  #   Then The application should display the "SubmitBtn" button
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display error message under "reason_errormsg" component
  #     | error_message | Reason is mandatory |
  #   Then The application should display error message under "reasondetail_errormsg" component
  #     | error_message | Reason detail is mandatory |
  #   Then The application should display error message under "email_errormsg" component
  #     | error_message | Please enter a valid email address |
  #   When The user select the "Further Investigation Required" from "reopenReasonType" drop down
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display error message under "reasondetail_errormsg" component
  #     | error_message | Reason detail is mandatory |
  #   Then The application should display error message under "email_errormsg" component
  #     | error_message | Please enter a valid email address |
  #   When The user entered "test@anz.com" in "reopenEmailInput" textbox
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display error message under "reasondetail_errormsg" component
  #     | error_message | Reason detail is mandatory |
  #   Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
  #   When The user entered " " in "reopenEmailInput" textbox
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display error message under "email_errormsg" component
  #     | error_message | Please enter a valid email address |


  # @RecallPayment-Reopen
  # Scenario: Claim Missing Deposit - Reopen submit
  #   Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
  #   When The user navigate to the "Missing Deposit" service request screen
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #     | AccountNo              | 010203 - 123456203                           |
  #   Then The user enters deposit date value
  #     | DepositDate |  February 12, 2020 |
  #   When The user select the "Cash" from "DepositType" drop down
  #   When The user select the "ATM" from "DepositMethod" drop down
  #   When The user Clicks the "BranchDeposit" button
  #   And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
  #   And I am entering "3006" in "Search Branch Lookup" Dialog
  #   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
  #   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
  #   Then The application shows address list in the Grid
  #   When I am selecting first address from Grid
  #   And I am entering the "cash amount details" for "claim missing deposit sr"
  #     | OriginalCashAmount | 500    |
  #     | MissingcashAmount  | 499.98 |
  #   Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
  #     | Your_Reference_header           | Your Reference (optional)                                                                    |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #     | Your_Reference_textbox          |                                                                                              |
  #   Then The user enter "testFCEEyour_reference" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "Claim Missing Deposit on review page"
  #     | AccountHeaderLabel     | Account Details                                     |
  #     | AccountName            | BO-PENDING-APPROVAL                          |
  #     | AccountDefaultCurrency | AUD                                          |
  #     | AccountDescription     | Book Order with New Channel Delivery Address |
  #   Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
  #     | Your_Reference_header | Your Reference (optional) |
  #     | your_reference        | testFCEEyourreference     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Summary Information" for "Claim Missing Deposit service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Account details" for "Claim Missing Deposit service request in view mode"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
  #     | AccountName            | BO-PENDING                                                                                                        |
  #     | AccountDefaultCurrency | AUD                                                                                                               |
  #     | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId         |
  #     | status        | RESOLVED_COMPLETED |
  #     | requestStatus | RESOLVED_COMPLETED |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
  #   Then The application should display the "updated status" for "Claim Missing Deposit service request"
  #     | Summary_Info_YourReference_txt | Request Status |
  #     | Summary_Info_YourReference_val | Completed      |
  #   When The user Clicks the "Reopen" button
  #   When The user select the "Further Investigation Required" from "reopenReasonType" drop down
  #   Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
  #   When The user entered "test@anz.com" in "reopenEmailInput" textbox
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "Confirmation pop-up" for "reopen submitted request"
  #     | reopen_submit_confirm_msg1 | Your Service Request has been |
  #     | reopen_submit_confirm_msg2 | Reopend.                      |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user Clicks the "Ok" button
  #   Then The user waiting to load "SR details"
  #   Then The application shows "Cash Management Service Requests" screen



  @MissingDeposit-Reopen
  Scenario: Claim Missing Deposit - Reopen submit and View
    Given I am an authorised user with permission to create a "Claim Missing Deposit" service request
    When The user navigate to the "Missing Deposit" service request screen
    When The user Clicks the "accountSearch" button
    When The user types in "BO-PENDING-APPROVAL" into the Search "Account" lookup
    Then The user waiting to load "Account details section"
    Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountNo              | 010203 - 123456203                           |
    Then The user enters deposit date value
      | DepositDate |  June 12, 2020 |
    When The user select the "Cash" from "DepositType" drop down
    When The user select the "ATM" from "DepositMethod" drop down
    When The user Clicks the "BranchDeposit" button
    And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "3006" in "Search Branch Lookup" Dialog
   Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
   When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
   Then The application shows address list in the Grid
    When I am selecting first address from Grid
    And I am entering the "cash amount details" for "claim missing deposit sr"
      | OriginalCashAmount | 500    |
      | MissingcashAmount  | 499.98 |
    Then The application should display the "Your Reference section" for "Claim Missing Deposit Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testFCEEyour_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "Claim Missing Deposit on review page"
      | AccountHeaderLabel     | Account Details                                     |
      | AccountName            | BO-PENDING-APPROVAL                          |
      | AccountDefaultCurrency | AUD                                          |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should display the "Your Reference details" for "Claim Missing Deposit on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testFCEEyourreference     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Claim Missing Deposit Service Request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Claim Missing Deposit service request in view mode"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application should display the "Summary Information" for "Claim Missing Deposit service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "Claim Missing Deposit service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                          |
      | AccountName            | BO-PENDING-APPROVAL                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order with New Channel Delivery Address|
    Then The user update the service request status with following details
      | requestId     | responseId         |
      | status        | RESOLVED_COMPLETED |
      | requestStatus | RESOLVED_COMPLETED |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Claim Missing Deposit" and selects it
    Then The application should display the "updated status" for "Claim Missing Deposit service request"
      | Summary_Info_YourReference_txt | Request Status |
      | Summary_Info_YourReference_val | Completed      |
    When The user Clicks the "Reopen" button
    When The user select the "Further Investigation Required" from "reopenReasonType" drop down
    Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
    When The user entered "test@anz.com" in "reopenEmailInput" textbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "Confirmation pop-up" for "reopen submitted request"
      | reopen_submit_confirm_msg1 | Your Service Request has been |
      | reopen_submit_confirm_msg2 | Reopened.                      |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Claim Missing Deposit service request in view mode"
      | recallPaymentTitle | Claim Missing Deposit (AU)                                                                         |
      | recallPaymentDesc  | Submit a claim if a cash or cheque deposit into your account is missing or partially missing. |
    Then The application should display the "Summary Information" for "Claim Missing Deposit service request in view mode"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_txt | Request Status      |
    Then The application should display the "Account details" for "Claim Missing Deposit service request in view mode"
      | AccountHeaderLabel     | Account Details                                                                                                          |
      | AccountName            | BO-PENDING-APPROVAL                                                                                                        |
      | AccountDefaultCurrency | AUD                                                                                                               |
      | AccountDescription     | Book Order with New Channel Delivery Address |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32 |
      | Added by | User Lname          |
      | Comments | reopenReasonText    |



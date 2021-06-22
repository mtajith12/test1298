@ui-mock @api-mock @RACB @Regression @webform
Feature: Request Account Closing Balance
    User should able to Submit a request to receive the closing balance for your Account(s).


    @ACB
    Scenario: Request Account Closing Balance - Create and View
        Given I am an authorised user with permission to create a "Request Account Closing BalanceRequest Account Closing Balance" service request
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
        Then The user click on the "addBtn" button
        Then The application should display the "Account(s) details" for "Request Account Closing Balance enter screen"
            | accountDetail-1 | 010201 - 123456201     |
            | accountDetail-2 | BO-AWAITING-FULFILMENT |
            | accountDetail-3 | AUD                    |
        Then The application should display the "Your Reference section" for "Request Account Closing Balance request"
            | Your_Reference_header           | Your Reference (optional)                                                                    |
            | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
            | Your_Reference_textbox          |                                                                                              |
        Then The user enter "test your reference" into the "your_reference" text field
        When The user Clicks the "Next" button
        Then  The application should display the "progress bar with status" for "Request Account Closing Balance Service Request" text
            | progressBarTxt1 | Select Service Type |
            | progressBarTxt2 | Enter Details       |
            | progressBarTxt3 | Review & Submit     |
        Then The application should display the "Service Request details" for "Request Account Closing Balance on review page"
            | amendStatementTitle   | Request Account Closing Balance (AU)                                 |
            | amendStatementDesc    | Submit a request to receive the closing balance for your Account(s). |
            | accountsLabel         | Account(s)                                                           |
            | accountNumber         | Account Number                                                       |
            | accountDetail-1       | 010201 - 123456201                                                   |
            | accountDetail-2       | BO-AWAITING-FULFILMENT                                               |
            | Your_Reference_header | Your Reference (optional)                                            |
            | your_reference        | test your reference                                                  |
        When The user click on the "importantInfoinput" checkbox
        When The user click on the "Submit" button
        Then The application shows "Manual email modal" dialog
        When The user entered "test@anz.com" in "EmailId" textbox
        When The user click on the "Ok" button
        Then The request id is stored from the element "responseId"
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
            | Summary_Info_TypeofEnquiry_txt   | Completion Date                                                      |
            | amendStatementTitle              | Request Account Closing Balance (AU)                                 |
            | amendStatementDesc               | Submit a request to receive the closing balance for your Account(s). |
            | accountsLabel                    | Account(s)                                                           |
            | accountNumber                    | Account Number                                                       |
            | accountName                      | Account Name                                                         |
            | currency                         | Currency                                                             |
            | AccountClosingBalance            | Account Closing Balance                                              |
            | accountDetail-1                  | 010201-123456201                                                     |
            | accountDetail-2                  | BO-AWAITING-FULFILMENT                                               |
            | accountDetail-3                  | AUD                                                                  |
            | Comment_Section_header           | Comments and Supporting Documents                                    |
            | Comment_Section_Date_txt         | Date                                                                 |
            | Comment_Section_AddedBy_txt      | Added by                                                             |
            | Comment_Section_Comments_txt     | Comments                                                             |
            | Comment_Section_Attachments_txt  | Attachments                                                          |
        Then I click on "viewAuditHistory"
        Then The application should display the "status as Submitted in Audit history" for "service request"
            | AuditHistoryStatus | Submitted |

    @ACB#UIValidations
    Scenario: Request Account Closing Balance - without selecting accounts
        Given I am an authorised user with permission to create a "Request Account Closing Balance" service request
        When The user navigate to the "Request Account Closing Balance" service request screen
        When The user Clicks the "Next" button
        Then The application should display error message under "accounts-error" section
            | error_message | Please select at least one account to proceed |
        * For Acceptance Criteria "without selecting important info"
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
        Then The user click on the "addBtn" button
        Then The application should display the "Account(s) details" for "Request Account Closing Balance enter screen"
            | accountDetail-1 | 010201 - 123456201     |
            | accountDetail-2 | BO-AWAITING-FULFILMENT |
            | accountDetail-3 | AUD                    |
        Then The application should display the "Your Reference section" for "Request Account Closing Balance request"
            | Your_Reference_header           | Your Reference (optional)                                                                    |
            | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
            | Your_Reference_textbox          |                                                                                              |
        Then The user enter "test your reference" into the "your_reference" text field
        When The user Clicks the "Next" button
        Then The application should display the "Service Request details" for "Request Account Closing Balance on review page"
            | amendStatementTitle | Request Account Closing Balance (AU)                                 |
            | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
        When The user click on the "Submit" button
        Then The application should display error message under "Important Information" section
            | error_message | Please select the checkbox to confirm you have read and understood the above information |
        * For Acceptance Criteria "more than 10 acconts"
        Then The user click on the "Sellect_All_Accounts" checkbox
        Then The user click on the "addBtn" button
        Then The application should display error message under "accounts-error" section
            | error_message | The selected account(s) could not be added as the maximum of 10 was exceeded |


    @ACBsearch
    Scenario: Request Account Closing Balance - Create with single account and search
        Given I am an authorised user with permission to create a "Request Account Closing BalanceRequest Account Closing Balance" service request
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
        Then The user click on the "addBtn" button
        Then The application should display the "Account(s) details" for "Request Account Closing Balance enter screen"
            | accountDetail-1 | 010201 - 123456201     |
            | accountDetail-2 | BO-AWAITING-FULFILMENT |
            | accountDetail-3 | AUD                    |
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
            | accountDetail-1       | 010201 - 123456201                                                   |
            | accountDetail-2       | BO-AWAITING-FULFILMENT                                               |
            | accountDetail-3       | AUD                                                                  |
            | currency              | Currency                                                             |
            | Your_Reference_header | Your Reference (optional)                                            |
            | your_reference        | test your reference                                                  |
        When The user click on the "importantInfoinput" checkbox
        When The user click on the "Submit" button
        Then The application shows "Manual email modal" dialog
        When The user entered "test@anz.com" in "EmailId" textbox
        When The user click on the "Ok" button
        Then The request id is stored from the element "responseId"
        Then The application should display the "Confirmation pop-up" for "DDR Service Request"
            | request_status             | Submitted                     |
            | view_request_link          | View Request Details          |
            | raise_another_request_link | Raise another Service Request |
        Then The "responseId" for the "Request Account Closing Balance" is detail is saved to a file
        Then The user click on the "Ok" button
        Then The user searches the stored service request with request type "Request Account Closing Balance" search req type "Request Account Closing Balance" and selects it
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
            | accountDetail-1                  | 010201-123456201                                                     |
            | accountDetail-2                  | BO-AWAITING-FULFILMENT                                               |
            | accountDetail-3                  | AUD                                                                  |
            | currency                         | Currency                                                             |
            | Comment_Section_header           | Comments and Supporting Documents                                    |
            | Comment_Section_Date_txt         | Date                                                                 |
            | Comment_Section_AddedBy_txt      | Added by                                                             |
            | Comment_Section_Comments_txt     | Comments                                                             |
            | Comment_Section_Attachments_txt  | Attachments                                                          |
        Then I click on "viewAuditHistory"
        Then The application should display the "status as Submitted in Audit history" for "service request"
            | AuditHistoryStatus | Submitted |


    @ACBWithMultipleAccountssearch
    Scenario: Request Account Closing Balance - Create with Multiple accounts and search
        Given I am an authorised user with permission to create a "Request Account Closing BalanceRequest Account Closing Balance" service request
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
        Then The application should display the "Account(s) details" for "Request Account Closing Balance enter screen"
            | accountDetail-1 | 010201 - 123456201     |
            | accountDetail-2 | BO-AWAITING-FULFILMENT |
            | accountDetail-3 | AUD                    |
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
            | accountDetail-1       | 010201 - 123456201                                                   |
            | accountDetail-2       | BO-AWAITING-FULFILMENT                                               |
            | accountDetail-3       | AUD                                                                  |
            | accountDetail-2.1     | 010204 - 123456204                                                   |
            | accountDetail-2.2     | BO-UNSUCCESSFUL                                                      |
            | accountDetail-2.3     | AUD                                                                  |
            # | accountDetail-3.1     | 010203 - 123456203                                                   |
            # | accountDetail-3.2     | BO-PENDING-APPROVAL                                                  |
            # | accountDetail-3.3     | AUD                                                                  |
            | currency              | Currency                                                             |
            | Your_Reference_header | Your Reference (optional)                                            |
            | your_reference        | test your reference                                                  |
        When The user click on the "importantInfoinput" checkbox
        When The user click on the "Submit" button
        Then The application shows "Manual email modal" dialog
        When The user entered "test@anz.com" in "EmailId" textbox
        When The user click on the "Ok" button
        Then The request id is stored from the element "responseId"
        Then The application should display the "Confirmation pop-up" for "DDR Service Request"
            | request_status             | Submitted                     |
            | view_request_link          | View Request Details          |
            | raise_another_request_link | Raise another Service Request |
        Then The "responseId" for the "Request Account Closing Balance" is detail is saved to a file
        Then The user click on the "Ok" button
        Then The user searches the stored service request with request type "Request Account Closing Balance" search req type "Request Account Closing Balance" and selects it
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
            | accountDetail-1                  | 010201-123456201                                                     |
            | accountDetail-2                  | BO-AWAITING-FULFILMENT                                               |
            | accountDetail-3                  | AUD                                                                  |
            | accountDetail-2.1                | 010204-123456204                                                     |
            | accountDetail-2.2                | BO-UNSUCCESSFUL                                                      |
            | accountDetail-2.3                | AUD                                                                  |
            # | accountDetail-3.1                | 010203 - 123456203                                                   |
            # | accountDetail-3.2                | BO-PENDING-APPROVAL                                                  |
            # | accountDetail-3.3                | AUD                                                                  |
            | currency                         | Currency                                                             |
            | Comment_Section_header           | Comments and Supporting Documents                                    |
            | Comment_Section_Date_txt         | Date                                                                 |
            | Comment_Section_AddedBy_txt      | Added by                                                             |
            | Comment_Section_Comments_txt     | Comments                                                             |
            | Comment_Section_Attachments_txt  | Attachments                                                          |




    @ACB#UIerror2
    Scenario: Request Account Closing Balance - Selected more than 10 accounts
        Given I am an authorised user with permission to create a "Request Account Closing Balance" service request
        When The user navigate to the "Request Account Closing Balance" service request screen
        Then The user click on the "addAccountbtn" button
        Then The application should display the "Account Model" for "Request Account Closing Balance enter screen"
            | accountDialogInlineSearch_dialog-title | Add Account       |
            | account_Name                           | Account Name      |
            | accNum                                 | Account Number    |
            | Currency                               | Currency          |
            | LegalEntityName                        | Legal Entity Name |
            | cancelBtn                              | Cancel            |
            | addBtn                                 | Add               |
        Then The user click on the "Sellect_All_Accounts" checkbox
        Then The user click on the "addBtn" button
        Then The application should display error message under "accounts-error" section
            | error_message | The selected account(s) could not be added as the maximum of 10 was exceeded |


    @ACB#UIerror3
    Scenario: Request Account Closing Balance - without selecting Important info
        Given I am an authorised user with permission to create a "Request Account Closing Balance" service request
        When The user navigate to the "Request Account Closing Balance" service request screen
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
        Then The user enter "test your reference" into the "your_reference" text field
        When The user Clicks the "Next" button
        Then The application should display the "Service Request details" for "Request Account Closing Balance on review page"
            | amendStatementTitle | Request Account Closing Balance (AU)                                 |
            | amendStatementDesc  | Submit a request to receive the closing balance for your Account(s). |
        When The user click on the "Submit" button
        Then The application should display error message under "Important Information" section
            | error_message | Please select the checkbox to confirm you have read and understood the above information |


    @Requesttypesearch
    Scenario: Request Account Closing Balance - Search based on RequestType Search Criteria
        Given The user on the service request history page
        When The user open the search fields
        And The user click into the "Request type" field
        Then The user should be able to see and select "Request Account Closing Balance"
        When The user Clicks the "summaryGridsearch" button
        Then User should only see request history items that relate to "Request Account Closing Balance"
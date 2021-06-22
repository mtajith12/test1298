@ui-mock @api-mock @MBF @Regression @webform
Feature: Manage Bank Feeds
  User should able raise a Manage Bank Feeds SR.

  @MBF
  Scenario: Manage Bank Feeds - Activate Bank Feeds -Intuit Quickbooks
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    Then  The application should display the "Select Enquiry Type" for "Manage Bank Feeds Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
      | accountDialogInlineSearch_dialog-title | Add Account       |
      | account_Name                           | Account Name      |
      | accNum                                 | Account Number    |
      | Currency                               | Currency          |
      | LegalEntityName                        | Legal Entity Name |
      | cancelBtn                              | Cancel            |
      | addBtn                                 | Add               |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Manage Bank Feeds Service Request" text
      | progressBarTxt1 | Select Service Type |
      | progressBarTxt2 | Enter Details       |
      | progressBarTxt3 | Review & Submit     |
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | accountsLabel                   | Account(s)                  |
      | accountNumber                   | Account Name                |
     # | accountDetail-1                 | BO-AWAITING-FULFILMENT      |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
     | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |


  @MBF3
  Scenario: Manage Bank Feeds - Activate Bank Feeds -MYOB
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "MYOB" from "accountSoftwarePlatform" drop down
    Then The user enter "myobBankFeedReferenceNo123" into the "myobBankFeedReferenceNo" text field
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Manage Bank Feeds enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account       |
      | account_Name                           | Account Name      |
      | accNum                                 | Account Number    |
      | Currency                               | Currency          |
      | LegalEntityName                        | Legal Entity Name |
      | cancelBtn                              | Cancel            |
      | addBtn                                 | Add               |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user click on the "historicalData-1" button
    When The user select the "No historical data" from "historicalData-cell.active-1" drop down
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)          |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.               |
      | requestType-title               | Request Type                    |
      | manageBankFeedRequestType-label | Request Type                    |
      | accountSoftwarePlatform-label   | Accounting Software Platform       |
      | accountingSoftwareDetails-title | Accounting Software Details     |
      | myobBankFeedReferenceNo-label   | MYOB Bank Feed Reference Number |
      | myobBankFeedReferenceNo         | myobBankFeedReferenceNo123      |
      | accountsLabel                   | Account(s)                      |
      | accountTableLabel-1             | Account Number                  |
      | accountTableLabel-2             | Account Name                    |
      | accountTableLabel-3             | Historical Data                 |
      | accountDetailVal-1              | 010201 - 123456201              |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT          |
      | accountDetailVal-3              | No historical data              |
      | Your_Reference_header           | Your Reference (optional)       |
      | your_reference                  | test your reference             |
      | importantInfoContainer-title    | Important Information           |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |

  @MBF-RECKON
  Scenario: Manage Bank Feeds - Activate Bank Feeds - RECKON
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | userId                          | userId123                   |
      | email-Address                   | emailAddress@anz.com        |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | userId                           | userId123                         |
      | email-Address                    | emailAddress@anz.com              |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |


  @MBF-SAASU
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAASU
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | username                        | username123                 |
      | fileId                          | fileId123                   |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | username                         | username123                       |
      | fileId                           | fileId123                         |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |




  @MBF-SAGE
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAGE
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.          |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | practiceId                      | practiceId123               |
      | clientId                        | clientId123                 |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | practiceId                       | practiceId123                     |
      | clientId                         | clientId123                       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |




  @MBF-SISS
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SISS
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | practiceId                      | practiceId123               |
      | clientId                        | clientId123                 |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | practiceId                       | practiceId123                     |
      | clientId                         | clientId123                       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |

  @MBF-XERO
  Scenario: Manage Bank Feeds - Activate Bank Feeds -XERO
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | organisationName                | organisationName123         |
      | username                        | username                   |
      | accountsLabel                   | Account(s)                  |
      | accountNumber                   | Account Name                |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | organisationName                 | organisationName123               |
      | username                         | username                         |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |



  @MBF2
  Scenario: Manage Bank Feeds - Activate Bank Feeds -Intuit Quickbooks
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle   | Manage Bank Feeds (AU)    |
      | amendStatementDesc    | Activate or deactivate bank feeds from your accounts to your chosen accounting software.         |
      | accountsLabel         | Account(s)                |
      | accountNumber         | Account Name              |
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | test your reference       |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |


  @MBF3
  Scenario: Manage Bank Feeds - Activate Bank Feeds -MYOB
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
      | INTUIT | Intuit Quickbooks |
      | MYOB   | MYOB              |
      | RECKON | Reckon            |
      | SAASU  | Saasu             |
      | SAGE   | SAGE              |
      | SISS   | SISS              |
      | XERO   | XERO              |
    When The user select the "MYOB" from "accountSoftwarePlatform" drop down
    Then The user enter "myobBankFeedReferenceNo123" into the "myobBankFeedReferenceNo" text field
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)          |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.               |
      | requestType-title               | Request Type                    |
      | manageBankFeedRequestType-label | Request Type                    |
      | accountSoftwarePlatform-label   | Accounting Software Platform       |
      | accountingSoftwareDetails-title | Accounting Software Details     |
      | myobBankFeedReferenceNo-label   | MYOB Bank Feed Reference Number |
      | myobBankFeedReferenceNo         | myobBankFeedReferenceNo123      |
      | accountsLabel                   | Account(s)                      |
      | accountTableLabel-1             | Account Number                  |
      | accountTableLabel-2             | Account Name                    |
      | accountTableLabel-3             | Historical Data                 |
      | accountDetailVal-1              | 010201 - 123456201              |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT          |
      | accountDetailVal-3              | No historical data              |
      | Your_Reference_header           | Your Reference (optional)       |
      | your_reference                  | test your reference             |
      | importantInfoContainer-title    | Important Information           |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |


  @MBF-RECKON
  Scenario: Manage Bank Feeds - Activate Bank Feeds - RECKON
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | userId                          | userId123                   |
      | email-Address                   | emailAddress@anz.com        |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | userId                           | userId123                         |
      | email-Address                    | emailAddress@anz.com              |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |


  @MBF-SAASU
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAASU
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | username                        | username123                 |
      | fileId                          | fileId123                   |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | username                         | username123                       |
      | fileId                           | fileId123                         |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |




  @MBF-SAGE
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SAGE
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | practiceId                      | practiceId123               |
      | clientId                        | clientId123                 |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | practiceId                       | practiceId123                     |
      | clientId                         | clientId123                       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |



  @MBF-SISS
  Scenario: Manage Bank Feeds - Activate Bank Feeds - SISS
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | practiceId                      | practiceId123               |
      | clientId                        | clientId123                 |
      | accountsLabel                   | Account(s)                  |
      | accountTableLabel-1             | Account Number              |
      | accountTableLabel-2             | Account Name                |
      | accountTableLabel-3             | Historical Data             |
      | accountDetailVal-1              | 010201 - 123456201          |
      | accountDetailVal-2              | BO-AWAITING-FULFILMENT      |
      | accountDetailVal-3              | No historical data          |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
      | importantInfoContainer-title    | Important Information       |
    #  | imp_info                        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | practiceId                       | practiceId123                     |
      | clientId                         | clientId123                       |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | accountDetailVal-3               | No historical data                |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |

  @MBF-XERO
  Scenario: Manage Bank Feeds - Activate Bank Feeds -XERO
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "optionDeactivateBankFeed" button
    Then  The application should display the "requestType details" for "Manage Bank Feeds Service Request"
      | requestType-title                      | Select Request Type               |
      | manageBankFeedRequestType-label        | Request Type                      |
      | manageBankFeedRequestType-field-label1 | Activate Bank Feeds               |
      | manageBankFeedRequestType-field-label2 | Deactivate Bank Feeds             |
      | accountSoftwarePlatform-label          | Accounting Software Platform         |
      | accountingSoftwareDetails-title        | Enter Accounting Software Details |
    Then The application should display the "following Accounting Software Platform" for "Accounting Software Platform drop-down"
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
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountGrid-Details-1 | 010201 - 123456201     |
      | accountGrid-Details-2 | BO-AWAITING-FULFILMENT |
    Then The application should display the "Your Reference section" for "Manage Bank Feeds request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle             | Manage Bank Feeds (AU)      |
      | amendStatementDesc              | Activate or deactivate bank feeds from your accounts to your chosen accounting software.           |
      | requestType-title               | Request Type                |
      | manageBankFeedRequestType-label | Request Type                |
      | accountSoftwarePlatform-label   | Accounting Software Platform   |
      | accountingSoftwareDetails-title | Accounting Software Details |
      | organisationName                | organisationName123         |
      | username                        | username                   |
      | accountsLabel                   | Account(s)                  |
      | accountNumber                   | Account Name                |
       | accountDetailVal-1               | 010201 - 123456201                 |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | Your_Reference_header           | Your Reference (optional)   |
      | your_reference                  | test your reference         |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                |
      | requestType-title                | Request Type                      |
      | manageBankFeedRequestType-label  | Request Type                      |
      | accountSoftwarePlatform-label    | Accounting Software Platform         |
      | accountingSoftwareDetails-title  | Accounting Software Details       |
      | organisationName                 | organisationName123               |
      | username                         | username                         |
      | accountsLabel                    | Account(s)                        |
      | accountNumber                    | Account Name                      |
      | accountDetailVal-1               | 010201-123456201                  |
      | accountDetailVal-2               | BO-AWAITING-FULFILMENT            |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |



  @MBF2.2
  Scenario: Manage Bank Feeds - 'Selecting mutiple accounts and submit
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "MYOB" from "accountSoftwarePlatform" drop down
    Then The user enter "myobBankFeedReferenceNo123" into the "myobBankFeedReferenceNo" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Manage Bank Feeds enter screen"
      | accountDetail-1   | 010201 - 123456201     |
      | accountDetail-2   | BO-AWAITING-FULFILMENT |
      # | accountDetail-2.1 | 123456203              |
      # | accountDetail-2.2 | Test Account3          |
      # | accountDetail-3.1 | 123456205              |
      # | accountDetail-3.2 | Test Account5          |
      Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle   | Manage Bank Feeds (AU)    |
      | amendStatementDesc    | Activate or deactivate bank feeds from your accounts to your chosen accounting software.         |
      | accountsLabel         | Account(s)                |
      | accountName           | Account Name              |
      | accountNumber         | Account Number            |
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | test your reference       |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Manage Bank Feeds request"
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Cash Management Service Requests" for "Manage Bank Feeds request"
      | Cash Management Service Requests | Cash Management Service Requests |
      | summaryGrid-RequestType1         | Manage Bank Feeds                |
      | summaryGrid-RequestType2         | Manage Bank Feeds                |
      | summaryGrid-RequestType3         | Manage Bank Feeds                |

  @MBF
  Scenario: Manage Bank Feeds - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
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
     When The user navigate to the "Manage Bank Feeds" service request screen
       Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
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
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
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



  @MBF#T
  Scenario: Manage Bank Feeds - Toggling b/w Amend types
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application shows the "cancel" button
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "accountDetail" for "Manage Bank Feeds enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      Then The user click on the "optionDeactivateBankFeed" radioButton
    Then The application does not show "accountDetail" section
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "accountDetail" for "Manage Bank Feeds enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
       When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle | Manage Bank Feeds (AU)  |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.       |
      | accountsLabel       | Account(s)              |
      | accountName         | Account Name            |
      | accountNumber       | Account Number          |
      | accountDetail-1     | 010201 - 123456201      |
      | accountDetail-2     | BO-AWAITING-FULFILMENT  |
       When The user Clicks the "Previous" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The application does not show "accountDetail" section
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "accountDetail" for "Manage Bank Feeds enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
     When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
      | accountsLabel       | Account(s)             |
      | accountName         | Account Name           |
      | accountNumber       | Account Number         |
      When The user Clicks the "Previous" button
    Then The user click on the "ResumePaperStatements" radioButton
    Then The application does not show "accountDetail" section


  @MBF#UIValidations
  Scenario: Manage Bank Feeds - without selecting accounts
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "accounts-error" section
      | error_message | Please select at least one account to proceed |


  @MBFsearch
  Scenario: Manage Bank Feeds - Activate Bank Feeds -  Create and search
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle   | Manage Bank Feeds (AU)    |
      | amendStatementDesc    | Activate or deactivate bank feeds from your accounts to your chosen accounting software.        |
     | accountsLabel         | Account(s)                |
      | accountName           | Account Name              |
      | accountNumber         | Account Number            |
      |  Your_Reference_header | Your Reference (optional) |
      | your_reference        | test your reference       |
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
    Then The "responseId" for the "Manage Bank Feeds" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Manage Bank Feeds" search req type "Manage Bank Feeds" and selects it
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Manage Bank Feeds request in view mode"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | Summary_Info_RequestStatus_txt   | Your Reference                    |
      | Summary_Info_YourReference_txt   | Request Status                    |
      | Summary_Info_YourReference_value | test your reference               |
      | amendStatementTitle              | Manage Bank Feeds (AU)            |
      | amendStatementDesc               | Activate or deactivate bank feeds from your accounts to your chosen accounting software.                 |
      | accountsLabel                    | Account                           |
      | accountName                      | Account Name                      |
      | accountNumber                    | Account Number                    |
      | Comment_Section_header           | Comments and Supporting Documents |
      | Comment_Section_Date_txt         | Date                              |
      | Comment_Section_AddedBy_txt      | Added by                          |
      | Comment_Section_Comments_txt     | Comments                          |
      | Comment_Section_Attachments_txt  | Attachments                       |





  @MBF#UIerror
  Scenario: Manage Bank Feeds - without selecting Important info
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The user click on the "ActivateBankFeedsRaidoBtn" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Manage Bank Feeds on review page"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |

  @MBF-UIError
  Scenario: Manage Bank Feeds - Intuit Quickbooks UI Validation check
    Given I am an authorised user with permission to create a "Manage Bank Feeds" service request
    When The user navigate to the "Manage Bank Feeds" service request screen
    Then The application should display the "Service Request Header" for "Manage Bank Feeds"
      | amendStatementTitle | Manage Bank Feeds (AU) |
      | amendStatementDesc  | Activate or deactivate bank feeds from your accounts to your chosen accounting software.      |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "INTUIT" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "companyId-error" section
      | error_message | Company ID is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "INTUIT" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "companyId-error" section
      | error_message | Company ID is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "MYOB" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "myobBankFeedReferenceNo-error" section
      | error_message | MYOB Bank Feed Reference Number is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "MYOB" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "myobBankFeedReferenceNo-error" section
      | error_message | MYOB Bank Feed Reference Number is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "RECKON" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "userId-error" section
      | error_message | User ID/Username is mandatory |
    Then The application should display error message under "emailAddress-error" section
      | error_message | Email Address is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "RECKON" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "userId-error" section
      | error_message | User ID/Username is mandatory |
    Then The application should display error message under "emailAddress-error" section
      | error_message | Email Address is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "SAASU" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "fileId-error" section
      | error_message | File ID is mandatory |
    Then The application should display error message under "username-error" section
      | error_message | Username is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "SAASU" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "fileId-error" section
      | error_message | File ID is mandatory |
    Then The application should display error message under "username-error" section
      | error_message | Username is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "SAGE" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "practiceId-error" section
      | error_message | Practice ID is mandatory |
    Then The application should display error message under "clientId-error" section
      | error_message | Client ID is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "SAGE" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "practiceId-error" section
      | error_message | Practice ID is mandatory |
    Then The application should display error message under "clientId-error" section
      | error_message | Client ID is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "SISS" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "practiceId-error" section
      | error_message | Practice ID is mandatory |
    Then The application should display error message under "clientId-error" section
      | error_message | Client ID is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "SISS" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "practiceId-error" section
      | error_message | Practice ID is mandatory |
    Then The application should display error message under "clientId-error" section
      | error_message | Client ID is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "organisationName-error" section
      | error_message | Organisation Name is mandatory |
    Then The application should display error message under "username-error" section
      | error_message | Username is mandatory |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    When The user Clicks the "Next" button
    Then The application should display error message under "organisationName-error" section
      | error_message | Organisation Name is mandatory |
    Then The application should display error message under "username-error" section
      | error_message | Username is mandatory |
    When The user Clicks the "optionDeactivateBankFeed" button
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "accounts-error" section
      | error_message | Please select at least one account to proceed |
    When The user Clicks the "ActivateBankFeedsRaidoBtn" button
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    When The user Clicks the "Next" button
    Then The application should display error message under "accounts-error" section
      | error_message | Please select at least one account to proceed |
    Then The user click on the "optionDeactivateBankFeed" radioButton
    When The user select the "XERO" from "accountSoftwarePlatform" drop down
    Then The user enter "organisationName123" into the "organisationName" text field
    Then The user enter "username" into the "username" text field
    Then The user click on the "addAccountbtn" button
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

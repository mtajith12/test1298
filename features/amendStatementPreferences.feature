@ui-mock @api-mock @ASP @Regression @webform
Feature: Amend Statement Preferences
  User should able to Amend the preferences for your account statements.

  @ASP_local
  Scenario: Amend Statement Preferences - Service Request Header and Progress Bar
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Enquiry Type" for "Amend Statement Preferences Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
    Then The application should display the "Enquiry details" for "Amend Statement Preferences Service Request"
      | SelectAmendmentType                              | Select Amendment Type                                  |
      | amendmentType-label                              | Amendment Type                                         |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    When The user Clicks the "Next" button
    Then  The application should display the "progress bar with status" for "Amend Statement Preferences Service Request" text
      | progressBarTxt1    | Select Service Type |
      | progressBarTxt2    | Enter Details       |
      | progressBarTxt3    | Review & Submit     |
      | progressBarStatus1 | Completed           |
      | progressBarStatus2 | Completed           |
      | progressBarStatus3 | Current             |

  @ASP2.1
  Scenario: Amend Statement Preferences - 'Select Account(s)' in Enter,review & view page
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StopPaperStatements" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account       |
      | account_Name                           | Account Name      |
      | accNum                                 | Account Number    |
      | Currency                               | Currency          |
      | LegalEntityName                        | Legal Entity Name |
      | cancelBtn                              | Cancel            |
      | addBtn                                 | Add               |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |


  @ASP2
  Scenario: Amend Statement Preferences - Stop Paper Statements - Enter,review & view page
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    # Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
    #   | amendmentTypeNote | Note: by stopping paper statements, only e-Statements will be issued for your account(s). |
    Then The user click on the "StopPaperStatements" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen" text
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    Then The application should display the "Your Reference section" for "Amend Statement Preferences request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Stop Paper Statements                              |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | accountDetail-1       | 010201 - 123456201                                 |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3       | AUD                                                |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | amendmentType-label              | Amendment Type                                     |
      | amendmentType-field              | Stop Paper Statements                              |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      | accountDetail-1                  | 010201-123456201                                   |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3                  | AUD                                                |
      | currency                         | Currency                                           |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |
    Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
      | amendmentTypeNote | Note: by stopping paper statements, only e-Statements will be issued for your account(s). |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @ASP33
  Scenario: Amend Statement Preferences - Resume Paper Statements - Enter,review & view page
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "ResumePaperStatements" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    #  Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
    #     | amendmentTypeNote | Note: paper statements will resume back to the existing statement address, cycle and frequency for each account. |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    Then The application should display the "Your Reference section" for "Amend Statement Preferences request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Resume Paper Statements                            |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | accountDetail-1       | 010201 - 123456201                                 |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3       | AUD                                                |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | amendmentType-label              | Amendment Type                                     |
      | amendmentType-field              | Resume Paper Statements                            |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      | accountDetail-1                  | 010201-123456201                                   |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3                  | AUD                                                |
      | currency                         | Currency                                           |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |
    Then The application should display the "amendmentTypeNote" for "Amend Statement Preferences" text
      | amendmentTypeNote |Note: paper statements will resume back to the existing frequency and address for each Account.|
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @ASP2.2
  Scenario: Amend Statement Preferences - 'Selecting mutiple accounts and submit
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "addBtn" button
    # Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name        |                        |
      | accountDetail-1   | 010201 - 123456201     |
      | accountDetail-2   | BO-AWAITING-FULFILMENT |
      | accountDetail-3   | AUD                    |
      | accountDetail-2.1 | 010203 - 123456203     |
      | accountDetail-2.2 | BO-PENDING-APPROVAL    |
      | accountDetail-2.3 | AUD                    |
      | accountDetail-3.1 | 010205 - 123456205     |
      | accountDetail-3.2 | BO-UNABLE-TO-APPROVE   |
      | accountDetail-3.3 | AUD                    |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Stop Paper Statements                              |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | accountDetail-1       | 010201 - 123456201                                 |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3       | AUD                                                |
      | accountDetail-2.1     | 010203 - 123456203                                 |
      | accountDetail-2.2     | BO-PENDING-APPROVAL                                |
      | accountDetail-2.3     | AUD                                                |
      | accountDetail-3.1     | 010205 - 123456205                                 |
      | accountDetail-3.2     | BO-UNABLE-TO-APPROVE                               |
      | accountDetail-3.3     | AUD                                                |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
   Then The application should display following fields "Cash Management Service Requests for Manage Bank Feeds request"
      | field_name                |
      | Cash Management Service Requests | 
      | summaryGrid-RequestType1         | 
      | summaryGrid-RequestType2         | 
      | summaryGrid-RequestType3         | 

  @ASP3
  Scenario: Amend Statement Preferences - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
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
    * For Acceptance Criteria "Cancel button after selecting Amend type"
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
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

    * For Acceptance Criteria "Cancel Service Request prior to submission on 'Review and Submit' screen"
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
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
    When The user Clicks the "Cancel" button
    * For Acceptance Criteria "Closing the email modal Clicks the Ok button"
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    When The user Clicks the "Next" button
    When The user click on the "importantInfoinput" checkbox
    When The user Clicks the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "anz@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then "Manual email" modal window must close


  @ASP#T
  Scenario: Amend Statement Preferences - Toggling b/w Amend types
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle                              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc                               | Amend the preferences for your account statements.     |
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The application shows the "cancel" button
    Then The user click on the "ResumePaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    #Then The application should display the "accountDetail" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    Then The user click on the "StopPaperStatements" radioButton
    Then The application does not show "accountDetail" section
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    #  Then The application should display the "accountDetail" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    Then The user click on the "ResumePaperStatements" radioButton
    Then The application does not show "accountDetail" section
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "accountDetail" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Resume Paper Statements                            |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user Clicks the "Previous" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The application does not show "accountDetail" section
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    # Then The application should display the "accountDetail" for "Amend Statement Preferences enter screen"
    Then The application should display following fields "Account(s) details"
      | field_name      |                        |
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user Clicks the "Previous" button
    Then The user click on the "ResumePaperStatements" radioButton
    Then The application does not show "accountDetail" section


  @ASP#UIValidations
  Scenario: Amend Statement Preferences - without selecting accounts
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "ResumePaperStatements" radioButton
    When The user Clicks the "Next" button
    Then The application should display error message under "accounts-error" section
      | error_message | Please select at least one account to proceed |


  @ASPsearch
  Scenario: Amend Statement Preferences - Resume Paper Statements -  Create and search
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "ResumePaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Resume Paper Statements                            |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | accountDetail-1       | 010201 - 123456201                                 |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3       | AUD                                                |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
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
    Then The "responseId" for the "Amend Statement Preferences" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Amend Statement Preferences" search req type "Amend Statement Preferences" and selects it
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      | accountDetail-1                  | 010201-123456201                                   |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3                  | AUD                                                |
      | currency                         | Currency                                           |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |


  @ASPsearch
  Scenario: Amend Statement Preferences - Stop Paper Statements - Create and search
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Amend Statement Preferences" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Amend Statement Preferences" search req type "Amend Statement Preferences" and selects it
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                |
      | Summary_Info_RequestID_txt       | Request ID                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                     |
      | Summary_Info_YourReference_txt   | Request Status                                     |
      | Summary_Info_YourReference_value | test your reference                                |
      | amendStatementTitle              | Amend Statement Preferences (AU)                   |
      | amendStatementDesc               | Amend the preferences for your account statements. |
      | accountsLabel                    | Account(s)                                         |
      | accountName                      | Account Name                                       |
      | accountNumber                    | Account Number                                     |
      | currency                         | Currency                                           |
      | accountDetail-1                  | 010201-123456201                                   |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3                  | AUD                                                |
      | currency                         | Currency                                           |
      | Comment_Section_header           | Comments and Supporting Documents                  |
      | Comment_Section_Date_txt         | Date                                               |
      | Comment_Section_AddedBy_txt      | Added by                                           |
      | Comment_Section_Comments_txt     | Comments                                           |
      | Comment_Section_Attachments_txt  | Attachments                                        |

  @ASM#CancelRequest
  Scenario: Amend Statement Preferences - Stop Paper Statements - Cancel Request
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "DDR Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then The "responseId" for the "Amend Statement Preferences" is detail is saved to a file
    Then The user click on the "Ok" button
    Then The user searches the stored service request with request type "Amend Statement Preferences" search req type "Amend Statement Preferences" and selects it
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
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
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "status as Cancelled" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Cancelled   |

  @ASM#CancelRequest1
  Scenario: Amend Statement Preferences - Stop Paper Statements - Cancel Request After SR staus is in-progress
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                   |
      | amendStatementDesc    | Amend the preferences for your account statements. |
      | amendmentType-label   | Amendment Type                                     |
      | amendmentType-field   | Stop Paper Statements                              |
      | accountsLabel         | Account(s)                                         |
      | accountName           | Account Name                                       |
      | accountNumber         | Account Number                                     |
      | currency              | Currency                                           |
      | accountDetail-1       | 010201 - 123456201                                 |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3       | AUD                                                |
      | currency              | Currency                                           |
      | Your_Reference_header | Your Reference (optional)                          |
      | your_reference        | test your reference                                |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "request status as More Information Required" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval           |
    Then The application should display the "Cancel Request" button
    When The user Clicks the "Cancel Request" button
    Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
      | cancelDialog-title | Cancel Service Request                                                                        |
     # | importantInfoText  | Your request will be reviewed by ANZ before the cancellation can be confirmed.                |
      | reason-label       | Cancel Reason                                                                                 |
      | notes-label        | Please provide cancellation details                                                           |
      | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #  Then The application should display the "disclaimer Message" for "Add User service request" text
  #    | disclaimerMessage | I acknowledge that any Fees and/or Charges already charged for this service request may not be reversed. |
    Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
      | reasonoption1 |                              |
      | reasonoption2 | Duplicate Request            |
      | reasonoption3 | Request No Longer Required   |
      | reasonoption4 | Request Resolved             |
    #  | reasonoption5 | Partial Request Cancellation |
    Then The application should display the "SubmitBtn" button
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "following Cancel Request type" for "SR under cancel model window"
      | reason-error          | Cancellation Reason is mandatory                      |
      | notes-error           | Cancellation details are mandatory                    |
   #   | importantErrorMessage | Please read and acknowledge by selecting the checkbox |
    When The user Clicks the "cancel" button
    Then The application does not show "cancelDialog" dialog
    When The user Clicks the "Cancel Request" button
    When The user select the "Duplicate Request" from "cancelReasonType" drop down
    Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
  #  When The user click on the "legalDisclaimerTC" checkbox
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "The request has been cancelled" toast notification
   # Then The user waiting to load "or refresh the screen"
    #Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "status as Cancelled" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Cancelled           |

  @ASM#Reject
  Scenario: Amend Statement Preferences - Stop Paper Statements - Reject
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "request status as More Information Required" for "ROF SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval    |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title  | Reject Service Request |
      | cancelBtn           | Cancel                 |
      | rejectBtn           | Reject                 |
      | rejectComment-label | Reason For Rejection   |
      | rejectComment       |                        |
    Then The application should display the "rejectBtn" button
    Then The application should display the "cancelBtn" button
    When The user click on the "cancelBtn" button
    Then The application does not show "rejectDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval    |
    When The user click on the "Reject" button
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    When The user click on the "cancelBtn" button
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval    |
    When The user click on the "Reject" button
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    And The user click on the "rejectBtn" button
    Then The application should display the "Reject" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "status as Rejected" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Rejected                                           |



  @ASP#UIerror2
  Scenario: Amend Statement Preferences - Selected more than 10 accounts
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "Sellect_All_Accounts" checkbox
    Then The user click on the "addBtn" button
    Then The application should display error message under "accounts-error" section
      | error_message | The selected account(s) could not be added as the maximum of 10 was exceeded |


  @ASP#UIerror3
  Scenario: Amend Statement Preferences - without selecting Important info
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "Submit" button
    Then The application should display error message under "Important Information" section
      | error_message | Please select the checkbox to confirm you have read and understood the above information |

  @ASP#UIerror4
  Scenario: Amend Statement Preferences - without selecting Important info
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "checkboxsel2" button
    Then The user click on the "checkboxsel3" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1   | 010201 - 123456201     |
      | accountDetail-2   | BO-AWAITING-FULFILMENT |
      | accountDetail-3   | AUD                    |
      | accountDetail-2.1 | 010203 - 123456203     |
      | accountDetail-2.2 | BO-PENDING-APPROVAL    |
      | accountDetail-2.3 | AUD                    |
      | accountDetail-3.1 | 010205 - 123456205     |
      | accountDetail-3.2 | BO-UNABLE-TO-APPROVE   |
      | accountDetail-3.3 | AUD                    |
    When The user click on the "selectAccount0" button
    When The user click on the "selectAccount1" button
    Then The user click on the "removeBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010205 - 123456205   |
      | accountDetail-2 | BO-UNABLE-TO-APPROVE |
      | accountDetail-3 | AUD                  |



  @ASP#DualApprove#ADK#PUSH
  Scenario: Amend Statement Preferences - Dual approval Service Request
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header adrequest status" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Pending Approval                                   |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ACPP request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    Then The application should display the "Approve model important Info Content" for "Service Request" text
      | imp_cpp1 | By approving this service request, you:                              |
      | imp_cpp2 | ensure the details provided within this service request are correct. |
    Then The application should display the "approveButton" button
    Then The application should display the "cancel" button
    When The user click on the "cancel" button
    Then The application does not show "approveDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval    |
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "service request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approvebtn          | Approve                 |
    When The user click on the "adk-checkbox" button
    When The user click on the "approveButton" button
    When The user click on the "Approve" button
    Then The application should display the "following below text on Dual approver model window" for "Service Request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | Continue            | Continue                |
    When The user click on the "adk-checkbox" button
    When The user click on the "Continue" button
    Then The application should display the "ADK Approve model" for "Service Request"
      | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
      | cancelBtn                 | Cancel                                                                                                                                                                        |
      | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
      | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
      | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
    Then The application should display the "SingleApprove" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header and status" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Approved                                           |



  @ASP#DualApprove#ADK#QR
  Scenario: Amend Statement Preferences - Dual approval Service Request
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header adrequest status" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Pending Approval                                   |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ACPP request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    Then The application should display the "Approve model important Info Content" for "Service Request" text
      | imp_cpp1 | By approving this service request, you:                              |
      | imp_cpp2 | ensure the details provided within this service request are correct. |
    Then The application should display the "approveButton" button
    Then The application should display the "cancel" button
    When The user click on the "cancel" button
    Then The application does not show "approveDialog-title" dialog
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Pending Approval    |
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "service request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approvebtn          | Approve                 |
    When The user click on the "adk-checkbox" button
    When The user click on the "approveButton" button
    When The user click on the "Approve" button
    Then The application should display the "following below text on Dual approver model window" for "Service Request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | Continue            | Continue                |
    When The user click on the "adk-checkbox" button
    When The user click on the "Continue" button
    Then The application should display the "ADK push Approve model" for "Service Request"
      | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
      | cancelBtn                 | Cancel                                                                                                                                                                        |
      | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
      | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
      | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
    When The user click on the "notificationNotRecBtn" button
    Then The application should display the "ADK QR Approve model" for "Service Request"
      | approveADKDialog-title    | Approve Service Request                                                                              |
      | cancelBtn                 | Cancel                                                                                               |
      | notificationNotRecBtn     | Generate new QR code                                                                                 |
      | approveADKDialog-content1 | Please open and log on to the ANZ Digital Key on your activated device. Scan the QR code to proceed. |
    # | approveADKDialog-content2 | Please open and log on to the ANZ Digital Key on your activated device. Scan the QR code to proceed.  |
    Then The application should display the "SingleApprove" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header and status" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Approved                                           |



  @TokenApproval
  Scenario: Amend Statement Preferences - Single Approval
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application shows the "cancel" button
    Then The user click on the "StopPaperStatements" radioButton
    Then The user click on the "addAccountbtn" button
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
      | amendmentType-label | Amendment Type                                     |
      | amendmentType-field | Stop Paper Statements                              |
      | accountsLabel       | Account(s)                                         |
      | accountName         | Account Name                                       |
      | accountNumber       | Account Number                                     |
      | currency            | Currency                                           |
      | accountDetail-1     | 010201 - 123456201                                 |
      | accountDetail-2     | BO-AWAITING-FULFILMENT                             |
      | accountDetail-3     | AUD                                                |
      | currency            | Currency                                           |
    When The user click on the "importantInfoinput" checkbox
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header adrequest status" for "ROF service request in view mode"
      | amendStatementTitle          | Amend Statement Preferences (AU)                   |
      | amendStatementDesc           | Amend the preferences for your account statements. |
      | Summary_Info_header          | Summary Information                                |
      | Summary_Info_RequestID_txt   | Request ID                                         |
      | Summary_Info_Requestedon_txt | Requested on                                       |
      | Summary_Info_Requestedby_txt | Requested by                                       |
      | summary_status               | Pending Approval                                   |
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "status as Pending Approval" for "Service Request"
      | Summary_Info_header              | Summary Information |
      | Summary_Info_RequestID_txt       | Request ID          |
      | Summary_Info_Requestedon_txt     | Requested on        |
      | Summary_Info_Requestedby_txt     | Requested by        |
      | summary_status                   | Pending Approval    |
      | Summary_Info_YourReference_value | test your reference |
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
      | approveDialog-content6 | Enter your 6 digit PIN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | approveDialog-content1 | Token authorisation required                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | importantInfoContent1  | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      | importantInfoContent2  | By approving this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge ANZ will send a request to the recipient's bank to have the funds returned to this account. It is not guaranteed that the funds will be returned as the recipient has the right to refuse the recall request.\nA request to recall a payment should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments. If the payment has been made to either of these government bodies, please contact the ATO or RBA directly to recall the payment. |
    Then The user enter "8754328" into the "authoriseCode" text field
    When The user click on the "cancelBtn" button
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information               |
      | Summary_Info_RequestID_txt       | Request ID                        |
      | Summary_Info_Requestedon_txt     | Requested on                      |
      | Summary_Info_Requestedby_txt     | Requested by                      |
      | summary_status                   | Pending Approval                  |
      | Summary_Info_YourReference_value | testRecallPayment#PendingApproval |
    When The user click on the "Approve" button
    Then The user enter "8754328" into the "authoriseCode" text field
    And The user click on the "approveBtn" button
    Then The application should display the "Approve" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request Header" for "ROF service request in view mode"
      | recallPaymentTitle | Recall Payment (AU)                                                                           |
      | recallPaymentDesc  | Request a payment recall if your payment details are incorrect and your funds to be returned. |
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_header          | Summary Information |
      | Summary_Info_RequestID_txt   | Request ID          |
      | Summary_Info_Requestedon_txt | Requested on        |
      | Summary_Info_Requestedby_txt | Requested by        |
      | summary_status               | Approved            |


  @ASP_st1
  Scenario: Amend Statement Preferences - Statement Frequency - Daily
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Daily" from "statementFrequency" drop down
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The application should display the "Your Reference section" for "Amend Statement Preferences request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      | attentionToTitle                      | title 1 title 2                          |
      | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |

  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Weekly
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Weekly" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
    #  | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |



  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Fortnightly
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Fortnightly" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
    #  | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
    #  | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Monthly (on specific date)
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Monthly (on specific date)" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Monthly (on specific business day)
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Monthly (on specific business day)" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
    #  | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Every two months
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Every two months" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
    #  | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Quarterly
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Quarterly" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name                 | field_value           |
      | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input    | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_sit2
  Scenario: Amend Statement Preferences - Statement Frequency - Last business day of the month
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application shows the "cancel" button
    Then The application should display the "Select Amendment Type section" for "Amend Statement Preferences enter screen"
      | amendmentType-label                              | Amendment Type                                         |
      | StopPaperStatements-label                        | Stop Paper Statements                                  |
      | ResumePaperStatements-label                      | Resume Paper Statements                                |
      | StatementFrequencyAddressAccountDescriptor-label | Statement Frequency, Address and/or Account Descriptor |
    Then The user click on the "StatementFrequencyAddress" radioButton
    Then The application should display the "Select Account(s)" for "Amend Statement Preferences enter screen"
      | addAccountbtn       | Add                    |
      | removeBtn           | Remove                 |
      | accountNumber       | Account Number         |
      | accountName         | Account Name           |
      | currency            | Currency               |
      | NoOfaccountselected | No account(s) selected |
      | accountTableWarning | Max 10 per request     |
    Then The user click on the "addAccountbtn" button
    Then The application should display the "Account Model" for "Amend Statement Preferences enter screen"
      | accountDialogInlineSearch_dialog-title | Add Account    |
      | account_Name                           | Account Name   |
      | accNum                                 | Account Number |
      | Currency                               | Currency       |
      | cancelBtn                              | Cancel         |
      | addBtn                                 | Add            |
    Then The user click on the "checkboxsel1" button
    Then The user click on the "addBtn" button
    Then The application should display the "Account(s) details" for "Amend Statement Preferences enter screen"
      | accountDetail-1 | 010201 - 123456201     |
      | accountDetail-2 | BO-AWAITING-FULFILMENT |
      | accountDetail-3 | AUD                    |
      | amendlnk1       | Amend                  |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Amend Statement Preferences                                                                      |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      | statementFrequency-label              | Statement Frequency                                                                              |
      | statementDetailsSubTitle              | Statement Delivery Address Details                                                               |
      | attentionToTitle-label                | Attention To                                                                                     |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                                                                        |
      #| attentionToTitle                      | title 1 title 2                                                                                  |
      | amtStmtPrefMsg                        | The existing statement preferences for this account are displayed as default in the below fields |
      #  | addressViewOption                     | Adr1 Adr2 Adr3,  urb state code Australia                                                        |
      | statementDeliveryAddress-label        | Statement Delivery Address                                                                       |
      | addressManuallyBtn                    | Enter address manually                                                                           |
      | cancelBtn                             | Cancel                                                                                           |
      | save                                  | Save                                                                                             |
    When The user select the "Weekly" from "statementFrequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name              | field_value           |
      # | statementNextFrequencyDate | 18/02/2022            |
      | accountDescriptor input | accountDescriptorText |
    Then The user enter "accountDescriptorText" into the "accountDescriptor input" text field
    Then The user click on the "save" button
    Then The user enter "test your reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Service Request details" for "Amend Statement Preferences on review page"
      | amendStatementTitle   | Amend Statement Preferences (AU)                       |
      | amendStatementDesc    | Amend the preferences for your account statements.     |
      | amendmentType-label   | Amendment Type                                         |
      | amendmentType-field   | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel         | Account(s)                                             |
      | accountName           | Account Name                                           |
      | accountNumber         | Account Number                                         |
      | currency              | Currency                                               |
      | accountDetail-1       | 010201 - 123456201                                     |
      | accountDetail-2       | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3       | AUD                                                    |
      | currency              | Currency                                               |
      | Your_Reference_header | Your Reference (optional)                              |
      | your_reference        | test your reference                                    |
      | amendlnk1             | View                                                   |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #| statementNextFrequencyDate-value      | 18/02/2022                               |
      | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "CloseBtn" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Amend Statement Preferences request"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Summary Information" for "Amend Statement Preferences request in view mode"
      | Summary_Info_header              | Summary Information                                    |
      | Summary_Info_RequestID_txt       | Request ID                                             |
      | Summary_Info_Requestedon_txt     | Requested on                                           |
      | Summary_Info_Requestedby_txt     | Requested by                                           |
      | Summary_Info_RequestStatus_txt   | Your Reference                                         |
      | Summary_Info_YourReference_txt   | Request Status                                         |
      | Summary_Info_YourReference_value | test your reference                                    |
      | amendStatementTitle              | Amend Statement Preferences (AU)                       |
      | amendStatementDesc               | Amend the preferences for your account statements.     |
      | amendmentType-label              | Amendment Type                                         |
      | amendmentType-field              | Statement Frequency, Address and/or Account Descriptor |
      | accountsLabel                    | Account(s)                                             |
      | accountName                      | Account Name                                           |
      | accountNumber                    | Account Number                                         |
      | currency                         | Currency                                               |
      | accountDetail-1                  | 010201-123456201                                       |
      | accountDetail-2                  | BO-AWAITING-FULFILMENT                                 |
      | accountDetail-3                  | AUD                                                    |
      | currency                         | Currency                                               |
      | amendlnk1                        | View                                                   |
      | Comment_Section_header           | Comments and Supporting Documents                      |
      | Comment_Section_Date_txt         | Date                                                   |
      | Comment_Section_AddedBy_txt      | Added by                                               |
      | Comment_Section_Comments_txt     | Comments                                               |
      | Comment_Section_Attachments_txt  | Attachments                                            |
    Then The user click on the "amendlnk1" button
    Then The application should display the "Amend Statement Preferences popup model" for "Amend Statement Preferences SR"
      | amendStatementProferencesDialog-title | Statement Preferences                    |
      | statementFrequency-label              | Statement Frequency                      |
      | statementDetailsSubTitle              | Statement Delivery Address Details       |
      | attentionToTitle-label                | Attention To                             |
      # | statementNextFrequencyDate-label      | Next Statement Issue Date                |
      #  | statementNextFrequencyDate            | 18/02/2022                               |
      # | attentionToTitle                      | title 1 title 2                          |
     # | addressView                           | Adr1 Adr2 Adr3, urb state code Australia |
      | StatementDeliveryAddress              | Statement Delivery Address               |
      | closeBtn                              | Close                                    |
    When The user click on the "closeBtn" button
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Submitted |


  @ASP_error
  Scenario: Amend Statement Preferences - Statement Frequency - > 10 accounts
    Given I am an authorised user with permission to create a "Amend Statement Preferences" service request
    When The user navigate to the "Amend Statement Preferences" service request screen
    Then The application should display the "Service Request Header" for "Amend Statement Preferences"
      | amendStatementTitle | Amend Statement Preferences (AU)                   |
      | amendStatementDesc  | Amend the preferences for your account statements. |
    Then The user click on the "StatementFrequencyAddress" radioButton
     Then The user click on the "addAccountbtn" button
    Then The user click on the "Sellect_All_Accounts" checkbox
    Then The user click on the "addBtn" button
    Then The application should display error message under "accounts-error" section
      | error_message | The selected account(s) could not be added as the maximum of 10 was exceeded |

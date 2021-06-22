@ui-mock @api-mock @MPP @Regression @webform
Feature: Manage Periodical (Automatic) Payments (AU)
  User should able to initiate new Manage Periodical (Automatic) Payments (AU) from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------

  @CPP1
  Scenario: Manage Periodical (Automatic) Payments - Create
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Periodical Payment Details" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                |                    |
      | payeeAccountName            |                    |
      | paymentReference            |                    |
      | closePeriodicalAmount       |                    |
      | closeDate                   |                    |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "AMPP on review page"
      | AccountHeaderLabel     | Account Details |
      | AccountName            | BO-PENDING      |
      | AccountDefaultCurrency | AUD             |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "Your Reference details" for "AMPP on review page"
      | Your_Reference_header | Your Reference (optional) |
      | your_reference        | testAMPP#yourreference    |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request Header" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU) |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    Then The application should display the "Summary Information" for "AMPP service request in view mode"
      | Summary_Info_header              | Summary Information    |
      | Summary_Info_RequestID_txt       | Request ID             |
      | Summary_Info_Requestedon_txt     | Requested on           |
      | Summary_Info_Requestedby_txt     | Requested by           |
      | Summary_Info_RequestStatus_txt   | Your Reference         |
      | Summary_Info_YourReference_txt   | Request Status         |
      | Summary_Info_YourReference_value | testAMPP#yourreference |

  @CPP2
  Scenario: Manage Periodical (Automatic) Payments - Cancel Service Request prior to submission in 'Enter details' screen
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
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

  @CPP3
  Scenario: Close Periodical  Payments - Cancel Service Request prior to submission on 'Review and Submit' screen
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Periodical Payment Details" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                |                    |
      | payeeAccountName            |                    |
      | paymentReference            |                    |
      | closePeriodicalAmount       |                    |
      | closeDate                   |                    |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
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



  @CPP4
  Scenario: Close Periodical  Payments - Create MPP request
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Periodical Payment Details" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                |                    |
      | payeeAccountName            |                    |
      | paymentReference            |                    |
      | closePeriodicalAmount       |                    |
      | closeDate                   |                    |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The application should display the "Your Reference section" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "review page"
      | AccountName | BO-PENDING |
    #  | AccountDefaultCurrency | AUD                                                                                                               |
    #| AccountDescription | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | selectAccountLabel            | Account Details            |
      | periodicalPaymentDetailsLabel | Periodical Payment Details |
    Then The application should display the "Transaction details" for "review page"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                | 1234567            |
      | payeeAccountName            | Account ame        |
      | paymentReference            | MPP#ref            |
      | closePeriodicalAmount       | AUD 213,312.02     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Service Request HeaderSummary Information and Account details," for "AMPP service request in view mode"
      #  #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
      | serialNumber-label             | Serial Number                                                      |
      | payeeAccountName-label         | Payee Account Name                                                 |
      | paymentReference-label         | Payment Reference                                                  |
      | closePeriodicalAmount-label    | Amount                                                             |
      | closeDate-label                | Close Date                                                         |
      # | serialNumber                | 1234567            |
      | payeeAccountName               | Account ame                                                        |
    #  | paymentReference               | MPP#ref                                                            |
      | closePeriodicalAmount          | AUD 213,312.02                                                     |



  @CPP11
  Scenario: Close Periodical  Payments - Create AMPP request and search based on requestId
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Periodical Payment Details" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                |                    |
      | payeeAccountName            |                    |
      | paymentReference            |                    |
      | closePeriodicalAmount       |                    |
      | closeDate                   |                    |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The application should display the "Your Reference section" for "Manage Periodical (Automatic) Payments (AU) Service Request"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
      | Your_Reference_textbox          |                                                                                              |
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "review page"
      # | AccountHeaderLabel     | Account Details                                                                                                   |
      | AccountName            | BO-PENDING |
      | AccountDefaultCurrency | AUD        |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | selectAccountLabel            | Account Details            |
      | periodicalPaymentDetailsLabel | Periodical Payment Details |
    Then The application should display the "Transaction details" for "review page"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                | 1234567            |
      | payeeAccountName            | Account ame        |
      | paymentReference            | MPP#ref            |
      | closePeriodicalAmount       | AUD 213,312.02     |
    #| closeDate                   | 26/09/2020         |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "viewAuditHistory" button
    Then The application should display the "Close" button
    Then The application should display the "Service Request HeaderSummary Information and Account details," for "AMPP service request in view mode"
      #  #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
      | serialNumber-label             | Serial Number                                                      |
      | payeeAccountName-label         | Payee Account Name                                                 |
      | paymentReference-label         | Payment Reference                                                  |
      | closePeriodicalAmount-label    | Amount                                                             |
      | closeDate-label                | Close Date                                                         |
      # | serialNumber                | 1234567            |
      | payeeAccountName               | Account ame                                                        |
    #  | paymentReference               | MPP#ref                                                            |
    #  | closePeriodicalAmount          | AUD 213,312.02                                                     |


  @CPP
  Scenario: Close Periodical  Payments - Search based on RequestType Search Criteria
    Given The user on the service request history page
    When The user open the search fields
    And The user click into the "Request type" field
    Then The user should be able to see and select "Manage Periodical (Automatic) Payments (AU)"
    When The user Clicks the "summaryGridsearch" button
    Then User should only see request history items that relate to "Manage Periodical (Automatic) Payments (AU)"


  @AMPP-additionalDocs1
  Scenario: Close Periodical  Payments - Submit comments only
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | selectAccountLabel            | Account Details            |
      | periodicalPaymentDetailsLabel | Periodical Payment Details |
    Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) view page"
      | paymentsTitle          | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc           | Add, amend, suspend or close periodical payments on your accounts. |
      | AccountHeaderLabel     | Account Details                                                    |
      | AccountName            | BO-PENDING                                                         |
      | AccountDefaultCurrency | AUD                                                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user Clicks the "Ok" button
    Then The request id is stored from the element "responseId"
    # Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) view page"
      # | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "request status as More Information Required" for "SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
  Then The application should display "New comment / attachment" sub-section
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Add Comment" textbox
     When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents section" for "service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date     | 19/07/2019 01:37:32         |
      | Added by | User Lname                  |
      | Comments | Providing the comments only |





  @AMPP-additionalDocs2
  Scenario: Close Periodical  Payments - Submit Attachments only
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "review page"
      | AccountName            | BO-PENDING |
      | AccountDefaultCurrency | AUD        |
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | selectAccountLabel            | Account Details            |
      | periodicalPaymentDetailsLabel | Periodical Payment Details |
    Then The application should display the "Transaction details" for "review page"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                | 1234567            |
      | payeeAccountName            | Account ame        |
      | paymentReference            | MPP#ref            |
      | closePeriodicalAmount       | AUD 213,312.02     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "service request details" for "Manage Periodical (Automatic) Payments (AU)"
      #  #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "request status as More Information Required" for "AMPP SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display the "additional comments section" for "service request"
      | Comment_Section_header          | Comments and Supporting Documents                                                            |
     # | additional_CommentLabel         | Please ensure that all required comments and attachments are included before clicking submit |
      | additional_CommentpaymentsTitle | New comment / attachment                                                                     |
      | additional_Comment-field        | Max 400 characters                                                                           |
    Then The application should display "New comment / attachment" sub-section
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for " service request"
      | Comment_Section_header          | Comments and Supporting Documents |
      | Comment_Section_Date_txt        | Date                              |
      | Comment_Section_AddedBy_txt     | Added by                          |
      | Comment_Section_Comments_txt    | Comments                          |
      | Comment_Section_Attachments_txt | Attachments                       |
    Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
      | Date        | 19/07/2019 01:37:32        |
      | Added by    | User Lname                 |
      | Attachments | Test-pdf.pdf ( 444.82 KB ) |



  @AMPP-additionalDocs3
  Scenario: Close Periodical  Payments - Submit Comments and Attachments
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value |
      | serialNumber          | 12345678    |
      | payeeAccountName      | Account ame |
      | paymentReference      | MPP#ref     |
      | closePeriodicalAmount | 213312.02   |
    Then The user picking the "closeDate" from calender
    Then The user enter "testAMPP#authorisation" into the "your_reference" text field
    When The user Clicks the "Next" button
    Then The application should display the "Account details" for "review page"
      | AccountName            | BO-PENDING |
      | AccountDefaultCurrency | AUD        |
    #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
    Then The application should display the "SearchforTransactionLabel" for "Service Request" text
      | selectAccountLabel            | Account Details            |
      | periodicalPaymentDetailsLabel | Periodical Payment Details |
    Then The application should display the "Transaction details" for "review page"
      | serialNumber-label          | Serial Number      |
      | payeeAccountName-label      | Payee Account Name |
      | paymentReference-label      | Payment Reference  |
      | closePeriodicalAmount-label | Amount             |
      | closeDate-label             | Close Date         |
      | serialNumber                | 1234567            |
      | payeeAccountName            | Account ame        |
      | paymentReference            | MPP#ref            |
      | closePeriodicalAmount       | AUD 213,312.02     |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "service request details" for "Manage Periodical (Automatic) Payments (AU)"
      #  #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
    Then The application should display the "Account details" for "service request in view mode"
      | AccountHeaderLabel     | Account Details |
      | AccountName            | BO-PENDING      |
      | AccountDefaultCurrency | AUD             |
    Then The user update the service request status with following details
      | requestId     | responseId        |
      | status        | PENDING_MORE_INFO |
      | requestStatus | PENDING_MORE_INFO |
    When The user Clicks the "Close" button
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "request status as More Information Required" for "AMPP SR"
      | Summary_Info_header          | Summary Information       |
      | Summary_Info_RequestID_txt   | Request ID                |
      | Summary_Info_Requestedon_txt | Requested on              |
      | Summary_Info_Requestedby_txt | Requested by              |
      | summary_status               | More Information Required |
    Then The application should display the "Add new comment / attachment" button
    When The user click on the "Add new comment / attachment" button
    Then The application should display "New comment / attachment" sub-section
    And The application should display the "Submit" button
    When The user entered "Test comments" in "Additional Comment" textbox
    When The user entered "Comments with attachments" in "Additional Comment" textbox
    Then The application should allow user to select and upload single file
      | filepath | //resources//input//Test-pdf.pdf |
    Then The application should display the "uploaded files under" the "additional file upload section"
      | fileRemoveIcon1            |                            |
      | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
    When The user click on the "Submit" button
    Then The application should display the "Comments and Supporting Documents/Attachments details" for "service request"
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





  @AMPP-UIErrors
  Scenario: Close Periodical Payments - UI validations
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "close PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user Clicks the "Next" button
    Then The application should display error message under "serialNumber-error" section
      | error_message | Serial Number is mandatory |
    Then The application should display error message under "payeeAccountName-error" section
      | error_message | Payee Account Name is mandatory |
    Then The application should display error message under "paymentReference-error" section
      | error_message | Payment Reference is mandatory |
    Then The application should display error message under "closePeriodicalAmount-error" section
      | error_message | Amount is mandatory |
    Then The application should display error message under "closedate-error" section
      | error_message | Close Date is mandatory |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | payeeAccountName      | Account Name |
      | paymentReference      | MPP#ref      |
      | closePeriodicalAmount | 213312.02    |
      | closeDate             | 21           |
    When The user Clicks the "Next" button
    Then The application should display error message under "closedate-error" section
      | error_message | Close Date must be entered in DD/MM/YYYY format |



  @APP-UIValidation1
  Scenario: Add Periodical  Payments - Enter screen Ui validation
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    And The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    And I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    When The user click on the "Next" button
    Then The application should display error message under "payeeBSB-error" section
      | error_message | Payee BSB is mandatory |
    Then The application should display error message under "payeeAccountNumber-error" section
      | error_message | Payee Account Number is mandatory |
    Then The application should display error message under "payeeAccountName-error" section
      | error_message | Payee Account Name is mandatory |
    Then The application should display error message under "frequency-error" section
      | error_message | Frequency is mandatory |
    Then The application should display error message under "amount-error" section
      | error_message | Amount is mandatory |
    Then The application should display error message under "variablePayAmountRequired-error" section
      | error_message | Variable Payment Amount is mandatory |
    Then The application should display error message under "paymentReference-error" section
      | error_message | Payment Reference is mandatory |
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Payment Start Date is mandatory |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12           |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 12           |
    When The user click on the "Next" button
    Then The application should display error message under "payeeBSB-error" section
      | error_message | Payee BSB must be 6 digits |
    Then The application should display error message under "payeeAccountNumber-error" section
      | error_message | Payee Account Number must be between 6 and 9 digits |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Days are mandatory |

    When The user select the "Monthly (on business day)" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "businessDay-error" section
      | error_message | Business Day is mandatory |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "20" from "day1" drop down
    When The user select the "10" from "day2" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Day 2 must be later than Day 1 |

    When The user select the "every-n-weeks" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "week-error" section
      | error_message | Number of Weeks is mandatory |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "10thday1" from "day1" drop down
    When The user select the "10thday2" from "day2" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Day 2 must be later than Day 1 |

    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | amount     | 0.0         |
    When The user click on the "Next" button
    Then The application should display error message under "amount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |
    Then The user enter the following text in corresponding textboxes
      | field_name | field_value |
      | amount     | 1000000.01  |
    When The user click on the "Next" button
    Then The application should display error message under "amount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

    When The user select the "Monthly (on business day)" from "frequency" drop down
    When The user select the "1st" from "businessDay" drop down
    When The user select the "Yes (first payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value |
      | amount             | 123456      |
      | paymentReference   | MPP#ref     |
      | paymentStartDate   | 18/01/2021  |
      | lastPaymentDate    | 28/01/2021  |
      | payeeBSB           | 125454545   |
      | payeeAccountNumber | 125454      |
    When The user click on the "Next" button
    Then The application should display error message under "variablePayAmount-error" section
      | error_message | Variable Payment Amount is mandatory |

    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value |
      | variablePayAmount | 0           |
    When The user click on the "Next" button
    Then The application should display error message under "variablePayAmount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value |
      | variablePayAmount | 9999999999  |
    When The user click on the "Next" button
    Then The application should display error message under "variablePayAmount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

  # Then The user enter the following text in corresponding textboxes
  #   | field_name        | field_value |
  #   | variablePayAmount | 0           |
  # When The user click on the "Next" button
  # Then The application should display error message under "variablePayAmountRequired-error" section
  #   | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |
  # When The user click on the "Next" button
  # Then The user enter the following text in corresponding textboxes
  #   | field_name        | field_value |
  #   | variablePayAmount | 999999999   |
  # Then The application should display error message under "variablePayAmountRequired-error" section
  #   | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

  @APP_SIT1
  Scenario: Add Periodical Payments - Frequency - daily : -  Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 123456       |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "daily" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Daily (every business day)                                         |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT2
  Scenario: Add Periodical Payments - Frequency - weekly : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 123456       |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "weekly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Weekly                                                             |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT3
  Scenario: Add Periodical Payments - Frequency - fortnightly : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "fortnightly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Fortnightly                                                        |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT4
  Scenario: Add Periodical Payments - Frequency - twice Per Month : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "1" from "day1" drop down
    When The user select the "2" from "day2" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 01/03/2022  |
      | lastPaymentDate  | 06/03/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | frequency                      | Twice per month            |
      | day1                           | 1                          |
      | day2                           | 2                          |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Twice per month                                                    |
      | day1                             | 1                                                                  |
      | day2                             | 2                                                                  |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @APP_SIT5
  Scenario: Add Periodical Payments - Frequency - monthly-specific date : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "monthly-specificdate" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Monthly (on specific date)                                         |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT6
  Scenario: Add Periodical Payments - Frequency - Monthly (on business day) : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "Monthly (on business day)" from "frequency" drop down
    When The user select the "1st" from "businessDay" drop down
    When The user select the "Yes (first payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value |
      | amount            | 1000000     |
      | paymentReference  | MPP#ref     |
      | paymentStartDate  | 01/03/2022  |
      | lastPaymentDate   | 06/03/2022  |
      | variablePayAmount | 1000000     |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | frequency                      | Monthly (on business day)  |
      | businessDay                    | 1                          |
      | fromAmount                     | AUD 1,000,000.00           |
      | variablePayAmountRequired      | Yes (first payment)        |
      | variablePayAmount              | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Monthly (on business day)                                          |
      | businessDay                      | 1                                                                  |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | Yes (first payment)                                                |
      | variablePayAmount                | AUD 1,000,000.00                                                   |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT7
  Scenario: Add Periodical Payments - Frequency - Bi-monthly : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "Bi-monthly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Bi-monthly                                                         |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @APP_SIT8
  Scenario: Add Periodical Payments - Frequency - six-monthly : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "six-monthly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Six monthly                                                        |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT9
  Scenario: Add Periodical Payments - Frequency - quarterly : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "quarterly" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Quarterly                                                          |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |


  @APP_SIT10
  Scenario: Add Periodical Payments - Frequency - Annually : - Enter, view and Rejected flow
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "annually" from "frequency" drop down
    When The user select the "No" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amount           | 1000000     |
      | paymentReference | MPP#ref     |
      | paymentStartDate | 18/02/2022  |
      | lastPaymentDate  | 28/02/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | No                         |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Annually                                                           |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | No                                                                 |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |
    Then I click on "cancelBtn"
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
      | Summary_Info_header              | Summary Information    |
      | Summary_Info_RequestID_txt       | Request ID             |
      | Summary_Info_Requestedon_txt     | Requested on           |
      | Summary_Info_Requestedby_txt     | Requested by           |
      | summary_status                   | Pending Approval       |
      | Summary_Info_YourReference_value | testAMPP#yourreference |
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title | Reject Service Request |
      | cancelBtn          | Cancel                 |
      | rejectBtn          | Reject                 |
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    When The user click on the "cancelBtn" button
    Then The application should display the "or directed back to the service request details screen" for "SR"
      | Summary_Info_header              | Summary Information    |
      | Summary_Info_RequestID_txt       | Request ID             |
      | Summary_Info_Requestedon_txt     | Requested on           |
      | Summary_Info_Requestedby_txt     | Requested by           |
      | summary_status                   | Pending Approval       |
      | Summary_Info_YourReference_value | testAMPP#yourreference |
    When The user click on the "Reject" button
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    And The user click on the "rejectBtn" button
    #Then The user waiting to load "or refresh the screen"
    Then The application should display the "Reject" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "status as Approved" for "SR"
      | Summary_Info_header              | Summary Information    |
      | Summary_Info_RequestID_txt       | Request ID             |
      | Summary_Info_Requestedon_txt     | Requested on           |
      | Summary_Info_Requestedby_txt     | Requested by           |
      | summary_status                   | Rejected               |
      | Summary_Info_YourReference_value | testAMPP#yourreference |


  @APP_SIT11
  Scenario: Add Periodical Payments - Frequency - Every 'n' weeks : - Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Add PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountDetails-title | Enter Payee Account Details |
      | payeeAccountName-label    | Payee Account Name          |
      | payeeAccountNumber-label  | Payee Account Number        |
      | payeeBSB-label            | Payee BSB                   |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12345678     |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 323131333    |
    Then The application should display the "Enter Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | periodicalPaymentDetails-title  | Enter Periodical Payment Details       |
      | frequency-label                 | Frequency                              |
      | amount-label                    | Amount                                 |
      | variablePayAmountRequired-label | Is a variable payment amount required? |
      | paymentReference-label          | Payment Reference                      |
      | paymentStartDate-label          | Payment Start Date                     |
      | lastPaymentDate-label           | Last Payment Date                      |
    When The user select the "Every 'n' weeks" from "frequency" drop down
    When The user select the "1" from "week" drop down
    When The user select the "Yes (last payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name        | field_value |
      | amount            | 1000000     |
      | paymentReference  | MPP#ref     |
      | paymentStartDate  | 18/02/2022  |
      | lastPaymentDate   | 28/02/2022  |
      | variablePayAmount | 1000000     |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | AccountHeaderLabel             | Account Details            |
      | AccountName                    | BO-PENDING                 |
      | AccountDefaultCurrency         | AUD                        |
      #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
      | payeeAccountDetails-title      | Payee Account Details      |
      | payeeBSB                       | 123456                     |
      | payeeAccountName               | Account Name               |
      | payeeAccountNumber             | 323131333                  |
      | periodicalPaymentDetails-title | Periodical Payment Details |
      | frequency                      | Every 'n' weeks            |
      | week                           | 1                          |
      | fromAmount                     | AUD 1,000,000.00           |
      | paymentReference               | MPP#ref                    |
      | paymentStartDate-label         | Payment Start Date         |
      | lastPaymentDate-label          | Last Payment Date          |
      | variablePayAmountRequired      | Yes (last payment)         |
      | variablePayAmount              | AUD 1,000,000.00           |
      | Your_Reference_header          | Your Reference (optional)  |
      | your_reference                 | testAMPP#yourreference     |
    When The user click on the "importantInfo_checkbox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | Periodical Payment Details                                         |
      | frequency                        | Every 'n' weeks                                                    |
      | week                             | 1                                                                  |
      | fromAmount                       | AUD                                                                |
      | variablePayAmountRequired        | Yes (last payment)                                                 |
      | variablePayAmount                | AUD 1,000,000.00                                                   |
      | paymentStartDate-label           | Payment Start Date                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @AMPP_ST1
  Scenario: Amend Periodical Payments - Payee Account Details -  Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PayeeAccountDetailsCkbx"
    Then The application should display the "Enter Payee Account Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | payeeAccountName-label   | Payee Account Name   |
      | payeeAccountNumber-label | Payee Account Number |
      | payeeBSB-label           | Payee BSB            |
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value       |
      | payeeBSB           | 823456            |
      | payeeAccountName   | Test Account Name |
      | payeeAccountNumber | 567576            |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | BO-PENDING                          |
      | AccountDefaultCurrency         | AUD                                 |
      | payeeBSB                       | 823456                              |
      | payeeAccountName               | Test Account Name                   |
      | payeeAccountNumber             | 567576                              |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | payeeBSB                         | 823456                                                             |
      | payeeAccountName                 | Test Account Name                                                  |
      | payeeAccountNumber               | 567576                                                             |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |



  @AMPP_ST2
  Scenario: Amend Periodical Payments - Frequency - only -  Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "FrequencyCkbx"
    When The user select the "daily" from "frequency" drop down
    Then The application should display the "Select Amendment Date" for "Amend PP Service Request"
      | lastPaymentDateLabel      | Please select the date you would like your frequency and/or requested amendment(s) to start from |
      | selectAmendmentDate-title | Select Amendment Date                                                                            |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | paymentAmendDate | 19/08/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | BO-PENDING                                            |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | frequency                      | Daily (every business day)                            |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | 19/08/2022                                            |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "view_request_link" link
    Then The application should display the "Service Request details" for "AMPP service request in view mode"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | frequency                        | Daily (every business day)                                         |
      | selectAmendmentDate-title        | Amendment Date                                                     |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from              |
      | paymentAmendDate-field           | 19/08/2022                                                         |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @AMPP_ST3
  Scenario: Amend Periodical Payments - Amount only : -  Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "AmountCkbx"
    Then The application should display the "Select Amendment Date" for "Amend PP Service Request"
      | lastPaymentDateLabel      | Please select the date you would like your frequency and/or requested amendment(s) to start from |
      | selectAmendmentDate-title | Select Amendment Date                                                                            |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value |
      | amendmentAmount  | 32131.99    |
      | paymentAmendDate | 19/08/2022  |
    Then The user enter "testAMPP#your_reference" into the "your_reference" text field
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | BO-PENDING                                            |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | amount-label                   | Amount                                                |
      | amendmentAmount                | AUD 32,131.99                                         |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | 19/08/2022                                            |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | selectAmendmentDate-title        | Amendment Date                                                     |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from              |
      | paymentAmendDate-field           | 19/08/2022                                                         |
      | amount-label                     | Amount                                                             |
      | amendmentAmount                  | AUD 32,131.99                                                      |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @AMPP_ST4
  Scenario: Amend Periodical Payments - Payment Reference only : -  Enter values and verify view page
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PaymentReferenceCkbx"
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value             |
      | paymentReference | paymentReference#213213 |
      | your_reference   | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | BO-PENDING                          |
      | AccountDefaultCurrency         | AUD                                 |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | paymentReference-label         | Payment Reference                   |
      | paymentReference               | paymentReference#2                  |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | paymentReference-label           | Payment Reference                                                  |
      | paymentReference                 | paymentReference#2                                                 |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |

  @AMPP_ST5
  Scenario: Amend Periodical Payments - Payment Reference only : ADK dual approval Push
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "LastPaymentDateCkbx"
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value             |
      | amendlastPaymentDate | 01/09/2022              |
      | your_reference       | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | BO-PENDING                          |
      | AccountDefaultCurrency         | AUD                                 |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | lastPaymentDate-label          | Last Payment Date                   |
      | amendlastPaymentDate           | 01/09/2022                          |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | amendlastPaymentDate             | 01/09/2022                                                         |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |
    Then I click on "cancelBtn"
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ACPP request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    # Then The application should display the "Approve model important Info Content" for "Service Request" text
    #   | imp_cpp1 | By approving this service request, you:                              |
    #   | imp_cpp2 | ensure the details provided within this service request are correct. |
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
    #Then The user waiting to load "or refresh the screen"
    # Then The application should display the "Approve" toast notification
    Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
      | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
      | summary_status                 | Approved                                                           |

  @AMPP_ST5
  Scenario: Amend Periodical Payments - Payment Reference only : ADK dual approval QR
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "LastPaymentDateCkbx"
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value             |
      | amendlastPaymentDate | 01/09/2022              |
      | your_reference       | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                        |
      | reqType                        | Request Type                        |
      | AccountHeaderLabel             | Account Details                     |
      | AccountName                    | BO-PENDING                          |
      | AccountDefaultCurrency         | AUD                                 |
      | existingAccountDetails-title   | Existing Periodical Payment Details |
      | serialNumber                   | 1234567                             |
      | recurringReference             | AMPP#ref 123                        |
      | amendPeriodicalAmount          | AUD 213,312.02                      |
      | periodicalPaymentDetails-title | New Periodical Payment Details      |
      | lastPaymentDate-label          | Last Payment Date                   |
      | amendlastPaymentDate           | 01/09/2022                          |
      | Your_Reference_header          | Your Reference (optional)           |
      | your_reference                 | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | amendlastPaymentDate             | 01/09/2022                                                         |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |
    Then I click on "cancelBtn"
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "ACPP request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    # Then The application should display the "Approve model important Info Content" for "Service Request" text
    #   | imp_cpp1 | By approving this service request, you:                              |
    #   | imp_cpp2 | ensure the details provided within this service request are correct. |
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
    Then The application should display the "Approve" toast notification
    Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
      | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header            | Summary Information                                                |
      | Summary_Info_RequestID_txt     | Request ID                                                         |
      | Summary_Info_Requestedon_txt   | Requested on                                                       |
      | Summary_Info_Requestedby_txt   | Requested by                                                       |
      | Summary_Info_YourReference_txt | Request Status                                                     |
      | Summary_Info_RequestStatus_txt | Your Reference                                                     |
      | AccountHeaderLabel             | Account Details                                                    |
      | AccountName                    | BO-PENDING                                                         |
      | AccountDefaultCurrency         | AUD                                                                |
      | summary_status                 | Approved                                                           |




  @AMPP_ST6
  Scenario: Amend Periodical Payments - All options -  Enter values , verify view page and Cancel Request
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title   | Enter Existing Periodical Payment Details                 |
      | serialNumber-label             | Serial Number                                             |
      | recurringReference-label       | Payment Reference                                         |
      | amendPeriodicalAmount-label    | Amount                                                    |
      | periodicalPaymentDetails-title | Enter New Periodical Payment Details                      |
      | amendPaymentDetailsOption      | Please select the payment details you would like to amend |
      | FrequencyL                     | Frequency                                                 |
      | AmountLabel                    | Amount                                                    |
      | PayeeAccountDetailsL           | Payee Account Details                                     |
      | PaymentReferenceL              | Payment Reference                                         |
      | LastPaymentDateL               | Last Payment Date                                         |
    #   | lastPaymentDate-label          | Last Payment Date                                         |
    Then The user enter the following text in corresponding textboxes
      | field_name            | field_value  |
      | serialNumber          | 12345678     |
      | recurringReference    | AMPP#ref 123 |
      | amendPeriodicalAmount | 213312.02    |
    When I click on "PayeeAccountDetailsCkbx"
    When I click on "FrequencyCkbx"
    When I click on "AmountCkbx"
    When I click on "PaymentReferenceCkbx"
    When I click on "LastPaymentDateCkbx"
    When The user select the "daily" from "frequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name           | field_value             |
      | amendlastPaymentDate | 01/09/2022              |
      | your_reference       | testAMPP#your_reference |
      | payeeBSB             | 823456                  |
      | payeeAccountName     | Test Account Name       |
      | payeeAccountNumber   | 567576                  |
      | paymentAmendDate     | 19/08/2022              |
      | amendmentAmount      | 32131.99                |
      | paymentReference     | paymentReference#213213 |
      | amendlastPaymentDate | 01/09/2022              |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel         | Request Type                                          |
      | reqType                        | Request Type                                          |
      | AccountHeaderLabel             | Account Details                                       |
      | AccountName                    | BO-PENDING                                            |
      | AccountDefaultCurrency         | AUD                                                   |
      | existingAccountDetails-title   | Existing Periodical Payment Details                   |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | periodicalPaymentDetails-title | New Periodical Payment Details                        |
      | serialNumber                   | 1234567                                               |
      | recurringReference             | AMPP#ref 123                                          |
      | amendPeriodicalAmount          | AUD 213,312.02                                        |
      | selectAmendmentDate-title      | Amendment Date                                        |
      | paymentAmendDate-label         | Frequency and/or requested amendment(s) to start from |
      | paymentAmendDate-field         | 19/08/2022                                            |
      | amount-label                   | Amount                                                |
      | amendmentAmount                | AUD 32,131.99                                         |
      | paymentReference               | paymentReference#2                                    |
      | lastPaymentDate-label          | Last Payment Date                                     |
      | amendlastPaymentDate           | 01/09/2022                                            |
      | Your_Reference_header          | Your Reference (optional)                             |
      | your_reference                 | testAMPP#yourreference                                |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Amend Periodical Payment                                           |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | recurringReference               | AMPP#ref 123                                                       |
      | amendPeriodicalAmount            | AUD 213,312.02                                                     |
      | periodicalPaymentDetails-title   | New Periodical Payment Details                                     |
      | payeeBSB                         | 823456                                                             |
      | payeeAccountName                 | Test Account Name                                                  |
      | payeeAccountNumber               | 567576                                                             |
      | frequency                        | Daily (every business day)                                         |
      | selectAmendmentDate-title        | Amendment Date                                                     |
      | paymentAmendDate-label           | Frequency and/or requested amendment(s) to start from              |
      | paymentAmendDate-field           | 19/08/2022                                                         |
      | amount-label                     | Amount                                                             |
      | amendmentAmount                  | AUD 32,131.99                                                      |
      | paymentReference                 | paymentReference#2                                                 |
      | lastPaymentDate-label            | Last Payment Date                                                  |
      | amendlastPaymentDate             | 01/09/2022                                                         |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | cancelRequest                    | Cancel Request                                                     |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |
    Then I click on "cancelBtn"
    Then The application should display the "Cancel Request" button
    When The user Clicks the "cancelRequest" button
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
    When The user Clicks the "cancelRequest" button
    When The user select the "Duplicate Request" from "cancelReasonType" drop down
    Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
    When The user Clicks the "SubmitBtn" button
    Then The application should display the "(.*)" toast notification
    Then The user waiting to load "or refresh the screen"
    Then The application should display the "Service Request details and status" for "AMPP service request in view mode"
      | summary_status | Cancelled |



  @suspendPP
  Scenario: Suspend Periodical Payments - Enter values and verify view page and approve
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "suspend PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Enter Existing Periodical Payment Details" for "Add Periodical (Automatic) Payments (AU) Service Request"
      | existingAccountDetails-title | Enter Existing Periodical Payment Details |
      | serialNumber-label           | Serial Number                             |
      | suspendReference-label       | Payment Reference                         |
      | suspendAmount-label          | Amount                                    |
      | suspendDates-title           | Select Suspend Dates                      |
      | suspendDate-label            | Suspend On                                |
      | unsuspendDate-label          | Unsuspend On                              |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value             |
      | serialNumber     | 12345678                |
      | suspendReference | AMPP#ref 123            |
      | suspendAmount    | 213312.02               |
      | suspendDate      | 01/09/2022              |
      | unsuspendDate    | 10/09/2022              |
      | your_reference   | testAMPP#your_reference |
    When The user click on the "Next" button
    Then The application should display the "details for review" for "AMPP on review page"
      | RequestTypeHeaderLabel       | Request Type                        |
      | reqType                      | Request Type                        |
      | AccountHeaderLabel           | Account Details                     |
      | AccountName                  | BO-PENDING                          |
      | AccountDefaultCurrency       | AUD                                 |
      | existingAccountDetails-title | Existing Periodical Payment Details |
      | serialNumber                 | 1234567                             |
      | suspendReference-label       | Payment Reference                   |
      | suspendReference             | AMPP#ref 123                        |
      | suspendAmount                | AUD 213,312.02                      |
      | suspendDates-title           | Suspend Dates                       |
      | suspendDate-value            | 01/09/2022                          |
      | unsuspendDate-value          | 10/09/2022                          |
      | Your_Reference_header        | Your Reference (optional)           |
      | your_reference               | testAMPP#yourreference              |
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    Then I click on "Ok"
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
    Then The application should display the "Service Request Header,Summary Information and amend pp details" for "AMPP service request in view screen"
      | paymentsTitle                    | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc                     | Add, amend, suspend or close periodical payments on your accounts. |
      | Summary_Info_header              | Summary Information                                                |
      | Summary_Info_RequestID_txt       | Request ID                                                         |
      | Summary_Info_Requestedon_txt     | Requested on                                                       |
      | Summary_Info_Requestedby_txt     | Requested by                                                       |
      | Summary_Info_RequestStatus_txt   | Your Reference                                                     |
      | Summary_Info_YourReference_txt   | Request Status                                                     |
      | Summary_Info_YourReference_value | testAMPP#yourreference                                             |
      | Approve                          | Approve                                                            |
      | Reject                           | Reject                                                             |
      | RequestTypeHeaderLabel           | Request Type                                                       |
      | reqType                          | Request Type                                                       |
      | requestSubType                   | Suspend Periodical Payment                                         |
      | AccountHeaderLabel               | Account Details                                                    |
      | AccountName                      | BO-PENDING                                                         |
      | AccountDefaultCurrency           | AUD                                                                |
      | existingAccountDetails-title     | Existing Periodical Payment Details                                |
      | serialNumber                     | 1234567                                                            |
      | suspendReference                 | AMPP#ref 123                                                       |
      | suspendAmount                    | AUD 213,312.02                                                     |
      | suspendDates-title               | Suspend Dates                                                      |
      | suspendDate-value                | 01/09/2022                                                         |
      | unsuspendDate-value              | 10/09/2022                                                         |
      | Comment_Section_header           | Comments and Supporting Documents                                  |
      | Comment_Section_Date_txt         | Date                                                               |
      | Comment_Section_AddedBy_txt      | Added by                                                           |
      | Comment_Section_Comments_txt     | Comments                                                           |
      | Comment_Section_Attachments_txt  | Attachments                                                        |
    Then I click on "viewAuditHistory"
    Then The application should display the "status as Submitted in Audit history" for "service request"
      | AuditHistoryStatus | Pending Approval |
    Then I click on "cancelBtn"
    Then The application should display the "Approve" button
    Then The application should display the "Reject" button
    When The user click on the "Approve" button
    Then The application should display the "Approve model window" for "Service Request"
      | approveDialog-title | Approve Service Request |
      | cancelBtn           | Cancel                  |
      | approveBtn          | Approve                 |
    When The user click on the "adk-checkbox" button
    When The user click on the "approveBtn" button
    Then The application should display the "SingleApprove" toast notification
    Then The application should display the "status as Pending Approval" for "SR"
      | Summary_Info_header              | Summary Information |
      | Summary_Info_RequestID_txt       | Request ID          |
      | Summary_Info_Requestedon_txt     | Requested on        |
      | Summary_Info_Requestedby_txt     | Requested by        |
      | summary_status                   | Pending Approval    |
      When The user click on the "Close" button
    Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments" and selects it
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
    Then The application should display the "or directed back to the service request details screen" for "Service Request"
      | Summary_Info_header              | Summary Information |
      | Summary_Info_RequestID_txt       | Request ID          |
      | Summary_Info_Requestedon_txt     | Requested on        |
      | Summary_Info_Requestedby_txt     | Requested by        |
      | summary_status                   | Pending Approval    |
     When The user click on the "Approve" button
    Then The user enter "8754328" into the "authoriseCode" text field
    Then The user click on the "approveBtn" button
    #Then The user waiting to load "or refresh the screen"
    Then The application should display the "status as Approved" for "SR"
      | summary_status | Approved |


  @suspendPP_UI
  Scenario: Suspend Periodical Payments - UI validation
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "suspend PP rediobutn"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When The user click on the "Next" button
    Then The application should display error message under "serialNumber-error" section
      | error_message | Serial Number is mandatory |
    Then The application should display error message under "suspendReference-error" section
      | error_message | Payment Reference is mandatory |
    Then The application should display error message under "suspendAmount-error" section
      | error_message | Amount is mandatory |
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Suspend On date is mandatory |
    Then The user enter the following text in corresponding textboxes
      | field_name  | field_value |
      | suspendDate | 01/09/2022  |
    When The user click on the "Next" button
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Unsuspend On date is mandatory |
    Then The user enter the following text in corresponding textboxes
      | field_name       | field_value  |
      | serialNumber     | 12345678     |
      | suspendReference | AMPP#ref 123 |
      | suspendAmount    | 0            |
    When The user click on the "Next" button
    Then The application should display error message under "suspendAmount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | suspendAmount | 1000000.01  |
    When The user click on the "Next" button
    Then The application should display error message under "suspendAmount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | suspendAmount | 213312.02   |
      | suspendDate   | 01/09/20221 |
    When The user click on the "Next" button
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Suspend On date must be entered in DD/MM/YYYY format |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | suspendDate   | 01/09/2022  |
      | unsuspendDate | 10/09/20221 |
    When The user click on the "Next" button
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Unsuspend On date must be entered in DD/MM/YYYY format |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | suspendDate   | 01/09/2022  |
      | unsuspendDate | 01/09/2022  |
    When The user click on the "Next" button
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Unsuspend On date must be later than the Suspend On date |
    Then The user enter the following text in corresponding textboxes
      | field_name    | field_value |
      | suspendDate   | 01/09/2022  |
      | unsuspendDate | 01/08/2022  |
    When The user click on the "Next" button
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Unsuspend On date must be later than the Suspend On date |


  @AmendPP-UIValidation
  Scenario: Add Periodical  Payments - Enter screen Ui validation
    Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments" service request
    When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
    Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
      #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
      | paymentsDesc | Add, amend, suspend or close periodical payments on your accounts. |
    When I click on "Amend PP button"
    And The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    And I am selecting an eligible account from Search Account Lookup Dialog
    When I click on "PayeeAccountDetailsCkbx"
    When I click on "AmountCkbx"
    When I click on "FrequencyCkbx"
    When I click on "PaymentReferenceCkbx"
    When I click on "LastPaymentDateCkbx"
    When The user click on the "Next" button
    Then The application should display error message under "payeeBSB-error" section
      | error_message | Payee BSB is mandatory |
    Then The application should display error message under "payeeAccountNumber-error" section
      | error_message | Payee Account Number is mandatory |
    Then The application should display error message under "payeeAccountName-error" section
      | error_message | Payee Account Name is mandatory |

    Then The application should display error message under "frequency-error" section
      | error_message | Frequency is mandatory |
    Then The application should display error message under "amount-error" section
      | error_message | Amount is mandatory |
    Then The application should display error message under "paymentReference-error" section
      | error_message | Payment Reference is mandatory |
    Then The application should display error message under "paymentStartDate-error" section
      | error_message | Last Payment Date is mandatory |
    When The user select the "daily" from "frequency" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | payeeBSB           | 12           |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 12           |
    When The user click on the "Next" button
    Then The application should display error message under "payeeBSB-error" section
      | error_message | Payee BSB must be 6 digits |
    Then The application should display error message under "payeeAccountNumber-error" section
      | error_message | Payee Account Number must be between 6 and 9 digits |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Days are mandatory |

    When The user select the "Monthly (on business day)" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "businessDay-error" section
      | error_message | Business Day is mandatory |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "20" from "day1" drop down
    When The user select the "10" from "day2" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Day 2 must be later than Day 1 |

    When The user select the "every-n-weeks" from "frequency" drop down
    When The user click on the "Next" button
    Then The application should display error message under "week-error" section
      | error_message | Number of Weeks is mandatory |

    When The user select the "twicePerMonth" from "frequency" drop down
    When The user select the "10thday1" from "day1" drop down
    When The user select the "10thday2" from "day2" drop down
    When The user click on the "Next" button
    Then The application should display error message under "days-error" section
      | error_message | Day 2 must be later than Day 1 |

    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | amount             | 0            |
      | payeeBSB           | 12           |
      | payeeAccountName   | Account Name |
      | payeeAccountNumber | 12           |
    # When The user click on the "Next" button
    # Then The application should display error message under "amount-error" section
    #   | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

    # Then The user enter the following text in corresponding textboxes
    #   | field_name | field_value |
    #   | amount     | 1000000.01  |
    # When The user click on the "Next" button
    # Then The application should display error message under "amount-error" section
    #   | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |

    When The user select the "Monthly (on business day)" from "frequency" drop down
    When The user select the "1st" from "businessDay" drop down
    When The user select the "Yes (first payment)" from "variablePayAmountRequired" drop down
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value |
      | amount             | 123456      |
      | paymentReference   | MPP#ref     |
      | paymentStartDate   | 18/01/2021  |
      | lastPaymentDate    | 28/01/2021  |
      | payeeBSB           | 125454545   |
      | payeeAccountNumber | 125454      |
    When The user click on the "Next" button

    Then The application should display error message under "variablePayAmount-error" section
      | error_message | Amount should be greater than 0.00 and less than $1,000,000.01 |



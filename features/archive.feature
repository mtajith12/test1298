# @RegressionArchive
# Feature: Moved all archive test cases under here.


#  @shakeout-AmendPeriodicalPayment
#   Scenario: viewing case, checking the status for Amend Periodical Payment
#     Given I am logging in as user "AUTODSS5" with permission to create "Amend Periodical Payment" service request
#     Then The user searches the stored service request with request type "Amend Periodical Payment" search req type "Manage Periodical Payments" and selects it
#     Then The "Summary_Info_RequestID_value" value displays the id for "Amend Periodical Payment" SR
#     Then The application should display following fields "in view details screen"
#       | field_name                       |
#       | commentsTable                    |
#       | Summary_Info_RequestID_value     |
#       | Summary_Info_Requestedby_value   |
#       | Summary_Info_RequestStatus_value |
#     Then The application should display the "fields with text in view details" for "Amend Periodical Payment SR"
#       #   | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#       | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL |
#       | AccountDefaultCurrency         | AUD                               |
#       | Summary_Info_YourReference_val | testpurpose                       |
#     Then I click on "viewAuditHistory"
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |


#        @RegressionArchive
#   Scenario: Close Periodical Payment - Create CPP request,Approve and view
#     Given I am logging in as token user "AUTODSS8" with permission to create "Recall Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value  |
#       | serialNumber          | 12345678     |
#       | payeeAccountName      | Account Name |
#       | paymentReference      | CPP#ref      |
#       | closePeriodicalAmount | 213312.02    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name | field_value  |
#       | closeDate  | Dec 24, 2020 |
#    #   Then The user picking the "closeDate" from calender
#     Then The user enter "testROF#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Service Request Header" for "CPP service request in Review mode"
#       | paymentsTitle               | Close Periodical Payment (AU)   |
#       | paymentsDesc                | Close your periodical payments. |
#       | serialNumber-label          | Serial Number                   |
#       | payeeAccountName-label      | Payee Account Name              |
#       | paymentReference-label      | Payment Reference               |
#       | closePeriodicalAmount-label | Amount                          |
#       | closeDate-label             | Close Date                      |
#       #| payeeAccountName            | Account Name                    |
#       | paymentReference            | CPP#ref                         |
#       | closePeriodicalAmount       | AUD 213,312.02                  |
#     When The user click on the "Submit" button
#     Then The application should display the "Confirmation pop-up" for "Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     Then The "responseId" for the "Close Periodical Payment" is detail is saved to a file
#     Then I click on "Ok"
#     Then The user searches the stored service request with request type "Close Periodical Payment" search req type "Close Periodical Payment" and selects it
#     Then The application should display the "Service Request Header,Summary Information,Account details" for "CPP SR in view mode"
#       | paymentsTitle                  | Close Periodical Payment (AU)     |
#       | paymentsDesc                   | Close your periodical payments.   |
#       | Summary_Info_header            | Summary Information               |
#       | Summary_Info_RequestID_txt     | Request ID                        |
#       | Summary_Info_Requestedon_txt   | Requested on                      |
#       | Summary_Info_Requestedby_txt   | Requested by                      |
#       | Summary_Info_RequestStatus_txt | Your Reference                    |
#       | Summary_Info_YourReference_txt | Request Status                    |
#       | AccountHeaderLabel             | Account Details                   |
#       | AccountName                    | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
#       | AccountDefaultCurrency         | AUD                               |
#       | serialNumber-label             | Serial Number                     |
#       | payeeAccountName-label         | Payee Account Name                |
#       | paymentReference-label         | Payment Reference                 |
#       | closePeriodicalAmount-label    | Amount                            |
#       | closeDate-label                | Close Date                        |
#       | serialNumber                   | 1234567                           |
#       | payeeAccountName               | Account Name                      |
#       | paymentReference               | CPP#ref                           |
#       | closePeriodicalAmount          | AUD 213,312.02                    |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then I click on "viewAuditHistory"
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | Pending Approval |
#     When The user click on the "cancelBtn" button
#     Then The application should display following fields "Close Periodical Payment view details screen"
#       | field_name |
#       | Approve    |
#       | Reject     |
#     When The user click on the "Approve" button
#     When The user click on the "approvechkbox" button
#     When The user click on the "Continue" button
#     Then The user enter the following text in corresponding textboxes
#       | field_name    | field_value |
#       | authoriseCode | 8754328     |
#     Then The user click on the "approveBtn" button
#     Then The application should display the "status as Approved" for "SR"
#       | summary_status | Approved |
#     When The user click on the "Close" button
#     Then The user searches the stored service request with request type "Close Periodical Payment" search req type "Close Periodical Payment" and selects it
#     Then The application should display the "status as Approved" for "SR"
#       | summary_status | In Progress |
#     Then I click on "viewAuditHistory"
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |

#   # @shakeout#Reject#weform Half Done
#   # Scenario: Return Incorrectly Received Funds - Reject Service Request (Webform)
#   #   Given I am logging in as user "AUTODSS6" with permission to create "Return Incorrectly Received Funds" service request
#   #   When The user navigate to the "Return Incorrectly Received Funds" service request screen
#   #   When The user Clicks the "confirmButton" button
#   #   When The user types Account Name "OSTOJIC PUBLIC FEDERAL GOVERNMENT" to the search box in the Search Account Lookup Dialog
#   #   When I am selecting an eligible account from Search Account Lookup Dialog
#   #   Then The application should display the "SearchforTransactionLabel" for "DDR Service Request" text
#   #     | SearchforTransactionLabel | Search for Transaction |
#   #   Then The user enters value in the search criteria fields
#   #     | PostDate | March 9, 2020 |
#   #     | amount   |               |
#   #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
#   #   Then The user enter "testROF#PendingApproval" into the "your_reference" text field
#   #   When The user Clicks the "Next" button
#   #   Then The application should display the "Account details" for "ROF on review page"
#   #     | AccountHeaderLabel     | Account Details                   |
#   #     | AccountName            | OSTOJIC PUBLIC FEDERAL GOVERNMENT |
#   #     | AccountDefaultCurrency | AUD                               |
#   #   When The user click on the "importantInformationCheckBox" button
#   #   When The user click on the "Submit" button
#   #   Then The request id is stored from the element "responseId"
#   #   When The user click on the "view_request_link" link
#   #   Then The application should display the "Service Request Header and Summary Information" for "ROF service request in view mode"
#   #     | returnOffund_title           | Return Incorrectly Received Funds (AU)                                                                    |
#   #     | returnOffund_desc            | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
#   #     | Summary_Info_header          | Summary Information                                                                                       |
#   #     | Summary_Info_RequestID_txt   | Request ID                                                                                                |
#   #     | Summary_Info_Requestedon_txt | Requested on                                                                                              |
#   #     | Summary_Info_Requestedby_txt | Requested by                                                                                              |
#   #     | summary_status               | Pending Approval                                                                                          |
#   #   Then The application should display the "Approve" button
#   #   Then The application should display the "Reject" button
#   #   When The user click on the "Reject" button
#   #   Then The application should display the "Reject model window" for "SR"
#   #     | rejectDialog-title  | Reject Service Request |
#   #     | cancelBtn           | Cancel                 |
#   #     | rejectBtn           | Reject                 |
#   #     | rejectComment-label | Reason For Rejection   |
#   #     | rejectComment       |                        |
#   #   Then The user enter "Rejection comments text" into the "rejectComment" text field
#   #   And The user click on the "rejectBtn" button
#   #   Then The application should display the "Reject" toast notification
#   #   Then The user waiting to load "or refresh the screen"
#   #   Then The application should display the "Service Request Header and Status" for "ROF service request in view mode"
#   #     | returnOffund_title           | Return Incorrectly Received Funds (AU)                                                                    |
#   #     | returnOffund_desc            | Request a return of funds if you are unable to reconcile a transaction and would like the funds returned. |
#   #     | Summary_Info_header          | Summary Information                                                                                       |
#   #     | Summary_Info_RequestID_txt   | Request ID                                                                                                |
#   #     | Summary_Info_Requestedon_txt | Requested on                                                                                              |
#   #     | Summary_Info_Requestedby_txt | Requested by                                                                                              |
#   #     | summary_status               | Rejected                                                                                                  |

#   # @PCM#Reject Half done
#   # Scenario: Delete Signatory - Reject Service Request (PCM)
#   #   Given I am an authorised user with permission to create an "Delete Signatory" service request
#   #   When The user navigate to the "Delete Signatory" service request screen
#   #   Then The application should display the "service request Header details" for "Delete Signatory"
#   #     | Title       | Delete Signatory (AU)                                                                                                                      |
#   #     | Description | Delete authorised signatories from accounts with the option of removing them as authorised persons and/or users for your digital channels. |
#   #   Then The application should allow user to select and upload one or more files from computer
#   #     | filepath1 | //resources//input//Test-pdf.pdf    |
#   #     | filepath2 | //resources//input//Test-pdf1.pdf   |
#   #     | filepath3 | //resources//input//Test-Excel.xlsx |
#   #   Then The user enter "test#Ref#123" into the "your_reference" text field
#   #   Then The user select a legal entity from the search legal entity pop up
#   #     | legalEntity | NSWG |
#   #   When The user click on the "Submit" button
#   #   When The user click on the "view_request_link" link
#   #   Then The application should display the "Service Request Header and Summary InformationLegal Entity details" for "Delete Signatory Service request"
#   #     | Title                        | Delete Signatory (AU)                                                                                                                      |
#   #     | Description                  | Delete authorised signatories from accounts with the option of removing them as authorised persons and/or users for your digital channels. |
#   #     | Summary_Info_header          | Summary Information                                                                                                                        |
#   #     | Summary_Info_RequestID_txt   | Request ID                                                                                                                                 |
#   #     | Summary_Info_Requestedon_txt | Requested on                                                                                                                               |
#   #     | Summary_Info_Requestedby_txt | Requested by                                                                                                                               |
#   #     | summary_status               | Pending Approval                                                                                                                           |
#   #   Then The application should display the "Approve" button
#   #   Then The application should display the "Reject" button
#   #   When The user click on the "Reject" button
#   #   Then The application should display the "Reject model window" for "SR"
#   #     | rejectDialog-title  | Reject Service Request |
#   #     | cancelBtn           | Cancel                 |
#   #     | rejectBtn           | Reject                 |
#   #     | rejectComment-label | Reason For Rejection   |
#   #     | rejectComment       |                        |
#   #   Then The user enter "Rejection comments text" into the "rejectComment" text field
#   #   And The user click on the "rejectBtn" button
#   #   Then The application should display the "Reject" toast notification
#   #   Then The user waiting to load "or refresh the screen"
#   #   Then The application should display the "Service Request Header and Status" for "ROF service request in view mode"
#   #     | Title                        | Delete Signatory (AU)                                                                                                                      |
#   #     | Description                  | Delete authorised signatories from accounts with the option of removing them as authorised persons and/or users for your digital channels. |
#   #     | Summary_Info_header          | Summary Information                                                                                                                        |
#   #     | Summary_Info_RequestID_txt   | Request ID                                                                                                                                 |
#   #     | Summary_Info_Requestedon_txt | Requested on                                                                                                                               |
#   #     | Summary_Info_Requestedby_txt | Requested by                                                                                                                               |
#   #     | summary_status               | Rejected                                                                                                                                   |

# @shakeout-AddPeriodicalPayment
#   Scenario: Creating case for Add Periodical Payment
#     Given I am logging in as user "AUTODSS5" with permission to create "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should display following fields "Add Periodical Payment"
#       | field_name         |
#       | dowload_form       |
#       | browse_upload      |
#       | your_reference     |
#       | AccountHeaderLabel |
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value |
#       | your_reference | testpurpose |
#     When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then I click on "importantInfo_checkbox"
#     Then I click on "Submit"
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#     #Then The request id is stored from the element "responseId"
#     Then The "responseId" for the "Add Periodical Payment" is detail is saved to a file
#   #  Then I click on "Ok"
#   # Then The user searches stored service request with request type "Manage Periodical Payments" and selects it
#   # Then The "Summary_Info_RequestID_value" value displays the stored id
#   # Then The application should display following fields "in view details screen"
#   #   | field_name                       |
#   #   | commentsTable                    |
#   #   | Summary_Info_RequestID_value     |
#   #   | Summary_Info_Requestedby_value   |
#   #   | Summary_Info_RequestStatus_value |
#   # Then The application should display the "fields with text in view details" for "Add Periodical Payment SR"
#   #   | Important_Information          | Product Fee Schedule for any Fee and/or Charges that may apply to this service. that may apply to this service. |
#   #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
#   #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
#   # Then I click on "viewAuditHistory"
#   # Then The application should display the "status as In progress in Audit history" for "service request"
#   #   | AuditHistoryStatus | Submitted |

#    @shakeout-AmendPeriodicalPayment
#   Scenario: Creating case, search and view the created case for Amend Periodical Payment
#     Given I am logging in as user "AUTODSS5" with permission to create "Amend Periodical Payment" service request
#     When The user navigate to the "Amend Periodical Payment" service request screen
#     Then The application should display following fields "Amend Periodical Payment"
#       | field_name     |
#       | dowload_form   |
#       | browse_upload  |
#       | your_reference |
#     # | legalEntity_dropdown |
#     #| importantInfo_checkbox |
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value |
#       | your_reference | testpurpose |
#     #Then The user select "AutoLegal1" from "legalEntity_dropdown"
#     When The user types Account Name "COOPER PRIVATE INDUSTRIAL GENERAL" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then I click on "Submit"
#     Then The application should display following fields "Amend Periodical Paymentr SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#     #hen The request id is stored from the element "responseId"
#     Then The "responseId" for the "Amend Periodical Payment" is detail is saved to a file
#     Then I click on "Ok"
#   # Then The user searches stored service request with request type "Manage Periodical Payments" and selects it
#   # Then The "Summary_Info_RequestID_value" value displays the stored id
#   # Then The application should display following fields "in view details screen"
#   #   | field_name                       |
#   #   | commentsTable                    |
#   #   | Summary_Info_RequestID_value     |
#   #   | Summary_Info_Requestedby_value   |
#   #   | Summary_Info_RequestStatus_value |
#   # Then The application should display the "fields with text in view details" for "Amend Periodical Payment SR"
#   #   | Legal_Entity_Value             | AutoLegal1                                                                                    |
#   #   | Summary_Info_YourReference_val | testpurpose                                                                                   |
#   # Then I click on "viewAuditHistory"
#   # Then The application should display the "status as In progress in Audit history" for "service request"
#   #   | AuditHistoryStatus | Submitted |


#  @shakeout-AddPeriodicalPayment
#   Scenario: Viewing case, checking the status for Add Periodical Payment
#     Given I am logging in as user "AUTODSS5" with permission to create "Add Periodical Payment" service request
#     Then The user searches the stored service request with request type "Add Periodical Payment" search req type "Manage Periodical Payments" and selects it
#     Then The "Summary_Info_RequestID_value" value displays the id for "Add Periodical Payment" SR
#     Then The application should display following fields "in view details screen"
#       | field_name                       |
#       | commentsTable                    |
#       | Summary_Info_RequestID_value     |
#       | Summary_Info_Requestedby_value   |
#       | Summary_Info_RequestStatus_value |
#     Then The application should display the "fields with text in view details" for "Add Periodical Payment SR"
#       | Important_Information          | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#       | AccountName                    | COOPER PRIVATE INDUSTRIAL GENERAL                                                                         |
#       | AccountDefaultCurrency         | AUD                                                                                                       |
#       | Summary_Info_YourReference_val | testpurpose                                                                                               |
#     Then I click on "viewAuditHistory"
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |


#   # @shakeout-ttr
#   # Scenario: Creating case for TTR using Manual transaction
#   #   Given The user navigated to the "Trace a Transaction" service request screen
#   #   When The user types Account Name "LE COMPANY SIT 5" to the search box in the Search Account Lookup Dialog
#   #   When I am selecting an eligible account from Search Account Lookup Dialog
#   #   When The user click on the "Enter your details in manually" link
#   #   Then The system displays fields to enter 'Manual entry details'
#   #   Then The user enter the 'Manual entry information' in all fields
#   #   When The user Clicks the "Next" button
#   #   Then The system must display the service request footer as per Field Matrix
#   #   When The user Clicks the "Submit" button
#   #   Then The system must display a confirmation pop-up message as per the Field Matrix
#   #   Then The request id is stored from the element "responseId"
#   #   When The user Clicks the "Ok" button
#   #   Then The user searches stored service request with request type "Channel User Maintenance" and selects it
#   #   Then The view details screen of manual transaction is displayed with corresponding fields
#   #   Then The user selects to 'View Audit History' for the service request
#   #   And The status in Audit history should displays as "In Progress"

# #-------------------------------------------Close Periodical Payment  ----------------------------------------------------------------------------

#   @dummy
#   Scenario: Close Periodical Payment - Notification Dialog,Header & Progress Bar
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application shows the "cancel" button
#     Then  The application should display the "progress bar with status" for "Direct Debits Service Request" text
#       | progressBarTxt1    | Select Service Type |
#       | progressBarTxt2    | Enter Details       |
#       | progressBarTxt3    | Review & Submit     |
#       | progressBarStatus1 | Completed           |
#       | progressBarStatus2 | Current             |
#       | progressBarStatus3 |                     |
#     Then The select service type marked as complete with tick symbol
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog


#   @CPP7
#   Scenario: Close Periodical Payment - Populating 'Your Reference' value in view page
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#your_reference" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "ACPP on review page"
#       | AccountHeaderLabel     | Account Details |
#       | AccountName            | BO-PENDING      |
#       | AccountDefaultCurrency | AUD             |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "Your Reference details" for "ACPP on review page"
#       | Your_Reference_header | Your Reference (optional) |
#       | your_reference        | testACPP#yourreference    |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header              | Summary Information    |
#       | Summary_Info_RequestID_txt       | Request ID             |
#       | Summary_Info_Requestedon_txt     | Requested on           |
#       | Summary_Info_Requestedby_txt     | Requested by           |
#       | Summary_Info_RequestStatus_txt   | Your Reference         |
#       | Summary_Info_YourReference_txt   | Request Status         |
#       | Summary_Info_YourReference_value | testACPP#yourreference |

#   @CPP8
#   Scenario: Close Periodical Payment - Cancel Service Request prior to submission in 'Enter details' screen
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application shows the "cancel" button
#     When The user Clicks the "Cancel" button
#     Then The application should display an alert pop-up message
#     When The user Clicks the "No" button
#     Then The application must close the cancel service request alert pop-up message
#     When The user Clicks the "Cancel" button
#     Then The application should display an alert pop-up message
#     When The user Clicks the "Yes" button
#     Then The application shows "Create Service Request" screen

#   @CPP9
#   Scenario: Close Periodical Payment - Cancel Service Request prior to submission on 'Review and Submit' screen
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     When The user Clicks the "Next" button
#     Then The application shows the "cancel" button
#     When The user Clicks the "Cancel" button
#     Then The application should display an alert pop-up message
#     When The user Clicks the "No" button
#     Then The application must close the cancel service request alert pop-up message
#     When The user Clicks the "Cancel" button
#     Then The application should display an alert pop-up message
#     When The user Clicks the "Yes" button
#     Then The application shows "Create Service Request" screen

#   @CPP10
#   Scenario: Close Periodical Payment - User does not have email address
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "Test@anz.com" in "EmailId" textbox
#     When The user Clicks the "Ok" button



#   @CPP0
#   Scenario: Close Periodical Payment - Create CPP request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The application should display the "Your Reference section" for "Close Periodical Payment Service Request"
#       | Your_Reference_header           | Your Reference (optional)                                                                    |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#       | Your_Reference_textbox          |                                                                                              |
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       | AccountName | BO-PENDING |
#     #  | AccountDefaultCurrency | AUD                                                                                                               |
#     #| AccountDescription | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#       | Summary_Info_YourReference_txt | Request Status      |
#     Then The application should display the "Account details" for "ACPP service request in view mode"
#       | AccountHeaderLabel          | Account Details    |
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |



#   @ACPPSearch
#   Scenario: Close Periodical Payment - Create ACPP request and search based on requestId
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The application should display the "Enter Periodical Payment Details" for "Close Periodical Payment Service Request"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                |                    |
#       | payeeAccountName            |                    |
#       | paymentReference            |                    |
#       | closePeriodicalAmount       |                    |
#       | closeDate                   |                    |
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The application should display the "Your Reference section" for "Close Periodical Payment Service Request"
#       | Your_Reference_header           | Your Reference (optional)                                                                    |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#       | Your_Reference_textbox          |                                                                                              |
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       # | AccountHeaderLabel     | Account Details                                                                                                   |
#       | AccountName            | BO-PENDING |
#       | AccountDefaultCurrency | AUD        |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     #| closeDate                   | 26/09/2020         |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     Then I click on "Ok"
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#       | Summary_Info_YourReference_txt | Request Status      |
#     Then The application should display the "Account details" for "ACPP service request in view mode"
#       | AccountHeaderLabel          | Account Details    |
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |


#   @ACPPsearch2
#   Scenario: Close Periodical Payment - Search based on RequestType Search Criteria
#     Given The user on the service request history page
#     When The user open the search fields
#     And The user click into the "Request type" field
#     Then The user should be able to see and select "Close Periodical Payment"
#     When The user Clicks the "summaryGridsearch" button
#     Then User should only see request history items that relate to "Close Periodical Payment"

#   @ACPP-Reopen1
#   Scenario: Close Periodical Payment - Reopen modal/pop-up 'Close Periodical Payment' request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     # Then The application should display the "SearchforTransactionLabel" for " Service Request" text
#     #  | selectAccountLabel            | Select Account                   |
#     #  | periodicalPaymentDetailsLabel | Enter Periodical Payment Details |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       # | AccountHeaderLabel     | Account Details                                                                                                   |
#       | AccountName            | BO-PENDING |
#       | AccountDefaultCurrency | AUD        |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     #| closeDate                   | 26/09/2020         |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#       | Summary_Info_YourReference_txt | Request Status      |
#     Then The application should display the "Account details" for "ACPP service request in view mode"
#       | AccountHeaderLabel          | Account Details    |
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     Then The user update the service request status with following details
#       | requestId     | responseId         |
#       | status        | RESOLVED_COMPLETED |
#       | requestStatus | RESOLVED_COMPLETED |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "updated status" for "ACPP service request"
#       | summary_status | Completed |
#     Then The application should display the "Reopen" button
#     When The user Clicks the "Reopen" button
#     Then The application should display the "Reopen" button
#     Then The application should display the "Reopen model window" for "ACPP request"
#       | reopenModelWindowName            | Reopen Reason                                                                                                 |
#       | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
#       | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
#       | reopenEmailLabel                 | Email                                                                                                         |
#       | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
#     Then The application should display the "SubmitBtn" button
#     Then The application should display the "following reason type" for "ACPP under Reopen model window"
#       | reopen_dropdown_option1 | Please select a reason         |
#       | reopen_dropdown_option2 | Further Investigation Required |
#       | reopen_dropdown_option3 | Information Incomplete         |
#       | reopen_dropdown_option4 | Information Unclear            |
#       | reopen_dropdown_option5 | Other                          |


#   @ACPP-Reopen#submit
#   Scenario: Close Periodical Payment - Reopen modal/pop-up validations and submit
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       # | AccountHeaderLabel     | Account Details                                                                                                   |
#       | AccountName            | BO-PENDING |
#       | AccountDefaultCurrency | AUD        |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     #| closeDate                   | 26/09/2020         |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#       | Summary_Info_YourReference_txt | Request Status      |
#     Then The application should display the "Account details" for "ACPP service request in view mode"
#       | AccountHeaderLabel          | Account Details    |
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     Then The user update the service request status with following details
#       | requestId     | responseId         |
#       | status        | RESOLVED_COMPLETED |
#       | requestStatus | RESOLVED_COMPLETED |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "updated status" for "ACPP service request"
#       | Summary_Info_YourReference_txt | Request Status |
#       | summary_status                 | Completed      |
#     Then The application should display the "Reopen" button
#     When The user Clicks the "Reopen" button
#     Then The application should display the "Reopen" button
#     Then The application should display the "SubmitBtn" button
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reason_errormsg" component
#       | error_message | Reason is mandatory |
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |
#     When The user select the "Further Investigation Required" from "reopenReasonType" drop down
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |
#     When The user entered "test@anz.com" in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
#     When The user entered " " in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |
#     When The user entered "test@anz.com" in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "Confirmation pop-up" for "reopen submitted request"
#       | reopen_submit_confirm_msg1 | Your Service Request has been |
#       | reopen_submit_confirm_msg2 | Reopened.                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user Clicks the "Ok" button
#     Then The user waiting to load "SR details"
#     Then The application shows "Cash Management Service Requests" screen
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "updated status" for "ACPP service request"
#       | Summary_Info_YourReference_txt | Request Status |
#       | summary_status                 | In Progress    |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date     | 19/07/2019 01:37:32 |
#       | Added by | User Lname          |
#       | Comments | reopenReasonText    |

#   @ACPP#ADK-DualApprove @spinner
#   Scenario: Close Periodical Payment - Dual PUSH approval Service Request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Account and Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment review page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "ACPP request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approveBtn          | Approve                 |
#     Then The application should display the "Approve model important Info Content" for "Service Request" text
#       | imp_cpp1 | By approving this service request, you:                              |
#       | imp_cpp2 | ensure the details provided within this service request are correct. |
#     Then The application should display the "approveButton" button
#     Then The application should display the "cancel" button
#     When The user click on the "cancel" button
#     Then The application does not show "approveDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Pending Approval    |
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "service request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approvebtn          | Approve                 |
#     When The user click on the "adk-checkbox" button
#     When The user click on the "approveButton" button
#     When The user click on the "Approve" button
#     Then The application should display the "following below text on Dual approver model window" for "Service Request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | Continue            | Continue                |
#     When The user click on the "adk-checkbox" button
#     When The user click on the "Continue" button
#     Then The application should display the "ADK push Approve model" for "Service Request"
#       | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
#       | cancelBtn                 | Cancel                                                                                                                                                                        |
#       | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
#       | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
#       | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
#        When The user click on the "cancelBtn" button
#     Then The application should display the 'Spinner' while the service calls are being completed
#    Then The application should stop displaying spinner and approval modal should disappear
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "service request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approvebtn          | Approve                 |
#     When The user click on the "adk-checkbox" button
#     When The user click on the "Continue" button
#     Then The application should display the "SingleApprove" toast notification
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#       | summary_status                 | Pending Approval                |


#   @ACPP#ADK-QRApprove
#   Scenario: Close Periodical Payment - Dual QR approval Service Request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Account and Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment review page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "ACPP request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approveBtn          | Approve                 |
#     Then The application should display the "Approve model important Info Content" for "Service Request" text
#       | imp_cpp1 | By approving this service request, you:                              |
#       | imp_cpp2 | ensure the details provided within this service request are correct. |
#     Then The application should display the "approveButton" button
#     Then The application should display the "cancel" button
#     When The user click on the "cancel" button
#     Then The application does not show "approveDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Pending Approval    |
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "service request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approvebtn          | Approve                 |
#     When The user click on the "adk-checkbox" button
#     When The user click on the "approveButton" button
#     When The user click on the "Approve" button
#     Then The application should display the "following below text on Dual approver model window" for "Service Request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | Continue            | Continue                |
#     When The user click on the "adk-checkbox" button
#     When The user click on the "Continue" button
#     Then The application should display the "ADK push Approve model" for "Service Request"
#       | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
#       | cancelBtn                 | Cancel                                                                                                                                                                        |
#       | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
#       | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
#       | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
#     When The user click on the "notificationNotRecBtn" button
#         Then The application should display the "ADK QR Approve model" for "Service Request"
#       | approveADKDialog-title    | Approve Service Request                                                                              |
#       | cancelBtn                 | Cancel                                                                                               |
#       | notificationNotRecBtn     | Generate new QR code                                                                                 |
#       | approveADKDialog-content1 | Please open and log on to the ANZ Digital Key on your activated device. Scan the QR code to proceed. |
#     When The user click on the "cancelBtn" button
#     Then The application should display the 'Spinner' while the service calls are being completed
#    Then The application should stop displaying spinner and approval modal should disappear
#     When The user click on the "Approve" button
#      When The user click on the "adk-checkbox" button
#     When The user click on the "Continue" button
#     Then The application should display the "ADK push Approve model" for "Service Request"
#       | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
#       | cancelBtn                 | Cancel                                                                                                                                                                        |
#       | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
#       | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
#       | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
#     When The user click on the "notificationNotRecBtn" button
#     Then The application should display the "SingleApprove" toast notification
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#       | summary_status                 | Pending Approval                |






#   @ACPP-additionalDocs1
#   Scenario: Close Periodical Payment - Submit comments only
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
#       | paymentsTitle          | Close Periodical Payment (AU)   |
#       | paymentsDesc           | Close your periodical payments. |
#       | AccountHeaderLabel     | Account Details                 |
#       | AccountName            | BO-PENDING                      |
#       | AccountDefaultCurrency | AUD                             |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then The request id is stored from the element "responseId"
#    # Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment view page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "request status as More Information Required" for "SR"
#       | Summary_Info_header          | Summary Information       |
#       | Summary_Info_RequestID_txt   | Request ID                |
#       | Summary_Info_Requestedon_txt | Requested on              |
#       | Summary_Info_Requestedby_txt | Requested by              |
#       | summary_status               | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     # Then The application should display the "additional comments section" for "service request"
#     #   | Comment_Section_header          | Comments and Supporting Documents                                                            |
#     #   | additional_CommentLabel         | Please ensure that all required comments and attachments are included before clicking submit |
#     #   | additional_CommentpaymentsTitle | New comment / attachment                                                                     |
#     #   | additional_Comment-field        | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     And The application should display the "Submit" button
#     When The user entered "Test comments" in "Add Comment" textbox
#     #When The user entered "Providing the comments only" in "Additional Comment" textbox
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents section" for "service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date     | 19/07/2019 01:37:32         |
#       | Added by | User Lname                  |
#       | Comments | Providing the comments only |





#   @ACPP-additionalDocs2
#   Scenario: Close Periodical Payment - Submit Attachments only
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       | AccountName            | BO-PENDING |
#       | AccountDefaultCurrency | AUD        |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "Summary Information" for "ACPP service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_YourReference_txt | Request Status      |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#       | AccountHeaderLabel             | Account Details     |
#       | AccountName                    | BO-PENDING          |
#       | AccountDefaultCurrency         | AUD                 |
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "request status as More Information Required" for "ACPP SR"
#       | Summary_Info_header          | Summary Information       |
#       | Summary_Info_RequestID_txt   | Request ID                |
#       | Summary_Info_Requestedon_txt | Requested on              |
#       | Summary_Info_Requestedby_txt | Requested by              |
#       | summary_status               | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     # Then The application should display the "additional comments section" for "service request"
#     #   | Comment_Section_header          | Comments and Supporting Documents                                                            |
#     #   | additional_CommentLabel         | Please ensure that all required comments and attachments are included before clicking submit |
#     #   | additional_CommentpaymentsTitle | New comment / attachment                                                                     |
#     #   | additional_Comment-field        | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents/Attachments details" for " service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date        | 19/07/2019 01:37:32        |
#       | Added by    | User Lname                 |
#       | Attachments | Test-pdf.pdf ( 444.82 KB ) |



#   @ACPP-additionalDocs3
#   Scenario: Close Periodical Payment - Submit Comments and Attachments
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account details" for "review page"
#       | AccountName            | BO-PENDING |
#       | AccountDefaultCurrency | AUD        |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Transaction details" for "review page"
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "Summary Information" for "service request in view mode"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_YourReference_txt | Request Status      |
#       | Summary_Info_RequestStatus_txt | Your Reference      |
#     Then The application should display the "Account details" for "service request in view mode"
#       | AccountHeaderLabel     | Account Details |
#       | AccountName            | BO-PENDING      |
#       | AccountDefaultCurrency | AUD             |
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     Then The application should display the "request status as More Information Required" for "ACPP SR"
#       | Summary_Info_header          | Summary Information       |
#       | Summary_Info_RequestID_txt   | Request ID                |
#       | Summary_Info_Requestedon_txt | Requested on              |
#       | Summary_Info_Requestedby_txt | Requested by              |
#       | summary_status               | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#    Then The application should display "New comment / attachment" sub-section
#      And The application should display the "Submit" button
#     When The user entered "Test comments" in "Additional Comment" textbox
#     When The user entered "Comments with attachments" in "Additional Comment" textbox
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents/Attachments details" for "service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date        | 19/07/2019 01:37:32        |
#       | Added by    | User Lname                 |
#       | Comments    | Comments with attachments  |
#       | Attachments | Test-pdf.pdf ( 444.82 KB ) |

  # @ACPP#DualApprove  --- Currently its pointed to ADK flow
  # Scenario: Close Periodical Payment - Dual approval Service Request
  #   Given I am an authorised user with permission to create an "Close Periodical Payment" service request
  #   When The user navigate to the "Close Periodical Payment" service request screen
  #   Then The application should display the "service request Header details" for "Close Periodical Payment"
  #     | paymentsTitle | Close Periodical Payment (AU)   |
  #     | paymentsDesc  | Close your periodical payments. |
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | CPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testACPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "review page"
  #     | AccountName            | BO-PENDING |
  #     | AccountDefaultCurrency | AUD        |
  #   #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Transaction details" for "review page"
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | CPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "service request Header details" for "Close Periodical Payment"
  #     | paymentsTitle | Close Periodical Payment (AU)   |
  #     | paymentsDesc  | Close your periodical payments. |
  #   Then The application should display the "Summary Information" for "ACPP service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #   Then The application should display the "Account details" for "ACPP service request in view mode"
  #     | AccountHeaderLabel     | Account Details |
  #     | AccountName            | BO-PENDING      |
  #     | AccountDefaultCurrency | AUD             |
  #   #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "ACPP request"
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
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testACPP#PendingApproval |
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   When The user click on the "approveBtn" button
  #   Then The application should display the "SingleApprove" toast notification
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testACPP#PendingApproval |
  #   When The user click on the "Close" button
  #   Then The user searches stored service request with request type "Close Periodical Payment" and selects it
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
  #     | approveDialog-content6 | Enter your 6 digit PIN       |
  #     | approveDialog-content1 | Token authorisation required |
  #   #| importantInfoContent1  | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
  #   # | importantInfoContent2  | By approving this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge ANZ will send a request to the recipient's bank to have the funds returned to this account. It is not guaranteed that the funds will be returned as the recipient has the right to refuse the recall request.\nA request to recall a payment should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments. If the payment has been made to either of these government bodies, please contact the ATO or RBA directly to recall the payment. |
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testACPP#PendingApproval |
  #   When The user click on the "Approve" button
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   Then The user click on the "approveBtn" button
  #   #Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Approve" toast notification
  #   Then The application should display the "Service Request Header" for "ACPP service request in view mode"
  #     | paymentsTitle | Close Periodical Payment (AU)   |
  #     | paymentsDesc  | Close your periodical payments. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Approved                 |
  #     | Summary_Info_YourReference_value | testACPP#PendingApproval |



#   @ACPP#Reject
#   Scenario: Close Periodical Payment - Reject Service Request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Account,Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       #| AccountDescription          | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header details,Summary Information and Account details" for "Close Periodical Payment"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     When The user click on the "Reject" button
#     Then The application should display the "Reject model window" for "SR"
#       | rejectDialog-title  | Reject Service Request |
#       | cancelBtn           | Cancel                 |
#       | rejectBtn           | Reject                 |
#       | rejectComment-label | Reason For Rejection   |
#       | rejectComment       |                        |
#     # Then The application should display the "Reject model important Info Content" for "Service Request" text
#     #| reject-importantInfoHeading | Important Information:                                                                                                                                                              |
#     #| rejectDialog-infoText       | Please be advised that no further actions can be taken on a request after it has been rejected. If any additional actions are required, a new service request will need to be created.|
#     Then The application should display the "rejectBtn" button
#     Then The application should display the "cancelBtn" button
#     When The user click on the "cancelBtn" button
#     Then The application does not show "rejectDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Pending Approval    |
#     When The user click on the "Reject" button
#     Then The application should display the "Reject model window" for "SR"
#       | rejectDialog-title | Reject Service Request |
#       | cancelBtn          | Cancel                 |
#       | rejectBtn          | Reject                 |
#     Then The user enter "Rejection comments text" into the "rejectComment" text field
#     When The user click on the "cancelBtn" button
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header              | Summary Information    |
#       | Summary_Info_RequestID_txt       | Request ID             |
#       | Summary_Info_Requestedon_txt     | Requested on           |
#       | Summary_Info_Requestedby_txt     | Requested by           |
#       | summary_status                   | Pending Approval       |
#       | Summary_Info_YourReference_value | testACPP#authorisation |
#     When The user click on the "Reject" button
#     Then The user enter "Rejection comments text" into the "rejectComment" text field
#     And The user click on the "rejectBtn" button
#     Then The application should display the "Reject" toast notification
#     Then The user waiting to load "or refresh the screen"
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "status as Approved" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Rejected            |

#   @ACPP#InstantCancel
#   Scenario: Close Periodical Payment - Instant Cancel Service Request
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account,Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       #| AccountDescription          | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header,Summary Information and Account" for "Close Periodical Payment review page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The application should display the "Cancel Request" button
#     When The user Clicks the "Cancel Request" button
#     Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
#       | cancelDialog-title | Cancel Service Request                                                                        |
#       | reason-label       | Cancel Reason                                                                                 |
#       | notes-label        | Please provide cancellation details                                                           |
#       | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
#       | reasonoption1 |                            |
#       | reasonoption2 | Duplicate Request          |
#       | reasonoption3 | Request No Longer Required |
#       | reasonoption4 | Request Resolved           |
#     Then The application should display the "SubmitBtn" button
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "following Cancel Request type" for "SR under cancel model window"
#       | reason-error | Cancellation Reason is mandatory   |
#       | notes-error  | Cancellation details are mandatory |
#     When The user Clicks the "cancel" button
#     Then The application does not show "cancelDialog" dialog
#     When The user Clicks the "Cancel Request" button
#     When The user select the "Duplicate Request" from "cancelReasonType" drop down
#     Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "(.*)" toast notification
#     Then The user waiting to load "or refresh the screen"
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "status as Approved" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Cancelled           |



#   @ACPP#CancelRequest
#   Scenario: Close Periodical Payment - Cancel Service Request
#    Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Account and Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "Header,Summary Information and Account" for "Close Periodical Payment review page"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "ACPP request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approveBtn          | Approve                 |
#     Then The application should display the "Approve model important Info Content" for "Service Request" text
#       | imp_cpp1 | By approving this service request, you:                              |
#       | imp_cpp2 | ensure the details provided within this service request are correct. |
#     Then The application should display the "approveButton" button
#     Then The application should display the "cancel" button
#     When The user click on the "cancel" button
#     Then The application does not show "approveDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Pending Approval    |
#       Then The application should display the "Cancel Request" button
#     When The user Clicks the "Cancel Request" button
#     # Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
#     #   | cancelDialog-title | Cancel Service Request                                                                        |
#     #   | reason-label       | Cancel Reason                                                                                 |
#     #   | notes-label        | Please provide cancellation details                                                           |
#     #   | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
#       | reasonoption1 |                              |
#       | reasonoption2 | Duplicate Request            |
#       | reasonoption3 | Request No Longer Required   |
#       | reasonoption4 | Request Resolved             |
#      # | reasonoption5 | Partial Request Cancellation |
#     Then The application should display the "SubmitBtn" button
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "following Cancel Request type" for "SR under cancel model window"
#       | reason-error          | Cancellation Reason is mandatory                      |
#       | notes-error           | Cancellation details are mandatory                    |
#       | importantErrorMessage | Please read and acknowledge by selecting the checkbox |
#     When The user Clicks the "cancel" button
#     Then The application does not show "cancelDialog" dialog
#     When The user Clicks the "Cancel Request" button
#     When The user select the "Duplicate Request" from "cancelReasonType" drop down
#     Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
#     When The user click on the "legalDisclaimerTC" checkbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "The request has been cancelled" toast notification
#     Then The user waiting to load "or refresh the screen"
#     Then The application should display the "Service Request Header, Summary Information status" for "ACPP service request in view mode"
#       | paymentsTitle                | Close Periodical Payment (AU)   |
#       | paymentsDesc                 | Close your periodical payments. |
#       | Summary_Info_header          | Summary Information             |
#       | Summary_Info_RequestID_txt   | Request ID                      |
#       | Summary_Info_Requestedon_txt | Requested on                    |
#       | Summary_Info_Requestedby_txt | Requested by                    |
#       | summary_status               | Cancelled                       |


#   @ACPP#Approve#AfterCutOffDate
#   Scenario: Close Periodical Payment - Dual approval Service Request AfterCutOffDate
#     Given I am an authorised user with permission to create an "Close Periodical Payment" service request
#     When The user navigate to the "Close Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Close Periodical Payment"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | CPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testACPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#       | selectAccountLabel            | Account Details            |
#       | periodicalPaymentDetailsLabel | Periodical Payment Details |
#     Then The application should display the "Account,Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | CPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "ACPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header ,Summary Information,Account" for "Close Periodical Payment"
#       | paymentsTitle                  | Close Periodical Payment (AU)   |
#       | paymentsDesc                   | Close your periodical payments. |
#       | Summary_Info_header            | Summary Information             |
#       | Summary_Info_RequestID_txt     | Request ID                      |
#       | Summary_Info_Requestedon_txt   | Requested on                    |
#       | Summary_Info_Requestedby_txt   | Requested by                    |
#       | Summary_Info_YourReference_txt | Request Status                  |
#       | Summary_Info_RequestStatus_txt | Your Reference                  |
#       | AccountHeaderLabel             | Account Details                 |
#       | AccountName                    | BO-PENDING                      |
#       | AccountDefaultCurrency         | AUD                             |
#     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     Then The application should display the "Approve" button
#     Then The application should display the "Reject" button
#     When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "ACPP request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approveBtn          | Approve                 |
#    # Then The application should display the "Approve model important Info Content" for "Service Request" text
#    #   | importantInfoContent1 | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                         |
#    #   | importantInfoContent2 | By approving this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge that funds will be debited from this account to return the payment.\nA request to return funds should not be initiated for Australian Taxation Office (ATO) or Reserve of Bank of Australia (RBA) payments. If the payment has been received from either of these government bodies, please contact the ATO or RBA directly to return the payment. |
#     Then The application should display the "approveBtn" button
#     Then The application should display the "cancelBtn" button
#     When The user click on the "cancelBtn" button
#     Then The application does not show "approveDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header              | Summary Information      |
#       | Summary_Info_RequestID_txt       | Request ID               |
#       | Summary_Info_Requestedon_txt     | Requested on             |
#       | Summary_Info_Requestedby_txt     | Requested by             |
#       | summary_status                   | Pending Approval         |
#          When The user click on the "Approve" button
#     Then The application should display the "Approve model window" for "service request"
#       | approveDialog-title | Approve Service Request |
#       | cancelBtn           | Cancel                  |
#       | approveBtn          | Approve                 |
#     When The user click on the "approveBtn" button
#     Then The application should display the "SingleApprove" toast notification
#     Then The application should display the "status as Pending Approval" for "SR"
#       | Summary_Info_header              | Summary Information      |
#       | Summary_Info_RequestID_txt       | Request ID               |
#       | Summary_Info_Requestedon_txt     | Requested on             |
#       | Summary_Info_Requestedby_txt     | Requested by             |
#       | summary_status                   | Pending Approval         |
#       When The user click on the "Close" button
#     Then The user searches stored service request with request type "Close Periodical Payment" and selects it
#     When The user click on the "Approve" button
#     Then The application should display the "following below text on Dual approver model window" for "Service Request"
#       | approveDialog-title     | Approve Service Request                       |
#       | cancelBtn               | Cancel                                        |
#       | approveBtn              | Approve                                       |
#       | approveDialog-content2  | Step 1: Generate your authorisation code      |
#       | approveDialog-content3  | Step 2: Enter your authorisation code         |
#       | approveDialog-content4  | Turn on the token by holding down             |
#       | approveDialog-content5  | and pressing                                  |
#       | approveDialog-content7  | Press                                         |
#       | approveDialog-content8  | and enter the following code into your token: |
#       | approveDialog-content9  | Press                                         |
#       | approveDialog-content10 | to display your authorisation code            |
#       | helpLink                | Click here for Security Device Help           |
#     Then The application should display the "Approve model important Info Content" for "Service Request" text
#       | approveDialog-content6 | Enter your 6 digit PIN       |
#       | approveDialog-content1 | Token authorisation required |
#     Then The user enter "8754328" into the "authoriseCode" text field
#     When The user click on the "cancelBtn" button
#     Then The application does not show "approveDialog-title" dialog
#     Then The application should display the "or directed back to the service request details screen" for "SR"
#       | Summary_Info_header              | Summary Information    |
#       | Summary_Info_RequestID_txt       | Request ID             |
#       | Summary_Info_Requestedon_txt     | Requested on           |
#       | Summary_Info_Requestedby_txt     | Requested by           |
#       | summary_status                   | Pending Approval       |
#       When The user click on the "Approve" button
#     Then The user enter "8754328" into the "authoriseCode" text field
#     Then The user click on the "approveBtn" button
#     #Then The user waiting to load "or refresh the screen"
#     Then The application should display the "Approve" toast notification
#     Then The application should display the "Service Request Header" for "ACPP service request in view mode"
#       | paymentsTitle | Close Periodical Payment (AU)   |
#       | paymentsDesc  | Close your periodical payments. |
#     Then The application should display the "status as Approved" for "SR"
#       | Summary_Info_header              | Summary Information      |
#       | Summary_Info_RequestID_txt       | Request ID               |
#       | Summary_Info_Requestedon_txt     | Requested on             |
#       | Summary_Info_Requestedby_txt     | Requested by             |
#       | summary_status                   | Approved                 |




# # @AMPP-Reopen1
#   # Scenario: Close Periodical  Payments - Reopen modal/pop-up 'Manage Periodical (Automatic) Payments (AU)' request
#   #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
#   #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
#   #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
#   #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
#   #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
#   #   When I click on "Close Periodical Payment"
#   #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#   #   When I am selecting an eligible account from Search Account Lookup Dialog
#   #   Then The user enter the following text in corresponding textboxes
#   #     | field_name            | field_value |
#   #     | serialNumber          | 12345678    |
#   #     | payeeAccountName      | Account ame |
#   #     | paymentReference      | MPP#ref     |
#   #     | closePeriodicalAmount | 213312.02   |
#   #   Then The user picking the "closeDate" from calender
#   #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
#   #   When The user Clicks the "Next" button
#   #   Then The application should display the "Account details" for "review page"
#   #        | AccountName            | BO-PENDING |
#   #     | AccountDefaultCurrency | AUD        |
#   #     Then The application should display the "SearchforTransactionLabel" for "Service Request" text
#   #     | selectAccountLabel            | Account Details            |
#   #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
#   #   Then The application should display the "Transaction details" for "review page"
#   #     | serialNumber-label          | Serial Number      |
#   #     | payeeAccountName-label      | Payee Account Name |
#   #     | paymentReference-label      | Payment Reference  |
#   #     | closePeriodicalAmount-label | Amount             |
#   #     | closeDate-label             | Close Date         |
#   #     | serialNumber                | 1234567            |
#   #     | payeeAccountName            | Account ame        |
#   #     | paymentReference            | MPP#ref            |
#   #     | closePeriodicalAmount       | AUD 213,312.02     |
#   #    When The user click on the "Submit" button
#   #   Then The application shows "Manual email modal" dialog
#   #   When The user entered "test@anz.com" in "EmailId" textbox
#   #   When The user click on the "Ok" button
#   #   Then The request id is stored from the element "responseId"
#   #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
#   #     | request_status             | Pending Approval              |
#   #     | view_request_link          | View Request Details          |
#   #     | raise_another_request_link | Raise another Service Request |
#   #   When The user click on the "view_request_link" link
#   #   Then The application should display the "Service Request Header" for "AMPP service request in view mode"
#   #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
#   #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
#   #   Then The application should display the "viewAuditHistory" button
#   #   Then The application should display the "Close" button
#   #   Then The application should display the "Approve" button
#   #   Then The application should display the "Reject" button
#   #   Then The application should display the "Summary Information" for "AMPP service request in view mode"
#   #     | Summary_Info_header            | Summary Information |
#   #     | Summary_Info_RequestID_txt     | Request ID          |
#   #     | Summary_Info_Requestedon_txt   | Requested on        |
#   #     | Summary_Info_Requestedby_txt   | Requested by        |
#   #     | Summary_Info_RequestStatus_txt | Your Reference      |
#   #     | Summary_Info_YourReference_txt | Request Status      |
#   #   Then The application should display the "Account details" for "AMPP service request in view mode"
#   #     | AccountHeaderLabel          | Account Details    |
#   #     | AccountName                 | BO-PENDING         |
#   #     | AccountDefaultCurrency      | AUD                |
#   #     | serialNumber-label          | Serial Number      |
#   #     | payeeAccountName-label      | Payee Account Name |
#   #     | paymentReference-label      | Payment Reference  |
#   #     | closePeriodicalAmount-label | Amount             |
#   #     | closeDate-label             | Close Date         |
#   #     # | serialNumber                | 1234567            |
#   #     | payeeAccountName            | Account ame        |
#   #     | paymentReference            | MPP#ref            |
#   #     | closePeriodicalAmount       | AUD 213,312.02     |
#   #   Then The user update the service request status with following details
#   #     | requestId     | responseId         |
#   #     | status        | RESOLVED_COMPLETED |
#   #     | requestStatus | RESOLVED_COMPLETED |
#   #   When The user Clicks the "Close" button
#   #   Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
#   #   Then The application should display the "updated status" for "AMPP service request"
#   #     | summary_status | Completed |
#   #   Then The application should display the "Reopen" button
#   #   When The user Clicks the "Reopen" button
#   #   Then The application should display the "Reopen" button
#   #   Then The application should display the "Reopen model window" for "AMPP request"
#   #     | reopenModelWindowName            | Reopen Reason                                                                                                 |
#   #     | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
  #     | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
  #     | reopenEmailLabel                 | Email                                                                                                         |
  #     | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
  #   Then The application should display the "SubmitBtn" button
  #   Then The application should display the "following reason type" for "AMPP under Reopen model window"
  #     | reopen_dropdown_option1 | Please select a reason         |
  #     | reopen_dropdown_option2 | Further Investigation Required |
  #     | reopen_dropdown_option3 | Information Incomplete         |
  #     | reopen_dropdown_option4 | Information Unclear            |
  #     | reopen_dropdown_option5 | Other                          |


  # @AMPP-Reopen#submit
  # Scenario: Close Periodical  Payments - Reopen modal/pop-up validations and submit
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When I click on "Close Periodical Payment"
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "review page"
  #     # | AccountHeaderLabel     | Account Details                                                                                                   |
  #     | AccountName            | BO-PENDING |
  #     | AccountDefaultCurrency | AUD        |
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Transaction details" for "review page"
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   #| closeDate                   | 26/09/2020         |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Service Request Header" for "AMPP service request in view mode"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   Then The application should display the "Summary Information" for "AMPP service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #   Then The application should display the "Account details" for "AMPP service request in view mode"
  #     | AccountHeaderLabel          | Account Details    |
  #     | AccountName                 | BO-PENDING         |
  #     | AccountDefaultCurrency      | AUD                |
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     #  | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId         |
  #     | status        | RESOLVED_COMPLETED |
  #     | requestStatus | RESOLVED_COMPLETED |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
  #   Then The application should display the "updated status" for "AMPP service request"
  #     | Summary_Info_YourReference_txt | Request Status |
  #     | summary_status                 | Completed      |
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
  #   When The user entered "test@anz.com" in "reopenEmailInput" textbox
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "Confirmation pop-up" for "reopen submitted request"
  #     | reopen_submit_confirm_msg1 | Your Service Request has been |
  #     | reopen_submit_confirm_msg2 | Reopened.                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user Clicks the "Ok" button
  #   Then The user waiting to load "SR details"
  #   Then The application shows "Cash Management Service Requests" screen
  #   Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
  #   Then The application should display the "updated status" for "AMPP service request"
  #     | Summary_Info_YourReference_txt | Request Status |
  #     | summary_status                 | In Progress    |
  #   Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
  #     | Date     | 19/07/2019 01:37:32 |
  #     | Added by | User Lname          |
  #     | Comments | reopenReasonText    |

  # # @AMPP#ADK-DualApprove @spinner
  # # Scenario: Close Periodical  Payments - Dual PUSH approval Service Request
  # #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  # #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  # #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  # #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  # #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  # #   When I click on "Close Periodical Payment"
  # #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  # #   When I am selecting an eligible account from Search Account Lookup Dialog
  # #   Then The user enter the following text in corresponding textboxes
  # #     | field_name            | field_value |
  # #     | serialNumber          | 12345678    |
  # #     | payeeAccountName      | Account ame |
  # #     | paymentReference      | MPP#ref     |
  # #     | closePeriodicalAmount | 213312.02   |
  # #   Then The user picking the "closeDate" from calender
  # #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  # #   When The user Clicks the "Next" button
  # #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  # #     | selectAccountLabel            | Account Details            |
  # #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  # #   Then The application should display the "Account and Transaction details" for "review page"
  # #     | AccountName                 | BO-PENDING         |
  # #     | AccountDefaultCurrency      | AUD                |
  # #     | serialNumber-label          | Serial Number      |
  # #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) review page"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "AMPP request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   Then The application should display the "Approve model important Info Content" for "Service Request" text
  #     | imp_cpp1 | By approving this service request, you:                              |
  #     | imp_cpp2 | ensure the details provided within this service request are correct. |
  #   Then The application should display the "approveButton" button
  #   Then The application should display the "cancel" button
  #   When The user click on the "cancel" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approvebtn          | Approve                 |
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "approveButton" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "following below text on Dual approver model window" for "Service Request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | Continue            | Continue                |
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "Continue" button
  #   Then The application should display the "ADK push Approve model" for "Service Request"
  #     | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
  #     | cancelBtn                 | Cancel                                                                                                                                                                        |
  #     | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
  #     | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
  #     | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the 'Spinner' while the service calls are being completed
  #   Then The application should stop displaying spinner and approval modal should disappear
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approvebtn          | Approve                 |
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "Continue" button
  #   Then The application should display the "SingleApprove" toast notification
  #   Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) view page"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #     | summary_status                 | Pending Approval                                                   |


  # @AMPP#ADK-QRApprove
  # Scenario: Close Periodical  Payments - Dual QR approval Service Request
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When I click on "Close Periodical Payment"
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Account and Transaction details" for "review page"
  #     | AccountName                 | BO-PENDING         |
  #     | AccountDefaultCurrency      | AUD                |
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) review page"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "AMPP request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   Then The application should display the "Approve model important Info Content" for "Service Request" text
  #     | imp_cpp1 | By approving this service request, you:                              |
  #     | imp_cpp2 | ensure the details provided within this service request are correct. |
  #   Then The application should display the "approveButton" button
  #   Then The application should display the "cancel" button
  #   When The user click on the "cancel" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approvebtn          | Approve                 |
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "approveButton" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "following below text on Dual approver model window" for "Service Request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | Continue            | Continue                |
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "Continue" button
  #   Then The application should display the "ADK push Approve model" for "Service Request"
  #     | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
  #     | cancelBtn                 | Cancel                                                                                                                                                                        |
  #     | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
  #     | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
  #     | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
  #   When The user click on the "notificationNotRecBtn" button
  #   Then The application should display the "ADK QR Approve model" for "Service Request"
  #     | approveADKDialog-title    | Approve Service Request                                                                              |
  #     | cancelBtn                 | Cancel                                                                                               |
  #     | notificationNotRecBtn     | Generate new QR code                                                                                 |
  #     | approveADKDialog-content1 | Please open and log on to the ANZ Digital Key on your activated device. Scan the QR code to proceed. |
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the 'Spinner' while the service calls are being completed
  #   Then The application should stop displaying spinner and approval modal should disappear
  #   When The user click on the "Approve" button
  #   When The user click on the "adk-checkbox" button
  #   When The user click on the "Continue" button
  #   Then The application should display the "ADK push Approve model" for "Service Request"
  #     | approveADKDialog-title    | Approve Service Request                                                                                                                                                       |
  #     | cancelBtn                 | Cancel                                                                                                                                                                        |
  #     | notificationNotRecBtn     | Notification Not Received                                                                                                                                                     |
  #     | approveADKDialog-content1 | We have sent a notification to your activated device                                                                                                                          |
  #     | approveADKDialog-content2 | Once you receive the notification, please tap on it to approve your service request(s) using ANZ Digital Key. Please note this notification may take a few moments to arrive. |
  #   When The user click on the "notificationNotRecBtn" button
  #   Then The application should display the "SingleApprove" toast notification
  #   Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) view page"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #     | summary_status                 | Pending Approval                                                   |



  # @AMPP#DualApprove  --- Currently its pointed to ADK flow
  # Scenario: Close Periodical  Payments - Dual approval Service Request
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)   |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "review page"
  #     | AccountName            | BO-PENDING |
  #     | AccountDefaultCurrency | AUD        |
  #   #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Transaction details" for "review page"
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)   |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   Then The application should display the "Summary Information" for "AMPP service request in view mode"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_YourReference_txt | Request Status      |
  #     | Summary_Info_RequestStatus_txt | Your Reference      |
  #   Then The application should display the "Account details" for "AMPP service request in view mode"
  #     | AccountHeaderLabel     | Account Details |
  #     | AccountName            | BO-PENDING      |
  #     | AccountDefaultCurrency | AUD             |
  #   #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "AMPP request"
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
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testAMPP#PendingApproval |
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   When The user click on the "approveBtn" button
  #   Then The application should display the "SingleApprove" toast notification
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testAMPP#PendingApproval |
  #   When The user click on the "Close" button
  #   Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
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
  #     | approveDialog-content6 | Enter your 6 digit PIN       |
  #     | approveDialog-content1 | Token authorisation required |
  #   #| importantInfoContent1  | It is your responsibility to ensure that the details provided in the service request are correct.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
  #   # | importantInfoContent2  | By approving this request, I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) and acknowledge ANZ will send a request to the recipient's bank to have the funds returned to this account. It is not guaranteed that the funds will be returned as the recipient has the right to refuse the recall request.\nA request to recall a payment should not be initiated for Australian Taxation Office (ATO) or Reserve Bank of Australia (RBA) payments. If the payment has been made to either of these government bodies, please contact the ATO or RBA directly to recall the payment. |
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Pending Approval         |
  #     | Summary_Info_YourReference_value | testAMPP#PendingApproval |
  #   When The user click on the "Approve" button
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   Then The user click on the "approveBtn" button
  #   #Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Approve" toast notification
  #   Then The application should display the "Service Request Header" for "AMPP service request in view mode"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)   |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header              | Summary Information      |
  #     | Summary_Info_RequestID_txt       | Request ID               |
  #     | Summary_Info_Requestedon_txt     | Requested on             |
  #     | Summary_Info_Requestedby_txt     | Requested by             |
  #     | summary_status                   | Approved                 |
  #     | Summary_Info_YourReference_value | testAMPP#PendingApproval |



  # @AMPP#Reject
  # Scenario: Close Periodical  Payments - Reject Service Request
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When I click on "Close Periodical Payment"
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Account,Transaction details" for "review page"
  #     | AccountName                 | BO-PENDING         |
  #     | AccountDefaultCurrency      | AUD                |
  #     #| AccountDescription          | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "service request Header details,Summary Information and Account details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title  | Reject Service Request |
  #     | cancelBtn           | Cancel                 |
  #     | rejectBtn           | Reject                 |
  #     | rejectComment-label | Reason For Rejection   |
  #     | rejectComment       |                        |
  #   # Then The application should display the "Reject model important Info Content" for "Service Request" text
  #   #| reject-importantInfoHeading | Important Information:                                                                                                                                                              |
  #   #| rejectDialog-infoText       | Please be advised that no further actions can be taken on a request after it has been rejected. If any additional actions are required, a new service request will need to be created.|
  #   Then The application should display the "rejectBtn" button
  #   Then The application should display the "cancelBtn" button
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "rejectDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Reject" button
  #   Then The application should display the "Reject model window" for "SR"
  #     | rejectDialog-title | Reject Service Request |
  #     | cancelBtn          | Cancel                 |
  #     | rejectBtn          | Reject                 |
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header              | Summary Information    |
  #     | Summary_Info_RequestID_txt       | Request ID             |
  #     | Summary_Info_Requestedon_txt     | Requested on           |
  #     | Summary_Info_Requestedby_txt     | Requested by           |
  #     | summary_status                   | Pending Approval       |
  #     | Summary_Info_YourReference_value | testAMPP#authorisation |
  #   When The user click on the "Reject" button
  #   Then The user enter "Rejection comments text" into the "rejectComment" text field
  #   And The user click on the "rejectBtn" button
  #   Then The application should display the "Reject" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header" for "AMPP service request in view mode"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Rejected            |


 # @AMPP#Approve#AfterCutOffDate
  # Scenario: Close Periodical  Payments - Dual approval Service Request AfterCutOffDate
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   When I click on "Close Periodical Payment"
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Account,Transaction details" for "review page"
  #     | AccountName                 | BO-PENDING         |
  #     | AccountDefaultCurrency      | AUD                |
  #     #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "service request Header ,Summary Information,Account" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #   #| AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
  #   Then The application should display the "Approve" button
  #   Then The application should display the "Reject" button
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "AMPP request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   Then The application should display the "approveBtn" button
  #   Then The application should display the "cancelBtn" button
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The application should display the "Approve model window" for "service request"
  #     | approveDialog-title | Approve Service Request |
  #     | cancelBtn           | Cancel                  |
  #     | approveBtn          | Approve                 |
  #   When The user click on the "approveBtn" button
  #   Then The application should display the "SingleApprove" toast notification
  #   Then The application should display the "status as Pending Approval" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Close" button
  #   Then The user searches stored service request with request type "Manage Periodical (Automatic) Payments (AU)" and selects it
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
  #     | approveDialog-content6 | Enter your 6 digit PIN       |
  #     | approveDialog-content1 | Token authorisation required |
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   When The user click on the "cancelBtn" button
  #   Then The application does not show "approveDialog-title" dialog
  #   Then The application should display the "or directed back to the service request details screen" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Pending Approval    |
  #   When The user click on the "Approve" button
  #   Then The user enter "8754328" into the "authoriseCode" text field
  #   Then The user click on the "approveBtn" button
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Approve" toast notification
  #   Then The application should display the "Service Request Header" for "AMPP service request in view mode"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   Then The application should display the "status as Approved" for "SR"
  #     | Summary_Info_header          | Summary Information |
  #     | Summary_Info_RequestID_txt   | Request ID          |
  #     | Summary_Info_Requestedon_txt | Requested on        |
  #     | Summary_Info_Requestedby_txt | Requested by        |
  #     | summary_status               | Approved            |


  # @trace8
  # Scenario: View Transaction Details - Cancel Service Request
  #   Given I am an authorised user with permission to create a "View Transaction Details" service request
  #   When The user navigate to the "View Transaction Details" service request screen
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application shows the "cancel" button
  #   When The user Clicks the "Cancel" button
  #   Then The application should display an alert pop-up message
  #   When The user Clicks the "No" button
  #   Then The application must close the cancel service request alert pop-up message
  #   When The user Clicks the "Cancel" button
  #   Then The application should display an alert pop-up message
  #   When The user Clicks the "Yes" button
  #   Then The application shows "Create Service Request" screen





  # @view8
  # Scenario: View Transaction Details - Cancel Service Request-After acount selected
  #   Given I am an authorised user with permission to create a "View Transaction Details" service request
  #   When The user navigate to the "View Transaction Details" service request screen
  #   When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "TraceTransaction on after selectd account in enter details page"
  #     | AccountName | BO-PENDING-APPROVAL |
  #     | AccountNo   | 010203 - 123456203  |
  #   Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
  #     | SearchforTransactionL | Search for Transaction |
  #   Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
  #     | amount   | Amount    |
  #     | postDate | Post Date |
  #     | Reset    | Reset     |
  #     | Search   | Search    |
  #   Then The application shows the "cancel" button
  #   When The user Clicks the "Cancel" button
  #   Then The application should display an alert pop-up message
  #   When The user Clicks the "No" button
  #   Then The application must close the cancel service request alert pop-up message
  #   When The user Clicks the "Cancel" button
  #   Then The application should display an alert pop-up message
  #   When The user Clicks the "Yes" button
  #   Then The application shows "Create Service Request" screen



  #   #out of scope:
    
  # @AMPP#CancelRequest
  # Scenario: Close Periodical  Payments - Cancel Service Request
  #   Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
  #   When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
  #   Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
  #     | paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
  #   When I click on "close PP rediobutn"
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name            | field_value |
  #     | serialNumber          | 12345678    |
  #     | payeeAccountName      | Account ame |
  #     | paymentReference      | MPP#ref     |
  #     | closePeriodicalAmount | 213312.02   |
  #   Then The user picking the "closeDate" from calender
  #   Then The user enter "testAMPP#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "SearchforTransactionLabel" for "Service Request" text
  #     | selectAccountLabel            | Account Details            |
  #     | periodicalPaymentDetailsLabel | Periodical Payment Details |
  #   Then The application should display the "Account and Transaction details" for "review page"
  #     | AccountName                 | BO-PENDING         |
  #     | AccountDefaultCurrency      | AUD                |
  #     | serialNumber-label          | Serial Number      |
  #     | payeeAccountName-label      | Payee Account Name |
  #     | paymentReference-label      | Payment Reference  |
  #     | closePeriodicalAmount-label | Amount             |
  #     | closeDate-label             | Close Date         |
  #     | serialNumber                | 1234567            |
  #     | payeeAccountName            | Account ame        |
  #     | paymentReference            | MPP#ref            |
  #     | closePeriodicalAmount       | AUD 213,312.02     |
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
  #     | request_status             | Pending Approval              |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) review page"
  #     | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header            | Summary Information                                                |
  #     | Summary_Info_RequestID_txt     | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt   | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt   | Requested by                                                       |
  #     | Summary_Info_YourReference_txt | Request Status                                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                                     |
  #     | AccountHeaderLabel             | Account Details                                                    |
  #     | AccountName                    | BO-PENDING                                                         |
  #     | AccountDefaultCurrency         | AUD                                                                |
  #   Then The application should display the "Cancel Request" button
  #   When The user Clicks the "Cancel Request" button
  #   # Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
  #   #   | cancelDialog-title | Cancel Service Request                                                                        |
  #   #   | reason-label       | Cancel Reason                                                                                 |
  #   #   | notes-label        | Please provide cancellation details                                                           |
  #   #   | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #   Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
  #     | reasonoption1 |                            |
  #     | reasonoption2 | Duplicate Request          |
  #     | reasonoption3 | Request No Longer Required |
  #     | reasonoption4 | Request Resolved           |
  #   # | reasonoption5 | Partial Request Cancellation |
  #   Then The application should display the "SubmitBtn" button
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "following Cancel Request type" for "SR under cancel model window"
  #     | reason-error          | Cancellation Reason is mandatory                      |
  #     | notes-error           | Cancellation details are mandatory                    |
  #     | importantErrorMessage | Please read and acknowledge by selecting the checkbox |
  #   When The user Clicks the "cancel" button
  #   Then The application does not show "cancelDialog" dialog
  #   When The user Clicks the "Cancel Request" button
  #   When The user select the "Duplicate Request" from "cancelReasonType" drop down
  #   Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
  #   When The user click on the "legalDisclaimerTC" checkbox
  #   When The user Clicks the "SubmitBtn" button
  #   Then The application should display the "The request has been cancelled" toast notification
  #   Then The user waiting to load "or refresh the screen"
  #   Then The application should display the "Service Request Header, Summary Information status" for "AMPP service request in view mode"
  #     | paymentsTitle                | Manage Periodical (Automatic) Payments (AU)                        |
  #     | paymentsDesc                 | Add, amend, suspend or close periodical payments on your accounts. |
  #     | Summary_Info_header          | Summary Information                                                |
  #     | Summary_Info_RequestID_txt   | Request ID                                                         |
  #     | Summary_Info_Requestedon_txt | Requested on                                                       |
  #     | Summary_Info_Requestedby_txt | Requested by                                                       |
  #     | summary_status               | Cancelled                                                          |

# @AMPP#InstantCancel
#   Scenario: Close Periodical  Payments - Instant Cancel Service Request
#     Given I am an authorised user with permission to create an "Manage Periodical (Automatic) Payments (AU)" service request
#     When The user navigate to the "Manage Periodical (Automatic) Payments" service request screen
#     Then The application should display the "service request Header details" for "Manage Periodical (Automatic) Payments (AU)"
#       #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
#       | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
#     When I click on "close PP rediobutn"
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     Then The user enter the following text in corresponding textboxes
#       | field_name            | field_value |
#       | serialNumber          | 12345678    |
#       | payeeAccountName      | Account ame |
#       | paymentReference      | MPP#ref     |
#       | closePeriodicalAmount | 213312.02   |
#     Then The user picking the "closeDate" from calender
#     Then The user enter "testAMPP#authorisation" into the "your_reference" text field
#     When The user Clicks the "Next" button
#     Then The application should display the "Account,Transaction details" for "review page"
#       | AccountName                 | BO-PENDING         |
#       | AccountDefaultCurrency      | AUD                |
#       #| AccountDescription          | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#       | serialNumber-label          | Serial Number      |
#       | payeeAccountName-label      | Payee Account Name |
#       | paymentReference-label      | Payment Reference  |
#       | closePeriodicalAmount-label | Amount             |
#       | closeDate-label             | Close Date         |
#       | serialNumber                | 1234567            |
#       | payeeAccountName            | Account ame        |
#       | paymentReference            | MPP#ref            |
#       | closePeriodicalAmount       | AUD 213,312.02     |
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up" for "AMPP Service Request"
#       | request_status             | Pending Approval              |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header,Summary Information and Account" for "Manage Periodical (Automatic) Payments (AU) review page"
#      # | paymentsTitle                  | Manage Periodical (Automatic) Payments (AU)                        |
#       | paymentsDesc                   | Add, amend, suspend or close periodical payments on your accounts. |
#       | Summary_Info_header            | Summary Information                                                |
#       | Summary_Info_RequestID_txt     | Request ID                                                         |
#       | Summary_Info_Requestedon_txt   | Requested on                                                       |
#       | Summary_Info_Requestedby_txt   | Requested by                                                       |
#       | Summary_Info_YourReference_txt | Request Status                                                     |
#       | Summary_Info_RequestStatus_txt | Your Reference                                                     |
#       | AccountHeaderLabel             | Account Details                                                    |
#       | AccountName                    | BO-PENDING                                                         |
#       | AccountDefaultCurrency         | AUD                                                                |
#     Then The application should display the "Cancel Request" button
#     When The user Clicks the "Cancel Request" button
#     Then The application should display the "Cancel Request model window" for "Add User to Digital Channel request"
#       | cancelDialog-title | Cancel Service Request                                                                        |
#       | reason-label       | Cancel Reason                                                                                 |
#       | notes-label        | Please provide cancellation details                                                           |
#       | notes-desc         | Max 400 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The application should display the "following Cancel Request type" for "SR under Reopen model window"
#       | reasonoption1 |                            |
#       | reasonoption2 | Duplicate Request          |
#       | reasonoption3 | Request No Longer Required |
#       | reasonoption4 | Request Resolved           |
#     Then The application should display the "SubmitBtn" button
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "following Cancel Request type" for "SR under cancel model window"
#       | reason-error | Cancellation Reason is mandatory   |
#       | notes-error  | Cancellation details are mandatory |
#     When The user Clicks the "cancel" button
#     Then The application does not show "cancelDialog" dialog
#     When The user Clicks the "Cancel Request" button
#     When The user select the "Duplicate Request" from "cancelReasonType" drop down
#     Then The user enter "CancelReasonText" into the "cancelReasonNotes" text field
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "(.*)" toast notification
#     Then The user waiting to load "or refresh the screen"
#     Then The application should display the "Service Request Header" for "AMPP service request in view mode"
#       #| paymentsTitle | Manage Periodical (Automatic) Payments (AU)                        |
#       | paymentsDesc  | Add, amend, suspend or close periodical payments on your accounts. |
#     Then The application should display the "status as Approved" for "SR"
#       | Summary_Info_header          | Summary Information |
#       | Summary_Info_RequestID_txt   | Request ID          |
#       | Summary_Info_Requestedon_txt | Requested on        |
#       | Summary_Info_Requestedby_txt | Requested by        |
#       | summary_status               | Cancelled           |

#   @add-userNew3
#   Scenario:Add Legal Entity to Digital Channel - Header and Description
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Add_user_Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Add_user_Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application shows the "cancel" button

#   @add-userNew4
#   Scenario:Add Legal Entity to Digital Channel - Step 1: Download and Complete Content
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "Instructions to download and complete the form" for "Add Legal Entity to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#     Then The user click on the Download Form button

#   @add-userNew5
#   Scenario:Add Legal Entity to Digital Channel - Important Information
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
#       | imp_info_header | Important Information                                                                                                   |
#       | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
#     And The application should display "importantInfo_checkbox" checkbox is NOT checked by default


#   @add-userNew6
#   Scenario:Add Legal Entity to Digital Channel - Display Your Reference section
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The application should display following fields "under Your Reference section"
#       | field_name             |
#       | Your_Reference_textbox |
#     Then The application should display the "Your Reference section" for "Add Legal Entity to Digital Channel"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     And The application should allow only valid characters in the reference field
#       | ValidData | test reference validation data 12-&',:;# |
#     And The application should not allow more than 40 characters in the reference field
#       | MoreThan40InputData    | more than 40 characters test by the DSSAutomationTesting team |
#       | MoreThan40AcceptedData | more than 40 characters test by the DSSA                      |
#     And The application should not allow unsupported characters in the reference field
#       | InvalidCharacters | `~!@$%^*()+={}[]\"?><,./ |

#   @add-userNew7
#   Scenario:Add Legal Entity to Digital Channel - Display the legal entity
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The application should display following fields "under Your Reference section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Add User service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |

#   @add-userNew8
#   Scenario:Add Legal Entity to Digital Channel - Select the legal entity from drop down
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Add User SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The user waiting to load "View details page"
#     Then The application should display the "service request Header detailsin view mode" for "Add User SR"
#       | Add_user_Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Add_user_Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "Summary Information" for "Add User service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Legal Entity details" for "Add User SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |

#   @LE1
#   Scenario:Add Legal Entity to Digital Channel - Select the legal entity from search pop-up
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | Health |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The user waiting to load "view details page"
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Add User SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then  The user waiting to load "view details page"
#     Then The application should display the "service request Header detailsin view mode" for "Add User SR"
#       | Add_user_Title       | Add Legal Entity to Digital Channel (AU)                                                                               |
#       | Add_user_Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "Summary Information" for "Add User service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Legal Entity details" for "Add User SR"
#       | Legal_Entity_Summary | Legal Entity         |
#       | Legal_Entity_Name    | Legal Entity         |
#       | Legal_Entity_Value   | Department of Health |

#   @tooltip
#   Scenario:Add Legal Entity to Digital Channel -  Upload Form - Display Upload File Component
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "file upload header" for "Add User service request" text
#       | File_upload_header        | Step 2: Upload Completed Form & Required Documentation |
#       | File_upload_Drag&Drop_txt | Drag and drop your files here, or                      |
#     Then The application should display following fields "under file upload component"
#       | field_name              |
#       | File_upload_icon        |
#       | File_upload_Drag&Drop   |
#       | File_upload_Browser     |
#       | File_upload_fileToolTip |
#     Then The application should display the File_upload_fileToolTip_txt overing tooltip icon
#       |  | A file must not exceed 10MB and must be one of the following formats: .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. A maximum of 10 files can be uploaded. |




#   @SmokeTesting3214
#   Scenario:Add Legal Entity to Digital Channel - Confirmation Pop-Up Message - View SR Details
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add User SR"
#       | Add_user_Title       | Add Legal Entity to Digital Channel (AU)                                                                               |
#       | Add_user_Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add User service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Legal Entity details" for "Add User SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     When The user click on the "View Audit History" button
#     Then The application should display the "Audit History Pop-up details" for "Add User SR"
#       | SR_Audit_History_header | Service Request Audit History |
#       | SR_Audit_History_Date   | Date / Time                   |
#       | SR_Audit_History_Status | Request Status                |
#       | SR_Audit_History_User   | User                          |
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |
#     Then The application should display the "Comments and Supporting Documents section" for "Add User service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |





#   Scenario:Add Legal Entity to Digital Channel - Confirmation Pop-Up Message - OK
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The user waiting to load "SR details"
#     Then The application shows "Cash Management Service Requests" screen


#   Scenario:Add Legal Entity to Digital Channel - Confirmation Pop-Up Message - Raise Another Service Request
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "Raise another Service Request" link
#     Then The application shows "Create Service Request" screen


#   Scenario:Add Legal Entity to Digital Channel - Multiple files upload
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf2.pdf   |
#       | filepath3 | //resources//input//Test-pdf3.pdf   |
#       | filepath4 | //resources//input//Test-pdf4.pdf   |
#       | filepath5 | //resources//input//Test-pdf5.pdf   |
#       | filepath6 | //resources//input//Test-pdf6.pdf   |
#       | filepath7 | //resources//input//Test-Excel.xlsx |
#       | filepath8 | //resources//input//Test-word.docx  |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add User SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The user waiting to load "SR details"
#     Then The application shows "Cash Management Service Requests" screen

#   @Duplicate_123
#   Scenario:Add Legal Entity to Digital Channel - Duplicate files upload
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf.pdf  |
#       | filepath1 | //resources//input//Test-pdf1.pdf |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#       | filepath4 | //resources//input//Test-pdf4.pdf |
#       | filepath5 | //resources//input//Test-pdf.pdf  |
#       | filepath6 | //resources//input//Test-pdf5.pdf |
#     Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |                             |
#       | File_Name1      | Test-pdf1.pdf ( 444.82 KB ) |
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-pdf.pdf - A file with the same name already exists. |

#   @fileuploadNegative
#   Scenario:Add Legal Entity to Digital Channel - Mixed files upload
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf      |
#       | filepath2 | //resources//input//Test-pdf2.pdf     |
#       | filepath3 | //resources//input//Test-pdf3.pdf     |
#       | filepath4 | //resources//input//Test-webfont.woff |
#       | filepath5 | //resources//input//Compressed.zip    |
#       | filepath6 | //resources//input//Test-pdf4.pdf     |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Compressed.zip - File format must be one of .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. |
#     Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |                             |
#       | fileRemoveIcon2 |                             |
#       | File_Name1      | Test-pdf.pdf ( 444.82 KB )  |
#       | File_Name2      | Test-pdf2.pdf ( 444.82 KB ) |

#   @Invalidfile
#   Scenario:Add Legal Entity to Digital Channel - Invalid file format upload
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-7z.7z |
#       | filepath2 | //resources//input//Test-7z.7z |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-7z.7z - File format must be one of .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. |

#   @fileuploadNegative2
#   Scenario:Add a User to a Digital Channel - Submit Request - Submit with No Files Uploaded
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     And The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     When The user Clicks the "Submit" button
#     Then The application should display error message under "file upload" component
#       | error_message | A file has not been uploaded. Please upload at least one file to proceed. |

#   @fileuploadNegative1
#   Scenario:Add a User to a Digital Channel - Without Terms and Conditions
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user Clicks the "Submit" button
#     Then The application should display error message under "Important Information" component
#       | error_message | Please select the checkbox to confirm you have read and understood the above information |

#   @fileuploadNegative
#   Scenario:Add a User to a Digital Channel - Morethan 10 files
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1  | //resources//input//Test-pdf.pdf    |
#       | filepath2  | //resources//input//Test-pdf2.pdf   |
#       | filepath3  | //resources//input//Test-pdf3.pdf   |
#       | filepath4  | //resources//input//Test-pdf4.pdf   |
#       | filepath5  | //resources//input//Test-pdf5.pdf   |
#       | filepath6  | //resources//input//Test-rtf.rtf    |
#       | filepath7  | //resources//input//Test-Excel.xlsx |
#       | filepath8  | //resources//input//Test-word.docx  |
#       | filepath9  | //resources//input//Test-csv.csv    |
#       | filepath10 | //resources//input//Test-ppt.pptx   |
#       | filepath11 | //resources//input//Test-pdf1.pdf   |
#       | filepath11 | //resources//input//Test-pdf6.pdf   |
#       | filepath13 | //resources//input//Test-PNG.PNG    |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-JPG.JPG |
#       | filepath2 | //resources//input//Test-TIF.TIF |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-JPG.JPG - Maximum number of 10 files has been reached. |

#   @moreThan10MB
#   Scenario:Add a User to a Digital Channel - Morethan 10 MB file size
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//MoreThan10mb.xls |
#     Then The user waiting to load "file upload error section"
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | MoreThan10mb.xls - Individual file size cannot exceed 10MB. |

#   @fileuploadNegative3
#   Scenario:Add Legal Entity to Digital Channel - Without Legal Entity
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf.pdf  |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application should display error message under "Legal_Entity_error_msg" component
#       | error_message | Please select a Legal Entity. |

#   @fileuploadNegative4
#   Scenario:Add Legal Entity to Digital Channel - Remove Uploaded File
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf.pdf  |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |                             |
#       | fileRemoveIcon2 |                             |
#       | File_Name1      | Test-pdf2.pdf ( 444.82 KB )  |
#       | File_Name2      | Test-pdf3.pdf ( 444.82 KB ) |
#     When The user click on the "fileRemoveIcon1" button
#     Then The application does not show "files uploaded under fileupload" section


#   #-------------------------Email----------------------------
#   @Email
#   Scenario:Add a User to a Digital Channel - User does not have email address
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user clicks the "importantInformationCheckBox" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog

#   @Email2
#   Scenario:Add a User to a Digital Channel - User does not enter an email address
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user clicks the "importantInformationCheckBox" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "" in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then The application should display error message in "email verification" dialog
#       | error_message | Please enter a valid email address |

#   @Email3
#   Scenario:Add a User to a Digital Channel - User enters invalid email address
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user clicks the "importantInformationCheckBox" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz." in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then The application should display error message in "email verification" dialog
#       | error_message | Please enter a valid email address |

#   @Email4
#   Scenario:Add a User to a Digital Channel - Closing the email modal
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user clicks the "importantInformationCheckBox" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz.com" in "EmailId" textbox
#     When The user clicks the 'X' icon
#     Then "Manual email" modal window must close

#   @Email5
#   Scenario:Add a User to a Digital Channel - Closing the email modal
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user clicks the "importantInformationCheckBox" button
#     When The user Clicks the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "anz@anz.com" in "EmailId" textbox
#     When The user Clicks the "Ok" button
#     Then "Manual email" modal window must close


#   @addUser#comments
#   Scenario:Add a User - Submit Comment - Successful
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                               |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display the "additional comments section" for "add user service request"
#       | Comment_Section_header   | Comments and Supporting Documents                                                            |
#       | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
#       | additional_CommentTitle  | New comment / attachment                                                                     |
#       | additional_Comment-field | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     When The user entered "Providing the comments only" in "Additional Comment" textbox
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents section" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date     | 19/07/2019 01:37:32         |
#       | Added by | User Lname                  |
#       | Comments | Providing the comments only |


#   @AddUserComments#Close#Yes
#   Scenario:Add a User - Comments&Attachments#Close#Yes
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     When The user entered "Providing the comments only" in "Additional Comment" textbox
#     When The user click on the "Close" button
#     Then The application shows "Alert prompt" dialog
#     When The user Clicks the "Yes" button
#     Then The application does not show "Add Comment" element
#     Then The application shows "Create Service Request" screen



#   @AddUserComments#Close#NO
#   Scenario:Add a User - Comments&Attachments#Close#NO
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     When The user entered "Providing the comments only" in "Additional Comment" textbox
#     When The user click on the "Close" button
#     Then The application shows "Alert prompt" dialog
#     When The user Clicks the "No" button
#     Then The application must close the cancel service request alert pop-up message
#     Then The element "#additionalComment" should have the text "Test comments"

#   @adduserattachments
#   Scenario:Add a User - Submit Additional documents - Successful
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display the "additional comments section" for "add user service request"
#       | Comment_Section_header   | Comments and Supporting Documents                                                            |
#       | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
#       | additional_CommentTitle  | New comment / attachment                                                                     |
#       | additional_Comment-field | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents/Attachments details" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date        | 19/07/2019 01:37:32        |
#       | Added by    | User Lname                 |
#       | Attachments | Test-pdf.pdf ( 444.82 KB ) |


#   @adduser#attachmentsOnly#Close#Yes
#   Scenario:Add a User - adduser#attachmentsOnly#Close#Yes
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display the "additional comments section" for "add user service request"
#       | Comment_Section_header   | Comments and Supporting Documents                                                            |
#       | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
#       | additional_CommentTitle  | New comment / attachment                                                                     |
#       | additional_Comment-field | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Close" button
#     Then The application shows "Alert prompt" dialog
#     When The user Clicks the "Yes" button
#     Then The application does not show "Add Comment" element
#     Then The application shows "Create Service Request" screen



#   @adduser#attachmentsOnly#Close#NO
#   Scenario:Add a User - adduser#attachmentsOnly#Close#NO
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display the "additional comments section" for "add user service request"
#       | Comment_Section_header   | Comments and Supporting Documents                                                            |
#       | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
#       | additional_CommentTitle  | New comment / attachment                                                                     |
#       | additional_Comment-field | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Close" button
#     Then The application shows "Alert prompt" dialog
#     When The user Clicks the "No" button
#     Then The application must close the cancel service request alert pop-up message
#     Then The element "#additionalComment" should have the text "Test comments"




#   @adduser#comments#attachments
#   Scenario:Add a User - Submit comments and Attachments
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The user update the service request status with following details
#       | requestId     | responseId        |
#       | status        | PENDING_MORE_INFO |
#       | requestStatus | PENDING_MORE_INFO |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Manage Direct Debits" and selects it
#     Then The application should display the "request status as More Information Required" for "DDR SR"
#       | Summary_Info_header              | Summary Information       |
#       | Summary_Info_RequestID_txt       | Request ID                |
#       | Summary_Info_Requestedon_txt     | Requested on              |
#       | Summary_Info_Requestedby_txt     | Requested by              |
#       | Summary_Info_RequestStatus_value | More Information Required |
#     Then The application should display the "Add new comment / attachment" button
#     When The user click on the "Add new comment / attachment" button
#     Then The application should display the "additional comments section" for "add user service request"
#       | Comment_Section_header   | Comments and Supporting Documents                                                            |
#       | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
#       | additional_CommentTitle  | New comment / attachment                                                                     |
#       | additional_Comment-field | Max 400 characters                                                                           |
#     Then The application should display "New comment / attachment" sub-section
#     Then The application should display following fields "under file upload component"
#       | field_name                        |
#       | File_upload_icon                  |
#       | File_upload_Drag&Drop             |
#       | File_upload_Browser               |
#       | File_upload_fileToolTip           |
#       | additional_upload_fileToolTip_txt |
#     And The application should display the "Submit" button
#     When The user entered "Comments with attachments" in "Additional Comment" textbox
#     Then The application should allow user to select and upload single file
#       | filepath | //resources//input//Test-pdf.pdf |
#     Then The application should display the "uploaded files under" the "additional file upload section"
#       | fileRemoveIcon1            |                            |
#       | additional_upload_FileName | Test-pdf.pdf ( 444.82 KB ) |
#     When The user click on the "Submit" button
#     Then The application should display the "Comments and Supporting Documents/Attachments details" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section
#       | Date        | 19/07/2019 01:37:32        |
#       | Added by    | User Lname                 |
#       | Comments    | Comments with attachments  |
#       | Attachments | Test-pdf.pdf ( 444.82 KB ) |





#  @ReopenPCML
#   Scenario: Add Legal Entity to Digital Channel - Reopen PCM service request
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application shows the "cancel" button
#     Then The application should display the "Instructions to download and complete the form" for "Add Legal Entity to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#     Then The application should display the "download form button" for "Add Legal Entity to Digital Channel"
#       | download_form | Download the Add Legal Entity to Digital Channel form |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The application should display the "Your Reference section" for "Add Legal Entity to Digital Channel"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The application should display following fields "under Select Legal Entity section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
#       | imp_info_header | Important Information                                                                                                   |
#       | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
#     And The application should display "importantInfo_checkbox" checkbox is NOT checked by default
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up detail" for "Add Legal Entity to Digital Channel SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Important Information Section" for "Add User SR"
#       | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The user update the service request status with following details
#       | requestId     | responseId         |
#       | status        | RESOLVED_COMPLETED |
#       | requestStatus | RESOLVED_COMPLETED |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Add Legal Entity to Digital Channel" and selects it
#     Then The application should display the "updated status" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_RequestStatus_txt   | Request Status |
#       | Summary_Info_RequestStatus_value | Completed      |
#     Then The application should display the "Reopen" button
#     When The user Clicks the "Reopen" button
#     Then The application should display the "Reopen" button
#     Then The application should display the "Reopen model window" for "Add Legal Entity to Digital Channel request"
#       | reopenModelWindowName            | Reopen Reason                                                                                                 |
#       | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
#       | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
#       | reopenEmailLabel                 | Email                                                                                                         |
#       | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
#     Then The application should display the "SubmitBtn" button
#     Then The application should display the "following reason type" for "SR under Reopen model window"
#       | reopen_dropdown_option1 | Please select a reason         |
#       | reopen_dropdown_option2 | Further Investigation Required |
#       | reopen_dropdown_option3 | Information Incomplete         |
#       | reopen_dropdown_option4 | Information Unclear            |
#       | reopen_dropdown_option5 | Other                          |




#   @ReopenPCML
#   Scenario: Add Legal Entity to Digital Channel - Reopen modal/pop-up validations
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application shows the "cancel" button
#     Then The application should display the "Instructions to download and complete the form" for "Add Legal Entity to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#     Then The application should display the "download form button" for "Add Legal Entity to Digital Channel"
#       | download_form | Download the Add Legal Entity to Digital Channel form |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The application should display the "Your Reference section" for "Add Legal Entity to Digital Channel"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The application should display following fields "under Select Legal Entity section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
#       | imp_info_header | Important Information                                                                                                   |
#       | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
#     And The application should display "importantInfo_checkbox" checkbox is NOT checked by default
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up detail" for "Add Legal Entity to Digital Channel SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Important Information Section" for "Add User SR"
#       | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The user update the service request status with following details
#       | requestId     | responseId         |
#       | status        | RESOLVED_COMPLETED |
#       | requestStatus | RESOLVED_COMPLETED |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Add Legal Entity to Digital Channel" and selects it
#     Then The application should display the "updated status" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_RequestStatus_txt   | Request Status |
#       | Summary_Info_RequestStatus_value | Completed      |
#     Then The application should display the "Reopen" button
#     When The user Clicks the "Reopen" button
#     Then The application should display the "Reopen" button
#     Then The application should display the "Reopen model window" for "Direct Debits request"
#       | reopenModelWindowName            | Reopen Reason                                                                                                 |
#       | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
#       | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
#       | reopenEmailLabel                 | Email                                                                                                         |
#       | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
#     Then The application should display the "SubmitBtn" button
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reason_errormsg" component
#       | error_message | Reason is mandatory |
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |
#     When The user select the "Further Investigation Required" from "reopenReasonType" drop down
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |
#     When The user entered "test@anz.com" in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "reasondetail_errormsg" component
#       | error_message | Reason detail is mandatory |
#     Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
#     When The user entered " " in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display error message under "email_errormsg" component
#       | error_message | Please enter a valid email address |



#   @ReopenPCML
#   Scenario: Add Legal Entity to Digital Channel - Reopen
#     Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
#     When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
#     Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application shows the "cancel" button
#     Then The application should display the "Instructions to download and complete the form" for "Add Legal Entity to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#     Then The application should display the "download form button" for "Add Legal Entity to Digital Channel"
#       | download_form | Download the Add Legal Entity to Digital Channel form |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath0 | //resources//input//Test-pdf1.pdf |
#       | filepath1 | //resources//input//Test-pdf2.pdf |
#       | filepath2 | //resources//input//Test-pdf3.pdf |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The application should display the "Your Reference section" for "Add Legal Entity to Digital Channel"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The application should display following fields "under Select Legal Entity section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
#       | imp_info_header | Important Information                                                                                                   |
#       | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
#     And The application should display "importantInfo_checkbox" checkbox is NOT checked by default
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then The application should display the "Confirmation pop-up detail" for "Add Legal Entity to Digital Channel SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
#       | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
#       | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Important Information Section" for "Add User SR"
#       | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#     Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Legal Entity to Digital Channel service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#     Then The user update the service request status with following details
#       | requestId     | responseId         |
#       | status        | RESOLVED_COMPLETED |
#       | requestStatus | RESOLVED_COMPLETED |
#     When The user Clicks the "Close" button
#     Then The user searches stored service request with request type "Add Legal Entity to Digital Channel" and selects it
#     Then The application should display the "updated status" for "Add Legal Entity to Digital Channel service request"
#       | Summary_Info_RequestStatus_txt   | Request Status |
#       | Summary_Info_RequestStatus_value | Completed      |
#     When The user Clicks the "Reopen" button
#     When The user select the "Further Investigation Required" from "reopenReasonType" drop down
#     Then The user enter "reopenReasonText" into the "reopenReasonNotes" text field
#     When The user entered "test@anz.com" in "reopenEmailInput" textbox
#     When The user Clicks the "SubmitBtn" button
#     Then The application should display the "Confirmation pop-up" for "reopen submitted request"
#       | reopen_submit_confirm_msg1 | Your Service Request has been |
#       | reopen_submit_confirm_msg2 | Reopened.                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user Clicks the "Ok" button
#     Then The user waiting to load "SR details"
#     Then The application shows "Cash Management Service Requests" screen



  # @CancelPCM
  # Scenario: Add Legal Entity to Digital Channel - Cancel PCM service request
  #   Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
  #   When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
  #   Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
  #     | Title       | Add Legal Entity to Digital Channel                                                                                |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application shows the "cancel" button
  #   Then The application should display the "Instructions to download and complete the form" for "Add Legal Entity to Digital Channel"
  #     | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
  #     | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
  #     | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
  #     | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
  #     | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
  #     | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
  #     | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
  #     | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
  #   Then The application should display the "download form button" for "Add Legal Entity to Digital Channel"
  #     | download_form | Download the Add Legal Entity to Digital Channel form |
  #   Then The application should allow user to select and upload one or more files from computer
  #     | filepath0 | //resources//input//Test-pdf1.pdf |
  #     | filepath1 | //resources//input//Test-pdf2.pdf |
  #     | filepath2 | //resources//input//Test-pdf3.pdf |
  #   Then The user enter "test#Ref#123" into the "your_reference" text field
  #   Then The application should display the "Your Reference section" for "Add Legal Entity to Digital Channel"
  #     | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
  #     | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value     |
  #     | your_reference | testAutoRef#123 |
  #   Then The application should display following fields "under Select Legal Entity section"
  #     | field_name                   |
  #     | Legal_Entity_select_dropdown |
  #     | Legal_Entity_search_icon     |
  #     | LegalEntity-field            |
  #   Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel service request"
  #     | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
  #     | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |
  #   Then The user select a legal entity from the search legal entity pop up
  #     | legalEntity | NSWG |
  #   Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
  #     | imp_info_header | Important Information                                                                                                   |
  #     | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
  #   And The application should display "importantInfo_checkbox" checkbox is NOT checked by default
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then The application should display the "Confirmation pop-up detail" for "Add Legal Entity to Digital Channel SR"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   When The user click on the "view_request_link" link
  #   Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
  #     | Title       | Add Legal Entity to Digital Channel                                                                                |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "Add Legal Entity to Digital Channel service request"
  #     | Summary_Info_header            | Summary Information |
  #     | Summary_Info_RequestID_txt     | Request ID          |
  #     | Summary_Info_Requestedon_txt   | Requested on        |
  #     | Summary_Info_Requestedby_txt   | Requested by        |
  #     | Summary_Info_RequestStatus_txt | Request Status      |
  #   Then The application should display the "Important Information Section" for "Add User SR"
  #     | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
  #   Then The application should display the "Legal Entity details" for "Add Legal Entity to Digital Channel SR"
  #     | Legal_Entity_Summary | Legal Entity |
  #     | Legal_Entity_Name    | Legal Entity |
  #     | Legal_Entity_Value   | NSWG         |
  #   Then The application should display the "Comments and Supporting Documents section" for "Add Legal Entity to Digital Channel service request"
  #     | Comment_Section_header          | Comments and Supporting Documents |
  #     | Comment_Section_Date_txt        | Date                              |
  #     | Comment_Section_AddedBy_txt     | Added by                          |
  #     | Comment_Section_Comments_txt    | Comments                          |
  #     | Comment_Section_Attachments_txt | Attachments                       |
  #   Then The user update the service request status with following details
  # | requestId     | responseId       |
  #     | status        | PENDING_APPROVAL |
  #     | requestStatus | PENDING_APPROVAL |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Add Legal Entity to Digital Channel" and selects it
  #   Then The application should display the "updated status" for "Add Legal Entity to Digital Channel service request"
  #     | Summary_Info_RequestStatus_txt   | Request Status |
  #     | Summary_Info_RequestStatus_value | Pending Approval |
  #   Then The application should display the "Close Request" button
  #   When The user Clicks the "Close Request" button
  #   Then The application should display the "Close Request" button
  #   Then The application should display the "Close Request model window" for "Add Legal Entity to Digital Channel request"
  #     | reopenModelWindowName            | Close Request                                                                                                 |
  #     | reopenReasonNotesLabel           | Please provide details for reopening this request                                                             |
  #     | reopenReasonNotesInstructionText | Max 100 characters. Can contain letters, numbers and these special characters # - & ' , : ; .                 |
  #     | reopenEmailLabel                 | Email                                                                                                         |
  #     | reopenEmailText                  | Please enter an email address for updates on this service request. Your email won't be saved to your profile. |
  #   Then The application should display the "SubmitBtn" button
  #   Then The application should display the "following reason type" for "SR under Reopen model window"
  #     | reopen_dropdown_option1 | Please select a reason         |
  #     | reopen_dropdown_option2 | Further Investigation Required |
  #     | reopen_dropdown_option3 | Information Incomplete         |
  #     | reopen_dropdown_option4 | Information Unclear            |
  #     | reopen_dropdown_option5 | Other                          |





  # @adduser#comments#attachments#Close#Yes
  # Scenario:Add a User - adduser#comments#attachments#Close#Yes
  #   Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
  #   When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
  #   Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
  #     | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application should allow user to select and upload one or more files from computer
  #     | filepath0 | //resources//input//Test-pdf1.pdf |
  #     | filepath1 | //resources//input//Test-pdf2.pdf |
  #     | filepath2 | //resources//input//Test-pdf3.pdf |
  #   Then The user enter "test#Ref#123" into the "your_reference" text field
  #   Then The user select a legal entity from the search legal entity pop up
  #     | legalEntity | NSWG |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then I click on "Ok"
  #   Then The user searches stored service request and selects it
  #   Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
  #     | Title       | Add Legal Entity to Digital Channel (AU)                                                                               |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Manage Direct Debits" and selects it
  #   Then The application should display the "request status as More Information Required" for "DDR SR"
  #     | Summary_Info_header              | Summary Information       |
  #     | Summary_Info_RequestID_txt       | Request ID                |
  #     | Summary_Info_Requestedon_txt     | Requested on              |
  #     | Summary_Info_Requestedby_txt     | Requested by              |
  #     | Summary_Info_RequestStatus_value | More Information Required |
  #   Then The application should display the "Add new comment / attachment" button
  #   When The user click on the "Add new comment / attachment" button
  #   Then The application should display the "additional comments section" for "add user service request"
  #     | Comment_Section_header   | Comments and Supporting Documents                                                            |
  #     | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
  #     | additional_CommentTitle  | New comment / attachment                                                                     |
  #     | additional_Comment-field | Max 400 characters                                                                           |
  #   Then The application should display "New comment / attachment" sub-section
  #   Then The application should display following fields "under file upload component"
  #     | field_name                        |
  #     | File_upload_icon                  |
  #     | File_upload_Drag&Drop             |
  #     | File_upload_Browser               |
  #     | File_upload_fileToolTip           |
  #     | additional_upload_fileToolTip_txt |
  #   And The application should display the "Submit" button
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
  #   Then The application shows "Create Service Request" screen



  # @adduser#comments#attachments#Close#No
  # Scenario:Add Legal Entity - AddLegalEntity#comments#attachments#Close#No
  #   Given I am an authorised user with permission to create an "Add Legal Entity to Digital Channel" service request
  #   When The user navigate to the "Add Legal Entity to Digital Channel" service request screen
  #   Then The application should display the "service request Header details" for "Add Legal Entity to Digital Channel"
  #     | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application should allow user to select and upload one or more files from computer
  #     | filepath0 | //resources//input//Test-pdf1.pdf |
  #     | filepath1 | //resources//input//Test-pdf2.pdf |
  #     | filepath2 | //resources//input//Test-pdf3.pdf |
  #   Then The user enter "test#Ref#123" into the "your_reference" text field
  #   Then The user select a legal entity from the search legal entity pop up
  #     | legalEntity | NSWG |
  #   When The user click on the "importantInformationCheckBox" button
  #   When The user click on the "Submit" button
  #   Then The application shows "Manual email modal" dialog
  #   When The user entered "test@anz.com" in "EmailId" textbox
  #   When The user click on the "Ok" button
  #   Then The request id is stored from the element "responseId"
  #   Then I click on "Ok"
  #   Then The user searches stored service request and selects it
  #   Then The application should display the "service request Header detailsin view mode" for "Add Legal Entity to Digital Channel SR"
  #     | Title       | Add Legal Entity to Digital Channel (AU)                                                                                |
  #     | Description | Add legal entities to your ANZ Transactive – Global digital channel for Cash Management Service Requests. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Manage Direct Debits" and selects it
  #   Then The application should display the "request status as More Information Required" for "DDR SR"
  #     | Summary_Info_header              | Summary Information       |
  #     | Summary_Info_RequestID_txt       | Request ID                |
  #     | Summary_Info_Requestedon_txt     | Requested on              |
  #     | Summary_Info_Requestedby_txt     | Requested by              |
  #     | Summary_Info_RequestStatus_value | More Information Required |
  #   Then The application should display the "Add new comment / attachment" button
  #   When The user click on the "Add new comment / attachment" button
  #   Then The application should display the "additional comments section" for "add user service request"
  #     | Comment_Section_header   | Comments and Supporting Documents                                                            |
  #     | additional_CommentLabel  | Please ensure that all required comments and attachments are included before clicking submit |
  #     | additional_CommentTitle  | New comment / attachment                                                                     |
  #     | additional_Comment-field | Max 400 characters                                                                           |
  #   Then The application should display "New comment / attachment" sub-section
  #   Then The application should display following fields "under file upload component"
  #     | field_name                        |
  #     | File_upload_icon                  |
  #     | File_upload_Drag&Drop             |
  #     | File_upload_Browser               |
  #     | File_upload_fileToolTip           |
  #     | additional_upload_fileToolTip_txt |
  #   And The application should display the "Submit" button
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


  # @shakeout-GE#Trobuleshooting
  # Scenario: General Enquiry - Create General Enquiry - Troubleshooting - search and view the details
  #   Given I am an authorised user with permission to create a "General Enquiry" service request
  #   Given I am logging in as user "AUTODSS5" with permission to create "General Enquiry" service request
  #   When The user navigate to the "General Enquiry" service request screen
  #   Then The application should display the "Service Request Header" for "General Enquiry"
  #     | titleL       | General Enquiry                                                                                                                                  |
  #     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
  #   Then The application shows the "cancel" button
  #   Then The user click on the "trobuleshooting" radioButton
  #   Then The application should display following fields "under Select Legal Entity section"
  #     | field_name                   |
  #     | Legal_Entity_select_dropdown |
  #     | Legal_Entity_search_icon     |
  #     | LegalEntity-field            |
  #   Then The application should display the "SelectLegalEntity" for "General Enquiry request" text
  #     | SelectLegalEntityHeader | Select Legal Entity |
  #   Then The user select "NSW Government new" from "legalEntity_dropdown"
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value          |
  #     | enquiryDetails | enquiry Details text |
  #     | contactNumber  | 9876543287           |
  #     | your_reference | testpurpose          |
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Service Request Header,Enquiry details,Legal entity" for "General Enquiry request on review page"
  #     | titleL                | General Enquiry                                                                                                                                  |
  #     | descriptionL          | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
  #     | enquiryTypeHeader     | Enquiry Type                                                                                                                                     |
  #     | enquiryTypeL          | Enquiry Type                                                                                                                                     |
  #     | optionAccountL        | Troubleshooting                                                                                                                                  |
  #     | legalEntityL          | Legal Entity                                                                                                                                     |
  #     | legalEntity           | NSW Government new                                                                                                                               |
  #     | enquiryTypeContainer  | Enquiry Type                                                                                                                                     |
  #     | enquiryDetails-field  | Please provide the details of your enquiry below                                                                                                 |
  #     | enquiryDetails        |                                                                                                                                                  |
  #     | contactNumber         | 9876543287                                                                                                                                       |
  #     | Your_Reference_header | Your Reference (optional)                                                                                                                        |
  #     | your_reference        | test your reference                                                                                                                              |
  #   When The user click on the "Submit" button
  #   Then The application should display the "Confirmation pop-up" for "General Enquiry request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   Then The "responseId" for the "General Enquiry" is detail is saved to a file
  #   Then I click on "Ok"
  #   Then The user searches the stored service request with request type "General Enquiry" search req type "General Enquiry" and selects it
  #   Then The application should display the "Service Request Header" for "General Enquiry"
  #     | titleL       | General Enquiry                                                                                                                                  |
  #     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "General Enquiry request in view mode"
  #     | Summary_Info_header            | Summary Information                              |
  #     | Summary_Info_RequestID_txt     | Request ID                                       |
  #     | Summary_Info_Requestedon_txt   | Requested on                                     |
  #     | Summary_Info_Requestedby_txt   | Requested by                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                   |
  #     | Summary_Info_YourReference_txt | Request Status                                   |
  #     | legalEntityName                | Legal Entity                                     |
  #     | Legal_Entity_Value             | NSW Government new                               |
  #     | enquiryTypeHeader              | Enquiry Type                                     |
  #     | enquiryTypeL                   | Enquiry Type                                     |
  #     | optionAccountL                 | Troubleshooting                                  |
  #     | enquiryTypeContainer           | Enquiry Type                                     |
  #     | enquiryTypeHeader              | Enquiry Type                                     |
  #     | enquiryDetails-field           | Please provide the details of your enquiry below |
  #     | enquiryDetails                 |                                                  |
  #     | contactNumber                  | 9876543287                                       |



  # @shakeout-GE#NavigationalSupport
  # Scenario: General Enquiry - Create General Enquiry Navigational Support - search and view the details
  #   Given I am an authorised user with permission to create a "General Enquiry" service request
  #   Given I am logging in as user "AUTODSS5" with permission to create "General Enquiry" service request
  #   When The user navigate to the "General Enquiry" service request screen
  #   Then The application should display the "Service Request Header" for "General Enquiry"
  #     | titleL       | General Enquiry                                                                                                                                  |
  #     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
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
  #   Then The user select "NSW Government new" from "legalEntity_dropdown"
  #   Then The user enter the following text in corresponding textboxes
  #     | field_name     | field_value          |
  #     | enquiryDetails | enquiry Details text |
  #     | contactNumber  | 9876543287           |
  #     | your_reference | testpurpose          |
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Service Request Header,Enquiry details,Legal entity" for "General Enquiry request on review page"
  #     | titleL                | General Enquiry                                                                                                                                  |
  #     | descriptionL          | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
  #     | enquiryTypeHeader     | Enquiry Type                                                                                                                                     |
  #     | enquiryTypeL          | Enquiry Type                                                                                                                                     |
  #     | optionAccountL        | Troubleshooting                                                                                                                                  |
  #     | legalEntityL          | Legal Entity                                                                                                                                     |
  #     | legalEntity           | NSW Government new                                                                                                                               |
  #     | enquiryTypeContainer  | Enquiry Type                                                                                                                                     |
  #     | enquiryDetails-field  | Please provide the details of your enquiry below                                                                                                 |
  #     | enquiryDetails        |                                                                                                                                                  |
  #     | contactNumber         | 9876543287                                                                                                                                       |
  #     | Your_Reference_header | Your Reference (optional)                                                                                                                        |
  #     | your_reference        | test your reference                                                                                                                              |
  #   When The user click on the "Submit" button
  #   Then The application should display the "Confirmation pop-up" for "General Enquiry request"
  #     | request_status             | Submitted                     |
  #     | view_request_link          | View Request Details          |
  #     | raise_another_request_link | Raise another Service Request |
  #   Then The "responseId" for the "General Enquiry" is detail is saved to a file
  #   Then I click on "Ok"
  #   Then The user searches the stored service request with request type "General Enquiry" search req type "General Enquiry" and selects it
  #   Then The application should display the "Service Request Header" for "General Enquiry"
  #     | titleL       | General Enquiry                                                                                                                                  |
  #     | descriptionL | Raise a Cash Management related enquiry on an account or transaction. If your enquiry is urgent, please contact the ANZ Customer Service Centre. |
  #   Then The application should display the "viewAuditHistory" button
  #   Then The application should display the "Close" button
  #   Then The application should display the "Summary Information" for "General Enquiry request in view mode"
  #     | Summary_Info_header            | Summary Information                              |
  #     | Summary_Info_RequestID_txt     | Request ID                                       |
  #     | Summary_Info_Requestedon_txt   | Requested on                                     |
  #     | Summary_Info_Requestedby_txt   | Requested by                                     |
  #     | Summary_Info_RequestStatus_txt | Your Reference                                   |
  #     | Summary_Info_YourReference_txt | Request Status                                   |
  #     | legalEntityName                | Legal Entity                                     |
  #     | Legal_Entity_Value             | NSW Government new                               |
  #     | enquiryTypeHeader              | Enquiry Type                                     |
  #     | enquiryTypeL                   | Enquiry Type                                     |
  #     | optionAccountL                 | Troubleshooting                                  |
  #     | enquiryTypeContainer           | Enquiry Type                                     |
  #     | enquiryTypeHeader              | Enquiry Type                                     |
  #     | enquiryDetails-field           | Please provide the details of your enquiry below |
  #     | enquiryDetails                 |                                                  |
  #     | contactNumber                  | 9876543287                                       |
#-----------------------------------------------------------------------------------------------

# @close-account
# Feature: Close Account
#   User should able close an account on an existing legal entity
#   #-----------------------------------------------------------------------------------------------------------------------

#   @DIGS-311 @DIGS-313 @DIGS-314 @DIGS-316 @DIGS-715 @smoke-testing @api-mock @ui-mock
#   Scenario: Close Account - Select existing account and display account details
#     Given An authorised user with permission
#     When The user navigated to the Create "Close Account" service request screen
#     Then The application must present the "Account Details" selection dropdown which is defaulted to BLANK

#     * For Acceptance Criteria "DIGS-311-2, DIGS-311-3, DIGS-311-4, DIGS-311-5, DIGS-311-6"
#     When I click on the dropdown arrow against the "Closing Accounts" field
#     Then The application will populate the "Closing Accounts" dropdown menu with all entitled "accounts"
#     When The user won't select any "Account" from the drop down and closes the select drop down
#     Then The application must not update the "Account Details" displayed on the screen
#     When The user types "NO-MATCH-ACCOUNT" into the "Accounts" selection drop down
#     Then The application must display the error message 'No Matches Found' in the "Close Accounts" dropdown
#     When The user types "POSITIVE-CLOSING-BALANCE-ACCOUNT" into the "Accounts" selection drop down
#     Then The application will only show "Operating Accounts" within the drop down which contain the values typed in by the user
#     When The user selects "POSITIVE-CLOSING-BALANCE-ACCOUNT" from the "Accounts" selection drop down
#     Then The "Closing Operating Accounts" must be populated with the "POSITIVE-CLOSING-BALANCE-ACCOUNT" account

#     * For Acceptance Criteria "DIGS-316-1, DIGS-316-2"
#     And The application must display the 'Account Settlement Details' section as per the business rules and Field matrix

#     * For Acceptance Criteria "DIGS-715-1, DIGS-715-2"
#     And The application must display the 'Important Information' section with relevant links

#     * For Acceptance Criteria "DIGS-314-1"
#     When The user selects "LE-LAST-ACCOUNT-NON-ZERO-CLOSING-BALANCE" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "This account cannot be closed through online banking as there are no linked accounts for settlement. Please contact your ANZ Representative"

#     When The user closes the fly down

#     * For Acceptance Criteria "DIGS-313-2"
#     And The user clicks on the lookup button for "Closing Accounts"
#     Then The application will open the Search "Account" Lookup Dialog and show all the accounts I am entitled as per business rules

#     * For Acceptance Criteria "DIGS-313-5"
#     When The user closes the Search "Account" dialog box
#     Then The Search "Account" lookup dialog box must be hidden
#     And The user is directed to the "Close Account" Service Request create screen
#     And The account details remain unchanged

#     * For Acceptance Criteria "DIGS-313-3"
#     When The user clicks on the lookup button for "Closing Accounts"
#     And The user types in "ZERO-CLOSING-BALANCE-ACCOUNT" into the Search "Account" lookup
#     Then The application will only show "Accounts" within the list which contain the values typed in by the user

#     * For Acceptance Criteria "DIGS-313-4"
#     When The user selects an account from the "Search Account" lookup
#     Then The Search "Account" lookup dialog box must be hidden
#     And The "Closing Operating Accounts" must be populated with the "ZERO-CLOSING-BALANCE-ACCOUNT" account

#     * For Acceptance Criteria "DIGS-313-7"
#     When The user clicks on the lookup button for "Closing Accounts"
#     And The user selects an account from the "Search Account" lookup
#     Then The system must remove the previously selected account and populate the "Accounts" field with the new account details selected

#   #-----------------------------------------------------------------------------------------------------------------------
#   @OMCW-7 @ui-mock
#   Scenario: Close Account - Handle Exceptions by providing suitable user messages
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "DIGS-340-1"
#     When The user selects "GENERIC-TECHNICAL-ERROR-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Unable to complete request. Please try again. If problem persists, contact the ANZ Customer Service Centre."
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-2"
#     When The user selects "CLOSED-OR-PURGEABLE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Closed or Purgeable"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-3"
#     When The user selects "LINKED-SVC-ARRANGEMENTS-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "LinkedSVC arrangements"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-4"
#     When The user selects "UNCLEARED-FUNDS-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Uncleared funds"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-5"
#     When The user selects "OUTSTANDING-SDC-DEBIT-AUTHORISATIONS-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Outstanding SDC Debit Authorisations"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-6"
#     When The user selects "DRIVER-PROCESSING-IN-PLACE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Driver processing in place"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-7"
#     When The user selects "HARD-HOLD-RESTRAINT-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Hard Hold restraint"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-8"
#     When The user selects "PLEDGE-RESTRAINT-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Pledge restraint"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-9"
#     When The user selects "AUTHORISATION-PLEDGE-AMOUNT(STOCKBROKER PLEDGE)-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Authorisation Pledge amount (Stockbroker Pledge)"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-10"
#     When The user selects "UNPRODUCTIVE-DOWNGRADED-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Unproductive/Downgraded"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-11"
#     When The user selects "ACCOUNT-RESTRICTED-FOR-CLOSURE" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Account is restricted for Closure"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-12"
#     When The user selects "PRODUCT-SETOFF-ARRANGEMENTS-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Product Setoff Arrangements"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-13"
#     When The user selects "ACCOUNT-LINKED-TO-SDC" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Linked to SDC"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-14"
#     When The user selects "PRIMARY-ACCOUNT-IN-PORTFOLIO-AND-PORTFOLIO-IS-OPEN" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Account is the Primary account in a Portfolio arrangement and the Portfolio account is not yet closed"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-15"
#     When The user selects "NEGATIVE-DEBIT-INTEREST-ACCRUAL-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Negative Debit Interest Accrual"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-16"
#     When The user selects "MULTIPLE-FUNCTIONAL-ERROR-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Multiple Functional Errors"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-17"
#     When The user selects "TECHNICAL-ERROR-IN-HOSTSYSTEMS-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Technical Error in Host Systems"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#     * For Acceptance Criteria "DIGS-340-18"
#     When The user selects "TIMEOUT-ERROR-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Time out error"
#     And The application will not display remaining screen elements of Close Account & not be able to create the SR

#   #-----------------------------------------------------------------------------------------------------------------------
#   @OMCW-426 @ui-mock
#   Scenario: Close Account - Able to zero out any closing balance by selecting a suitable settlement account
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "DIGS-318-1", "DIGS-318-2"
#     When The user selects "NEGATIVE-CLOSING-BALANCE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application display the "Settlement Account Details" section and tool tip as per Field Matrix & Wireframe

#     * For Acceptance Criteria "DIGS-318-3"
#     When I click on the dropdown arrow against the "Settlement Accounts" field
#     Then The application will populate the "Settlement Accounts" dropdown menu with all entitled "accounts"

#     * For Acceptance Criteria "DIGS-318-4"
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Settlement Accounts" selection drop down
#     Then The "Settlement Account" must be populated with the "ELIGIBLE-FUND-ACCOUNT" account

#     * For Acceptance Criteria "DIGS-318-5"
#     When The user selects "INELIGIBLE-FUND-ACCOUNT" from the "Settlement Accounts" selection drop down
#     Then The application must display "ineligible account" warning message under "Settlement Account"

#     # * For Acceptance Criteria "DIGS-318-16"
#     # When The user selects "INSUFFICIENT-FUND-ACCOUNT" from the "Settlement Accounts" selection drop down
#     # Then The application must display "insufficient funds" warning message under "Settlement Account"

#     * For Acceptance Criteria "DIGS-318-6"
#     When The user types "ELIGIBLE-FUND-ACCOUNT" into the "Settlement Account" selection drop down
#     Then The application must only show accounts containing "ELIGIBLE-FUND-ACCOUNT" in the "Settlement Account" drop down list

#     * For Acceptance Criteria "DIGS-318-7"
#     When The user types "NO-MATCH-ACCOUNT" into the "Settlement Account" selection drop down
#     Then The application must display the error message 'No Matches Found' in the "Settlement Account" dropdown

#     * For Acceptance Criteria "DIGS-318-8"
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Settlement Accounts" selection drop down
#     And The user open 'Settlement Account' & close without selecting
#     Then The application leaves selected "Settlement Account" as "ELIGIBLE-FUND-ACCOUNT"

#     * For Acceptance Criteria "DIGS-318-9", "DIGS-318-10", "DIGS-318-11"
#     When The user clicks on the lookup button for "Settlement Accounts"
#     Then The application shows the "Search Account" lookup dialog box for "Settlement Account"
#     When The user types Account Name "FUND-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     Then The application will only show "Accounts" within the list which contain the values typed in by the user
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from Grid
#     Then The "Settlement Account" must be populated with the "ELIGIBLE-FUND-ACCOUNT" account

#     * For Acceptance Criteria "DIGS-318-12"
#     When The user clicks on the lookup button for "Settlement Accounts"
#     And The user types Account Name "INELIGIBLE-FUND-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     And The user selects "INELIGIBLE-FUND-ACCOUNT" from Grid
#     Then The application must display "ineligible account" warning message under "Settlement Account"

#     # * For Acceptance Criteria "DIGS-318-17"
#     # When The user clicks on the lookup button for "Settlement Accounts"
#     # And The user types Account Name "INSUFFICIENT-FUND-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     # And The user selects "INSUFFICIENT-FUND-ACCOUNT" from Grid
#     # Then The application must display "insufficient funds" warning message under "Settlement Account"

#     * For Acceptance Criteria "DIGS-318-13"
#     When The user clicks on the lookup button for "Settlement Accounts"
#     And The user closes the Search "Settlement Account" dialog box
#     Then The Search "Settlement Account" lookup dialog box must be hidden

#     * For Acceptance Criteria "DIGS-318-14"
#     When The user clicks on the lookup button for "Settlement Accounts"
#     And The user types Account Name "INELIGIBLE-FUND-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     And The user selects "INELIGIBLE-FUND-ACCOUNT" from Grid
#     Then The "Settlement Account" must be populated with the "INELIGIBLE-FUND-ACCOUNT" account

#   #-----------------------------------------------------------------------------------------------------------------------
#   @OMCW-482 @ui-mock
#   Scenario: Close Account - Warning messages when User is creating a Close Account SR on Host System cut-off times
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "DIGS-717-1","DIGS-717-2"
#     When The user selects "CUT-OFF-TIME-WARNING-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows warning message to proceed 'No' or 'Yes'
#     When The user Clicks the "Yes" button
#     Then The user may proceed with the "Close Account" Service Request

#     * For Acceptance Criteria "DIGS-717-4"
#     When The user selects "OUTSIDE-CUT-OFF-TIME-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows error message in toast for "Outside Cut-off time"

#     * For Acceptance Criteria "DIGS-717-3"
#     When The user selects "CUT-OFF-TIME-WARNING-ACCOUNT" from the "Accounts" selection drop down
#     Then The application shows warning message to proceed 'No' or 'Yes'
#     When The user Clicks the "No" button
#     Then The application must navigate to the "Cash Management Service Request" screen
#   #-----------------------------------------------------------------------------------------------------------------------

#   @OMCW-353 @ui-mock
#   Scenario: Close Account - Redirection account for future payments
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "OMCW-353-1","OMCW-353-2", "OMCW-353-3"
#     When The user selects "POSITIVE-CLOSING-BALANCE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application must display the 'Payment Redirection' section as per Field Matrix & Wireframe
#     And The application must show the "Redirect Future Payments" checkbox and tooltip as per the business rules and Field matrix
#     When The user checks the "Redirect Future Payments" checkbox
#     Then The application must show the "Redirection Account" field as per the field Matrix

#     * For Acceptance Criteria "OMCW-353-4"
#     When The user clicks on the "Redirection Account Field"
#     Then The application must display the "Redirection Accounts" list

#     * For Acceptance Criteria "OMCW-353-5"
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Redirection Account" selection drop down
#     Then The "Redirection Account" must be populated with the "ELIGIBLE-FUND-ACCOUNT" account

#     * For Acceptance Criteria "OMCW-353-6"
#     When The user selects "STOP-ALL-RESTRAINT-ACCOUNT" from the "Redirection Account" selection drop down which has Stop All restraint
#     Then The application must display "ineligible redirection account" warning message under "Redirection Account"

#     * For Acceptance Criteria "OMCW-353-7"
#     When The user types "ELIGIBLE-FUND-ACCOUNT" into the "Redirection Account" selection drop down
#     Then The application must only show accounts containing "ELIGIBLE-FUND-ACCOUNT" in the "Redirection Account" drop down list

#     * For Acceptance Criteria "OMCW-353-8"
#     When The user types "NO-MATCH-ACCOUNT" into the "Redirection Account" selection drop down
#     Then The application must display the error message 'No Matches Found' in the "Redirection Account" dropdown

#     * For Acceptance Criteria "OMCW-353-9"
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Redirection Account" selection drop down which has no restraints
#     And The user open 'Redirection Account' & close without selecting
#     Then The application leaves selected "Redirection Account" as "ELIGIBLE-FUND-ACCOUNT"

#     * For Acceptance Criteria "OMCW-353-10", "OMCW-353-11", "OMCW-353-12"
#     When The user clicks on the lookup button for "Redirection Account"
#     Then The application shows the "Search Account" lookup dialog box for "Redirection Account"
#     When The user types Account Name "FUND-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     Then The application will only show "Accounts" within the list which contain the values typed in by the user
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from Grid
#     Then The "Redirection Account" must be populated with the "ELIGIBLE-FUND-ACCOUNT" account

#     * For Acceptance Criteria "OMCW-353-13"
#     When The user clicks on the lookup button for "Redirection Account"
#     And The user types Account Name "STOP-ALL-RESTRAINT-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     And The user selects "STOP-ALL-RESTRAINT-ACCOUNT" from Grid
#     Then The application must display "ineligible redirection account" warning message under "Redirection Account"

#     * For Acceptance Criteria "OMCW-353-14"
#     When The user clicks on the lookup button for "Redirection Account"
#     And The user closes the Search "Redirection Account" dialog box
#     Then The Search "Redirection Account" lookup dialog box must be hidden

#     * For Acceptance Criteria "OMCW-353-15"
#     When The user clicks on the lookup button for "Redirection Account"
#     And The user types Account Name "CLOSEABLE-SETTLEMENT-REDIRECT-ACCOUNT" to the search box in the Search Account Lookup Dialog
#     And The user selects "CLOSEABLE-SETTLEMENT-REDIRECT-ACCOUNT" from Grid
#     Then The "Redirection Account" must be populated with the "CLOSEABLE-SETTLEMENT-REDIRECT-ACCOUNT" account

#   # -----------------------------------------------------------------------------------------------------------------------
#   @OMCW-113 @ui-mock
#   Scenario: Close Account - Online Banking
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "OMCW-327-1","OMCW-327-2"
#     When The user selects "POSITIVE-CLOSING-BALANCE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application must display the 'Online Banking' section as per Field Matrix & Wireframe
#     And The application must show the "Remove account and history from Transactive Global" checkbox and tooltip as per the business rules and Field matrix
#     And The user must be able to check the "Remove account and history from Transactive Global" checkbox

#   # -----------------------------------------------------------------------------------------------------------------------
#   @OMCW-394 @ui-mock
#   Scenario: Close Account - Validate on Review & Submit
#     Given An authorised user with permission
#     And The user navigated to the Create "Close Account" service request screen

#     * For Acceptance Criteria "OMCW-724-1, OMCW-724-2"
#     When The user selects "POSITIVE-CLOSING-BALANCE-ACCOUNT" from the "Accounts" selection drop down
#     Then The application display the "Settlement Account Details" section and tool tip as per Field Matrix & Wireframe
#     And The application must display the 'Payment Redirection' section as per Field Matrix & Wireframe
#     When The user clicks on 'Review & Sumbit' without checking the "Redirect Future Payments" checkbox
#     Then The application must show 'Validation Error' under 'Settlement Account field'

#     When The user checks the "Redirect Future Payments" checkbox
#     Then The application must show the "Redirection Account" field as per the field Matrix
#     When The user Clicks the "Review & Submit" button
#     Then The application must show 'Validation Error' under 'Settlement Account field'
#     And The application must show 'Validation Error' under 'Redirection Account field'
#     And The application 'must not' allow the user to progress to the next page
#     When The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Settlement Accounts" selection drop down
#     And The user selects "ELIGIBLE-FUND-ACCOUNT" from the "Redirection Account" selection drop down
#     And The user Clicks the "Review & Submit" button
#     Then The Validation errors in Close Account form must be removed

# # -----------------------------------------------------------------------------------------------------------------------






  # @ROF-Comments&Attachments#Close#Yes
  # Scenario: Recall Payment - Comments&Attachments#Close#Yes
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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




  # @ROF-Comments&Attachments#Close#No
  # Scenario: Recall Payment - Comments&Attachments#Close#No
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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




  # @ROF-CommentsOnly#Close#Yes
  # Scenario: Recall Payment - CommentsOnly#Close#Yes
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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




  # @RecallPayment-CommentsOnly#Close#No
  # Scenario: Recall Payment - CommentsOnly#Close#No
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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




  # @RecallPayment-AttachmentsOnly#Close#Yes
  # Scenario: Recall Payment - AttachmentsOnly#Close#Yes
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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




  # @RecallPayment-AttachmentsOnly#Close#No
  # Scenario: Recall Payment - AttachmentsOnly#Close#No
  #   Given I am an authorised user with permission to create a "Recall Payment" service request
  #   When The user navigate to the "Recall Payment" service request screen
  #   When The user Clicks the "confirmButton" button
  #   When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
  #   When I am selecting an eligible account from Search Account Lookup Dialog
  #   Then The application should display the "SearchforTransactionLabel" for "Recall Payment Service Request" text
  #     | SearchforTransactionLabel | Search for Transaction |
  #   Then The user enters value in the search criteria fields
  #     | PostDate | March 9, 2020 |
  #     | amount   | 25000         |
  #   When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
  #   Then The user enter "testROF#authorisation" into the "your_reference" text field
  #   When The user Clicks the "Next" button
  #   Then The application should display the "Account details" for "ROF on review page"
  #     | AccountHeaderLabel     | Account Details                                                                                                          |
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
  #   Then The application should display the "Service Request Header" for "Recall Payment service request in view mode"
  #     | recallPaymentTitle | Recall Payment (AU)                                                                                |
  #     | recallPaymentDesc  | Request a payment recall if you have made a payment in error and would like the funds to be returned to your account. |
  #   Then The user update the service request status with following details
  #     | requestId     | responseId        |
  #     | status        | PENDING_MORE_INFO |
  #     | requestStatus | PENDING_MORE_INFO |
  #   When The user Clicks the "Close" button
  #   Then The user searches stored service request with request type "Recall Payment" and selects it
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
#-------------------------------------------------------------------------------------


###@AddPeriodicalPayment  @Regression @PCM @ACM
#Feature: Add Periodical Payment
#  As an authorised user,
#  I want to be able to download, complete and upload a signed ACM Request Form through Digital Self Service,
#  so that user can Set up new periodical payments from your accounts.
  #-----------------------------------------------------------------------------------------------------------------------


#   @SmokeTestingMockUI @AddPP
#   Scenario:Add Periodical Payment - Create and View service request
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Add Periodical Payment"
#       | Title       | Add Periodical Payment (AU)                             |
#       | Description | Set up new periodical payments from your accounts. |
#     Then The application shows the "cancel" button
#     Then The application should display the "Instructions to download and complete the form" for "Add User to Digital Channel"
#       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
#       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
#       | instructions_step1.1_text   | Download the form by clicking the button below.                                                                                                                                                                                                        |
#       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
#       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
#       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
#       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
#       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
#       | instructions_step#1.4       | Step 1.4                                                                                                                                                                                                                                               |
#       | instructions_step1.4_text   | Follow the instructions to submit your service request, ensuring the selected account matches at least one of the accounts provided on the form.                                                                                                       |
#     Then The application should display the "download form button" for "Add Periodical Payment"
#       | download_form | Download the Add Periodical Payment form |
#     Then The user click on the Download Form button
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The application should display following fields "under Your Reference section"
#       | field_name             |
#       | Your_Reference_textbox |
#     Then The application should display the "Your Reference section" for "Add Periodical Payment"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     Then The application should display the "Account section" for "Service Request"
#       #| AccountHeaderLabel  |Step 4: Select Account |
#       | account_placeholder | Select Account Number  |
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Add Periodical Payment SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add Periodical Payment SR"
#       | Title       | Add Periodical Payment (AU)                             |
#       | Description | Set up new periodical payments from your accounts. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Important Information Section" for "Add Periodical Payment SR"
#       | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#     Then The application should display the "Account details" for "DDR service request in view mode"
#       | AccountHeaderLabel     | Account Details                                                                                                   |
#       | AccountName            | BO-PENDING                                                                                                        |
#       | AccountDefaultCurrency | AUD                                                                                                               |
#       | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     When The user click on the "View Audit History" button
#     Then The application should display the "Audit History Pop-up details" for "Add Periodical Payment SR"
#       | SR_Audit_History_header | Service Request Audit History |
#       | SR_Audit_History_Date   | Date / Time                   |
#       | SR_Audit_History_Status | Request Status                |
#       | SR_Audit_History_User   | User                          |
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Periodical Payment service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |



#   @SmokeTestingMockUI
#   Scenario:Add Periodical Payment - Create and Search service request
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should display the "service request Header details" for "Add Periodical Payment"
#       | Title       | Add Periodical Payment (AU)                             |
#       | Description | Set up new periodical payments from your accounts. |
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter "test#Ref#123" into the "your_reference" text field
#     When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
#     When I am selecting an eligible account from Search Account Lookup Dialog
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The request id is stored from the element "responseId"
#     Then I click on "Ok"
#     Then The user searches stored service request and selects it
#     Then The application should display the "service request Header detailsin view mode" for "Add Periodical Payment SR"
#       | Title       | Add Periodical Payment (AU)                             |
#       | Description | Set up new periodical payments from your accounts. |
#     Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add Periodical Payment service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested on        |
#       | Summary_Info_Requestedby_txt   | Requested by        |
#       | Summary_Info_RequestStatus_txt | Request Status      |
#     Then The application should display the "Important Information Section" for "Add Periodical Payment SR"
#       | Important_Information | Please refer to your Cash Product Fee Schedule for any Fee and/or Charges that may apply to this service. |
#     Then The application should display the "Account details" for "service request in view mode"
#       | AccountHeaderLabel     | Account Details                                                                                                   |
#       | AccountName            | BO-PENDING                                                                                                        |
#       | AccountDefaultCurrency | AUD                                                                                                               |
#       | AccountDescription     | Book Order Pending - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut |
#     When The user click on the "View Audit History" button
#     Then The application should display the "Audit History Pop-up details" for "Add Periodical Payment SR"
#       | SR_Audit_History_header | Service Request Audit History |
#       | SR_Audit_History_Date   | Date / Time                   |
#       | SR_Audit_History_Status | Request Status                |
#       | SR_Audit_History_User   | User                          |
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | AuditHistoryStatus | In Progress |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Periodical Payment service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |



# #    Scenario:DTFAU-1 Add Periodical Payment - Header and Description
# #     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
# #     When The user navigate to the "Add Periodical Payment" service request screen
# #     Then The application should display the "service request Header details" for "Add Periodical Payment"
# #       | Title       | Add Periodical Payment                                                                                |
# #       | Description | Set up new periodical payments from your accounts.|
# #     Then The application shows the "cancel" button



# #     Scenario:Add Periodical Payment - Step 1: Download and Complete Content
# #     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
# #     When The user navigate to the "Add Periodical Payment" service request screen
# #    Then The application should display the "Instructions to download and complete the form" for "Add User to Digital Channel"
# #       | instructions_header         | Step 1: Download and Complete                                                                                                                                                                                                                          |
# #       | instructions_step#1.1       | Step 1.1                                                                                                                                                                                                                                               |
# #       | instructions_step1.1_text   | Download the form by clicking the button below. Note: contact your administrator if you need to add an ANZ Transactive – Global company managed user.                                                                                                 |
# #       | instructions_step#1.2       | Step 1.2                                                                                                                                                                                                                                               |
# #       | instructions_step1.2_text   | Complete all required details and print the form.                                                                                                                                                                                                      |
# #       | instructions_step1.2.1_text | If the Declaration and Execution sections are present within the printed form, it will need to be signed by the appropriate authorised persons in your organisation. Contact your ANZ representative if you need to identify these authorised persons. |
# #       | instructions_step#1.3       | Step 1.3                                                                                                                                                                                                                                               |
# #       | instructions_step1.3_text   | Upload the form (signed version if required) along with any required supporting documentation and follow the instructions to submit your service request.                                                                                              |
# #    # Then The user click on the Download Form button



#     Scenario:Add Periodical Payment - Important Information
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-Excel.xlsx |
#     Then The application should display 'Important Information' details at the bottom of the "Add a user" screen
#       | imp_info_header | Important Information                                                                                                   |
#       | imp_info        | By submitting this request I accept that Fees and/or Charges may apply (Please refer to your Cash Product Fee Schedule) |
#     And The application should display "importantInfo_checkbox" checkbox is NOT checked by default



#     Scenario:Add Periodical Payment - Display Your Reference section
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-Excel.xlsx |
#     Then The application should display following fields "under Your Reference section"
#       | field_name             |
#       | Your_Reference_textbox |
#     Then The application should display the "Your Reference section" for "Add Periodical Payment"
#       | Your_Reference_header           | Step 3: Your Reference (Optional)                                                            |
#       | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
#     And The application should allow only valid characters in the reference field
#       | ValidData | test reference validation data 12-&',:;# |
#     And The application should not allow more than 40 characters in the reference field
#       | MoreThan40InputData    | more than 40 characters test by the DSSAutomationTesting team |
#       | MoreThan40AcceptedData | more than 40 characters test by the DSSA                      |
#     And The application should not allow unsupported characters in the reference field
#       | InvalidCharacters | `~!@$%^*()+={}[]\"?><,./ |


#     Scenario:Add Periodical Payment - Display the legal entity
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-Excel.xlsx |
#     Then The application should display following fields "under Your Reference section"
#       | field_name                   |
#       | Legal_Entity_select_dropdown |
#       | Legal_Entity_search_icon     |
#       | LegalEntity-field            |
#     Then The application should display the "Legal Entity details" for "Add Periodical Payment service request"
#       | Legal_Entity_header          | Step 4: Select a Legal Entity                   |
#       | Legal_Entity_placeholder_txt | Please select the Legal Entity for this request |




#   Scenario:Add Periodical Payment - Select the legal entity from drop down
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Add Periodical Payment SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The user waiting to load "View details page"
#     Then The application should display the "service request Header detailsin view mode" for "Add Periodical Payment SR"
#       | Title       | Add Periodical Payment                                                                                |
#       | Description | Set up new periodical payments from your accounts.|
#     Then The application should display the "Summary Information" for "Add Periodical Payment service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     Then The application should display the "Legal Entity details" for "Add Periodical Payment SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |


#     Scenario:Add Periodical Payment - Select the legal entity from search pop-up
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up
#       | legalEntity | Health |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The user waiting to load "View details page"
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     Then The application should display the "Confirmation pop-up detail" for "Add Periodical Payment SR"
#       | request_status             | Submitted                     |
#       | view_request_link          | View Request Details          |
#       | raise_another_request_link | Raise another Service Request |
#     When The user click on the "view_request_link" link
#     Then The user waiting to load "View details page"
#     Then The application should display the "service request Header detailsin view mode" for "Add Periodical Payment SR"
#        | Title       | Add Periodical Payment                                                                                |
#       | Description | Set up new periodical payments from your accounts. |
#     Then The application should display the "Summary Information" for "Add Periodical Payment service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     Then The application should display the "Legal Entity details" for "Add Periodical Payment SR"
#       | Legal_Entity_Summary | Legal Entity         |
#       | Legal_Entity_Name    | Legal Entity         |
#       | Legal_Entity_Value   | Department of Health |



#     Scenario:Add Periodical Payment -  Upload Form - Display Upload File Component
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should display following fields "under file upload component"
#       | field_name              |
#       | File_upload_header      |
#       | File_upload_icon        |
#       | File_upload_Drag&Drop   |
#       | File_upload_Browser     |
#       | File_upload_fileToolTip |
#     Then The application should display the "file upload component details" for "Add Periodical Payment service request"
#       | File_upload_header        | Step 2: Upload Completed Form & Required Documentation |
#       | File_upload_Drag&Drop_txt | Drag and drop your files here, or                      |
#   #   // TO DO not working
#   # Then The application should display the 'file tooltip text' as follows "title"
#   #   | File_upload_fileToolTip_txt | A file must not exceed 10MB and must be one of the following formats: .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. A maximum of 10 files can be uploaded. |





#     Scenario:Add Periodical Payment - Confirmation Pop-Up Message - View SR Details
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf1.pdf   |
#       | filepath3 | //resources//input//Test-Excel.xlsx |
#     Then The user enter the following text in corresponding textboxes
#       | field_name     | field_value     |
#       | your_reference | testAutoRef#123 |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "view_request_link" link
#     Then The application should display the "service request Header detailsin view mode" for "Add Periodical Payment SR"
#       | Title       | Add Periodical Payment                                                                                |
#       | Description | Set up new periodical payments from your accounts. |
#      Then The application should display the "viewAuditHistory" button
#     Then The application should display the "Close" button
#     Then The application should display the "Summary Information" for "Add Periodical Payment service request"
#       | Summary_Info_header            | Summary Information |
#       | Summary_Info_RequestID_txt     | Request ID          |
#       | Summary_Info_Requestedon_txt   | Requested by        |
#       | Summary_Info_Requestedby_txt   | Request Status      |
#       | Summary_Info_RequestStatus_txt | Requested on        |
#     Then The application should display the "Legal Entity details" for "Add Periodical Payment SR"
#       | Legal_Entity_Summary | Legal Entity |
#       | Legal_Entity_Name    | Legal Entity |
#       | Legal_Entity_Value   | NSWG         |
#     When The user click on the "View Audit History" button
#     Then The application should display the "Audit History Pop-up details" for "Add Periodical Payment SR"
#       | SR_Audit_History_header | Service Request Audit History |
#       | SR_Audit_History_Date   | Date / Time                   |
#       | SR_Audit_History_Status | Request Status                |
#       | SR_Audit_History_User   | User                          |
#     Then The application should display the "status as In progress in Audit history" for "service request"
#       | SR_Audit_History_status | In Progress |
#     Then The application should display the "Comments and Supporting Documents section" for "Add Periodical Payment service request"
#       | Comment_Section_header          | Comments and Supporting Documents |
#       | Comment_Section_Date_txt        | Date                              |
#       | Comment_Section_AddedBy_txt     | Added by                          |
#       | Comment_Section_Comments_txt    | Comments                          |
#       | Comment_Section_Attachments_txt | Attachments                       |
#




#     Scenario:Add Periodical Payment - Confirmation Pop-Up Message - OK
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The application shows "Cash Management Service Requests" screen



#    Scenario:Add Periodical Payment - Confirmation Pop-Up Message - Raise Another Service Request
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user click on the "Raise another Service Request" link
#     Then The application shows "Create Service Request" screen



#    Scenario:Add Periodical Payment - Multiple files upload
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf    |
#       | filepath2 | //resources//input//Test-pdf2.pdf   |
#       | filepath3 | //resources//input//Test-pdf3.pdf   |
#       | filepath4 | //resources//input//Test-pdf4.pdf   |
#       | filepath5 | //resources//input//Test-pdf5.pdf   |
#       | filepath6 | //resources//input//Test-pdf6.pdf   |
#       | filepath7 | //resources//input//Test-Excel.xlsx |
#       | filepath8 | //resources//input//Test-word.docx  |
#     Then The user select a legal entity from the search legal entity pop up       | legalEntity | NSWG |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application shows "Manual email modal" dialog
#     When The user entered "test@anz.com" in "EmailId" textbox
#     When The user click on the "Ok" button
#     Then The application should display following fields "Add Periodical Payment SR confirmation pop-up"
#       | field_name                 |
#       | request_status             |
#       | requestId                  |
#       | view_request_link          |
#       | raise_another_request_link |
#       | submitted_txt              |
#       | submitted_tickMark         |
#     When The user Clicks the "Ok" button
#     Then The application shows "Cash Management Service Requests" screen


#    Scenario:Add Periodical Payment - Duplicate files upload
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#       | filepath4 | //resources//input//Test-pdf.pdf  |
#       | filepath5 | //resources//input//Test-pdf5.pdf |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-pdf.pdf - A file with the same name already exists. |



#    Scenario:Add Periodical Payment - Mixed files upload
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#       | filepath4 | //resources//input//Test-webfont.woff |
#       | filepath5 | //resources//input//Compressed.zip |
#     Then The application should display error message under "file-upload" component
#       | error_message | The following file(s) failed to upload: |
#     And The application should display error message under "file-upload-errorDetails" component
#       | error_message | Test-webfont.woff - File format must be one of .pdf, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .jpg, .jpeg, .png, .gif, .txt, .tif. |
#    Then The application should display the "uploaded files under" the "file upload section"
#       | fileRemoveIcon1 |       |
#       | fileRemoveIcon2 |        |
#       | File_Name1      | Test-pdf.pdf ( 444.82 KB ) |
#       | File_Name2      | Test-pdf2.pdf ( 444.82 KB ) |


#     Scenario:Add Periodical Payment - Submit Request - Submit with No File(s) Uploaded
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     And The user navigate to the "Add Periodical Payment" service request screen
#     When The user Clicks the "Submit" button
#     Then The application should display error message under "file upload" component
#       | error_message | A file has not been uploaded. Please upload at least one file to proceed. |


#     Scenario:Add Periodical Payment - Without Terms and Conditions
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#       | filepath3 | //resources//input//Test-pdf3.pdf |
#     And The user select a legal entity from the search legal entity pop up
#       | legalEntity | NSWG |
#     When The user Clicks the "Submit" button
#     Then The application should display error message under "Important Information" component
#       | error_message | Please select the checkbox to confirm |





#    Scenario:Add Periodical Payment - Without Legal Entity
#     Given I am an authorised user with permission to create an "Add Periodical Payment" service request
#     When The user navigate to the "Add Periodical Payment" service request screen
#     Then The application should allow user to select and upload one or more files from computer
#       | filepath1 | //resources//input//Test-pdf.pdf  |
#       | filepath2 | //resources//input//Test-pdf2.pdf |
#     When The user click on the "importantInformationCheckBox" button
#     When The user click on the "Submit" button
#     Then The application should display error message under "Legal_Entity_error_msg" component
#       | error_message | Please select a Legal Entity. |




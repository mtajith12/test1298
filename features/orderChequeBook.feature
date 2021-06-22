@order-cheque-book @Regression @webform
Feature: Order Cheque Book
  User should able to initiate new Order Cheque Book Request
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @order-cheque-book1
  Scenario: Order Cheque Book Enter Details
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
    #When The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
    When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "Account details" for "Order Cheque Book in enter details page"
      | AccountName | BO-PENDING-APPROVAL |
      | AccountNo   | 010203 - 123456203  |
    Then The application should display following fields "Cheque Book Details section"
      | field_name               |
      | NumberofBooks            |
      | BookSize                 |
      | OrderChequeMailingTitle1 |
      | personalizationLine2     |
      | personalizationLine3     |
      | personalizationLine4     |
      | mailingTitle2            |
    Then The user select the "2" from "NumberofBooks" drop down
    Then The user select the "50" from "BookSize" drop down
    And I am entering below detail in "Order Cheque Book" section
      | Attention To | Attention@test.com                    |
      | Line3        | incididunt ut labore et dolore magna  |
      | Line4        | aliqua. Ut enim ad minim veniam, quis |
    And The user Clicks the "Review & Submit" button
    When The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen

  @DIGS-239 @api-mock @ui-mock
  Scenario: Order Cheque Book - Field Validation
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
    When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #When The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
    And The user Clicks the "Review & Submit" button
    Then The application should display the "Error messages" in the "Order Cheque Book Creation Page"
      | quantity-error | Number of Books is mandatory |
    Then The application should display the "Error messages" in the "Order Cheque Book Creation Page"
      | bookSize-error | Book Size is mandatory |
    Then The application should display the "Error messages" in the "Order Cheque Book Creation Page"
      | OrderChequeMailingTitle1-error | Attention To is mandatory |
    When I am entering below detail in "Order Cheque Book" section
      | No of Books  | 1             |
      | Book Size    | 50            |
      | Attention To | test@test.com |
      | Company Name | Test Company  |
    When I am selecting "Yes" from "Do you want Custom Serial Numbers?" Radio options
    And The user Clicks the "Review & Submit" button
    Then The application should display the "Error messages" in the "Order Cheque Book Creation Page"
      | customeSerialNo-error | Starting Cheque Number is mandatory |
    When I am entering below detail in "Order Cheque Book" section
      | Starting Cheque Number          | 8888 |
      | Starting Cheque Number End With | 76   |
    When The user Clicks the "Review & Submit" button
    Then The application should display the "OrderChequeDeliveryAddress_wrapper-error" in the "Order Cheque Book creation Page"
      | OrderChequeDeliveryAddress_wrapper-error | Enter a valid Australian delivery address |
    Then The user select the "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    # When I am selecting "ANZ Branch" from "Select Delivery Location" Radio options
    And The user Clicks the "Review & Submit" button
     And I am selecting Postage Method as "Express Post"
    Then The application hide Billing Division Selection
    Then The application does not show error message on "Line1", "Line2", "Line3", "Line4", "Attention To" & "Company Name" fields
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-247-1 @ui-mock
  Scenario: Order Cheque Book - API Validation Error
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-2"
    When The user navigated to the "Order Cheque Book" service request screen
    When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books  | 1              |
      | Book Size    | 50             |
      | Attention To | API Error Test |
    And The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user Clicks the "Review & Submit" button
    Then The application shows error message in toast for "API validation failed"
  #-----------------------------------------------------------------------------------------------------------------------
  @api-mock @ui-mock @DIGS-247-02
  Scenario: Order Cheque Book - Add New Business / ANZ Branch Address
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "vic" in "Add New Address" Dialog
    Then The application show 5 result from Address Lookup in "Add New Address" Dialog
    When I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The application shows selected adress in "Delivery Address"
    #When I am selecting "ANZ Branch" from "Select Delivery Location" Radio options
    #And The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "vic" in "Search Branch Lookup" Dialog
    Then The application show 5 result from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from Grid
    Then The application shows selected adress in "Branch Address"
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-247-2 @api-mock @ui-mock
  Scenario: Order Cheque Book - Pending Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-1, DIGS-247-6"
    When The user navigated to the "Order Cheque Book" service request screen
    #Then The user select "BO-PENDING" from "AccountDropDown"
    #And The user selects 'BO-PENDING' from Select Account Number Dropdown
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    #   Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Cancel" as action
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending                       |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |


  @DIGS-247-11 @api-mock @ui-mock
  Scenario: Order Cheque Book - Approve Request with 'Approve' - Approve
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-4"
    When The user navigated to the "Order Cheque Book" service request screen
   # Then The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
   When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Approve" as action
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |


  # Create record to approve in view mode
  @DIGS-247-3 @api-mock @ui-mock
  Scenario: Order Cheque Book - Approve Request with 'Cancel' - Approve
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-4"
    When The user navigated to the "Order Cheque Book" service request screen
   # Then The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
   When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Cancel" as action
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "viewRequest" link
    Then The application should display the "Service Request Header" for "Order Cheque Book view screen"
      | Order a Cheque Book | Order Cheque Book (AU) |
      | Approve             | Approve                |
      | Reject              | Reject                 |
    When The user click on the "Approve" button
    Then The application should display the "Approval Successful" toast notification

  #-----------------------------------------------------------------------------------------------------------------------
  @api-mock @ui-mock#Reject
  # Create record to reject in view mode
  Scenario: Order Cheque Book - Approve Request with 'Cancel' - Reject
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-3, DIGS-247-5"
    When The user navigated to the "Order Cheque Book" service request screen
    #Then The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
       When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Cancel" as action
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "viewRequest" link
    Then The application should display the "Service Request Header" for "Order Cheque Book view screen"
      | Order a Cheque Book | Order Cheque Book (AU) |
      | Approve             | Approve                |
      | Reject              | Reject                 |
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title   | Reject Service Request                                           |
      | cancelBtn            | Cancel                                                           |
      | rejectBtn            | Ok                                                               |
      | rejectDialog-content | Provide other users with some context for rejecting this request |
      | rejectComment        |                                                                  |
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    And The user click on the "rejectBtn" button
    Then The application should display the "Rejection Successful" toast notification



  @DIGS-247-4 @api-mock @ui-mock
  Scenario: Order Cheque Book - Awaiting Fulfilment Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-7"
    When The user navigated to the "Order Cheque Book" service request screen
   # Then The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
      When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Awaiting Fulfilment           |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |

  @DIGS-247-5 @api-mock @ui-mock
  Scenario: Order Cheque Book - Unsuccessful Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-8"
    When The user navigated to the "Order Cheque Book" service request screen
   # Then The user select "BO-UNSUCCESSFUL" from "AccountDropDown"
      When The user types Account Name "BO-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    When I am entering below detail in "Order Cheque Book" section
      | No of Books  | 1             |
      | Book Size    | 50            |
      | Attention To | test@test.com |
      | Company Name | Test Company  |
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    Then The user select "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    When The user Clicks the "Review & Submit" button
    When The user click on the "Submit" button
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Unsuccessful                  |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-247-6 @ui-mock
  Scenario: Order Cheque Book - Unable To Approve
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
    #Then The user select "BO-UNABLE-TO-APPROVE" from "AccountDropDown"
       When The user types Account Name "BO-UNABLE-TO-APPROVE" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Approve" as action
    Then The application should display the "Notification Alert Msg" for "SR"
      | NotificationAlertMsg | Vacman Controller error, method AAL2ProcVerifySignatureReply() Vacman Controller error code -202 – Response Too Small |

  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-247-7 @ui-mock
  Scenario: Order Cheque Book - Unable To Reject
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
  #  Then The user select "BO-UNABLE-TO-REJECT" from "AccountDropDown"
     When The user types Account Name "BO-UNABLE-TO-REJECT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Cancel" as action
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "viewRequest" link
    Then The application should display the "Service Request Header" for "Order Cheque Book view screen"
      | Order a Cheque Book | Order Cheque Book (AU) |
      | Approve             | Approve                |
      | Reject              | Reject                 |
    When The user click on the "Reject" button
    Then The application should display the "Reject model window" for "SR"
      | rejectDialog-title   | Reject Service Request                                           |
      | cancelBtn            | Cancel                                                           |
      | rejectBtn            | Ok                                                               |
      | rejectDialog-content | Provide other users with some context for rejecting this request |
      | rejectComment        |                                                                  |
    Then The user enter "Rejection comments text" into the "rejectComment" text field
    And The user click on the "rejectBtn" button
    Then The application should display the "Notification Alert Msg" for "SR"
      | NotificationAlertMsg | Unable to complete request. Please try again. If problem persists, contact the ANZ Customer Service Centre. |
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-438-1 @api-mock @ui-mock
  Scenario: Order Cheque Book - View Service Requests
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-247-4"
    When The user navigated to the "Order Cheque Book" service request screen
   # Then The user select "BO-PENDING-APPROVAL" from "AccountDropDown"
      When The user types Account Name "BO-PENDING-APPROVAL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am entering below detail in "Order Cheque Book" section
      | No of Books | 1  |
      | Book Size   | 50 |
    And The user enter "Test Attention To" text to "Attention To" field
    # When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    Then The user waiting to load "Approve model window"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "Service Request Header" for "Order Cheque Book"
      | Order a Cheque Book | Order Cheque Book (AU) |
    Then The application shows "Review & Submit" Page
    When The user click on the "Submit" button
    Then The user waiting to load "Approve model window"
    Then The application show "Approve" model window
    Then The application should display the "Approve model with below confirmatiom descriptions" for "service request"
      | confirmationDialog-describedby1 | You have added a new address. For security reasons you are required to approve this request before the address can be used. |
      | confirmationDialog-describedby2 | Once approved, the address will be available in your address book for future use.                                           |
      | confirmationDialog-describedby3 | Do you wish to approve this request?                                                                                        |
    When I am selecting "Cancel" as action
    Then The request id is stored from the element "responseId"
    Then The application should display the "Confirmation pop-up" for "Service Request"
      | request_status             | Pending Approval              |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
    When The user click on the "viewRequest" link
    Then The application should display the "Service Request Header" for "Order Cheque Book view screen"
      | Order a Cheque Book | Order Cheque Book (AU) |
      | Approve             | Approve                |
      | Reject              | Reject                 |
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for " SR"
      | SR_Audit_History_header | Service Request Audit History |
    When The user selects to close the audit popup
    Then The application must close the audit popup and return the user to the Service Request view detail screen

  #-----------------------------------------------------------------------------------------------------------------------
  @api-mock @ui-mock @order-reject
  Scenario: Order Cheque Book - View Individual Service Request
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-438-05"
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    And The user input "Request Status" with 'Pending Approval' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    Then The application must present the selected "Order Cheque Book (AU)" service request in non editable mode as per the field matrix
    When The user Clicks the "Approve" button
    #Then The application presents the "Approval Successful" as a toast message & hide the 'Approve' and 'Reject' buttons

    # * For Acceptance Criteria "DIGS-438-07, DIGS-438-09"
    # When The user selects to progress to the "Next Record"
    # Then The 'Reject' action button is displayed
    # And The user Clicks the "Reject" button
    # Then The application must show the 'Reject Service Request' Dialog window
    # When The user Clicks the "Cancel" button in Reject Dialog
    # Then The application must hide the 'Reject Service Request' Dialog window

    # * For Acceptance Criteria "DIGS-659-01"
    # When The user Clicks the "Reject" button
    # And The user Clicks the "Reject" button in Reject Dialog
    # Then The system must highlight the field "Reason for reject" in red and display error message
    # When The User enter the rejection reason as "Testing"
    # And The user Clicks the "Reject" button in Reject Dialog

    # * For Acceptance Criteria "DIGS-662-01"
    # Then The application presents the "Rejection Successful" as a toast message, Close the Dialog & hide the 'Approve' and 'Reject' buttons

    # * For Acceptance Criteria "DIGS-438-02"
    # When The user Clicks the "Close" button
    # Then The application must navigate the user to the Service Request List screen and previous search must be presented

    When The user selects to 'Reset' the advanced search criteria
    And The user input "Account Name" with 'BO-PENDING' in Advance Search Panel
    And The user input "Request Type" with 'Cheque Book' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    Then The application must present 'Pending' Request with 'Errors and Alerts' subsection on the View Details screen
    When The user Clicks the "Close" button
    Then The application must navigate to the "View Service Request List" screen

    When The user selects to 'Reset' the advanced search criteria
    And The user input "Account Name" with 'BO-UNSUCCESSFUL' in Advance Search Panel
    And The user input "Request Type" with 'Cheque Book' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    Then The application must present 'Unsuccessful' Request with 'Errors and Alerts' subsection on the View Details screen
    When The user Clicks the "Close" button
    Then The application must navigate to the "View Service Request List" screen
  #------------------------------------------------------------------------------------------------------------------
  @ui-mock @DIGS-438
  Scenario: Order Cheque Book - Approve/Reject - API Error
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-438-06"
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    When The user selects to 'Reset' the advanced search criteria
    And The user input "Account Name" with 'BO-UNABLE-TO-APPROVE' in Advance Search Panel
    And The user input "Request Status" with 'Pending Approval' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    And The user Clicks the "Approve" button
    Then The application presents the "Unable to approve request" as a toast message & show the 'Approve' and 'Reject' buttons
    When The user Clicks the "Close" button
    Then The application must navigate the user to the Service Request List screen and previous search must be presented

    * For Acceptance Criteria "DIGS-438-08"
    When The user selects to 'Reset' the advanced search criteria
    And The user input "Account Name" with 'BO-UNABLE-TO-REJECT' in Advance Search Panel
    And The user input "Request Status" with 'Pending Approval' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    And The user Clicks the "Reject" button
    Then The application must show the 'Reject Service Request' Dialog window
    When The User enter the rejection reason as "Unable to reject request Testing"
    And The user Clicks the "Reject" button in Reject Dialog
    Then The application presents the "Unable to reject request" as a toast message, Close the Dialog & show the 'Approve' and 'Reject' buttons
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-574 @api-mock @ui-mock
  Scenario: Order Cheque Book - Show BIN
    Given An authorised user with permission
    When The user navigated to the "Order Cheque Book" service request screen
    #Then The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
   # Then The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
   When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    * For Acceptance Criteria "DIGS-574-01"
    Then The application must present BIN Type and BIN in next available empty personalisation line in personalisation section

    * For Acceptance Criteria "DIGS-231-07"
    Then The system must populate up to the 3rd the personalisation rows with "Account Legal Entity Name"

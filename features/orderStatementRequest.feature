 @order-statement-request
Feature: Order Statement Request
  User should able to initiate new Order Statement Request Request
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Enter Account Details
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    Then The application must present the "Operating Accounts" selection dropdown which is defaulted to BLANK
    And The application must hide the further input fields to Request "Order Statement Request"

    * For Acceptance Criteria "@DTFAU-9"
    When I click on the dropdown arrow against the "Operating Accounts" field
    Then The application will populate the "Operating Accounts" dropdown menu with all entitled "accounts"

    * For Acceptance Criteria "@DTFAU-9"
    When The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    Then The "Operating Account" must be populated with the "BO-AWAITING-FULFILMENT" account

    * For Acceptance Criteria "@DTFAU-9"
    When The user types "BO-AWAITING-FULFILMENT" into the "Operating Accounts" selection drop down
    Then The application pops up the drop-down list while typing, suggesting a list of possible results

    * For Acceptance Criteria "@DTFAU-9"
   # When The user types "ABCD" into the "Operating Accounts" selection drop down
   # Then The application must display the error message 'No Matches Found' in the "Operating Accounts" dropdown

    * For Acceptance Criteria "@DTFAU-9"
    When The user clicks on the lookup button for "Operating Accounts"
    Then The application will open the Search "Account" Lookup Dialog and show all the accounts I am entitled as per business rules

    * For Acceptance Criteria "@DTFAU-9"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    Then The application will only show "Accounts" within the list which contain the values typed in by the user
    When The user types Account Name "ABCD" to the search box in the Search Account Lookup Dialog
    Then "Search Account" Lookup Dialog should not list any accounts

    * For Acceptance Criteria "@DTFAU-9"
    When The user closes the Search "Account" dialog box
    And The user clicks on the lookup button for "Operating Accounts"
    Then The application will open the Search "Account" Lookup Dialog and show all the accounts I am entitled as per business rules
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The "Operating Account" must be populated with the "BO-AWAITING-FULFILMENT" account

    * For Acceptance Criteria "@DTFAU-9"
    When The user clicks on the lookup button for "Operating Accounts"
    Then The application will open the Search "Account" Lookup Dialog and show all the accounts I am entitled as per business rules
    When The user closes the Search "Account" dialog box
    Then The application must close the search account popup and the account number Dropdown is not updated
    And The application shows previously entered details
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Standard
    Given An authorised user with permission

    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    Then The application shows the "Statement Request Details" section

    * For Acceptance Criteria "@DTFAU-9"
    When The user Clicks the "Review & Submit" button
    Then The application shows the "Statement Request Details" section
    And The application shows "Statement Request Validation Error" on "Statement Request Details" as per business rules

  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Cancel Button
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen

  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request Cancel Button - Post Review
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen

  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Previous Button
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-UNSUCCESSFUL' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Previous" button
    Then The application shows previously entered details
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Awaiting Fulfilment Status
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Pending Status
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-PENDING' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Pending"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Unsuccessful Fulfilment Status
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-UNSUCCESSFUL' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Unsuccessful"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Field Validations
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    Then The application shows the "Statement Request Details" section
    #No from and to date details
    When The user Clicks the "Review & Submit" button
    Then The application shows "Statement Request Validation Error" on "Statement Request Details" as per business rules
    #Only from date
    When I am entering below detail in "Order Statement Request" section
      | From Date  |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application shows "Statement Request Validation Error" on "To Date" as per business rules
    #To date less than from Date
    When I am entering below detail in "Order Statement Request" section
      | To Date    |  01/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application shows "Statement Request Validation Error" on "To Date" as per business rules
    When I am entering below detail in "Order Statement Request" section
      | From Date  |  08/03/2019        |
      | To Date    |  20/03/2019        |
    #Then The application shows "Statement Request Validation Error" on "To Date" as per business rules
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Navigate to Service Request View details
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "View Request Details" link from the Submission Response Dialog
    Then The application must navigate to the "Service Request View Details" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Navigate to View Service Request List screen
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "View Service Request List" link from the Submission Response Dialog
    Then The application must navigate to the "View Service Request List" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - Navigate to Raise another Service Request
    Given An authorised user with permission
    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Order Statement Request" service request screen
    And The user selects 'BO-AWAITING-FULFILMENT' from Select Account Number Dropdown
    And I am entering below detail in "Order Statement Request" section
      | From Date  |  01/03/2019        |
      | To Date    |  08/03/2019        |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Statement Request submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "Raise another Service Request" link from the Submission Response Dialog
    Then The application must navigate to the "Service Request Selection" screen
#-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DTFAU-9
  Scenario: Order Statement Request - View Details
    Given An authorised user with permission

    * For Acceptance Criteria "@DTFAU-9"
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    And The user input "Request Type" with 'Statement Request (AU)' in Advance Search Panel
    And The user input "Request Status" with 'Awaiting Fulfilment' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen

    When The user click the 'first' record on a service request in the list screen
    Then The application must present the required Actions buttons
    And The application must present the Summary information sub-section
    And The application must present the selected "Statement Request" service request in non editable mode as per the field matrix
    And The application must present the 'Previous' button as disabled

    When The user selects to progress to the "Next Record"
    Then The application must present the selected "Statement Request (AU)" service request in non editable mode as per the field matrix

    * For Acceptance Criteria ""@DTFAU-9"
    When The user selects to progress to the "Previous Record"
    Then The application must present the selected "Statement Request (AU)" service request in non editable mode as per the field matrix

    * For Acceptance Criteria "@DTFAU-9"
    When The user Clicks the "Close" button
    Then The application must navigate the user to the Service Request List screen and previous search must be presented

    * For Acceptance Criteria "@DTFAU-9"
    When The user click the 'last' record on a service request in the list screen
    Then The application must present the selected "Statement Request (AU)" service request in non editable mode as per the field matrix
    And The application must present the 'Next' button as disabled

    When The user Clicks the "Close" button
    And The user navigated to the "Cash Management Service Requests" screen
    And The user reset previous filters
    And The user input "Request Type" with 'Statement Request (AU)' in Advance Search Panel
    And The user input "Request Status" with 'Pending' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user click on service request grid first row
    Then The application must present the 'Errors and Alerts' subsection as per business rule

    When The user Clicks the "Close" button
    And The user navigated to the "Cash Management Service Requests" screen
    And The user reset previous filters
    And The user input "Request Type" with 'Statement Request (AU)' in Advance Search Panel
    And The user input "Request Status" with 'Unsuccessful' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user click on service request grid first row
    Then The application must present the 'Errors and Alerts' subsection as per business rule


#-----------------------------------------------------------------------------------------------------------------------



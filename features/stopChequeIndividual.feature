@ui-mock @api-mock @stop-cheque-individual @Regression @webform
Feature: Stop Individual Cheque -  Single & Multiple
  User should able to Request Stop Individual Cheque
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing
  Scenario: Stop Individual Cheque - Single / Multiple - Enter Details
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
    #Then The user select "SCR-IND-MULTI-SUCCESS" from "AccountDropDown"
     When The user types Account Name "SCR-IND-MULTI-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application must display option to choose Types of Request & enter Cheque Details
    And The application must display option to stop "Individual Cheque(s)" or "Cheque Book" & "Individual Cheque(s)" must be pre-selected by default
    And The application shows the "Individual Cheque(s)" section fields
    When The user clicks on the lookup button for "Operating Accounts"
    And I am selecting an eligible account from Search Account Lookup Dialog
    Then The application shows the "Individual Cheque(s)" section fields
    And The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @test1234
  Scenario: Stop Individual Cheque - Single / Multiple - Field Validation
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
   # Then The user select "SCR-IND-MULTI-SUCCESS" from "AccountDropDown"
    When The user types Account Name "SCR-IND-MULTI-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And The user Clicks the "Review & Submit" button
    Then The application should display the "chqNum1-error messages" in the "Stop Cheque Book Creation Page"
      | chqNum1-error | Cheque number is mandatory |
    Then The application should display the "chqAmt1-error messages" in the "Stop Cheque Book Creation Page"
      | chqAmt1-error | Value is mandatory|
    Then The application should display the "issuedate-error messages" in the "Stop Cheque Book Creation Page"
      | issuedate-error | Issue Date is mandatory |
    When I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum   | chqAmt     | chqIssDt   | payeeName | note  |
      | 12345643 | 9999999999 | 01/01/2100 | Abc firm  | Notes |
      When The user Clicks the "Add" button "Twice" in Cheque Details section
    Then The application shows 3 Rows in Cheque Details
    When The user Clicks the "Add" button "7 Times" in Cheque Details section
    Then The application should disable Add Button
    And The application shows 10 Rows in Cheque Details
    When The user click on the "Select All" checkbox
    And The user Clicks the "Remove" button "Once" in Cheque Details section
    And The user Clicks the "Review & Submit" button
    Then The application should display the "chqNum1-error messages" in the "Stop Cheque Book Creation Page"
      | chqNum1-error | Cheque number is mandatory |
    Then The application should display the "chqAmt1-error messages" in the "Stop Cheque Book Creation Page"
      | chqAmt1-error | Value is mandatory|
    Then The application should display the "issuedate-error messages" in the "Stop Cheque Book Creation Page"
      | issuedate-error | Issue Date is mandatory |
    When The user Clicks the "Add" button "Twice" in Cheque Details section
    And The user Clicks the "Review & Submit" button
    Then The application should display the "chqNum1-error messages" in the "Stop Cheque Book Creation Page"
      | chqNum1-error | Cheque number is mandatory |
    Then The application should display the "chqAmt1-error messages" in the "Stop Cheque Book Creation Page"
      | chqAmt1-error | Value is mandatory|
    Then The application should display the "issuedate-error messages" in the "Stop Cheque Book Creation Page"
      | issuedate-error | Issue Date is mandatory |
      When I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum  | chqAmt        | chqIssDt   | payeeName | note |
      | 123456  | 999999999 | 01/01/2100 | John      | §§§  |
      | 5423233 | 999999999 | 01/01/2100 | Peter     | §§§  |
    And The user Clicks the "Review & Submit" button
  #-----------------------------------------------------------------------------------------------------------------------
  Scenario: Stop Individual Cheque - Single - Successful Request
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
   # Then The user select "SCR-IND-SUCCESS" from "AccountDropDown"
    # And The user selects 'SCR-IND-SUCCESS' from Select Account Number Dropdown
     When The user types Account Name "SCR-IND-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum | chqAmt   | chqIssDt | payeeName     | note         |
      | 123456 | 1,000.00 |          | Testing Payee | Testing Note |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Stop Individual Cheque submission Review Page
    When The user Clicks the "Previous" button
    Then The application shows previously entered details
    When The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Successful"
  #-----------------------------------------------------------------------------------------------------------------------
  Scenario: Stop Individual Cheque - Single - Pending Request
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
    # And The user selects 'SCR-IND-PENDING' from Select Account Number Dropdown
   # Then The user select "SCR-IND-PENDING" from "AccountDropDown"
    When The user types Account Name "SCR-IND-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum | chqAmt   | chqIssDt | payeeName     | note         |
      | 123457 | 1,000.00 |          | Testing Payee | Testing Note |
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Pending"
  #-----------------------------------------------------------------------------------------------------------------------
  Scenario: Stop Individual Cheque - Single - UnSuccessful Request
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
  #  Then The user select "SCR-IND-UNSUCCESSFUL" from "AccountDropDown"
    # And The user selects 'SCR-IND-UNSUCCESSFUL' from Select Account Number Dropdown
     When The user types Account Name "SCR-IND-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum | chqAmt   | chqIssDt | payeeName     | note         |
      | 123458 | 1,000.00 |          | Testing Payee | Testing Note |
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Unsuccessful"
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-464
  Scenario: Stop Individual Cheque - Multiple - Successful Request
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-464-03"
    When The user navigated to the "Stop Cheque" service request screen
    #Then The user select "SCR-IND-MULTI-SUCCESS" from "AccountDropDown"
    #And The user selects 'SCR-IND-MULTI-SUCCESS' from Select Account Number Dropdown
     When The user types Account Name "SCR-IND-MULTI-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting "Individual Cheque(s)" as Request Type
    And The user Clicks the "Add" button "Once" in Cheque Details section
    And I am entering inputs into "Cheque Number", "Value", "Issue Date", "Payee Name" & "Note" in Cheque Detail
      | chqNum | chqAmt   | chqIssDt | payeeName      | note          |
      | 123456 | 1,000.00 |          | Testing Payee1 | Testing Note1 |
      | 456789 | 2,000.00 |          | Testing Payee2 | Testing Note2 |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Stop Individual Cheque submission Review Page
    When The user Clicks the "Previous" button
    Then The application shows previously entered details
    When The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog
    When The user click on the "View Request Details" link from the Submission Response Dialog
    Then The application should show list screen with filtered result
  #-----------------------------------------------------------------------------------------------------------------------
  @DIGS-368
  Scenario: Stop Individual Cheque - View
    Given An authorised user with permission
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    And The user input "Request Type" with 'Stop Cheque' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
    #Then The application must present the selected "Stop Cheque" service request in non editable mode as per the field matrix
    And The application must present the required Actions buttons
    And The application must present the Summary information sub-section
    When The user click on the "View Audit History" button
    Then The application should display the "Audit History Pop-up details" for "SR"
      | SR_Audit_History_header | Service Request Audit History |
    When The user selects to close the audit popup
    Then The application must close the audit popup and return the user to the Service Request view detail screen
     When The user Clicks the "Close" button
    Then The application must navigate the user to the Service Request List screen and previous search must be presented

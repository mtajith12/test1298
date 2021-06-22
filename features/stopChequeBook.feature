@ui-mock @api-mock @stop-cheque-book @Regression @webform
Feature: Stop Cheque Book
  User should able to Request Stop Cheque Book
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing
  Scenario: Stop Cheque Book - Enter Details
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
        When The user types Account Name "SCR-IND-MULTI-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #Then The user select "SCR-IND-MULTI-SUCCESS" from "AccountDropDown"
    Then The application must display option to choose Types of Request & enter Cheque Details

    * For Acceptance Criteria "DIGS-634-1, DIGS-634-2"
    And The application must present Cheque Details table with label as "Cheque Details" and the message "Max 10 per request" below
    And Cheque Details has Add and Remove buttons
    When The user Clicks the "Add" button
    Then A new row is added to the Cheque Details table
    When The user selects all rows from the Cheque Details table
    And The user Clicks the "Remove" button

    * For Acceptance Criteria "DIGS-419-1, DIGS-419-2"
    Then The Cheque Details Table must be updated with a blank row


    When I am selecting "Cheque Book" as Request Type
    Then The application shows the "Cheque Book" section fields
    When The user clicks on the lookup button for "Operating Accounts"
    And I am selecting an eligible account from Search Account Lookup Dialog
    Then The application shows the "Cheque Book" section fields
    When The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen
    
@scb-UI-check
    Scenario: Stop Cheque Book - Field Validation
      Given An authorised user with permission
      When The user navigated to the "Stop Cheque" service request screen
      #Then The user select "SCR-IND-MULTI-SUCCESS" from "AccountDropDown"
         When The user types Account Name "SCR-IND-MULTI-SUCCESS" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
      And I am selecting "Cheque Book" as Request Type
      And The user Clicks the "Review & Submit" button
      Then The application should display the "chqBookSize-error messages" in the "Stop Cheque Book Creation Page"
        | chqBookSize-error | Cheque Book Size is mandatory |
      Then The application should display the "Serial-error messages" in the "Order Cheque Book Creation Page"
        | Serial-error | First Serial Number is mandatory |
      When I am entering value "4333" in "First Serial Number"
      And The user Clicks the "Review & Submit" button
      * For Acceptance Criteria "DIGS-617-1"
      When I am selecting "26" from "First Serial Number" select dropdown
      And I am entering value "2333" in "First Serial Number"
      And The user Clicks the "Review & Submit" button


  Scenario: Cheque Book - Successful Presented Cheques
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
       When The user types Account Name "SCR-RANGE-SUCCESS-PRESENTED-CHEQ" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
   # Then The user select "SCR-RANGE-SUCCESS-PRESENTED-CHEQ" from "AccountDropDown"
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Successful"

  Scenario: Cheque Book - Successful No Cheques Found
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
         When The user types Account Name "SCR-RANGE-SUCCESS-NO-CHEQ-FOUND" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #Then The user select "SCR-RANGE-SUCCESS-NO-CHEQ-FOUND" from "AccountDropDown"
    #And The user selects 'SCR-RANGE-SUCCESS-NO-CHEQ-FOUND' from Select Account Number Dropdown
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Successful"


  Scenario: Cheque Book - Success Report failed to load. Attempting to populate.
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
    When The user types Account Name "SCR-RANGE-SUCC-RPTFAIL-ATMPT-POP" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
   # Then The user select "SCR-RANGE-SUCC-RPTFAIL-ATMPT-POP" from "AccountDropDown"
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Successful"


  Scenario: Cheque Book - Success Report failed to load. Please review your account activity in Reporting for honoured cheques.
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
        When The user types Account Name "SCR-RANGE-SUCC-RPTFAIL-REV-AC-ACT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #Then The user select "SCR-RANGE-SUCC-RPTFAIL-REV-AC-ACT" from "AccountDropDown"
    # And The user selects 'SCR-RANGE-SUCC-RPTFAIL-REV-AC-ACT' from Select Account Number Dropdown
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Successful"


  Scenario: Cheque Book - Unsuccessful
    Given An authorised user with permission
    When The user navigated to the "Stop Cheque" service request screen
    When The user types Account Name "SCR-RANGE-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #Then The user select "SCR-RANGE-UNSUCCESSFUL" from "AccountDropDown"
    #And The user selects 'SCR-RANGE-UNSUCCESSFUL' from Select Account Number Dropdown
    And I am selecting "Cheque Book" as Request Type
    And I am selecting "100" in "Cheque Book Size"
    And I am entering value "01" in "First Serial Number"
    And I am selecting "01" from "First Serial Number" select dropdown
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Unsuccessful"

  @DIGS-206
  Scenario: Stop Cheque Book - View
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-206-01, DIGS-206-02, DIGS-206-10, DIGS-469"
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    And The user input "Request Type" with 'Stop Cheque' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen
    When The user perform simple click on a service request in the list screen
   # Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
    And The application must present the required Actions buttons
    And The application must present the Summary information sub-section
    When The user selects to 'View Audit History' for the service request
    Then The application should display the "Audit History Pop-up details" for "SR"
      | SR_Audit_History_header | Service Request Audit History |
    When The user selects to close the audit popup
    Then The application must close the audit popup and return the user to the Service Request view detail screen
    When The user Clicks the "Close" button
    Then The application must navigate to the "View Service Request List" screen

#     When The user input "Account Name" with 'SCR-RANGE-SUCCESS-PRESENTED-CHEQ' in Advance Search Panel
#     And The user Clicks the "Search" button in Advance Search Panel
#     Then The application must display the service request list screen
#     When The user perform simple click on a service request in the list screen
#     Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
#     And The application must present the Summary information sub-section
#     And The application present "Rejected Cheques" in Itemised Report
#     When The user Clicks the "Close" button
#     Then The application must navigate to the "View Service Request List" screen

#     When The user selects to 'Reset' the advanced search criteria
#     And The user input "Account Name" with 'SCR-RANGE-SUCCESS-NO-CHEQ-FOUND' in Advance Search Panel
#     And The user Clicks the "Search" button in Advance Search Panel
#     Then The application must display the service request list screen
#     When The user perform simple click on a service request in the list screen
#     Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
#     And The application must present the Summary information sub-section
#     Then The application present "no Rejected Cheques" in Itemised Report
#     When The user Clicks the "Close" button
#     Then The application must navigate to the "View Service Request List" screen

#     When The user selects to 'Reset' the advanced search criteria
#     And The user input "Account Name" with 'SCR-RANGE-SUCC-RPTFAIL-ATMPT-POP' in Advance Search Panel
#     And The user Clicks the "Search" button in Advance Search Panel
#     Then The application must display the service request list screen
#     When The user perform simple click on a service request in the list screen
#     Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
#     And The application must present the Summary information sub-section
#     Then The application present "Report failed to load. Attempting to populate" in Itemised Report
#     When The user Clicks the "Close" button
#     Then The application must navigate to the "View Service Request List" screen

#     When The user selects to 'Reset' the advanced search criteria
#     And The user input "Account Name" with 'SCR-RANGE-SUCC-RPTFAIL-REV-AC-ACT' in Advance Search Panel
#     And The user Clicks the "Search" button in Advance Search Panel
#     Then The application must display the service request list screen
#     When The user perform simple click on a service request in the list screen
#     Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
#     And The application must present the Summary information sub-section
#     Then The application present "Report failed to load. Please review your account activity in Reporting for honoured cheques." in Itemised Report
#     When The user Clicks the "Close" button
#     Then The application must navigate to the "View Service Request List" screen

#     When The user selects to 'Reset' the advanced search criteria
#     And The user input "Account Name" with 'SCR-RANGE-UNSUCCESSFUL' in Advance Search Panel
#     And The user Clicks the "Search" button in Advance Search Panel
#     Then The application must display the service request list screen
#     When The user perform simple click on a service request in the list screen
#     Then The application must present the selected "Stop Cheque (AU)" service request in non editable mode as per the field matrix
#     And The application must present the Summary information sub-section
#     Then The application must present 'Unsuccessful' Request with 'Errors and Alerts' subsection on the View Details screen
#     When The user Clicks the "Close" button
#     Then The application must navigate to the "View Service Request List" screen
# #-----------------------------------------------------------------------------------------------------------------------

@ui-mock @api-mock @service-request @Regression
Feature: Service Request
  User should able to initiate new Service Request
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing
  Scenario: DTFAU-215 - Request Types options for user with DSS Release 2 and DSS Release 1 permission
    Given An authorised user with permission
    When The user navigated to the Create Service Request screen
    Then The application shows Service Request Types


    When The user Clicks the "Add User to Digital Channel" link from Create Service Request screen
    Then The application should display the "Add_user_Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Add Signatory" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen



    When The user Clicks the "Amend Signatory or Legal Name" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Delete Signatory" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Digital Channel Details" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Close Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Billing Details" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend User of Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Delete User from Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Add Account to Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Account on Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Delete Account from Digital Channel" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Open Account" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
      When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Close Account" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Statement Address" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Legal Entity Name" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Legal Entity Administrator/Liquidator/Receiver" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Amend Group Mandate" link from Create Service Request screen
    Then The application should display the "Title" Service Request screen
    When The user Clicks the "Cancel" button
      When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


   



    When The user Clicks the "Investigate Direct Debit Transaction" link from Create Service Request screen
    Then The application should display the "DDR_Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Stop Cheque" link from Create Service Request screen
    Then The application should display the "Stop a Cheque" Service Request screen
    When The user Clicks the "Cancel" button
    Then The application shows "Create Service Request" screen


    When The user Clicks the "Order Deposit Book" link from Create Service Request screen
    Then The application should display the "Order a Deposit Book" Service Request screen
    When The user Clicks the "Cancel" button
   Then The application shows "Create Service Request" screen


    When The user Clicks the "Order Cheque Book" link from Create Service Request screen
    Then The application should display the "Order a Cheque Book" Service Request screen
    When The user Clicks the "Cancel" button
   Then The application shows "Create Service Request" screen

    When The user Clicks the "Trace a Transaction" link from Create Service Request screen
    Then The application should display the "TraceTransaction_Title" Service Request screen
    When The user Clicks the "Cancel" button
    When The user Clicks the "Yes" button
    Then The application shows "Create Service Request" screen

#-----------------------------------------------------------------------------------------------------------------------


@ui-mock @api-mock @viewTransaction @Regression @webform
Feature: View Transaction Details
  User should able to initiate new View Transaction Details from your nominated accounts
  #-----------------------------------------------------------------------------------------------------------------------
  @smoke-testing @api-mock @ui-mock @viewT
  Scenario: View Transaction Details -view
    Given I am an authorised user with permission to create a "View Transaction Details" service request
    When The user navigate to the "View Transaction Details" service request screen
    Then The application should display the "Service Request Header" for "View Transaction Details"
      | TraceTransaction_Title       | View Transaction Details (AU)                                                            |
      | TraceTransaction_Description | View additional remitter details relating to your Direct Entry credit transactions. |
    Then The application shows the "cancel" button
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid
    #When The user double click on "Transaction_Results_Row1" from search result Grid


  #--------------------------------------------------------------------------------------------------------------------------------



  Scenario: View Transaction Details - Cancel Service Request Cancel Service Request-After trsactions selected
    Given I am an authorised user with permission to create a "View Transaction Details" service request
    When The user navigate to the "View Transaction Details" service request screen
    Then The application should display the "Service Request Header" for "View Transaction Details"
      | TraceTransaction_Title       | View Transaction Details (AU)                                                            |
      | TraceTransaction_Description | View additional remitter details relating to your Direct Entry credit transactions. |
    Then The application shows the "cancel" button
    Then The application should display the "SelectAccountHeader" for "TraceTransaction Service Request" text
      | SelectAccountHeader | Select Account |
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application should display the "SearchforTransactionL" for "TraceTransaction Service Request" text
      | SearchforTransactionL | Search for Transaction |
    Then The application should display the "Search for Transaction component" for "TraceTransaction Service Request"
      | amount   | Amount    |
      | postDate | Post Date |
      | Reset    | Reset     |
      | Search   | Search    |
    Then The user enters value in the search criteria fields
      | amount   |               |
      | PostDate | March 9, 2020 |
    When The user select a "Transaction_Results_Row1" by clicking on the search result Grid



  #  @asw
  # Scenario:ASW intigration
  #   Given I am an authorised user with permission to create an "Add User to Digital Channel" service request
  #   When The user navigate to the "Add User to Digital Channel" service request screen
  #   Then The application should display the "service request Header details" for "Add User to Digital Channel"
  #     | Title       | Add User to Digital Channel (AU)                                                                                |
  #     | Description | Add users to your digital channels with the option of nominating authorised persons to sign documentation. |
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
  #   Given I am logging in to ASW to update the status of service request
  #   When The user enter 'responseId' into the ASW SearchBox




@order-deposit-book @Regression @webform
Feature: Order Deposit Book
  User should able to initiate new Order Deposit Book Request
  #-----------------------------------------------------------------------------------------------------------------------
  # @ui-mock @api-mock @DIGS-248 @DIGS-251
  # Scenario: Order Deposit Book - Enter Account Details
  #   Given An authorised user with permission
  #   * For Acceptance Criteria "DIGS-248-1"
  #   When The user navigated to the "Order Deposit Book" service request screen
  #   When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
  #   Then The "Operating Account" must be populated with the "BO-AWAITING-FULFILMENT" account

  #   * For Acceptance Criteria "DIGS-251-2"
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-AWAITING-FULFILMENT" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName | BO-AWAITING-FULFILMENT |
  #     | AccountNo   | 010201 - 123456201     |

  # #-----------------------------------------------------------------------------------------------------------------------
  # @ui-mock @api-mock @DIGS-253 @DIGS-254
  # Scenario: Order Deposit Book - Book Type - Standard
  #   Given An authorised user with permission

  #   * For Acceptance Criteria "DIGS-253-1"
  #   When The user navigated to the "Order Deposit Book" service request screen
  #   When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
  #   Then The application shows the "Book Type" section

  #   * For Acceptance Criteria "DIGS-253-2, DIGS-253-3, DIGS-253-4"
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-AWAITING-FULFILMENT" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName | BO-AWAITING-FULFILMENT |
  #     | AccountNo   | 010201 - 123456201     |
  #   Then application must default the value in the 'Book Type' drop down as BLANK
  #   And The application populate "Book Type" subsection values as per selected account sub-product
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-AGENT-AWAITING-FULFILMENT" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName | BO-AGENT-AWAITING-FULFILMENT |
  #     | AccountNo   | 010207 - 123456207           |
  #   Then The application populate "Book Type" subsection values as per selected account sub-product
  #   When The user selects the 'Book Type' as "Agent"
  #   Then application must populate "Agent" subsection
  #   When The user Clicks the "accountSearch" button
  #   When The user types in "BO-AWAITING-FULFILMENT" into the Search "Account" lookup
  #   Then The user waiting to load "Account details section"
  #   Then The application should display the "Account details" for "Claim Missing Deposit in enter details page"
  #     | AccountName | BO-AWAITING-FULFILMENT |
  #     | AccountNo   | 010201 - 123456201     |
  #   Then application must default the value in the 'Book Type' drop down to BLANK as earlier selected 'Agent' book type is not applicable to CAP account

  #   * For Acceptance Criteria "DIGS-254-1, DIGS-254-3, DIGS-254-4, DIGS-254-6"
  #   When The user selects the 'Book Type' as "Standard"
  #   Then The application must present the 'Standard Book' and 'Personalisation' sections as per the field matrix
  #   And The application must populate the book size as per selected account sub-product
  #   And The application must populate the number of books with values from 1 to 10
  #   And The application must populate the personalisation fields with the account legal name as per business rule and populated fields are not editable
  #   And The user enters "Lorem ipsum dolor sit amet nullam sodales" which is more than 40 characters into line2
  #   Then The application accepts first 40 characters of given input
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-255
  Scenario: Order Deposit Book - Delivery address
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-255-1"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    Then The application present the "Delivery Details" section as per the field matrix

    * For Acceptance Criteria "DIGS-255-2"
    And The application must restrict the fields as per the Data Dictionary for "DepositBook" request

    * For Acceptance Criteria "DIGS-255-3"
    And The application must populate the 'Company' field with the account legal name
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-273
  Scenario: Order Deposit Book - Cancel Button
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-273-1" , "DIGS-273-3"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Attention |
    And The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen

  Scenario: Order Deposit Book - Cancel Button
    * For Acceptance Criteria "DIGS-273-2 , DIGS-273-4"
    Given An authorised user with permission
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Attention |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Cancel" button
    Then The application must navigate to the "Cash Management Service Request" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-275
  Scenario: Order Deposit Book - Previous Button
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-275-1 , DIGS-275-2"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-UNSUCCESSFUL" from "AccountDropDown"
    When The user types Account Name "BO-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1                                      |
      | Book Size    | 50                                     |
      | Line2        | adipiscing elit, sed do eiusmod tempor |
      | Line3        | incididunt ut labore et dolore magna   |
      | Line4        | aliqua. Ut enim ad minim veniam, quis  |
      | Attention To | Attention                              |
      | Company Name | Company                                |
    Then The user select "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Previous" button
    Then The application shows previously entered details
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @delivery-details-section
  Scenario: Order Deposit Book - Delivery Address, Select Postage Method and Billing Division
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-262-1"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-PENDING" from "AccountDropDown"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    Then The application present the "Delivery Details" section as per the field matrix

    * For Acceptance Criteria "DIGS-262-2, DIGS-262-3, DIGS-262-6"
    When The Delivery Location by default selected is "Business"
    And The application shows selected address in "Delivery Address"
    When User tries to select from the "Delivery Address" drop down
    * For Acceptance Criteria "DIGS-543-4"
    Then The application must populate the registered channel addresses shown in the Delivery Address drop down

    * For Acceptance Criteria "DIGS-262-4, DIGS-262-5, DIGS-262-8"
    * For Acceptance Criteria "The account statement mailing address has a country code of AU"
    #When The user select "BO-PENDING" from "AccountDropDown"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The default mailing address is populated as "Level 12, 530 Collins Street, Melbourne Victoria 3000 (Statement Address)" in the Delivery Address drop down
    * For Acceptance Criteria "The account statement mailing address has a country code of Not AU"
    # # When The user select "BO-AGENT-AWAITING-FULFILMENT" from "AccountDropDown"
    # # * For Acceptance Criteria "DIGS-543-1, DIGS-543-2"
    # # Then The default mailing address is populated as "No Australian Address recorded (Statement Address)" in the Delivery Address drop down
    # #   When The user select "BO-PENDING" from "AccountDropDown"
    # # When The user selects an account "BO-UNSUCCESSFUL" from Select Account Number Dropdown which have 'no business address'
    # # Then The Delivery Address drop down is populated as "No Australian Address recorded (Statement Address)"

    # * For Acceptance Criteria "DIGS-262-7"
    # When I am selecting "ANZ Branch" from "Select Delivery Location" Radio options in DepositBook
    # And I am selecting "Business" from "Select Delivery Location" Radio options in DepositBook
    # Then The application shows previously entered details

    # * For Acceptance Criteria "DIGS-267-1, DIGS-267-2, DIGS-267-3"
    #   When The user select "BO-PENDING" from "AccountDropDown"
    #   When The user selecting the account "BO-PENDING" under multiple divisions from Select Account Number Dropdown
    # Then The application present the "Postage Method" section as per the field matrix
    # And The application must show postage method options as per business rules
    # And The application shows tool tip on hover on icon of 'Select Postage Method'

    # * For Acceptance Criteria "DIGS-521-1, DIGS-521-2, DIGS-521-4, DIGS-267-4"
    #When The user select "BO-PENDING" from "AccountDropDown"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And I am selecting Postage Method as "Express Post"
    Then The application show Billing Division Selection in 'Order Deposit Book' page
    And The Billing Division value defaulted to Blank
    And The application populates all of the divisions under which I am entitled to the legal entity of the account
    And The application shows tool tip on hover on icon of 'Billing Division'
    # DIGS-746 Start
    # When I am selecting Postage Method as "Courier"
    # Then The application must display the warning message under Postage Method as per business rules
    # And The application show Billing Division Selection
    # And The Billing Division value defaulted to Blank
    # And The application populates all of the divisions under which I am entitled to the legal entity of the account
    # And The application shows tool tip on hover on icon of 'Billing Division'
    # DIGS-746 End
    * For Acceptance Criteria "DIGS-521-3"
    # When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The application hide Billing Division Selection
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @DIGS-535
  Scenario: Order Deposit Book - API Validation Error
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-2"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1              |
      | Book Size    | 50             |
      | Attention To | API Error Test |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application shows error message in toast for "API Validation Error"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - On Review & Submit
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-1"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1                                      |
      | Book Size    | 50                                     |
      | Line2        | adipiscing elit, sed do eiusmod tempor |
      | Line3        | incididunt ut labore et dolore magna   |
      | Line4        | aliqua. Ut enim ad minim veniam, quis  |
      | Attention To | Attention                              |
      | Company Name | Company                                |
    Then The user select the "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - Pending Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-3"
    When The user navigated to the "Order Deposit Book" service request screen
    # When The user select "BO-PENDING" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"

    * For Acceptance Criteria "DIGS-535-9"
    When The user clicks on "OK" button of the Submission Response Dialog
    Then The application must navigate to the "View Service Request List" screen

  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - Awaiting Fulfilment Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-4"
    When The user navigated to the "Order Deposit Book" service request screen
    # When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1                 |
      | Book Size    | 50                |
      | Attention To | Attention To Test |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock124
  Scenario: Order Deposit Book - BookType - Agent - Awaiting Fulfilment Status
    Given An authorised user with permission
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AGENT-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AGENT-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Agent"
    And The user enters below details in Order Deposit Book Agent section
      | Book Size                 | 50            |
      | Attention To              | Test text     |
      | Agent Number              | 0010001       |
      | Line 3                    | Description 1 |
      | Line 4                    | Description 2 |
      | Number of Books per Agent | 1             |
    Then The user select "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
  #-----------------------------------------------------------------------------------------------------------------------
  # Please do not delete, it is for bankAtPost related stories
  @ui-mock @api-mock
  Scenario: Order Deposit Book - BookType - Bank@Post Agent - Awaiting Fulfilment Status
    Given An authorised user with permission
    When The user navigated to the "Order Deposit Book" service request screen
    #And The user select "BO-BANK-POST-AGENT-AWAITING-FULFIL" from "AccountDropDown"
    When The user types Account Name "BO-BANK-POST-AGENT-AWAITING-FULFIL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Agent"
    And The user enters below details in Order Deposit Book Agent section
      | Book Size                 | 50            |
      | Attention To              | Test text     |
      | Agent Number              | 0010001       |
      | Line 3                    | Description 1 |
      | Line 4                    | Description 2 |
      | Number of Books per Agent | 1             |
    And The user Clicks the "Review & Submit" button
    And The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535 @api-mock124
  Scenario: Order Deposit Book - Unsuccessful Fulfilment Status
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-5"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-UNSUCCESSFUL" from "AccountDropDown"
    When The user types Account Name "BO-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1                 |
      | Book Size    | 50                |
      | Attention To | Attention To Test |
    Then The user select "2/530 Dickson Street Street2, Campbelltown ACT 3000" from "deliveryAddressField-Input" drop down
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Unsuccessful"
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - Navigate to Service Request View details
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-6"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "View Request Details" link from the Submission Response Dialog
    Then The application must navigate to the "Service Request View Details" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - Navigate to View Service Request List screen
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-7"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "View Service Request List" link from the Submission Response Dialog
    Then The application must navigate to the "View Service Request List" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-535
  Scenario: Order Deposit Book - Navigate to Raise another Service Request
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-535-8"
    When The user navigated to the "Order Deposit Book" service request screen
    # When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    And The user Clicks the "Review & Submit" button
    Then The application accepts input and move to Order Deposit Book submission Review Page
    When The user Clicks the "Submit" button
    Then The application will display the Submit Response Dialog with status "Awaiting Fulfilment"
    When The user click on the "Raise another Service Request" link from the Submission Response Dialog
    Then The application must navigate to the "Service Request Selection" screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-263
  Scenario: Order Deposit Book - Branch lookup
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-263-1, DIGS-263-2, DIGS-263-3, DIGS-263-4, DIGS-263-5"
    When The user navigated to the "Order Deposit Book" service request screen
    # When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am selecting "ANZ Branch" from "Select Delivery Location" Radio options
    Then The application must display the field 'Branch Address' search option as per the Field Matrix
    And The application must hide the 'Postage Method' section
    When The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    Then The application must display the 'Search Branch Lookup' modal window
    And The application must display the Lookup window elements as per the field matrix
    And The search results grid must be blank

    * For Acceptance Criteria "DIGS-263-6, DIGS-263-7, DIGS-263-8"
    When I am entering "vic" in "Search Branch Lookup" Dialog
    Then The application show 5 results from Address Lookup in "Search Branch Lookup" Dialog
    When I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog
    Then The application shows address list in the Grid
    When I am selecting first address from "Search Branch Lookup" Grid
    Then The application must show selected address in "Branch Address" for "DepositBook"

    * For Acceptance Criteria "DIGS-263-12"
    When The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And I am entering "vic" in "Search Branch Lookup" Dialog
    And The user clicks the 'X' icon
    Then The application must show selected address in "Branch Address" for "DepositBook"

    # * For Acceptance Criteria "DIGS-263-13"
    # When The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    # When I am entering "x" in "Search Branch Lookup" Dialog
    # Then The application must display the 'No Matches Found' on address quick list

    * For Acceptance Criteria "DIGS-263-9"
    When The user Clicks the "Find a Branch Address" Button from "Branch Address" Field
    And The user clicks the 'X' icon
    Then "Search Branch Lookup" modal window must close
    And The application show the "Order Deposit Book" service request screen
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-264
  Scenario: Order Deposit Book - address lookup
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-264-1, DIGS-264-2, DIGS-264-3, DIGS-264-4, DIGS-264-7, DIGS-264-9"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog

    And The user selects the 'Book Type' as "Standard"
    And The user Clicks the "Add New Address" Button from "Delivery Address" Field

    When I am entering "vic" in "Add New Address" Dialog
    Then The application show 5 results from Address Lookup in "Add New Address" Dialog
    When I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
    #Then The application must show selected address in "Delivery Address" for "DepositBook"
    When The user Clicks the "Add New Address" Button from "Delivery Address" Field
    And I am entering "Albany" in "Add New Address" Dialog
    And I am selecting first address from quick list from Displayed in "Add New Address" Dialog
    Then The application displays selected address in "Add New Address" Lookup Field
    When The user Clicks the "OK" from "Add New Address" Dialog
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-462
  Scenario: Order Deposit Book - Field Validation
    Given An authorised user with permission
    * For Acceptance Criteria "DIGS-462-1"
    ## refer DIGS-254-2
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-AGENT-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    When The user Clicks the "Review & Submit" button
    Then The application should display the "depBookQuantity-error messages" in the "Order Deposit Book Creation Page"
      | depBookQuantity-error | Number of Books is mandatory |
    Then The application should display the "depBookSize-error messages" in the "Order Deposit Book Creation Page"
      | depBookSize-error | Book Size is mandatory |
    Then The application should display the "DepositBookMailingTitle1-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookMailingTitle1-error | Attention To is mandatory |
    Then The application should display the "DepositBookDeliveryAddress_wrapper-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookDeliveryAddress_wrapper-error | Enter a valid Australian delivery address |
    * For Acceptance Criteria "DIGS-462-2"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    When I am selecting "ANZ Branch" from "Select Delivery Location" Radio options
    And The user Clicks the "Review & Submit" button
    Then The application should display the "Error messages" in the "Order Deposit Book Creation Page"
      | branch-error | Select a valid branch for delivery |
    * For Acceptance Criteria "DIGS-462-3"
    When I am entering below detail in "Delivery Details" section
      | Attention To | abc^  |
      | Company Name | name^ |
    And The user Clicks the "Review & Submit" button
    Then The application shows "Validation Error" on "Attention To" and "Company Name" as per business rule
    Then The application should display the "DepositBookMailingTitle1-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookMailingTitle1-error | Enter valid Attention To |
    Then The application should display the "mailingTitle2-error messages" in the "Order Deposit Book Creation Page"
      | mailingTitle2-error | Enter valid Company Name |
    * For Acceptance Criteria "DIGS-462-5"
    #When The user select "BO-PENDING" from "AccountDropDown"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Standard"
    And I am entering below detail in "Order Deposit Book" section for "Standard" booktype
      | No of Books  | 1         |
      | Book Size    | 50        |
      | Attention To | Test text |
    When I am selecting "Business" from "Select Delivery Location" Radio options
    When The user select the "Express Post" from "postageMethod" drop down
    And The user Clicks the "Review & Submit" button
    #When The user selects a "delivery method" 'Express Post' which required additional Fee and no division option available
    Then The application should display the "DepositBookMailingTitle1-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookbillingDivId-error | Billing Division is mandatory |

  @ui-mock @api-mock @DIGS-439
  Scenario: Order Deposit Book - View Details
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-439-1 DIGS-439-6"
    When The user navigated to the "Cash Management Service Requests" screen
    And The user opens "Advance Search Panel"
    And The user input "Request Type" with 'Order Deposit Book' in Advance Search Panel
    And The user input "Request Status" with 'Awaiting Fulfilment' in Advance Search Panel
    And The user Clicks the "Search" button in Advance Search Panel
    Then The application must display the service request list screen

    When The user click the 'first' record on a service request in the list screen
    Then The application must present the required Actions buttons
    And The application must present the Summary information sub-section
    And The application must present the selected "Order Deposit Book" service request in non editable mode as per the field matrix

    When The user Clicks the "Close" button
    And The user navigated to the "Cash Management Service Requests" screen

  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-534
  Scenario: Order Deposit Book - BookType AGENT Validation
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-534-1, DIGS-534-6, DIGS-534-7"
    When The user navigated to the "Order Deposit Book" service request screen
    #When The user select "BO-UNSUCCESSFU" from "AccountDropDown"
    When The user types Account Name "BO-UNSUCCESSFUL" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Agent"
    And The user Clicks the "Review & Submit" button
    # Then The application shows "Validation Error" on "Agent Deposit Book Details" as per business rules
    # And The application shows "Validation Error" on "Agent descriptiron Line 3" as per business rules
    # And The application shows "Validation Error" on "Books per Agent" as per business rules
    Then The application should display the "depAgentBookSize-error messages" in the "Order Deposit Book Creation Page"
      | depAgentBookSize-error | Book Size is mandatory |
    Then The application should display the "agentNumber_0-error messages" in the "Order Deposit Book Creation Page"
      | agentNumber_0-error | Agent Number is mandatory |
    Then The application should display the "Error messages" in the "Order Deposit Book Creation Page"
      | personalizationLine3_0-error | Line 3 is mandatory |
    Then The application should display the "Error messages" in the "Order Deposit Book Creation Page"
      | quantity_0-error | Number of Books is mandatory |
    Then The application should display the "DepositBookMailingTitle1-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookMailingTitle1-error | Attention To is mandatory |
    Then The application should display the "DepositBookDeliveryAddress_wrapper-error messages" in the "Order Deposit Book Creation Page"
      | DepositBookDeliveryAddress_wrapper-error | Enter a valid Australian delivery address |
    * For Acceptance Criteria "DIGS-534-2"
    When I am selecting "ANZ Branch" from "Select Delivery Location" Radio options
    And The user Clicks the "Review & Submit" button
    Then The application should display the "Error messages" in the "Order Deposit Book Creation Page"
      | branch-error | Select a valid branch for delivery |
    * For Acceptance Criteria "DIGS-534-3"
    When I am selecting "Business" from "Select Delivery Location" Radio options
    And The user Clicks the "Review & Submit" button
    * For Acceptance Criteria "DIGS-534-4"
    When I am entering below detail in "Delivery Details" section
      | Attention To                        | abc^               |
      | Company Name                        | name^              |
      | Line 2                              | personalisation2^^ |
      | Agent descriptiron first row Line 3 | personalisation3^^ |
      | Agent descriptiron first row Line 4 | personalisation4^^ |
    And The user Clicks the "Review & Submit" button
    Then The application shows "Validation Error" on "Attention To" and "Company Name" as per business rule
    And The application shows "Validation Error" on "Personalization"  "Line2", "Line3" and "Line4" as per business rules
    * For Acceptance Criteria "DIGS-534-5"
    When The user selects a "delivery method" 'Express Post' which required additional Fee and no division option available
    Then The application shows "Validation Error" on "division" as per business rule
    * For Acceptance Criteria "DIGS-534-8"
    When The user clicks 'select all' checkbox from Agent details
    And The user clicks the 'Remove' button on 'Agent Details'
    And The user Clicks the "Review & Submit" button
    Then The application shows "Validation Error" on "Agent Details" as per business rule
  #-----------------------------------------------------------------------------------------------------------------------
  @ui-mock @api-mock @DIGS-257 @DIGS-260
  Scenario: Order Deposit Book - 'Agent' Book Type
    Given An authorised user with permission

    * For Acceptance Criteria "DIGS-257-1, DIGS-257-2, DIGS-257-3, DIGS-257-4"
    When The user navigated to the "Order Deposit Book" service request screen
    # When The user select "BO-AGENT-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AGENT-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    And The user selects the 'Book Type' as "Agent"
    Then The application must present the 'Deposit Book Details' specific to Agent Deposit Book and 'Delivery Details' Sections
    And The application must show the 'Book Size' drop down with values
    And The application must present the 'Personalisation' section with Line 1 and 2
    And The application must restrict the fields as per the Data Dictionary for "Agent" BookType
    And The application must show 'Agent Details' subsection with 1 row that can be entered by default

    * For Acceptance Criteria "DIGS-732-1, DIGS-732-2"
    And The Agent Details table has a label 'Agent Details' and a message 'Max 6 per request' below

    * For Acceptance Criteria "DIGS-257-5, DIGS-257-6, DIGS-257-7"
    And The 'Add' button is enabled till max allowed records are displayed
    And The 'Remove' button must be disabled by default
    When The user Clicks the "Add" button
    Then The application must display the second row for entering agent details

    * For Acceptance Criteria "DIGS-257-8"
    # When The user checks one or more Agent Details rows displayed
    When The user selects all rows from 'Agent Details'
    Then The 'Remove' button is enabled
    When The user Clicks the "Remove" button
    Then All selected Agent Details rows must be removed

    * For Acceptance Criteria "DIGS-419-3"
    And The Agent Details Table must be updated with a blank row

    When The user Clicks the "Add" button
    Then The application must show 'Agent Details' subsection with 1 row that can be entered by default
    And The Agent Details table has a label 'Agent Details' and a message 'Max 6 per request' below

    # Please do not delete, it is for bankAtPost related stories
    # * For Acceptance Criteria "DIGS-257-10, DIGS-257-11, DIGS-260-1"
    # When The user selects the 'Book Type' as "Bank@Post Agent"
    # Then The application must present the 'Deposit Book Details' specific to Agent Deposit Book and 'Delivery Details' Sections
    # And The application must show the 'Book Size' drop down with values
    # And The application must present the 'Personalisation' section with Line 1 and 2
    # And The application must show 'Agent Details' subsection with 1 row that can be entered by default
    # And The Agent Details table has a label 'Agent Details' and a message 'Max 6 per request' below
    # And The Application must show the Display Books per Agent values
    # And The application must present the 'Agent Number' field
    # When The user enters '1' in to the 'Agent Number' field
    # Then The application must provide Padded Agent Number as per business rules

    * For Acceptance Criteria "DIGS-257-9"
    When User enter value for multiple Agents as below
      | Agent Number              | 0000010001    |
      | Line 3                    | Description 1 |
      | Line 4                    | Description 2 |
      | Number of Books per Agent | 1             |
    # When The user select "BO-UNSUCCESSFUL" from "AccountDropDown"
    When The user types Account Name "BO-AGENT-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    #And The user selects 'BO-UNSUCCESSFUL' from Select Account Number Dropdown
    Then The Agent Deposit Book details must remain unchanged for the newly selected account
  #-----------------------------------------------------------------------------------------------------------------------
  # Please do not delete, it is for bankAtPost related stories
  # @ui-mock @api-mock @DIGS-259
  # Scenario: Order Deposit Book - 'Bank@Post Agent' Book Type
  #   Given An authorised user with permission

  #   * For Acceptance Criteria "DIGS-259-1"
  #   When The user navigated to the "Order Deposit Book" service request screen
  #   And The user selects 'BO-BANK-POST-AGENT-AWAITING-FULFIL' from Select Account Number Dropdown
  #   And The user selects the 'Book Type' as "Bank@Post Agent"
  #   Then The application must "present" the 'Bank@Post' disclaimer

  #   * For Acceptance Criteria "DIGS-259-2"
  #   When The user selects the 'Book Type' as "Agent"
  #   Then The application must "hide" the 'Bank@Post' disclaimer
  @ui-mock @api-mock @DIGS-575
  Scenario: Order Deposit Book - Show BIN
    Given An authorised user with permission
    When The user navigated to the "Order Deposit Book" service request screen
    # Then The user select "BO-AGENT-AWAITING-FULFILMENT" from "AccountDropDown"
    When The user types Account Name "BO-AGENT-AWAITING-FULFILMENT" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog

    * For Acceptance Criteria "DIGS-575-01"
    And The user selects the 'Book Type' as "Standard"
    Then The application must present BIN Type and BIN in next available empty personalisation line in personalisation section
    And The application must populate the personalisation fields with the account legal name as per business rule and populated fields are not editable

    * For Acceptance Criteria "DIGS-575-02"
    And The user selects the 'Book Type' as "Agent"
    Then The application must present BIN Type and BIN in next available empty personalisation line in personalisation section
    And The application must populate the personalisation fields with the account legal name as per business rule and populated fields are not editable
#-----------------------------------------------------------------------------------------------------------------------

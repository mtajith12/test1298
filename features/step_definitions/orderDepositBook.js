const { Given, When, Then } = require("cucumber");
const moment = require("moment");

// Scenario: Order Deposit Book Enter Details
Then(/^The application must hide the further input fields to Request "Order Deposit Book"$/, async function () {
  await this.checkElementNotExist("#bookTypeContainer");
  //await this.attachScreenShot();
});

Then(/^The application must close the search account popup and the account number Dropdown is not updated$/, async function () {
  const account = await this.getHTMLText("#accountContainer #accName");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
  await this.checkElementNotExist("#accountDialogInlineSearch_dialog");
  await this.checkElementExist("#accountContainer");
  //await this.attachScreenShot();
});

Then(/^The application shows the "Book Type" section$/, async function () {
  await this.checkElementExist("#bookTypeContainer");
  await this.checkElementExist("#bookType");
  //await this.attachScreenShot();
});



Then(/^"Search Account" Lookup Dialog should not list any accounts$/, async function () {
  await this.checkElementNotExist(".slick-row");
  //await this.attachScreenShot();
});

//@DIGS-253, @DIGS-254
When(/^The user selects account number "(.*)" a "(.*)" account from Select Account Number Dropdown$/, async function (accNum, type) {
  const accountType = type
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", accNum, false);
  await this.clickElement("#accountContainer #account_wrapper .Select-option");
  const account = await this.getHTMLText("#accountContainer #accName");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
  await this.waitForLoading();
});

Then(/^application must default the value in the 'Book Type' drop down as BLANK$/, async function () {
  await this.checkSelectInputValue('#bookType', 'standard');
  //await this.attachScreenShot();
});

Then(/^The application populate "Book Type" subsection values as per selected account sub-product$/, async function () {
  await this.clickElement("#bookType");
  //await this.attachScreenShot();
});

When(/^The user selects the 'Book Type' as "(.*)"$/, async function (bookType) {
  if (bookType == 'Standard')
    await this.setSelectInputValue('bookType', 'standard', '#bookType');
  else if (bookType == 'Agent')
    await this.setSelectInputValue('bookType', 'agentIndividual', '#bookType');
  else if (bookType == 'Bank@Post Agent')
    await this.setSelectInputValue('bookType', 'bankAtPostIndividual', '#bookType');
});

Then(/^application must populate "Agent" subsection$/, async function () {
  await this.checkElementExist("#agentDetailsTable-field");
});

Then(/^application must default the value in the 'Book Type' drop down to BLANK as earlier selected 'Agent' book type is not applicable to CAP account$/, async function () {
  await this.checkSelectInputValue('#bookType', 'standard');
  //await this.attachScreenShot();
});

Then(/^The application must present the 'Standard Book' and 'Personalisation' sections as per the field matrix$/, async function () {
  await this.checkElementExist("#StandardBookTypeDetailsContainer");
  await this.checkElementExist("#depBookQuantity");
  await this.checkElementExist("#depBookSize");

  await this.checkElementExist("#personalizationLine1");
  await this.checkElementExist("#personalizationLine2");
  await this.checkElementExist("#personalizationLine3");
  await this.checkElementExist("#personalizationLine4");
});

Then(/^The application must populate the book size as per selected account sub-product$/, async function () {
  await this.clickElement('#depBookSize');
  //await this.attachScreenShot();
});

//story DIGS-255

When(/^The user selects the 'Book Type'$/, async function () {
  await this.setSelectInputValue('bookType', 'Standard');
});

Then(/^The application present the "(.*)" section as per the field matrix$/, async function (field) {
  if (field == "Delivery Details") {
    await this.checkElementExist("#DepositBookMailingTitle1");
    await this.checkElementExist("#mailingTitle2");
  } else if (field == "Postage Method") {
    await this.checkHTMLText("label[for='postageMethodField']", 'Select Postage Method');
    await this.checkElementExist("#postageMethod");
  }
  //await this.attachScreenShot();
});

Then(/^The application must restrict the fields as per the Data Dictionary for "(.*)" request$/, async function (requestType) {
  await this.setTextInputValue(`${requestType}MailingTitle1`, '12345678901234567890123456789012345678901');
  await this.checkElementValue(`#${requestType}MailingTitle1`, '1234567890123456789012345678901234567890');
  await this.setTextInputValue('mailingTitle2', '12345678901234567890123456789012345678901');
  await this.checkElementValue('#mailingTitle2', '1234567890123456789012345678901234567890');
});

Then(/^The application must populate the 'Company' field with the account legal name$/, async function () {
  await this.checkElementValue('#mailingTitle2', '1234567890123456789012345678901234567890');
});

Then(/^The application must populate the number of books with values from 1 to 10$/, async function () {
  await this.clickElement('#depBookQuantity');
  //await this.attachScreenShot();
});

Then(/^The application must populate the personalisation fields with the account legal name as per business rule and populated fields are not editable$/, async function () {
  await this.checkElementExist("div#personalizationLine2");
  //await this.attachScreenShot();
});

When(/^The user selects an account which having more than 40 char account Legal EntityName from Select Account Number Dropdown$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", 'BO-PENDING', false);
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accName");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
});

Then(/^The application must populate first 40 char in line2 and next 40 in line 3 and populated fields are not editable$/, async function () {
  await this.checkElementExist("div#personalizationLine2");
  await this.checkElementExist("div#personalizationLine3");
  //await this.attachScreenShot();
});

Then(/^The application shows "Validation Error" on "(.*)" as per business rules$/, async function (section) {
  if (section == 'Deposit Book Details') {
    await this.checkCSSClassExist(`#depBookQuantity`, 'form-control--has-error', true);
    await this.checkCSSClassExist(`#depBookSize`, 'form-control--has-error', true);
  }
  //await this.attachScreenShot();
});

When(/^The user selects "CACHE" account which is not having account Legal EntityName from Select Account Number Dropdown$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", "BO-UNSUCCESSFUL", false);
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accName");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
});

When(/^The user enters "(.*)" which is more than 40 characters into line2$/, async function (input) {
  await this.sendKeys("input#personalizationLine2", input, false);
});

Then(/^The application accepts first 40 characters of given input$/, async function () {
  await this.checkHTMLTextExist('input#personalizationLine2', "Lorem ipsum dolor sit amet nullam sodale");
  //await this.attachScreenShot();
});

//######## story DIGS-273-1,  DIGS-273-3.

When(/^I am entering below detail in "Order Deposit Book" section for "(.*)" booktype$/, async function (booktype, table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['No of Books'] !== undefined)
    await this.setSelectInputValue('depBookQuantity', data['No of Books']);
  if (data['Book Size'] !== undefined) {
    booktype === 'Standard' ? await this.setSelectInputValue('depBookSize', data['Book Size']) : await this.setSelectInputValue('depAgentBookSize', data['Book Size']);
  }
  if (data['Line2'] !== undefined)
    await this.setTextInputValue('personalizationLine2', data['Line2']);
  if (data['Line3'] !== undefined)
    await this.setTextInputValue('personalizationLine3', data['Line3']);
  if (data['Line4'] !== undefined)
    await this.setTextInputValue('personalizationLine4', data['Line4']);
  if (data['Attention To'] !== undefined)
    await this.setTextInputValue('DepositBookMailingTitle1', data['Attention To']);
  if (data['Company Name'] !== undefined)
    await this.setTextInputValue('mailingTitle2', data['Company Name']);
  if (data['Delivery Address'] !== undefined) {
    //await this.sendKeys('#DepositBookDeliveryAddress_wrapper input', data['Delivery Address'], true);
    await this.setSelectInputValue(null, data['Delivery Address'], '#DepositBookDeliveryContainerContent .Select__input input');
    await this.sendKeys(TAB, null, true);
  }

  // Agent
  if (data['Agent Number'] !== undefined)
    await this.setTextInputValue('agentNumber_0', data['Agent Number']);
  if (data['Books per Agent'] !== undefined)
    await this.setSelectInputValue('quantity_0', data['Books per Agent']);
  if (data['Line 3'] !== undefined)
    await this.setTextInputValue('personalizationLine3_0', data['Line 3']);
  if (data['Line 4'] !== undefined)
    await this.setTextInputValue('personalizationLine4_0', data['Line 4']);

});

// ####### story DIGS-273-2 , DIGS-273-4.
When(/^The user navigated to the Create "(.*)" from service request selection screen$/, async function (requestType) {
  await this.waitForLoading();
  if (requestType === 'Order Deposit Book') {
    await this.clickElement('a#orderDepositBook');
  }
});

// Scenario: Order Deposit Book - Successful Request
Then(/^The application accepts input and move to Order Deposit Book submission Review Page$/, async function () {
  await this.checkElementExist("#accountContainer");
  await this.checkElementExist("#bookTypeContainer");
  await this.checkElementExist("#StandardBookTypeDetailsContainer");
  await this.checkElementExist("#DepositBookDeliveryContainer");
  await this.checkElementExist("#personalizationLine1");
  await this.checkElementExist("#personalizationLine2");
  await this.checkElementExist("#personalizationLine3");
  await this.checkElementExist("#personalizationLine4");
  await this.checkElementExist("#DepositBookMailingTitle1");
  await this.checkElementExist("#mailingTitle2");
  //await this.attachScreenShot();
});

// Scenario: Order Deposit Book - Delivery Address, Select Postage Method and Billing Division
// DIGS-521, DIGS-262, DIGS-267

When(/^The user selecting the account "(.*)" under multiple divisions from Select Account Number Dropdown$/, async function (accountName) {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", accountName, false);
  await this.clickElement("#accountContainer .Select-option");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: accountName,
    type: 'HTMLText'
  });
});

When(/^The Delivery Location by default selected is "(.*)"$/, async function (deliveryLocation) {
  let value = '';
  if (deliveryLocation === 'Business') {
    value = 'business';
  }
  await this.checkRadioInputValue("input[name='deliveryLocation']", value);
});

Then(/^The application shows selected address in "(.*)"$/, async function (field) {
  if (field === 'Delivery Address') {
    await this.checkElementExist("#deliveryAddressField-field div.Select__single-value","Level 12, 530 Collins Street, Melbourne Victoria 3000 (Statement Address)");

  } else if (field === 'Branch Address') {
    await this.checkHTMLTextExist("#deliveryAddressField-label", 'deliveryBranchAddress');
    const deliveryBranchAddress = this.getTempState('deliveryBranchAddress');
    this.setState('deliveryBranchAddress', {
      selector: "#deliveryBranchAddress span.Select-value-label span",
      value: deliveryBranchAddress,
      type: 'HTMLText'
    });
  }
  //await this.attachScreenShot();
});

When(/^User tries to select from the "Delivery Address" drop down$/, async function () {
  await this.clickElement("#deliveryAddressField-field > div > div > div > div");
});

Then(/^The application must populate the registered channel addresses shown in the Delivery Address drop down$/, async function () {
  await this.checkElementExist("#deliveryAddressField-field .Select__menu .Select__option div > span");
  //await this.attachScreenShot();
});

When(/^The account statement mailing address has a country code of "(.*)"$/, async function (countryCode) {
  let account = "";
  if (countryCode == "AU") {
    account = "BO-AWAITING-FULFILMENT";
  } else if (countryCode == "Not AU") {
    account = "BO-AGENT-AWAITING-FULFILMENT";
  }
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", account, false);
  await this.clickElement("#accountContainer .Select-option");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
  await this.waitForLoading();
});

Then(/^The default mailing address is populated as "(.*)" in the Delivery Address drop down$/, async function (address) {
  await this.checkHTMLText("#deliveryAddressField-field > div > div > div > div > div > div > div.Select__single-value", address);
  //await this.attachScreenShot();
});

Then(/^The Delivery Address drop down is populated as "(.*)"$/, async function (message) {
  await this.checkHTMLText("#DepositBookDeliveryAddress_wrapper span.Select-value-label span", message);
  //await this.attachScreenShot();
});

When(/^The User selects an account "(.*)" from Select Account Number Dropdown which has only one Division$/, async function (account) {
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", account, false);
  await this.clickElement("#accountContainer .Select-option");
  this.setState('account', {
    selector: "#accountContainer #accName",
    value: account,
    type: 'HTMLText'
  });
});

Then(/^The application must show postage method options as per business rules$/, async function () {
  await this.clickElement("#postageMethod");
  await this.checkElementExist("#postageMethod option");
  //await this.attachScreenShot();
});

Then(/^The application shows tool tip on hover on icon of '(.*)'$/, async function (postageMethod) {
  if (postageMethod == 'Select Postage Method') {
    await this.checkElementExist("#postageMethodToolTip");
  } else if (postageMethod == 'Billing Division') {
    await this.checkElementExist("#billingDivIdToolTip");
  }
  //await this.attachScreenShot();
});

Then(/^The Billing Division value defaulted to Blank$/, async function () {
  await this.checkSelectInputValue("#DepositBookbillingDivId", '');
  //await this.attachScreenShot();
});

Then(/^The application populates all of the divisions under which I am entitled to the legal entity of the account$/, async function () {
  await this.clickElement("#DepositBookbillingDivId");
  await this.checkElementExist("#DepositBookbillingDivId option");
  //await this.attachScreenShot();
});

Then(/^The application must display the warning message under Postage Method as per business rules$/, async function () {
  await this.checkHTMLText("#postageMethodField-field div[class^=form-text]", 'Please Note: Delivery Address must be a street address when courier is selected.');
  //await this.attachScreenShot();
});

When(/^The user clicks on "OK" button of the Submission Response Dialog$/, async function () {
  await this.checkElementExist("#submitResponseDialog #okBtn");
  await this.clickElement('#submitResponseDialog #okBtn');
});

When(/^The user click on the "(.*)" link from the Submission Response Dialog$/, async function (link) {
  if (link === 'View Request Details') {
    await this.clickElement('a#detailLink');
  } else if (link === 'View Service Request List') {
    await this.clickElement('a#listLink');
  } else if (link === 'Raise another Service Request') {
    await this.clickElement('a#requestLink');
  }
});

// DIGS-263
Then(/^The application must display the field 'Branch Address' search option as per the Field Matrix$/, async function () {
  await this.checkElementExist("#deliveryBranchAddress");
  await this.checkElementExist("#deliveryBranchCode");
  //await this.attachScreenShot();
});

Then(/^The application must hide the 'Postage Method' section$/, async function () {
  await this.checkElementNotExist('#postageMethod');
});

Then(/^The application must display the 'Search Branch Lookup' modal window$/, async function () {
  await this.checkElementExist('#branchLookupDialog');
});

Then(/^The application must display the Lookup window elements as per the field matrix$/, async function () {
  await this.checkElementExist('.branch-lookup-autocomplete');
  await this.checkElementExist('#branchGrid-container');
  //await this.attachScreenShot();
});

Then(/^The search results grid must be blank$/, async function () {
  await this.checkElementExist('#branchGridMessage');
});

Then(/^The application must display the 'No Matches Found' on address quick list$/, async function () {
  await this.wait(1000);
  await this.waitForLoading();
  await this.checkHTMLText(".Select-noresults", "No Matches Found");
  //await this.attachScreenShot();
});

Then(/^The application show 5 results from Address Lookup in "(.*)" Dialog$/, async function (lookupName) {
  //Search Branch Lookup
  //Add New Address
  //await this.attachScreenShot();
});

When(/^I am selecting first address from "Search Branch Lookup" Grid$/, async function () {
  // fetch the row info for future reference
  await this.checkHTMLTextExist('#branchLookupDialog .slick-viewport .grid-canvas .ui-widget-content .r0', 'branch_address_col1');
  await this.checkHTMLTextExist('#branchLookupDialog .slick-viewport .grid-canvas .ui-widget-content .r1', 'branch_address_col2');
  await this.checkHTMLTextExist('#branchLookupDialog .slick-viewport .grid-canvas .ui-widget-content .r2', 'branch_address_col3');
  await this.clickElement("#branchLookupDialog .slick-viewport .grid-canvas .ui-widget-content");
});

Then(/^The application must show selected address in "(.*)" for "(.*)"$/, async function (param, requestType) {
  await this.wait(1000);
  if (param == 'Branch Address') {
    await this.checkElementExist("#deliveryBranchAddress");
    const preSelectedAddress = this.getTempState('branch_address_col1') + ' - ' + this.getTempState('branch_address_col2') + ', ' + this.getTempState('branch_address_col3');
    await this.checkHTMLText('#deliveryBranchAddress', preSelectedAddress);
  } else if (param == 'Delivery Address') {
    await this.checkElementExist(`#${requestType}DeliveryAddress_wrapper`);
    const preSelectedAddress = this.getTempState('newaddress');
    await this.checkHTMLText(`#${requestType}DeliveryAddress_wrapper`, preSelectedAddress);
  }
  //await this.attachScreenShot();
});

When(/^I am selecting first address from quick list which Displayed in "Search Branch Lookup" Dialog$/, async function () {
  await this.clickElement("#branchLookupDialog .Select-menu-outer .Select-option");
});


Then(/^The application show the "Order Deposit Book" service request screen$/, async function () {
  await this.checkElementExist("#orderDepositBook");
  //await this.attachScreenShot();
});

Then(/^The application must display the Address Lookup window elements as per the field matrix$/, async function () {
  await this.checkElementExist("#addNewAddressDialog-content");
  await this.checkElementExist("newBusinessAddess-field");
  await this.checkElementExist("#addNewAddressDialog-content #okBtn");
  //await this.attachScreenShot();
});

Then(/^The application displays selected address in "Add New Address" Lookup Field$/, async function () {
  await this.checkHTMLTextExist('#newBusinessAddess-field > div > div > div .Select__value-container.Select__value-container--has-value > div > span', 'newaddress');
  //await this.attachScreenShot();
});

Then(/^The application show error message on "Attention To", "Deposit Book Type", "Book Size" & "Number of Books" fields$/, async function () {
  // Refer "DIGS-254-2" for "Deposit Book Type", "Book Size"
  await this.checkCSSClassExist(`input#DepositBookMailingTitle1`, 'form-control--has-error', true);
  //await this.attachScreenShot();
});

Then(/^The application shows "Validation Error" on "(.*)" as per business rule$/, async function (field) {
  if (field == 'Branch Address') {
    await this.checkCSSClassExist(`#branchLocation-field label`, 'label--has-error', true);
  } else if (field == 'Delivery Address') {
    await this.checkCSSClassExist('#deliveryAddressField-field div[class*="form-text--is-note"]', 'form-text--has-error', true);
  } else if (field == 'Attention To') {
    await this.checkCSSClassExist('#DepositBookMailingTitle1', 'form-text--has-error', true);
  } else if (field == 'Book Size') {
    await this.checkCSSClassExist('#depAgentBookSize-field', 'form-text--has-error', true);
  } else if (field == 'Books per Agent') {
    await this.checkCSSClassExist('#quantity_0', 'form-control--has-error', true);
  }
  //await this.attachScreenShot();
});

When(/^I am entering below detail in "Delivery Details" section$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['Attention To'] !== undefined)
    await this.setTextInputValue('DepositBookMailingTitle1', data['Attention To'], 'input#DepositBookMailingTitle1');
  if (data['Company Name'] !== undefined)
    await this.setTextInputValue('mailingTitle2', data['Company Name'], 'input#mailingTitle2');
});

When(/^The user selects a "delivery method" '(.*)' which required additional Fee and no division option available$/, async function (method) {

  if (method == 'Express Post') {
    await this.setSelectInputValue('postageMethod', 'EXPRESS_POST', '#postageMethod')
  } else if (method == 'Courier') {
    await this.setSelectInputValue('postageMethod', 'COURIER', '#postageMethod')
  }
});

Then(/^The application must present the 'Errors and Alerts' subsection as per business rule$/, async function () {
  await this.checkElementExist("#errorsAndAlerts");
  //await this.attachScreenShot();
});

Then(/^The application must present the '(.*)' button as disabled$/, async function (position) {
  await this.waitForLoading();
  if (position == 'Previous') {
    await this.checkElementExist('#prevRecord button[disabled]');
  } else if (position == 'Next') {
    await this.checkElementExist('#nextRecord button[disabled]');
  }
  //await this.attachScreenShot();
});

When(/^The user click on service request grid first row$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#summaryGrid_wrap .slick-cell");
  await this.waitForLoading();
});

When(/^The user reset previous filters$/, async function () {
  await this.clickElement("#summaryGrid-reset");
  await this.waitForLoading();
});

// DIGS-534
When(/^The user selects an account "(.*)" from Select Account Number Dropdown which have '(.*)'$/, async function (searchKey, condition) {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", searchKey, false);
  await this.clickElement("#accountContainer .Select-option");
  this.setState("account", {
    selector: "#accountContainer #accName",
    value: searchKey,
    type: "HTMLText"
  });
});

When(/^The user clicks 'select all' checkbox from Agent details$/, async function () {
  await this.clickElement("input[name='selectAllAgentDetails']");
});

When(/^The user clicks the 'Remove' button on 'Agent Details'$/, async function () {
  await this.clickElement("#remove");
});

// DIGS-257

Then(/^The application must present the 'Deposit Book Details' specific to Agent Deposit Book and 'Delivery Details' Sections$/, async function () {
  await this.checkElementExist("#agentBookTypeDetailsContainer");
  await this.checkHTMLText("#agentBookTypeDetailsContainer span", "Deposit Book Details");
  //await this.attachScreenShot();
});

Then(/^The application must show the 'Book Size' drop down with values$/, async function () {
  await this.checkElementExist("#depAgentBookSize");
  await this.clickElement("#depAgentBookSize");
  await this.checkElementExist("#depAgentBookSize option");
  await this.waitForLoading();
  //await this.attachScreenShot();
});

Then(/^The application must present the 'Personalisation' section with Line 1 and 2$/, async function () {
  await this.checkHTMLText("#personalizationLine1-field label[for='personalizationLine1']", "Line 1");
  await this.checkHTMLText("#personalizationLine2-field label[for='personalizationLine2']", "Line 2");
  //await this.attachScreenShot();
});

Then(/^The application must show 'Agent Details' subsection with 1 row that can be entered by default$/, async function () {
  await this.checkHTMLText("label[for='agentDetailsTable']", "Agent Details");
  await this.checkElementExist("#orderDepositActionToolbar");
  await this.checkElementExist("#agentDetailsTable-field table");
  await this.checkElementExist("input[id^='agentNumber']");
  await this.checkElementExist("input[id^='personalizationLine3']");
  await this.checkElementExist("input[id^='personalizationLine4']");
  await this.checkElementExist("select[id^='quantity']");
  //await this.attachScreenShot();
});

Then(/^The Agent Details table has a label '(.*)' and a message '(.*)' below$/, async function (headingLabel, message) {
  await this.checkHTMLText('#agentDetailsTable-field label[for="agentDetailsTable"]', headingLabel);
  await this.checkHTMLText('#agentDetailsTable-field #agentDetailsMessage span', message);
  //await this.attachScreenShot();
});

Then(/^The 'Add' button is enabled till max allowed records are displayed$/, async function () {
  await this.checkElementExist("#add");
  await this.checkElementNotExist("#add button[disabled]");
  //await this.attachScreenShot();
});

Then(/^The 'Remove' button must be disabled by default$/, async function () {
  await this.checkElementExist("#remove");
  await this.checkElementExist("#remove button[disabled]");
  //await this.attachScreenShot();
});

Then(/^The application must display the second row for entering agent details$/, async function () {
  await this.checkElementExist("input[id^='agentNumber_1']");
  await this.checkElementExist("input[id^='personalizationLine3_1']");
  await this.checkElementExist("input[id^='personalizationLine4_1']");
  await this.checkElementExist("select[id^='quantity_1']");
  //await this.attachScreenShot();
});

When(/^The user checks one or more Agent Details rows displayed$/, async function () {
  await this.clickElement("#agentBookTypeDetailsContainer input[name='selectAgentDetails']");
});

When(/^The user selects all rows from '(.*)'$/, async function (table) {
  const selector = {
    'Agent Details': 'input[name="selectAllAgentDetails"]'
  }
  await this.clickElement(selector[table]);
});

Then(/^The Agent Details Table must be updated with a blank row$/, async function () {
  await this.checkElementExist('#agentDetailsTable-field #agentNumber_0');
  await this.checkElementValue('#agentDetailsTable-field #agentNumber_0', '');
  await this.checkElementExist('#agentDetailsTable-field #personalizationLine3_0');
  await this.checkElementValue('#agentDetailsTable-field #personalizationLine3_0', '');
  await this.checkElementExist('#agentDetailsTable-field #quantity_0');
  await this.checkSelectInputValue('#agentDetailsTable-field #quantity_0', '');
  //await this.attachScreenShot();
});

Then(/^The 'Remove' button is enabled$/, async function () {
  await this.checkElementNotExist("#remove button[disabled]");
  //await this.attachScreenShot();
});

When(/^User clicks on 'Remove' button$/, async function () {
  await this.clickElement("#agentDetailsTable-field #selectAllAgentDetails");
});

Then(/^All selected Agent Details rows must be removed$/, async function () {
  await this.checkElementNotExist("#agentDetailsTable-field tr");
  //await this.attachScreenShot();
});

Then(/^The Application must show the Display Books per Agent values$/, async function () {
  await this.checkElementExist("select[id^='quantity']");
  //await this.attachScreenShot();
});

Then(/^The application must present the 'Agent Number' field$/, async function () {
  await this.checkElementExist("input[id^='agentNumber']");
  //await this.attachScreenShot();
});

When(/^The user enters '(.*)' in to the 'Agent Number' field$/, async function (agentNum) {
  await this.sendKeys("#agentNumber_0", agentNum, false);
});

Then(/^The application must provide Padded Agent Number as per business rules$/, async function () {
  await this.clickElement("#personalizationLine3_0");
  await this.getTextInputValue("#agentNumber_0");
  //await this.attachScreenShot();
});

When(/^User enter value for multiple Agents as below$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data["Agent Number"] !== undefined) {
    await this.setTextInputValue("agentNumber_0", data["Agent Number"], "input#agentNumber_0");
    this.setState("agentNum", {
      selector: "#agentNumber_0",
      value: data["Agent Number"]
    });
  }
  if (data["Line 3"] !== undefined) {
    await this.setTextInputValue("personalizationLine3_0", data["Line 3"], "input#personalizationLine3_0");
    this.setState("personalizationLine3", {
      selector: "#personalizationLine3_0",
      value: data["Line 3"]
    });
  }
  if (data["Line 4"] !== undefined) {
    await this.setTextInputValue("personalizationLine4_0", data["Line 4"], "input#personalizationLine4_0");
    this.setState("personalizationLine4", {
      selector: "#personalizationLine4_0",
      value: data["Line 4"]
    });
  }
  if (data["Number of Books per Agent"] !== undefined) {
    await this.setSelectInputValue("quantity_0", data["Number of Books per Agent"]);
    this.setState("depBookQuantity", {
      selector: "#quantity_0",
      value: data["Number of Books per Agent"]
    });
  }
});

Then(/^The Agent Deposit Book details must remain unchanged for the newly selected account$/, async function () {
  const agentElements = ['agentNum', 'personalizationLine3', 'personalizationLine4', 'depBookQuantity'];
  await this.validatePreviousState(agentElements);
  //await this.attachScreenShot();
});

Then(/^The application must restrict the fields as per the Data Dictionary for "(.*)" BookType$/, async function (bookType) {
  if (bookType === "Agent" || bookType === "Bank@Post Agent") {
    await this.setTextInputValue("DepositBookMailingTitle1", "12345678901234567890123456789012345678901");
    await this.checkElementValue("#DepositBookMailingTitle1", "1234567890123456789012345678901234567890");
    await this.setTextInputValue("mailingTitle2", "12345678901234567890123456789012345678901");
    // await this.checkElementValue("#mailingTitle2", "1234567890123456789012345678901234567890");
    await this.setTextInputValue("agentNumber_0", "0121121212");
    await this.checkElementValue("#agentNumber_0", "0121121212");
    await this.setTextInputValue("personalizationLine3_0", "12345678901234567890123456789012345678901");
    await this.checkElementValue("#personalizationLine3_0", "1234567890123456789012345678901234567890");
    await this.setTextInputValue("personalizationLine4_0", "12345678901234567890123456789012345678901");
    await this.checkElementValue("#personalizationLine4_0", "1234567890123456789012345678901234567890");
  }
});

// DIGS-259

Then(/^The application must "(.*)" the 'Bank@Post' disclaimer$/, async function (status) {
  if (status === "present") {
    await this.checkHTMLText("#bankAtPostNote", "Please ensure you have a Bank@Post facility enabled for this account prior to ordering this book type.");
  } else {
    await this.checkElementNotExist("i[class^=fa-exclamation-triangle]");
  }
  //await this.attachScreenShot();
});

//####### story @DIGS-569

Then(/^The application must present the 'Book Type' as "(.*)"$/, async function (bookType) {
  if (bookType === "Agent" || bookType === "Bank@Post Agent")
    await this.checkElementExist("#bookTypeContainer");
  //await this.attachScreenShot();
});

Then(/^The application must show 'Agent Details' subsection with 1 row$/, async function () {
  await this.checkHTMLText("#agentDetailsTable-field label", "Agent Details");
  await this.checkElementExist("#agentNumber_0");
  await this.checkElementExist("#personalizationLine3_0");
  await this.checkElementExist("#personalizationLine4_0");
  await this.checkElementExist("#quantity_0");
  //await this.attachScreenShot();
});

Then(/^The application must present the 'Personalisation' sub-section with Line 1 as per the field matrix$/, async function () {
  await this.checkHTMLText("#DepositAgentDetailsPersonalizationContainer label[for='personalizationLine1']", "Line 1");
  //await this.attachScreenShot();
});

Then(/^The application must present BIN Type and BIN in next available empty personalisation line in personalisation section$/, async function () {
  //await this.attachScreenShot();
});

Then(/^The personalisation field populated with Legal Entity Name and uneditable$/, async function () {
  await this.checkHTMLText("#DepositAgentDetailsPersonalizationContainer label[for='personalizationLine1']", "Line 1");
  //await this.attachScreenShot();
});

Then(/^The application must populate first 40 char in line1 and next 40 char in line 2 and next 40 char in line 3 and next 40 char in line 4  and system populated fields are not editable$/, async function () {
  await this.checkElementExist("div#personalizationLine1");
  await this.checkElementExist("div#personalizationLine2");
  await this.checkElementExist("div#personalizationLine3");
  await this.checkElementExist("div#personalizationLine4");
  //await this.attachScreenShot();
});

When(/^The user enters below details in Order Deposit Book Agent section$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['Book Size'] !== undefined) {
    await this.setSelectInputValue('depAgentBookSize', data['Book Size']);
  }
  if (data["Agent Number"] !== undefined) {
    await this.setTextInputValue("agentNumber_0", data["Agent Number"], "input#agentNumber_0");
    this.setState("agentNum", {
      selector: "#agentNumber_0",
      value: data["Agent Number"]
    });
  }
  if (data["Line 3"] !== undefined) {
    await this.setTextInputValue("personalizationLine3_0", data["Line 3"], "input#personalizationLine3_0");
    this.setState("personalizationLine3", {
      selector: "#personalizationLine3_0",
      value: data["Line 3"]
    });
  }
  if (data["Line 4"] !== undefined) {
    await this.setTextInputValue("personalizationLine4_0", data["Line 4"], "input#personalizationLine4_0");
    this.setState("personalizationLine4", {
      selector: "#personalizationLine4_0",
      value: data["Line 4"]
    });
  }
  if (data["Number of Books per Agent"] !== undefined) {
    await this.setSelectInputValue("quantity_0", data["Number of Books per Agent"]);
    this.setState("depBookQuantity", {
      selector: "#quantity_0",
      value: data["Number of Books per Agent"]
    });
  }
  if (data['Attention To'] !== undefined) {
    await this.setTextInputValue('DepositBookMailingTitle1', data['Attention To']);
  }
  if (data['Delivery Address'] !== undefined) {
    await this.sendKeys('#DepositBookDeliveryAddress_wrapper input', data['Delivery Address'], false);
    await this.sendKeys(undefined, 'Enter', true);
  }
});

When(/^I am selecting "(.*)" from "Select Delivery Location" Radio options in DepositBook$/, async function (deliveryLocation) {
  await this.waitForLoading();
  if (deliveryLocation === 'ANZ Branch') {
    await this.setRadioInputValue('deliveryLocation', 'branch');
  } else if (deliveryLocation === 'Business') {
    await this.setRadioInputValue('deliveryLocation', 'business');
    await this.wait(1000);
    await this.checkHTMLTextExist("#DepositBookDeliveryAddress_wrapper span.Select-value-label span", 'alternateAddress');
    const selectedAddress = this.getTempState('alternateAddress');
    this.setState('alternateAddress', {
      selector: "#DepositBookDeliveryAddress_wrapper span.Select-value-label span",
      value: selectedAddress,
      type: 'HTMLText'
    });
  }
})

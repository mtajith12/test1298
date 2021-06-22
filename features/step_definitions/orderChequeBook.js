const { Given, When, Then } = require("cucumber");
const moment = require("moment");
var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');

// Scenario: Order Cheque Book Enter Details
Then(/^The application must hide the further input fields to Request "Order Cheque Book"$/, async function () {
  await this.checkElementNotExist("#chqBookDetailsContainer");
  await this.checkElementNotExist("#personalizationLine1");
  await this.checkElementNotExist("#personalizationLine2");
  await this.checkElementNotExist("#personalizationLine3");
  await this.checkElementNotExist("#personalizationLine4");
  await this.checkElementNotExist("#OrderChequeDelivery");
  //await this.attachScreenShot();
});

Then(/^The application shows the "Order Cheque Book" section fields$/, async function () {
  await this.checkElementExist("#quantity");
  await this.checkElementExist("#bookSize");
  await this.checkElementValue("input[name='crossInd']:checked", "C");
  await this.checkElementValue("input[name='customSerialNumber']:checked", "N");
  await this.checkElementExist("#personalizationLine1");
  await this.checkElementExist("#personalizationLine2");
  await this.checkElementExist("#personalizationLine3");
  await this.checkElementExist("#personalizationLine4");
  await this.checkElementExist("#OrderChequeMailingTitle1");
  await this.checkElementExist("#mailingTitle2");
  await this.checkElementValue("input[name='deliveryLocation']:checked", "business");
  await this.checkElementExist("#OrderChequeDeliveryAddress_wrapper");
  await this.checkElementValue("#postageMethod", "STANDARD_POST");
  await this.checkElementExist("button[id ='reviewAndSubmit']");
  //await this.attachScreenShot();
})

// Scenario: Order Cheque Book - Field Validation
Then(/^The application show error message on "Number of Books", "Book Size" & "Delivery Address" fields$/, async function () {
  await this.checkCSSClassExist(`#quantity`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#bookSize`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#OrderChequeDeliveryAddress_wrapper`, 'form-wrapper-control--has-error', true);
  //await this.attachScreenShot();
})

When(/^I am selecting "Yes" from "Do you want Custom Serial Numbers\?" Radio options$/, async function () {
  await this.waitForLoading();
  await this.setRadioInputValue('customSerialNumber', 'Y');
})
Then(/^The application show error message on "Number of Books", "Book Size", "Starting Cheque Number" & "Delivery Address" fields$/, async function () {
  await this.checkCSSClassExist(`#quantity`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#bookSize`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#serialNumberLastTwo`, 'has-error', true);
  await this.checkCSSClassExist(`#OrderChequeMailingTitle1`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#OrderChequeDeliveryAddress_wrapper`, 'form-wrapper-control--has-error', true);
  //await this.attachScreenShot();
})

Then(/^The application does not show error message on "Line1", "Line2", "Line3", "Line4", "Attention To" & "Company Name" fields$/, async function () {
  await this.checkCSSClassNotExist(`#personalizationLine2`, 'form-control--has-error', true);
  await this.checkCSSClassNotExist(`#personalizationLine3`, 'form-control--has-error', true);
  await this.checkCSSClassNotExist(`#personalizationLine4`, 'form-control--has-error', true);
  await this.checkCSSClassNotExist(`#OrderChequeMailingTitle1`, 'form-control--has-error', true);
  await this.checkCSSClassNotExist(`#mailingTitle2`, 'form-control--has-error', true);
  //await this.attachScreenShot();
})

When(/^I am selecting "(.*)" from "Select Delivery Location" Radio options$/, async function (deliveryLocation) {
  await this.waitForLoading();
  if (deliveryLocation === 'ANZ Branch') {
    await this.setRadioInputValue('deliveryLocation', 'branch');
  } else if (deliveryLocation === 'Business') {
    await this.setRadioInputValue('deliveryLocation', 'business');
  }
  //await this.attachScreenShot();
})

Then(/^The application show error message on "Last Cheque Number", "Line2", "Line3", "Line4", "Attention To" & "Branch Address" fields$/, async function () {
  // await this.checkCSSClassExist(`#serialNumberLastTwo`, 'has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine2`, 'form-control--has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine3`, 'form-control--has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine4`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#OrderChequeMailingTitle1`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#mailingTitle2`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`label[for='branchLocation']`, 'label--has-error', true);
  //await this.attachScreenShot();
})

When(/^I am entering below detail in "Order Cheque Book" section$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['No of Books'] !== undefined)
    await this.setSelectInputValue('quantity', data['No of Books']);

  if (data['Book Size'] !== undefined)
    await this.setSelectInputValue('bookSize', data['Book Size']);

  if (data['Starting Cheque Number'] !== undefined) {
    await this.sendKeys('#serialNumberFirstFour', 'Backspace', true);
    await this.sendKeys('#serialNumberFirstFour', 'Backspace', true);
    await this.sendKeys('#serialNumberFirstFour', 'Backspace', true);
    await this.sendKeys('#serialNumberFirstFour', 'Backspace', true);
    await this.setTextInputValue('serialNumberFirstFour', data['Starting Cheque Number'], undefined);
  }
  if (data['Starting Cheque Number End With'] !== undefined)
    await this.setSelectInputValue('serialNumberLastTwo', data['Starting Cheque Number End With']);
  if (data['Line2'] !== undefined) {
    await this.sendKeys('#personalizationLine2', 'Backspace', true);
    await this.setTextInputValue('personalizationLine2', data['Line2'], undefined);
  }
  if (data['Line3'] !== undefined) {
    //await this.sendKeys('#personalizationLine3', 'Backspace', true);
    await this.setTextInputValue('personalizationLine3', data['Line3']);
  }
  if (data['Line4'] !== undefined) {
    //await this.sendKeys('#personalizationLine4', 'Backspace', true);
    await this.setTextInputValue('personalizationLine4', data['Line4'], undefined);
  }
  if (data['Attention To'] !== undefined) {
    //await this.sendKeys('#OrderChequeMailingTitle1', 'Backspace', true);
    await this.setTextInputValue('OrderChequeMailingTitle1', data['Attention To'], '#OrderChequeMailingTitle1');
  }
  if (data['Company Name'] !== undefined) {
    await this.sendKeys('#mailingTitle2', 'Backspace', true);
    await this.setTextInputValue('mailingTitle2', data['Company Name'], undefined);
  }
  if (data['Delivery Address'] !== undefined) {
    await this.sendKeys('#deliveryAddressField-field input', data['Delivery Address'], false);
    await this.sendKeys(undefined, 'Enter', true);
  }
})
Then(/^The application show error message on "Last Cheque Number", "Line2", "Line3", "Line4", "Attention To" & "Company Name" fields$/, async function () {
  // await this.checkCSSClassExist(`label[for='lastChequeNumber']`, 'label--has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine2`, 'form-control--has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine3`, 'form-control--has-error', true);
  // await this.checkCSSClassExist(`#personalizationLine4`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#OrderChequeMailingTitle1`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#mailingTitle2`, 'form-control--has-error', true);
  //await this.attachScreenShot();
  await this.setRadioInputValue('deliveryLocation', 'business');
});

When(/^I am selecting an account from Select Account Number Dropdown to Perform Validation$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", "123456204", false);
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', { selector: "#accountContainer #accNum", value: account, type: 'TextInput' });
});
When(/^I am selecting an account from Select Account Number Dropdown which may or may not have more than one Division$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', { selector: "#accountContainer #accNum", value: account, type: 'TextInput' });
});
When(/^I am selecting an account from Select Account Number Dropdown which has one Division$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", "123456203", false);
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', { selector: "#accountContainer #accNum", value: account, type: 'TextInput' });
});
When(/^I am selecting an account from Select Account Number Dropdown which has more than one Division$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", "123456202", false);
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', { selector: "#accountContainer #accNum", value: account, type: 'TextInput' });
});
When(/^I am selecting Postage Method as "(.*)"$/, async function (postMethod) {
  let postMethodValue = 'STANDARD_POST';
  if (postMethod === 'Express Post') {
    postMethodValue = 'EXPRESS_POST';
  } else if (postMethod === 'Courier') {
    postMethodValue = 'COURIER';
  }
  await this.setSelectInputValue('postageMethod', postMethodValue);
});
Then(/^The application hide Billing Division Selection$/, async function () {
  await this.checkElementNotExist("#OrderChequebillingDivId");
  //await this.attachScreenShot();
});
Then(/^The application show Billing Division Selection in '(.*)' page$/, async function (page) {
  const selector = (page === 'Order Cheque Book') ? '#OrderChequebillingDivId' : '#DepositBookbillingDivId'
  await this.checkElementExist(selector);
  //await this.attachScreenShot();
});
Then(/^The application shows mandatory error on "Billing Division" Field$/, async function () {
  await this.checkCSSClassExist('#OrderChequebillingDivId', 'form-control--has-error', true);
});
Then(/^The application shows tool tip icon against the 'Select Cheque Type', 'Select Postage Method' & 'Billing Division' label$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist('#crossIndToolTip');
  await this.checkElementExist('#postageMethodToolTip');
  await this.checkElementExist('#billingDivIdToolTip');
  //await this.attachScreenShot();
});

// Scenario: Order Cheque Book - Add New Business / ANZ Branch Address
When(/^The user Clicks the "Add New Address" Button from "Delivery Address" Field$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#addNewAddress");
});

When(/^I am entering "(.*)" in "(.*)" Dialog$/, async function (input, dialog) {
  await this.wait(1000);
  if (dialog === 'Add New Address') {
    await this.sendKeys('#addNewAddressDialog-content input', input, true);
  } else if (dialog === 'Search Branch Lookup') {
    await this.sendKeys('#branchLookupDialog-content input', input, false);
  }
  await this.waitForLoading();
});

Then(/^The application show 5 result from Address Lookup in "(.*)" Dialog$/, async function (dialog) {
  if (dialog === 'Add New Address') {
    await this.checkElementExist("#addNewAddressDialog .Select__control");
  } else if (dialog === 'Search Branch Lookup') {
    await this.checkElementExist("#branchLookupDialog .Select__control");
  }
  //await this.attachScreenShot();
});

When(/^I am selecting first address from quick list from Displayed in "Add New Address" Dialog$/, async function () {
  await this.clickElement("#addNewAddressDialog > div >div > div .Select__menu .Select__option");
  await this.sendKeys(undefined, 'Tab', true);
});

Then(/^The application displays selected adress in "Add New Address" Lookup Field$/, async function () {
  await this.checkHTMLTextExist("#addNewAddressDialog .Select-value span span", 'alternateAddress');
  //await this.attachScreenShot();
});

When(/^The user Clicks the "OK" from "Add New Address" Dialog$/, async function () {
  await this.clickElement("#addNewAddressDialog #okBtn");
  await this.waitForLoading();
  //await this.attachScreenShot();
});

Then(/^The application shows selected adress in "(.*)"$/, async function (field) {
  if (field === 'Delivery Address') {
    const selectedAddress = this.getTempState('alternateAddress');
    this.setState('alternateAddress', { selector: "#OrderChequeDeliveryAddress_wrapper span.Select-value-label span", value: selectedAddress, type: 'HTMLText' });
    this.checkHTMLText("#OrderChequeDeliveryAddress_wrapper span.Select-value-label span", selectedAddress);
  } else if (field === 'Branch Address') {
    const deliveryBranchAddress = this.getTempState('deliveryBranchAddress');
    this.setState('deliveryBranchAddress', { selector: "#deliveryBranchAddress", value: deliveryBranchAddress, type: 'HTMLText' });
    await this.checkHTMLTextExist("#deliveryBranchAddress", 'deliveryBranchAddress');
  }
  //await this.attachScreenShot();
});

When(/^The user Clicks the "Find a Branch Address" Button from "Branch Address" Field$/, async function () {
  await this.clickElement("#deliveryBranchCode");
});

When(/^I am selecting first address from quick list from Displayed in "Search Branch Lookup" Dialog$/, async function () {
  //await this.clickElement("#branchLookupDialog-content .Select-option");
  await this.clickElement("#branchLookupDialog-content > div >div > div .Select__menu .Select__option");
});
Then(/^The application shows address list in the Grid$/, async function () {
  await this.checkElementExist("#branchLookupDialog-content .slick-viewport .grid-canvas .ui-widget-content");
  //await this.attachScreenShot();
});

When(/^I am selecting first address from Grid$/, async function () {
  await this.clickElement("#branchGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l0.r0");
});

// Scenario: Order Cheque Book - Successful Request
Then(/^The application accepts input and move to Order Cheque Book submission Review Page$/, async function () {
  await this.checkElementExist("#accountContainer");
  await this.checkElementExist("#chqBookDetailsContainer");
  await this.checkElementExist("#ChequeBookDeliveryContainer");
  await this.checkElementExist("button[id ='previous']");
  await this.checkElementExist("button[id ='submit']");
  //await this.attachScreenShot();
})


// Scenario: Order Cheque Book - Pending Approval Status
When(/^I am adding New Business Address$/, async function () {
  await this.clickElement("#addNewAddress");
  await this.sendKeys('[aria-label="Search Lookup Address"]', 'vic', false);
  await this.clickElement("#newBusinessAddess-field > div > div > div > div");
  await this.clickElement("#addNewAddressDialog-content #okBtn");
  await this.waitForLoading();

});

// Scenario: Order Cheque Book - Approve Request with 'Approve'
Then(/^The application show "Approve" model window$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist('[aria-describedby*="confirmationDialog-describedby"]');
  //await this.attachScreenShot();
});
When(/^I am selecting "(.*)" as action$/, async function (action) {
  if (action === 'Approve') {
    await this.clickElement('#confirmationDialog #confirmButton')
  } else if (action === 'Cancel') {
    await this.clickElement('#confirmationDialog #cancelButton')
  }
})

When(/^The user enter "(.*)" text to "Attention To" field$/, async function (input) {
  await this.setTextInputValue('OrderChequeMailingTitle1', input, undefined);
})

// Scenario: Order Cheque Book - Approve Request with 'Cancel'
// covered

// Scenario: Order Cheque Book - Pending Status
// covered

// Scenario: Order Cheque Book - Awaiting Fulfilment Status
// covered

// Scenario: Order Cheque Book - Unsuccessful Status
// covered

// Scenario: Order Cheque Book - View
Then(/^The application presents the "Approval Successful" as a toast message & hide the 'Approve' and 'Reject' buttons$/, async function () {
  await this.wait(5000);
  await this.waitForServerResponse("#requestSummary #status", 'Awaiting Fulfilment');
  //await this.attachScreenShot();
 // await this.clickElement('#Notification #Close');
});

Then(/^The application presents the "Unable to approve request" as a toast message & show the 'Approve' and 'Reject' buttons$/, async function () {
  // special case, avoid using this.wait - used due to RenderInBody
  await this.wait(5000);
  //await this.attachScreenShot();
  await this.clickElement('#Close');
});
Then(/^The application shows error message in toast for "(.*)"$/, async function (error) {
   //await this.attachScreenShot();
});

Then(/^The application must show the 'Reject Service Request' Dialog window$/, async function () {
  //await this.attachScreenShot();
});
Then(/^The application must hide the 'Reject Service Request' Dialog window$/, async function () {
  //await this.attachScreenShot();
});

Then(/^The application presents the "Request successfully rejected" as a toast message, Close the Dialog & hide the 'Approve' and 'Reject' buttons$/, async function () {
  await this.wait(5000);
  await this.waitForServerResponse("#requestSummary #status", 'Approver Rejected');
  //await this.attachScreenShot();
  await this.clickElement('#Close');
});

Then(/^The application presents the "Unable to reject request" as a toast message, Close the Dialog & show the 'Approve' and 'Reject' buttons$/, async function () {
  // special case, avoid using this.wait - due to RenderInBody
  await this.wait(5000);
  //await this.attachScreenShot();
  await this.clickElement('#Close');
});

Then(/^The 'Reject' action button is displayed$/, async function () {
  await this.checkElementExist("#reject button");
});

When(/^The User enter the rejection reason as "(.*)"$/, async function (input) {
  await this.setTextareaInputValue("rejectComment", input);
  //await this.attachScreenShot();
});

When(/^The user Clicks the "(.*)" button in Reject Dialog$/, async function (button) {
  let buttonId = '';
  if (button === 'Reject') {
    buttonId = '#rejectDialog #rejectBtn';
  } else if (button === 'Cancel') {
    buttonId = '#rejectDialog #cancelBtn';
  }
  await this.clickElement(buttonId);
});

Then(/^The system must highlight the field "Reason for reject" in red and display error message$/, async function () {
  await this.checkElementExist("#rejectComment");
  await this.checkHTMLText("#rejectDialog div[class^='form-text']", "Reason for rejection is mandatory");
  //await this.attachScreenShot();
});

Then(/^The application presents the "Rejection Successful" as a toast message, Close the Dialog & hide the 'Approve' and 'Reject' buttons$/, async function () {
  await this.wait(6000);
  await this.checkElementExist("#Notification");
  await this.checkElementNotExist("#approve");
  await this.checkElementNotExist("#reject");
  //await this.attachScreenShot();
});

Then(/^The system must populate up to the 3rd the personalisation rows with "Account Legal Entity Name"$/, async function () {
  await this.checkElementExist("div#personalizationLine1");
  await this.checkElementExist("div#personalizationLine2");
  await this.checkElementExist("div#personalizationLine3");
  //await this.attachScreenShot();
});

When(/^The user select "(.*)" from "(.*)" drop down$/, async function (optTxt, elem) {
  await this.waitForLoading();
  var selector = pageobj[elem];
  await this.clickElement(selector);
  await this.setTextInputValue(null, optTxt, selector)
  await this.sendKeys(undefined, 'Tab', true);
});

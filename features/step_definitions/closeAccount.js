const { Given, When, Then } = require("cucumber");
const moment = require("moment");


// Scenario: Close Account - Select existing account
// DIGS-311

When(/^The user won't select any "Account" from the drop down and closes the select drop down$/, async function () {
  await this.clickElement("#selfServiceStepper");
});

Then(/^The application must not update the "Account Details" displayed on the screen$/, async function () {
  await this.checkHTMLText('#closeAccount_wrapper div[class*="styled-autocomplete"]', 'Select Account Number');
  //await this.attachScreenShot();
});

When(/^The user selects "(.*)" from the "(.*)" selection drop down$/, async function (input, field) {
  const selectors = {
    "Accounts": "#closeAccount_wrapper",
    "Settlement Accounts": "#settlementAccount_wrapper",
    "Redirection Account": "#redirectionAccount_wrapper"
  };
  const stateKey = {
    "Accounts": "closeAccounts",
    "Settlement Accounts": "#settlementAccounts",
    "Redirection Account": "#redirectionAccount"
  }
  await this.waitForLoading();
  await this.checkElementExist(selectors[field]);
  await this.clickElement(selectors[field]);
  await this.sendKeys(selectors[field] + " div[class^='Select-input'] input", input, false);
  await this.clickElement(selectors[field] + " .Select-option");
  this.setState(stateKey[field], {
    selector: selectors[field] + " #accName",
    value: input,
    type: "HTMLText"
  });
});

// DIGS-316
Then(/^The application must display the '(.*)' section as per the business rules and Field matrix$/, async function (section) {
  const selectors = {
    'Account Settlement Details': '#accountSettlementDetails-field',
  };
  await this.checkElementExist(selectors[section]);
  //await this.attachScreenShot();
});

// DIGS-715
Then(/^The application must display the 'Important Information' section with relevant links$/, async function () {
  await this.checkElementExist('#information-wrapper');
  //await this.attachScreenShot();
});

When(/^The user closes the fly down$/, async function () {
  await this.clickElement('#Notification #Close');
});

Then(/^The user is directed to the "Close Account" Service Request create screen$/, async function () {
  await this.checkElementExist('#closeAccountDetailsContainer');
  //await this.attachScreenShot();
});

Then(/^The account details remain unchanged$/, async function () {
  const stateElements = ['closeAccounts'];
  await this.validatePreviousState(stateElements);
  //await this.attachScreenShot();
});

When(/^The user selects an account from the "Search Account" lookup$/, async function () {
  await this.clickElement("#accountDialogInlineSearch-container .slick-cell");
});

Then(/^The system must remove the previously selected account and populate the "Accounts" field with the new account details selected$/, async function () {
  await this.checkHTMLTextExist("#closeAccount_wrapper #accName");
  //await this.attachScreenShot();
});

Then(/^The application will not display remaining screen elements of Close Account & not be able to create the SR$/, async function () {
  await this.checkElementNotExist("#information-wrapper");
  await this.checkElementNotExist("#accountSettlementDetails-field");
  //await this.attachScreenShot();
});

Then(/^The application display the "Settlement Account Details" section and tool tip as per Field Matrix & Wireframe$/, async function () {
  await this.checkElementExist("#settlementAccount-field");
  await this.checkElementExist("#settlementAccountToolTip");
  //await this.attachScreenShot();
});

When(/^The user clicks on the "(.*)"$/, async function (field) {
  const wrapper = {
    'Settlement Account Field': '#settlementAccount-field #settlementAccount_wrapper',
    'Redirection Account Field': '#redirectionAccount-field #redirectionAccount_wrapper',
  }
  await this.clickElement(wrapper[field] + " div");
  await this.waitForLoading();
});

Then(/^The application must display the "(.*)" list$/, async function (dropdown) {
  const wrapper = {
    "Settlement Accounts": "#settlementAccount-field #settlementAccount_wrapper .Select-menu",
    "Redirection Accounts": "#redirectionAccount-field #redirectionAccount_wrapper .Select-menu"
  };
  await this.checkElementExist(wrapper[dropdown]);
  //await this.attachScreenShot();
});

Then(/^The application must display "(.*)" warning message under "(.*)"$/, async function (warningType, field) {
  const fieldWrapper = {
    "Settlement Account": "#settlementAccount-field",
    "Redirection Account": "#redirectionAccountContainerContent",
  };
  const selector = {
    "ineligible account": fieldWrapper[field] + " div[class^='form-text']",
    "insufficient funds": fieldWrapper[field] + " div#settlementAccountWarning",
    "ineligible redirection account": fieldWrapper[field] + " div[class^='form-text']"
  }
  await this.checkElementExist(selector[warningType]);
  //await this.attachScreenShot();
});

Then(/^The application must only show accounts containing "(.*)" in the "(.*)" drop down list$/, async function (input, accounts) {
  const selector = {
    'Settlement Account': '#settlementAccount-field #settlementAccount_wrapper',
    'Redirection Account': '#redirectionAccount-field #redirectionAccount_wrapper',
  }
  await this.checkElementExist(selector[accounts] + " .Select-menu");
  //await this.attachScreenShot();
});

// Check this one
Then(/^The user open '(.*)' & close without selecting$/, async function (dropdown) {
  const selector = {
    'Settlement Account': '#settlementAccount-field #settlementAccount_wrapper',
    'Redirection Account': '#redirectionAccount-field #redirectionAccount_wrapper',
  };
  await this.clickElement(selector[dropdown]);
  await this.clickElement("#closeAccountDetailsContainerWrapper");
});

Then(/^The application leaves selected "(.*)" as "(.*)"$/, async function (accounts, account) {
  const selector = {
    'Settlement Account': '#settlementAccount-field #settlementAccount_wrapper',
    'Redirection Account': '#redirectionAccount-field #redirectionAccount_wrapper',
  };
  await this.checkHTMLText(selector[accounts] + " #accName", account);
  //await this.attachScreenShot();
});

Then(/^The application shows the "Search Account" lookup dialog box for "(.*)"$/, async function (field) {
  await this.checkHTMLText("div#accountDialogInlineSearch_dialog div[class*='dialog__title']", "Search Account");
  //await this.attachScreenShot();
});

Then(/^The user selects "(.*)" from Grid$/, async function (account) {
  await this.clickElement("div#accountDialogInlineSearch_dialog div[class^='slick-cell']");
});

Then(/^The "(.*)" must be populated with the "(.*)" account$/, async function (accounts, account) {
  const selector = {
    "Closing Operating Accounts": "#closeAccount_wrapper",
    "Settlement Account": "#settlementAccount_wrapper",
    "Operating Account": "#accountContainer",
    "Redirection Account": "#redirectionAccount_wrapper",
  }
  await this.checkHTMLText(selector[accounts] + " #accName", account);
  //await this.attachScreenShot();
});

Then(/^The application shows warning message to proceed 'No' or 'Yes'$/, async function () {
  await this.checkElementExist('#warningDialog');
  await this.checkElementExist('#noBtn');
  await this.checkElementExist('#yesBtn');
  //await this.attachScreenShot();
});

Then(/^The user may proceed with the "(.*)" Service Request$/, async function (serviceRequest) {
  await this.checkElementExist('#information-wrapper');
  await this.checkElementExist('#accountSettlementDetails-field');
  //await this.attachScreenShot();
});

// OMCW-353

Then(/^The application must display the 'Payment Redirection' section as per Field Matrix & Wireframe$/, async function () {
  await this.checkElementExist("#redirectFuturePaymentsField-field");
  //await this.attachScreenShot();
});

Then(/^The application must show the "Redirect Future Payments" checkbox and tooltip as per the business rules and Field matrix$/, async function () {
  await this.checkElementExist("#redirectFuturePaymentsToolTip");
  await this.checkElementExist("#redirectFuturePaymentsField-field label[for='redirectFuturePayments']");
  //await this.attachScreenShot();
});

When(/^The user checks the "(.*)" checkbox$/, async function (checkbox) {
  const element = {
    "Redirect Future Payments": "#redirectFuturePaymentsField-field input[name='redirectFuturePayments']",
    "Remove account and history from Transactive Global": "#onlineBankingField-field input[name='removeAccountHistory']",
  };
  await this.clickElement(element[checkbox]);
});

Then(/^The application must show the "Redirection Account" field as per the field Matrix$/, async function () {
  await this.checkElementExist("#redirectionAccount_wrapper");
  //await this.attachScreenShot();
});

When(/^The user selects "(.*)" from the "(.*)" selection drop down which has Stop All restraint$/, async function (input, field) {
  const selectors = {
    "Settlement Accounts": "#settlementAccount_wrapper",
    "Redirection Account": "#redirectionAccount_wrapper",
  };
  const stateKey = {
    "Settlement Accounts": "#settlementAccounts",
    "Redirection Account": "#redirectionAccounts",
  }
  await this.waitForLoading();
  await this.checkElementExist(selectors[field]);
  await this.clickElement(selectors[field]);
  await this.sendKeys(selectors[field] + " div[class^='Select-input'] input", input, false);
  await this.clickElement(selectors[field] + " .Select-option");
  this.setState(stateKey[field], {
    selector: selectors[field] + " #accName",
    value: input,
    type: "HTMLText"
  });
});

When(/^The user selects "(.*)" from the "(.*)" selection drop down which has no restraints$/, async function (input, field) {
  const selectors = {
    "Settlement Accounts": "#settlementAccount_wrapper",
    "Redirection Account": "#redirectionAccount_wrapper",
  };
  const stateKey = {
    "Settlement Accounts": "#settlementAccounts",
    "Redirection Account": "#redirectionAccounts",
  }
  await this.waitForLoading();
  await this.checkElementExist(selectors[field]);
  await this.clickElement(selectors[field]);
  await this.sendKeys(selectors[field] + " div[class^='Select-input'] input", input, false);
  await this.clickElement(selectors[field] + " .Select-option");
  this.setState(stateKey[field], {
    selector: selectors[field] + " #accName",
    value: input,
    type: "HTMLText"
  });
});

// OMCW-113

Then(/^The application must display the 'Online Banking' section as per Field Matrix & Wireframe$/, async function () {
  await this.checkElementExist("#onlineBankingContainerContent");
  //await this.attachScreenShot();
});

Then(/^The application must show the "Remove account and history from Transactive Global" checkbox and tooltip as per the business rules and Field matrix$/, async function () {
  await this.checkElementExist("#onlineBankingContainerContent label[for='removeAccountHistory']");
  //await this.attachScreenShot();
});

Then(/^The user must be able to check the "Remove account and history from Transactive Global" checkbox$/, async function () {
  await this.setCheckboxInputValue(undefined, 'removeAccountHistory', 'input[name="removeAccountHistory"]');
  //await this.attachScreenShot();
});

// OMCW-394

When(/^The user clicks on 'Review & Sumbit' without checking the "Redirect Future Payments" checkbox$/, async function () {
  await this.clickElement("#reviewAndSubmit");
});

Then(/^The application must show 'Validation Error' under '(.*)'$/, async function (field) {
  const fieldWrapper = {
    'Settlement Account field': '#settlementAccount-field div[class^="form-text"]',
    'Redirection Account field': '#redirectionAccount-field div[class^="form-text"]',
  }
  await this.checkElementExist(fieldWrapper[field]);
  //await this.attachScreenShot();
});

Then(/^The application '(.*)' allow the user to progress to the next page$/, async function (status) {
  if (status === 'must not') await this.checkElementNotExist('#submit')
  else await this.checkElementExist('#submit')
  //await this.attachScreenShot();
});

Then(/^The Validation errors in Close Account form must be removed$/, async function () {
  await this.checkElementNotExist('div[class^="form-text"]')
  //await this.attachScreenShot();
});




const { Given, When, Then } = require("cucumber");
const moment = require("moment");

// Scenario: Order Cheque Book Enter Details
Then(/^The application must hide the further input fields to Request "Order Statement Request"$/, async function () {
  await this.checkElementNotExist("#statementRequestDetailsContainer");
  await this.checkElementNotExist("#fromDate");
  await this.checkElementNotExist("#toDate");
  await this.checkElementNotExist("#email");
  //await this.attachScreenShot();
});

Then(/^The application shows the "Statement Request Details" section$/, async function () {
  await this.checkElementExist("#statementRequestDetailsContainer");
  await this.checkElementExist("#fromDate");
  await this.checkElementExist("#toDate");
  await this.checkElementExist("#email");
  //await this.attachScreenShot();
});

Then(/^The application shows "Statement Request Validation Error" on "(.*)" as per business rules$/, async function (section) {
  if (section == 'Statement Request Details') {
    await this.checkCSSClassExist('div[id="fromDate"]~div', 'form-wrapper-control--has-error', true);
    await this.checkCSSClassExist('div[id="toDate"]~div', 'form-wrapper-control--has-error', true);
  }
  if (section == 'From Date') {
    await this.checkCSSClassExist('div[id="fromDate"]~div', 'form-wrapper-control--has-error', true);
  }
  if (section == 'To Date') {
    await this.checkCSSClassExist('div[id="toDate"]~div', 'form-wrapper-control--has-error', true);
  }
  //await this.attachScreenShot();
});

When(/^I am entering below detail in "Order Statement Request" section$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['From Date'] !== undefined){
    //console.log('Putitng in From Date value :' + data['From Date'] + ':');
    await this.setTextInputValue(undefined, data['From Date'], "#fromDate[type='text']");
    await this.sendKeys(undefined, 'Tab', true);
  }
  if (data['To Date'] !== undefined){
    //console.log('Putitng in To Date value :' + data['To Date'] + ':')
    await this.setTextInputValue(undefined, data['To Date'], "#toDate[type='text']");
    await this.sendKeys(undefined, 'Tab', true);
  }
  //await this.sendKeys(undefined, 'Enter', true);

});

// Scenario: Order Deposit Book - Successful Request
Then(/^The application accepts input and move to Order Statement Request submission Review Page$/, async function () {
  await this.checkElementExist("#accountContainer");
  await this.checkElementExist("#statementRequestDetailsContainer");
  await this.checkElementExist("#fromDate");
  await this.checkElementExist("#toDate");
  await this.checkElementExist("#email");
  await this.checkElementExist("#previous");
  await this.checkElementExist("#submit");
  //await this.attachScreenShot();
});

const {
  Given,
  When,
  Then,
  And
} = require("cucumber");
const moment = require("moment");
const _ = require('lodash');
const assert = require('assert')
const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');
const util = require('util');
var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');


Then(/The application should display 'New comment' sub-section$/, async function () {
  await this.waitForLoading();
  await this.checkHTMLTextExist('label[for="additionalComment"]', 'New Comment');
  await this.checkElementExist('#additionalComment');
  await this.checkElementExist('#additionalComment-field > div > div > div > label');
  //await this.attachScreenShot();
});

Then(/The application should display 'file upload' sub-section$/, async function () {
  await this.waitForLoading();
  await this.checkHTMLText("#content > div > div > div > div > h4", 'Step 2: Upload Completed Form & Required Documentation');
  await this.checkElementExist("div[class*='dropzone']");
  await this.checkElementExist("i[class='fa fa-2x fa-upload']");
  await this.checkElementExist("#browseButton > span");
  await this.checkHTMLText("#content > div > div > div > div > section > div > div", 'Drag and drop your files here, or');
  //await this.attachScreenShot();
});

Then(/^The user click on the Download Form button$/, async function () {
  await this.waitForLoading();
  const path = await this.download(this.page, () => this.page.click('#downloadFileLink > span', ), );
  const {    size  } = await util.promisify(fs.stat)(path);
});


Then(/^The system displays the files uploaded under the file upload section$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#content > div  ul > li:nth-child(1) > div");
  await this.checkElementExist('#removeButton0');
  //await this.attachScreenShot();
});


When(/^The user select the 'fileremoveicon' icon against a file$/, async function () {
  await this.waitForLoading();
  await this.clickElement('#removeButton0');
  //await this.attachScreenShot();
});

Then(/^The application should remove the files from the file upload section$/, async function () {
  await this.waitForLoading();
  await this.checkElementNotExist("#content > div  ul > li:nth-child(1) > div");
  await this.checkElementNotExist('#removeButton0');
  //await this.attachScreenShot();
});

When(/^The application should display a pop-up to confirm prior to submission$/, async function () {
  await this.waitForLoading();
  await this.checkHTMLText('div[style="display: inline-flex; font-weight: 600; padding-left: 5px;"]', 'Submitted');
  await this.checkElementExist("#requestStatus");
  await this.checkElementExist("#responseId");
  await this.checkElementExist("#requestStatusLbl");
  await this.checkElementExist("#okBtn");
  await this.checkElementExist("#requestStatus");
  await this.checkHTMLText("#detailLink", "View Request Details");
  await this.checkHTMLText("#requestLink > div", "Raise another Service Request");
  //await this.attachScreenShot();
});

When(/^The user click on the View Service Request Details hyperlink$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#detailLink");
});


Then(/^The application should display a spinner on the UI notifying request is being processed$/, async function () {
  await this.checkSpinner();
  //await this.attachScreenShot();
});

When(/^The user have not uploaded any files and submitted$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.clickElement("i[class='fa fa-chevron-down']");
  await this.sendKeys("div.Select-input > input", data['legalEntity'], false);
  await this.sendKeys(undefined, 'Tab', true);
  await this.clickElement("input[type=checkbox]");
  //await this.attachScreenShot();
});

Then(/^The application should display a invalid file format error$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.checkHTMLText("div[class*='errorMessage']", data['error_message']);
  //await this.attachScreenShot();
});


Then(/^The user not entered 'your reference field' value submitting the service request$/, async function (table, field) {
  await this.sendKeys('#customerReference', '', false);
});


Then(/^The user should select the legal entity from the drop down$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.checkHTMLText("#legalEntity-field  div.Select-placeholder", 'Please select the Legal Entity for this request');
  await this.clickElement("i[class='fa fa-chevron-down']");
  await this.sendKeys("div.Select-input > input", data['legalEntity'], false);
  await this.sendKeys(undefined, 'Tab', true);
});

Then(/^The Legal entity details should be diplayed in the add user details page$/, async function (table) {
  await this.waitForLoading();
  await this.wait(2000);
  const data = table.rowsHash();
  await this.checkHTMLText('#leLabel', 'Legal Entity');
  await this.checkHTMLText('#leEntityNameValue', data['legalEntity']);
  //await this.attachScreenShot();
});
Then(/^check the search functionality in the legal entity search pop up$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.clickElement("#legalEntitySearch > i");
  await this.sendKeys("#accountOwnerDialogInlineSearchFilterInput", data['SearchInput'], false);
  await this.waitForLoading();
  await this.checkElementExist("div.slick-cell.l0.r0");
  //await this.attachScreenShot();
  await this.clickElement("#accountOwnerDialogInlineSearch_dialog button > i");
});



Then(/^verify the functionality of cancel button in the legal entity search pop up$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.clickElement("#legalEntitySearch > i");
  await this.sendKeys("#accountOwnerDialogInlineSearchFilterInput", data['SearchInput'], false);
  await this.waitForLoading();
  await this.checkElementExist("div.slick-cell.l0.r0");
  //await this.attachScreenShot();
  await this.clickElement("#cancelBtn");
});

Then(/^The user select a legal entity from the search legal entity pop up$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  await this.clickElement("#legalEntitySearch > i");
  //  await this.sendKeys("#accountOwnerDialogInlineSearchFilterInput",data['legalEntity'], false);
  await this.setTextInputValue(null, data['legalEntity'], "#accountOwnerDialogInlineSearchFilterInput");
  await this.waitForLoading();
  // await this.sendKeys(undefined, 'Tab', true);
  // await this.sendKeys(undefined, 'Tab', true);
  await this.clickElement("div.slick-cell.l0.r0");
  //await this.attachScreenShot();
});

Then(/^The 'Your Reference' field is not displayed in the view service request details page$/, async function () {
  await this.checkElementNotExist('label[for="customerReference"]');
  await this.checkElementNotExist("#customerReference");
});

Then(/^The Case Notes should be sorted in the order of the Date by default$/, async function () {
  const date1 = await this.checkElementExist("td:nth-child(1)");
  d2 = alert(toTimestamp(date1));
  console.log(d2);
  await this.checkElementExist("td:nth-child(2)");
});

Then(/^The Case Notes should be sorted in the order of the Date by default$/, async function () {
  const date1 = await this.checkElementExist("td:nth-child(1)");
  d2 = alert(toTimestamp(date1));
  console.log(d2);
  await this.checkElementExist("td:nth-child(2)");
});


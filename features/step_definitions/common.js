const {
  Given,
  When,
  Then
} = require("cucumber");
const moment = require("moment");
const assert = require('assert');
const path = require('path');
var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');

Given(/^An authorised user with permission$/, async function () {
  // Login not required, good to go
});

Given(/^(?:I am|I'm|) an authorised user with permission to (?:create|view|update|) (?:a|an|) "(.*)" service request$/, async function (requestType) {
  //console.log(" User is on "+requestType+ " screen");
});

Then(/^The application should display the (.*) (?:for|on|in|under|the|) "(.*)"$/, async function (component, servicetyp, datatable) {
  await this.waitForLoading()
  const data = datatable.rowsHash();
  for (let i = 0; i < Object.keys(data).length; i++) {
    const value = data[Object.keys(data)[i]];
    const key = Object.keys(data)[i];
    await this.checkElementExist(pageobj[key]);
    await this.checkHTMLText(pageobj[key], value);
  }
  // await this.attachScreenShot();
});


Then(/^I am entering the (.*) (?:for|on|in|under|the|) "claim missing deposit sr"$/, async function (component, datatable) {
  await this.waitForLoading(2000);
  const data = datatable.rowsHash();
  for (let i = 0; i < Object.keys(data).length; i++) {
    const value = data[Object.keys(data)[i]];
    const key = Object.keys(data)[i];
    await this.sendKeys(pageobj[key], value, false);
  }
  //await this.attachScreenShot();
});

Then(/^The application should not display the (.*)$/, async function (component, datatable) {
  await this.waitForLoading(1000);
  const data = datatable.rowsHash();
  for (let i = 0; i < Object.keys(data).length; i++) {
    const value = data[Object.keys(data)[i]];
    const key = Object.keys(data)[i];
    await this.checkElementNotExist(pageobj[key]);
  }
  //await this.attachScreenShot();
});

//This method will chkeck and verify the text() passing xpath here
// Then(/The application should display the "(.*)" for "(.*)" text$/, async function (arg1,arg2,datatable) {
//   await this.waitForLoading()
//   const data = datatable.rowsHash();
//   for (let i = 0; i < Object.keys(data).length; i++) {
//     const key = Object.keys(data)[i];
//     const actualValue = data[Object.keys(data)[i]];
//     await this.page.$x(pageobj[key]);
//     var xpathData = await this.page.$x(pageobj[key]);
//     var ExpTextContent = await xpathData[0].getProperty('textContent'),
//       text = await ExpTextContent.jsonValue();
//     assert.equal(actualValue, text);
//   }
//   //await this.attachScreenShot();
// });

//This method will check and verify the text() passing xpath here
Then(/The application should display the "(.*)" for "(.*)" text$/, async function (arg1, arg2, datatable) {
  await this.waitForLoading();
  const data = datatable.rowsHash();
  for (let i = 0; i < Object.keys(data).length; i++) {
    const key = Object.keys(data)[i];
    const actualValue = data[Object.keys(data)[i]];
    await this.page.$x(pageobj[key]);
    var xpathData = await this.page.$x(pageobj[key]);
    var ExpTextContent = await xpathData[0].getProperty('textContent'),
      text = await ExpTextContent.jsonValue();
    assert.equal(actualValue, text);
  }
  //await this.attachScreenShot();
});

//right now attibute is hard coaded, need to make a genaralize
Then(/The application should display the File_upload_fileToolTip_txt overing tooltip icon$/, async function (title) {

  await this.page.hover("#content > div > div > div > div > div > section > div > span > i");
    var actualValue = await this.page.evaluate(() => (this, "#content > div > div > div > div > div > section > div > span > i", 417, event, 0, 1));
  // await this.checkAttributeValue(actualValue, title);

});




When(/^The user (?:click|clicks|Clicks) (?:|the|on the) "(.*)" (?:|Form|button|checkbox|link|element|radioButton)$/, async function (element) {
  await this.waitForLoading();
  var selector = pageobj[element];
  await this.clickElement(selector);
  //await this.attachScreenShot();
});


Then(/^The application (?:must|should|) (?:|displays|display|shows) (?:|a|the|an) "(.*)" (?:|screen|screen|dialog|element|comment|sub-section|button)$/, async function (element) {
  await this.waitForLoading();
  var selector = pageobj[element];
  await this.checkElementExist(selector);
  //await this.attachScreenShot();
});


When(/^I click on the dropdown arrow against the "(.*)" field$/, async function (fieldName) {
  var selector = pageobj[fieldName];
  await this.waitForLoading();
  await this.clickElement(selector);
  await this.waitForLoading();
});

Then(/^The application will populate the "(.*)" dropdown menu with all entitled "(.*)"$/, async function (fieldName, accountType) {
  var selector = pageobj[fieldName];
  await this.waitForLoading();
  await this.checkElementExist(selector + " .Select-menu");
  //await this.attachScreenShot();
});

Then(/^The application must display the service request footer$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#submit");
});

When(/^The (?:user|application|) (?:navigated|navigate|) to the "(.*)" service request screen$/, async function (requestType) {
 // await this.waitForLoading();
 // await this.page.waitFor(2000);
  await this.clickElement('#addNewBtn > button');
  await this.page.waitFor(4000);
  var selector = pageobj[requestType];
  await this.clickElement(selector);
  //await this.attachScreenShot();

});


When(/^The user enter "(.*)" into the "(.*)" (?:text|postDate| |) field$/, async function (inputVal, fieldName) {
  var selector = pageobj[fieldName];
  await this.setTextInputValue(null, inputVal, selector);
  //await this.attachScreenShot();
});

//This is method will select the dropdown based on values
When(/^The user select the "(.*)" from "(.*)" drop down$/, async function (optTxt, elem) {
  await this.waitForLoading();
  var selector = pageobj[elem];
  await this.clickElement(selector);
  await this.setTextInputValue(null, optTxt, selector);
  //await this.sendKeys(undefined, 'Tab', true);
});


Then(/^The application should allow user to select and upload one or more files from computer$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  for (let i = 1; i < Object.keys(data).length; i++) {
    let filepath = "filepath" + i;
    var file = path.join(process.cwd() + data[filepath]);
    var files = new Array();
    files.push(file);
    const elementHandle = await this.page.$(".dropzone input[type=file]");
    for (let index = 0; index < files.length; index++) {
      const filePath = files[index];
      await elementHandle.uploadFile(filePath);
    }
    await this.waitForLoading();
  }
  //await this.attachScreenShot();
});

Then(/^The application must display the service request list screen$/, async function () {
  await this.waitForLoading();
  await this.checkHTMLText("#serviceRequests", 'Cash Management Service Requests');
  //await this.attachScreenShot();
  // await this.waitForLoading()
});

When(/^I have selected an account from Select Account Number Dropdown$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'TextInput'
  });
});


Then(/^The application pops up the drop-down list while typing, suggesting a list of possible results$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#accountContainer #account_wrapper");
  //await this.attachScreenShot();
});

Then(/^The application must display the  'No Matches Found' in the "(.*)" dropdown$/, async function (fieldName) {
  const selector = {
    "Operating Accounts": "#accountContainer .Select-noresults",
    "Close Accounts": "#closeAccount_wrapper .Select-noresults",
    "Settlement Account": "#settlementAccount_wrapper .Select-noresults",
    "Redirection Account": "#redirectionAccount_wrapper .Select-noresults",
    "Legal Entity": "#legalEntity_wrapper div[class^='Select-menu-outer']",
    "Statement Delivery Address": "#deliveryAddress_wrapper .Select-noresults",
  };
  await this.checkHTMLText(selector[fieldName], "No Matches Found");
  //await this.attachScreenShot();
});

When(/^The user clicks on the lookup button for "(.*)"$/, async function (fieldName) {
  const selector = {
    "Operating Accounts": "#accountSearch",
    "Closing Accounts": "#closeAccountSearch",
    "Settlement Accounts": "#settlementAccountSearch",
    "Redirection Account": "#redirectionAccountSearch",
    "Legal Entity": "#legalEntitySearch",
    "Copy from Account": "#prePopAcctIdSearch",
    "Interest Redirection Account": "#interestRedirectionAccountSearch",
    "Fees Redirection Account": "#feeRedirectionAccountSearch",
    "Select Account Number": "#accountSearch > i"
  }
  await this.clickElement(selector[fieldName]);
  //await this.attachScreenShot();
});

Then(/^The application will open the Search "(.*)" Lookup Dialog and show all the accounts entitled$/, async function (fieldName) {
  await this.waitForLoading();
  const selector = {
    "Account": "#accountDialogInlineSearch_dialog",
    "Legal Entity": "#accountOwnerDialogInlineSearch_dialog",
    "Search Account": "#accountDialogInlineSearch_dialog",
  };
  await this.checkHTMLText(selector[fieldName] + " div[class*='dialog__header']", "Search " + fieldName);
  //await this.attachScreenShot();
});

When(/^I am selecting an eligible account from Search Account Lookup Dialog$/, async function () {
  await this.clickElement("div#accountDialogInlineSearch_dialog .slick-viewport .slick-row");
});

When(/^I am not selecting an eligible account from Select Account Number Dropdown$/, async function () {
  await this.checkElementExist("#accountContainer #account_wrapper");
});


Then(/^The application shows previously entered details$/, async function () {
  await this.validatePreviousState();
  //await this.attachScreenShot();
});

Then(/^The application shows  in toast for "(.*)"$/, async function (errorType) {
  const error = errorType;
  await this.checkCSSClassExist('#Notification', 'error-notification', true);
  await this.wait(1000);
  //await this.attachScreenShot();
});

When(/^The user decides to close the error toast$/, async function () {
  await this.waitForLoading()
  await this.clickElement("#Notification #Close");
  await this.wait(1000);
});

When(/^The user perform simple click on a service request in the list screen$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#summaryGrid-container > div.slick-viewport > div > div:nth-child(1)");
});

Then(/^The application must present the selected "(.*)" service request in non editable mode as per the field matrix$/, async function (reqType) {
  const selector = {
    "Stop Cheque": "#stopChequeRequest",
    "Order Cheque Book": "#orderChequeBook",
    "Order Deposit Book": "#orderDepositBook",
    "Open Account": "#openAccount",
  }
  await this.waitForLoading()
  await this.checkHTMLText(selector[reqType], reqType + " (AU)");
  await this.checkElementExist('#close');
  //await this.attachScreenShot();
});

Then(/^The application must present the required Actions buttons$/, async function () {
  await this.checkElementExist('#close');
  await this.checkElementExist('#auditHistory');
});

Then(/^The application must present the Summary information sub-section$/, async function () {
  await this.checkElementExist("#requestSummary");
  //await this.attachScreenShot();

});

Then(/^The application must present '(.*)' Request with 'Errors and Alerts' subsection on the View Details screen$/, async function (status) {
  const statusText = status;
  await this.waitForLoading()
  await this.checkElementExist("#errorsAndAlerts");
  //await this.attachScreenShot();
});

When(/^The user navigated to the "Cash Management Service Requests" screen$/, async function () {
  await this.waitForLoading()
});

Then(/^The application must disable the '(.*)' button$/, async function (button) {
  const buttonId = button;
  await this.waitForLoading()
  //await this.attachScreenShot();
});

When(/^The user selects to progress to the "(.*)"$/, async function (paginationTo) {
  const paginationButton = paginationTo === 'Next Record' ? '#nextRecord' : '#prevRecord';
  await this.clickElement(`${paginationButton} button`);
});

Then(/^The application must navigate to the "(.*)" screen$/, async function (screen) {
  if (screen === 'View Service Request List') {
    await this.checkElementExist("#serviceRequests");
    await this.checkElementExist("#summaryGrid-container");
    await this.checkHTMLText('#serviceRequests', "Cash Management Service Requests");
  } else if (screen === 'Service Request View Details') {
    await this.checkElementExist("#auditHistory");
    await this.checkElementExist("#requestSummary");
    await this.checkElementExist("#close");
  } else if (screen === 'Cash Management Service Request') {
    await this.checkHTMLText('#serviceRequest', "Create Service Request");
    await this.checkElementExist("#serviceReqCloseToolbar #cancel");
  }
  //await this.attachScreenShot();
});

Then(/^The application must navigate the user to the Service Request List screen and previous search must be presented$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#serviceRequests');
  //await this.attachScreenShot();
});
Given(/^For Acceptance Criteria "(.*)"$/, async function (tag) {
  const tagId = tag;
});

Then(/^The application shows "(.*)" Page$/, async function (page) {
  const pageName = page;
  //await this.attachScreenShot();
});



Then(/^The application shows "(.*)" (?:|screen|dialog|element|comment|button|sub-section)$/, async function (screen) {
  await this.waitForLoading()
  if (screen === 'Create Service Request') {
    await this.checkElementExist("#serviceRequest");
    await this.checkHTMLText('#serviceRequest', screen);
  } else if (screen === 'Cash Management Service Requests') {
    await this.checkElementExist("#serviceRequests");
    await this.checkElementExist('#addNewBtn > button');
    await this.checkElementExist('#searchToggleBtn > button');
    await this.checkElementExist('#savedSearch > button');
    await this.checkHTMLText('#serviceRequests', screen);
  } else if (screen === 'Manual email modal') {
    await this.waitForLoading()
    await this.checkElementExist("#getEmailDialog-content");
    await this.checkElementExist('#userEmail');
  } else if (screen === 'Add Comment') {
    await this.checkElementExist("#addComment");
  } else if (screen === 'Add new comment / attachment') {
    await this.checkElementExist("#addComment");
  } else if (screen === 'New comment') {
    await this.checkElementExist("label[for='additionalComment']");
  } else if (screen === 'Alert prompt') {
    await this.checkElementExist(".alertMessageConainer");
  } else if (screen === 'Submit') {
    await this.checkElementExist("#submit");
  } else {
    var selector = "//td[contains(text(), '" + screen + "')]"
    var elem = await this.page.$x(selector);
    var elemtxtcontent = await elem[0].getProperty('textContent');
    var txt = await elemtxtcontent.jsonValue()
    assert.notEqual(elemtxtcontent, undefined);
  }
  //await this.attachScreenShot();
});

Then(/^The application does not show "(.*)" (?:|section|screen|button|dialog|element|comment|spinner|)$/, async function (element) {
  await this.waitForLoading()
  var selector = pageobj[element];
  await this.checkElementNotExist(selector);
  //await this.attachScreenShot();
});


When(/^The user enters reference details in Your Reference field$/, async function () {
  await this.waitForLoading()
  await this.sendKeys('input#customerReference', "AUS#Ref123", false);
  //await this.attachScreenShot();
});

When(/^The user selects '(.*)' from Select Account Number Dropdown$/, async function (accountName) {
  await this.waitForLoading()
  await this.clickElement("#accountContainer #account_wrapper");
  await this.sendKeys("#accountContainer #account", accountName, false);
  await this.clickElement("#accountContainer #account_wrapper .Select-option");
  this.setState("account", {
    selector: "#accountContainer #accName",
    value: accountName,
    type: "HTMLText"
  });
});

Then(/^The application will display the Submit Response Dialog with status "(.*)"$/, async function (status) {
  await this.checkElementExist("#submitResponseDialog #okBtn");
  await this.checkHTMLText('#requestStatus', status);
  //await this.attachScreenShot();
});

When(/^The user opens "Advance Search Panel"$/, async function () {
  await this.clickElement('#groupMenuBtn button');
  await this.sendKeys(undefined, 'ArrowDown', true);
  await this.sendKeys(undefined, 'Enter', true);
  await this.clickElement('#searchToggleBtn button');
});

When(/^The user input "(.*)" with '(.*)' in Advance Search Panel$/, async function (field, value) {
  if (field === 'Request Status') {
    const input = value === 'Unsuccessful' ? 'nsuccessful' : value;
    await this.sendKeys('input[aria-label="Request Status"]', input + String.fromCharCode(13), false);

  } else if (field === 'Request Type') {
    await this.sendKeys('input[aria-label="Request Type"]', value + String.fromCharCode(13), false);

  } else if (field === 'Account Name') {
    await this.sendKeys('input[id="accAliasName"]', value + String.fromCharCode(13), false);
    await this.clickElement("input[id='accAliasName']");
    await this.sendKeys(undefined, 'ArrowDown', true);
    await this.sendKeys(undefined, 'ArrowDown', true);
    await this.sendKeys(undefined, 'Enter', true);
    await this.setTextInputValue("accAliasName", value);
  } else if (field === 'Legal Entity') {
    await this.sendKeys('#legalEntityName', value + String.fromCharCode(13), false);
  }
});

When(/^The user Clicks the "Search" button in Advance Search Panel$/, async function () {

  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
});

When(/^The user click the '(.*)' record on a service request in the list screen$/, async function (row) {
  await this.waitForLoading()
  if (row === 'first')
    await this.clickElement(".slick-row[style='top:0px'] .r0");
  else if (row === 'last') {
    await this.clickElement(".slick-row:last-child .r0");
  }
  await this.waitForLoading()
});

Then(/^The Search "(.*)" lookup dialog box must be hidden$/, async function (fieldName) {
  const selector = {
    "Account": "#accountDialogInlineSearch_dialog",
    "Legal Entity": "#accountOwnerDialogInlineSearch_dialog",
    "Settlement Account": "#accountDialogInlineSearch_dialog",
  }
  await this.checkElementNotExist(selector[fieldName]);
  //await this.attachScreenShot();
});

When(/^The user closes the Search "(.*)" dialog box$/, async function (fieldName) {
  await this.clickElement("#accountDialogInlineSearch_dialog #cancelBtn");
});

When(/^The user types in "(.*)" into the Search "(.*)" lookup$/, async function (accountName, fieldName) {
  let selector = "#accountDialogInlineSearchFilterInput";
  if (fieldName === "Legal Entity") {
    selector = "#accountOwnerDialogInlineSearchFilterInput";
  };
  await this.clickElement(selector);
  await this.sendKeys(selector, accountName, false);
  await this.checkElementValue(selector, accountName);
  await this.clickElement("div.slick-cell.l0.r0");
});

Then(/^The application must present the "(.*)" selection dropdown which is defaulted to BLANK$/, async function (reqType) {
  const selector = {
    "Operating Accounts": {
      tag: '#account_wrapper div[class*="styled-autocomplete"]',
      text: 'Select Account Number',
    },
    "Account Details": {
      tag: '#closeAccount_wrapper div[class*="styled-autocomplete"]',
      text: 'Select Account Number',
    },
    "Legal Entity": {
      tag: '#legalEntity_wrapper div[class^="Select-placeholder"]',
      text: 'Select Account Owner',
    },
    "Account Type": {
      tag: '#accountTypeKey',
      text: '',
    }
  };
  await this.checkHTMLText(selector[reqType].tag, selector[reqType].text);
  //await this.attachScreenShot();
});

When(/^The user types "(.*)" into the "(.*)" selection drop down$/, async function (inputVal, wrapper) {
  if (inputVal === "something valid" && wrapper === "Operating Accounts") {
    await this.clickElement("#accountContainer #account_wrapper");
    await this.sendKeys("#accountContainer #account", "1", false);
  } else {
    const containers = {
      "Legal Entity": "#legalEntity_wrapper",
      "Copy from Account": "#prePopAcctId_wrapper",
      "Accounts": "#closeAccount_wrapper",
      "Settlement Account": "#settlementAccount_wrapper",
      "Redirection Account": "#redirectionAccount_wrapper",
      "Operating Accounts": "#account_wrapper",
      "Statement Delivery Address": "#deliveryAddress_wrapper",
    };
    await this.clickElement(containers[wrapper]);
    await this.sendKeys(containers[wrapper] + " div[class^= 'Select-input'] input", inputVal, false);
    await this.clickElement(containers[wrapper] + " .Select-option");
  }
});

When(/^The user select the "(.*)" from the "(.*)" selection drop down$/, async function (fieldName, element) {

  await this.clickElement("i[class='fa fa-chevron-down']");
  await this.sendKeys(element, fieldName, false);
  await this.sendKeys(undefined, 'TAB', false);

});

When(/^The user selects to 'View Audit History' for the service request$/, async function () {
  await this.clickElement("#auditHistory button");
  //await this.attachScreenShot();
});

Then(/^The application must present the audit popup as per the field matrix$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLText("#auditHistoryDialog-title", 'Service Request Audit History');
  //await this.attachScreenShot();
});

When(/^The user selects to close the audit popup$/, async function () {
  await this.clickElement("#auditHistoryDialog button");
});

Then(/^The application must close the audit popup and return the user to the Service Request view detail screen$/, async function () {
  await this.checkElementNotExist('#auditHistoryDialog');
  //await this.attachScreenShot();
});


// Scenario: Service Request List - Grid Filter Action
Then(/^The application shows the "(.*)" button$/, async function (button) {
  const buttonMap = {
    Filter: '#filterToggleBtn',
    Export: '#exportBtn',
    Refresh: '#refreshBtn',
    Group: '#groupMenuBtn',
    cancel: '#cancel'
  };
  await this.checkElementExist(buttonMap[button]);
  //await this.attachScreenShot();
});

When(/^The user types Account Name "(.*)" to the search box in the Search Account Lookup Dialog$/, async function (accountName) {
  await this.waitForLoading()
  await this.clickElement('#accountSearch');
  await this.setTextInputValue(null, accountName, "#accountDialogInlineSearchFilterInput")
});

Then(/^The application (?:|must|should) display error message (?:under|in) "(.*)" (?:component|section|dialog|field|)$/, async function (field, datatable) {
  const data = datatable.rowsHash();
  var selector = pageobj[field];
  await this.checkHTMLText(selector, data['error_message']);
  //await this.attachScreenShot();
});

Then(/^The application (?:|must|should) display  under "(.*)"$/, async function (field) {
  let errorMsg;
  let selector;
  if (field === "Account Short Name") {
    errorMsg = "Account Short Name is mandatory";
    selector = "div[class^=form-text]";
  } else if (field === "Domicile Account Branch") {
    errorMsg = "Select a valid branch for delivery";
    selector = "div[class^=form-text]";
  } else if (field === "Attention To") {
    errorMsg = "Attention To is mandatory";
    selector = "div[class^=form-text]";
  } else if (field === "Statement Delivery Address") {
    errorMsg = "Enter a valid Australian delivery address";
    selector = "div[class^=form-text]";
  } else if (field === "Account Signatories for Any one to sign") {
    errorMsg = "Minimum one signatories required to be added.";
    selector = "#mandatory-error-message";
  } else if (field === "Account Signatories for Any two to sign") {
    errorMsg = "Minimum two signatories required to be added.";
    selector = "#mandatory-error-message";
  }
  await this.checkHTMLTextExist(selector, errorMsg);
  //await this.attachScreenShot();
});

When(/^The user entered "(.*)" in "(.*)" textbox$/, async function (input, dialog) {
  await this.wait(1000);
  var selector = pageobj[dialog];
  console.log(selector +"  "+input);
  //await this.sendKeys(selector, input, false);
  await this.setTextInputValue(null, input, selector);
  await this.waitForLoading()
});

When(/^The user clicks the 'X' icon$/, async function () {
  await this.clickElement("button[data-action='close-dialog']");
});

Then(/^"(.*)" modal window must close$/, async function (lookup) {
  var selector = pageobj[lookup];
  await this.checkElementNotExist(selector);
  //await this.attachScreenShot();
});

When(/^The user searches and selected service request "(.*)"$/, async function (requestId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The element "(.*)" should be (?:|disabled|enabled)$/, async function (toggle, selector) {
  await this.waitForLoading()
  var elem = selector + ':disabled'
  if (toggle == 'disabled')
    await this.checkElementExist(elem)
  else await this.checkElementNotExist(elem)
});

Then(/^The element "(.*)" should have the text "(.*)"$/, async function (selector, text) {
  await this.waitForLoading()
  await this.checkHTMLTextExist(selector, text)
});

Then(/^The application must display the 'Your Reference' section$/, async function () {
  await this.checkElementExist("#customerReferenceContainer div[role='heading'] span");
  await this.checkHTMLTextExist("#customerReferenceContainer div[role='heading'] span", 'Your Reference (Optional)');
  await this.checkElementExist("#customerReference");
  await this.checkHTMLText("#customerReferenceField2", "Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; .")
});

Then(/^The application should allow only valid characters in the reference field$/, async function (table) {
  const data = table.rowsHash();
  await this.waitForLoading()
  await this.sendKeys('#customerReference', data['ValidData'], false);
  //await this.attachScreenShot();
});

Then(/^The application should not allow more than 40 characters in the reference field$/, async function (table) {
  const data = table.rowsHash();
  await this.waitForLoading()
  await this.sendKeys('#customerReference', data['MoreThan40InputData'], false);
  await this.checkElementValue("#customerReference", data['MoreThan40AcceptedData']);
  await this.sendKeys('#customerReference', '', false);
  //await this.attachScreenShot();
});

Then(/^The application should not allow unsupported characters in the reference field$/, async function (table) {
  const data = table.rowsHash();
  await this.waitForLoading()
  await this.sendKeys('#customerReference', '', false);
  await this.sendKeys('#customerReference', data['InvalidCharacters'], false);
  await this.checkHTMLTextExist("#customerReference");
  //await this.attachScreenShot();
});

Then(/^The user search and selected service request "(.*)"$/, async function (requestId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The application should display "(.*)" sub-section$/, async function (component) {
  await this.waitForLoading()
  await this.checkHTMLText('#transactionManualEntryContainer div[role="heading"] span', 'Comments and Supporting Documents');
  await this.checkHTMLText("#additionalCommentLabel", "Please ensure that all required comments and attachments are included before clicking submit");
  await this.checkHTMLText("#additionalCommentTitle", "New comment / attachment");
  await this.checkHTMLText("#additionalComment-field  div > div > label", "Max 400 characters");
  await this.checkElementExist('#submit');
  //await this.attachScreenShot();
});

Then(/^The service request is in a status of "(.*)"$/, async function (status) {
  await this.waitForLoading()
  await this.checkHTMLText("#summery-label-3", status);
  //await this.attachScreenShot();
});


Then(/^The audit history table should displayed in a model$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist("#auditHistoryDialog-title", 'Service Request Audit History');
  await this.checkElementExist("#auditHistoryDialog button");
  //await this.attachScreenShot();
});

Then(/^The values should be displayed in sort order$/, async function () {
  //await this.attachScreenShot();
});

Then(/^The application should display 'Important Information' details at the bottom of the "(.*)" screen$/, async function (serviceType, table) {
  const data = table.rowsHash();
  let selector = "";
  await this.checkHTMLText('#importantInfoContainer div[role="heading"] span', 'Important Information');
  await this.checkElementExist('input[name*="importantInformationCheckBox"]');
  if (serviceType === "Trace a Transaction") {
    selector = "#importantInfoContainerContent > div > label";
    await this.checkHTMLText(selector, data['imp_info']);
  } else if (serviceType === "Add a user") {
    selector = "#importantInfoContainerContent > div > div > label";
  }
});

Then(/^The application should display "(.*)" checkbox is NOT checked by default$/, async function (inputval) {
  await this.waitForLoading()
  assert.equal(false, await this.page.$eval('input[name*="importantInformationCheckBox"]', input => {
    return input.checked
  }));
});

Then(/^The user searches stored service request (with|without) request type "(.*)" and selects it$/, async function (toggle, reqtype) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn button');
  var requestId = await this.getId()
  await this.waitForLoading()
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  if (toggle == 'with') {
    await this.setTextInputValue(null, reqtype, 'input[aria-label="Request Type"]');
  }
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The user searches the stored service request (with|without) request type "(.*)" search req type "(.*)" and selects it$/, async function (toggle, reqtype, sreqtype) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn');
  var requestId = srobj[reqtype];
  await this.waitForLoading()
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  await this.setTextInputValue(null, sreqtype, 'input[aria-label="Request Type"]');
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The request id is stored from the element "(.*)"$/, async function (elem) {
  var sel = '#' + elem
  var text = await this.getHTMLText(sel)
  var id = text.substring(text.indexOf("TG"), text.length)
  await this.setId(id)
});

Then(/^The "(.*)" for the "(.*)" is detail is saved to a file$/, async function (elem, reqtype) {
  var sel = '#' + elem
  var text = await this.getHTMLText(sel)
  var rid = text.substring(text.indexOf("TG"), text.length)
  'use strict';
  const fs = require('fs');
  var data = require('..//support//ServiceRequestDetails.json');
  // data.Servicerequests.push({ // the value that need to be appended
  // //  data.push({ // the value that need to be appended
  //   [reqtype]:rid
  //   });
  //data.Servicerequests.push({ // the value that need to be appended
  // data.Servicerequests.push({ // the value that need to be appended
  data[reqtype] = rid;
  // });
  let txt = JSON.stringify(data);
  var basepath = path.join(process.cwd());
  fs.writeFileSync(basepath + '//features//support//ServiceRequestDetails.json', txt);
});


Then(/^The previously stored service request values are cleared in the file$/, async function () {
  'use strict';
  const fs = require('fs');
  var data = {};
  let txt = JSON.stringify(data);
  var basepath = path.join(process.cwd());
  fs.writeFileSync(basepath + '//features//support//ServiceRequestDetails.json', txt);
});

Then(/^The application should allow user to select and upload single file$/, async function (table) {
  await this.waitForLoading()
  const data = table.rowsHash();
  const filePath = path.join(process.cwd() + data['filepath']);
  await this.upload(".dropzone input[type=file]", filePath);
  //await this.attachScreenShot();
});

Then(/^The application should displays the following information for each Case Note under 'Comments and Supporting Documents' section$/, async function (table) {
  const data = table.rowsHash();
  await this.waitForLoading()
  await this.checkElementExist("#additionalCommentsTableContainerContent > div > table > tbody > tr:nth-child(1) > td:nth-child(1)", data['Date']);
  await this.checkHTMLText("#additionalCommentsTableContainerContent > div > table > tbody > tr:nth-child(1) > td:nth-child(2)", data['Added by']);
  await this.checkElementExist("#additionalCommentsTableContainerContent > div > table > tbody > tr:nth-child(1) > td:nth-child(3)", data['Comments']);
  await this.checkElementExist("#additionalCommentsTableContainerContent > div > table > tbody > tr:nth-child(1) > td:nth-child(4)", data['Attachments']);
  //await this.attachScreenShot();
});


Then(/^The user update the service request status with following details$/, async function (dataTable) {
  const data = dataTable.rowsHash();
  var requestId = await this.getId()
  this.statusUpdate(requestId, data['status'], data['requestStatus']);
});

Then(/^The user (?:|reload|refresh) "(.*)" page$/, async function (dataTable) {
  await this.waitForLoading(50000)
  await this.reload();
});

Then(/^The user searches stored service request and selects it$/, async function () {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn button');
  var requestId = await this.getId()
  await this.waitForLoading()
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});


Then(/^The user confirm "reopen" dialog$/, async function () {
  await this.confirmdialog()
});



Then(/^The application should display the "(.*)" toast notification$/, async function (status) {

  if (status == 'Approve') {
    var requestId = await this.getId()
    const alertMessage = "Service Request ID" + ' ' + requestId + ' ' + "has been approved and submitted to the bank.";
    //await this.page.waitFor(2000);
    await this.page.waitForSelector("#Notification");
    var selector = "#Notification"
    await this.checkHTMLText(selector, alertMessage);
  }
  if (status == 'SingleApprove') {
    var requestId = await this.getId()
    const alertMessage = "Service Request ID" + ' ' + requestId + ' ' + "has been approved.";
    //await this.page.waitFor(2000);
    await this.page.waitForSelector("#Notification");
    var selector = "#Notification"
    await this.checkHTMLText(selector, alertMessage);
  }
  if (status == 'Reject') {
    var requestId = await this.getId()
    const alertMessage = "Service Request ID" + ' ' + requestId + ' ' + "has been rejected.";
    //await this.page.waitFor(2000);
    await this.page.waitForSelector("#Notification");
   var selector = "#Notification"
    await this.checkHTMLText(selector, alertMessage);
  }
  if (status == 'Approval Successful') {
    var requestId = await this.getId()
    const alertMessage = "Approval Successful";
   // await this.page.waitFor(2000);
   await this.page.waitForSelector("#Notification");
    var selector = "#Notification"
    await this.checkHTMLText(selector, alertMessage);
  }
  if (status == 'Rejection Successful') {
    var requestId = await this.getId()
    const alertMessage = "Rejection Successful";
    //await this.page.waitFor(4000);
    await this.page.waitForSelector("#Notification");
    var selector = "#Notification"
    await this.checkHTMLText(selector, alertMessage);
  }
});

Then(/^The user update the service request cobraAdminModel with following details$/, async function (dataTable) {
  const data = dataTable.rowsHash();
  var requestId = await this.getId()
  this.approvalModelUpdate(requestId, data['cobraAdminModel']);
});

When(/^The user click on the postDate and selected date range$/, async function () {
  await this.clickElement("#postDate-field button")
  var ele = await this.page.$x("//div[contains(text(),'Date Range')]");
  await ele[0].click()
});

When(/^The user double click on "Transaction_Results_Row1" from search result Grid$/, function (rowElement) {
  var selector = pageobj[rowElement];
  this.page.evaluate(() => {
    document.querySelector(selector).dbclick();
  });
});


When(/^The user enter "(.*)" into the beneficiaryAmount field$/, async function (inputVal, fieldName) {
  var selector = pageobj[fieldName];
  await this.setTextInputValue(null, inputVal, selector);
  //await this.attachScreenShot();
});



Then(/^The user picking the "(.*)" from calender$/, async function (closedate) {
  var date = new Date();
  if (date !== undefined && date !== "") {
    var myDate = new Date(date);
    var month = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ][myDate.getMonth()];
    var date = myDate.getDate() + 1;
    if (date < 10) date = '0' + date;
    var selector = pageobj[closedate];
    var closeDate = date + '/' + "0" + (myDate.getMonth() + 01) + '/' + myDate.getFullYear();
    if (date => 31) date = '01';
    var closeDate = date + '/' + "0" + (myDate.getMonth() + 02) + '/' + myDate.getFullYear();
    console.log(" closeDate "+ closeDate);
    await this.setTextInputValue(null, closeDate, selector);
  
 //   if (process.env.NODE_ENV != 'local') {
      
  //    } else  {
  //      var closeDate = date + '/' + "0" + (myDate.getMonth() + 01) + '/' + myDate.getFullYear();
   
    //    console.log(" closeDate "+ closeDate);
    //         await this.setTextInputValue(null, closeDate, selector);
    //await this.sendKeys(selector, closeDate, false);
    // await this.sendKeys(undefined, 'TAB', false);
 
  
}

});


Then(/^The application should displays "(.*)" disabled$/, async function (element) {
  let disabledChekbox = false;
  var selector = pageobj[element];
  disabledChekbox = await this.page.$(selector);
  assert(disabledChekbox)
});
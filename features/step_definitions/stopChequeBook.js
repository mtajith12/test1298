const { Given, When, Then } = require("cucumber");


// Scenario: Stop Cheque Book - Enter Details
Then(/^The application shows the "Cheque Book" section fields$/, async function () {
  const requestType = 'RANGE';
  await this.checkElementValue("input[type='radio']:checked", requestType);
  await this.checkElementExist("#chqBookSize");
  await this.checkElementExist("#serialNumberFirstFour");
  await this.checkElementExist("#serialNumberLastTwo");
  await this.checkElementExist("#chqEndSerialNum");
  await this.checkElementExist("#note");
  await this.checkElementExist("button[id ='reviewAndSubmit']");
  //await this.attachScreenShot();
});


// Scenario: Stop Cheque Book - Field Validation
Then(/^The application show error message on "Cheque Book Size" & "First Serial Number" field$/, async function () {
  await this.checkCSSClassExist('#chequeBookDetailsContainer #serialNumberLastTwo', 'form-control--has-error', true);
  await this.checkCSSClassExist('#chequeBookDetailsContainer #chqBookSize', 'form-control--has-error', true);
  //await this.attachScreenShot();
});


// Scenario: Cheque Book - Successful Request
When(/^I am entering value "(.*)" in "First Serial Number"$/, async function (input) {
  await this.setTextInputValue('serialNumberFirstFour', input);
});

When(/^I am selecting "(.*)" in "Cheque Book Size"$/, async function (input) {
  await this.setTextInputValue('chqBookSize', input);
});
Then(/^The application accepts input and move to Stop Cheque Book submission Review Page$/, async function () {
  await this.checkElementExist("#accountContainer");
  await this.checkElementExist("#requestTypeContainer");
  await this.checkElementExist("#chequeBookDetailsContainer");
  await this.checkElementExist("#previous");
  await this.checkElementExist("#submit");
  //await this.attachScreenShot();
});

// Scenario: Stop Cheque Book - View
Then(/^The application present "(.*)" in Itemised Report$/, async function (reportType) {
  const report = reportType;
  await this.waitForLoading();
  await this.checkElementExist("#chequeTableContainer");
  //await this.attachScreenShot();
});

//DIGS - 634
Then(/^The application must present Cheque Details table with label as "(.*)" and the message "(.*)" below$/, async function (headingLabel, message) {
  await this.checkElementExist("#chequeTableContainer");
  await this.checkHTMLText("#chequeTableContainer div[role='heading'] span", headingLabel);
  await this.checkHTMLText("#chequeTableContainer #chequeTableWarning", message);
  //await this.attachScreenShot();
});

Then(/^Cheque Details has Add and Remove buttons$/, async function () {
  await this.checkElementExist("#chequeTableContainer #add");
  await this.checkElementExist("#chequeTableContainer #remove");
  //await this.attachScreenShot();
});

Then(/^A new row is added to the Cheque Details table$/, async function () {
  await this.checkElementExist("#chequeDetail-2");
  //await this.attachScreenShot();
});

When(/^The user selects all rows from the Cheque Details table$/, async function () {
  await this.clickElement("input[name='selectAllCheques']");
});

Then(/^The Cheque Details Table must be updated with a blank row$/, async function () {
  await this.checkElementExist("#chequeTableContainerContent #chqNum1");
  await this.checkElementValue("#chequeTableContainerContent #chqNum1", "");
  await this.checkElementExist("#chequeTableContainerContent #chqAmt1");
  await this.checkElementValue("#chequeTableContainerContent #chqAmt1", "");
  await this.checkElementExist("#chequeTableContainerContent #chqIssDt1");
  await this.checkElementValue("#chequeTableContainerContent #chqIssDt1", "");
  await this.checkElementExist("#chequeTableContainerContent #payeeName1");
  await this.checkElementValue("#chequeTableContainerContent #payeeName1", "");
  await this.checkElementExist("#chequeTableContainerContent #note1");
  await this.checkElementValue("#chequeTableContainerContent #note1", "");
  //await this.attachScreenShot();
});

When(/^I am selecting "(.*)" from "First Serial Number" select dropdown$/, async function (val) {
  await this.setSelectInputValue("serialNumberLastTwo", val);
});

Then(/^The application show error message on "(.*)" field$/, async function (field) {
  if (field === "Cheque Book Size") await this.checkCSSClassExist("#chqBookSize", "form-control--has-error", true);
  else if (field === "First Serial Number") await this.checkCSSClassExist("#serialNumberLastTwo", "has-error", true);
  //await this.attachScreenShot();
});

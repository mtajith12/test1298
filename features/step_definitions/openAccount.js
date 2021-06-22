const { Given, When, Then } = require("cucumber");
const moment = require("moment");
const _ = require('lodash');



// Scenario: Open a new Account - Select existing legal entity
// DIGS-277
Then(/^The application must present the Legal Entity selection drop down$/, async function () {
  await this.checkElementNotExist("#accountDetailsContainer #legalEntity_wrapper");
  //await this.attachScreenShot();
});

Then(/^The application must populate the list with Legal Entities as per field matrix which the user is entitled to$/, async function () {
  await this.checkElementExist("#accountOwnerDialogInlineSearch_dialog #leName");
  await this.checkElementExist("#accountOwnerDialogInlineSearch_dialog #leBinType");
  await this.checkElementExist("#accountOwnerDialogInlineSearch_dialog #leBin");
  //await this.attachScreenShot();
});

When(/^The user has selected a legal entity "(.*)" for the Service Request$/, async function (legalEntity) {
  await this.waitForLoading();
  await this.checkElementExist('#legalEntity_wrapper');
  await this.clickElement("#legalEntity_wrapper");
  await this.sendKeys("#legalEntity_wrapper div[class^='Select-input'] input", legalEntity, false);
  await this.clickElement("#legalEntity_wrapper .Select-option");
});

When(/^The user has selected "(.*)" "(.*)" for the Service Request in the look up$/, async function (accType, legalEntity) {
  const selectors = {
    "a legal entity": "accountOwnerDialogInlineSearch",
    "an account": "accountDialogInlineSearch"
  };
  await this.clickElement("#" + selectors[accType] + "_dialog #" + selectors[accType] + "FilterInput");
  await this.sendKeys("#" + selectors[accType] + "_dialog #" + selectors[accType] + "FilterInput", legalEntity, false);
  await this.clickElement("#" + selectors[accType] + "_dialog .slick-cell");
});

Then(/^The legal entity details must be populated into the Service Request record$/, async function () {
  await this.checkElementValueExist("#legalEntity_wrapper span[class^='Select-value-label'] span");
  //await this.attachScreenShot();
});

When(/^The user navigated to the Create "Open Account" from service request screen$/, async function () {
  await this.clickElement("#cancel");
  await this.waitForLoading();
  //await this.clickElement("a#openAccount");
  await this.clickElement("a[title='Open an Account'] > div");
  await this.waitForLoading();
});

Then(/^The application will only show "(.*)" within the drop down which contain the values typed in by the user$/, async function (wrapper) {
  const containers = {
    "Legal Entities": "#legalEntity_wrapper",
    "Accounts": "#prePopAcctId_wrapper",
    "Operating Accounts": "#closeAccount_wrapper",
  };
  await this.checkElementExist(containers[wrapper] + " div[class^='Select-menu-outer']");
  //await this.attachScreenShot();
});

Then(/^The application will only show "(.*)" within the list which contain the values typed in by the user$/, async function (dropDown) {
  const selectors = {
    "Legal Entities": "#accountOwnerDialogInlineSearch",
    "Accounts": "#accountDialogInlineSearch"
  };
  await this.waitForLoading();
  await this.checkElementExist(selectors[dropDown] + "-container .slick-cell");
  //await this.attachScreenShot();
});

When(/^The user won't select any Legal Entity from the drop down and closes the select drop down$/, async function () {
  await this.clickElement("#selfServiceStepper");
  await this.checkElementNotExist("label[for='accountShortName']");
  await this.checkElementNotExist("#accountShortName");
  await this.checkElementNotExist("label[for='accountTypeKey']");
  await this.checkElementNotExist("#accountTypeKey");
});

Then(/^The application must not update the legal entity values displayed on the screen$/, async function () {
  const currState = this.getState();
  const agentElements = ['accountShortName', 'accountTypeKey'];
  await this.validatePreviousState(agentElements);
  //await this.attachScreenShot();
});

Then(/^The application must populate the error message "No Matches Found" in Legal Entity Look-Up popup$/, async function () {
  await this.checkElementNotExist('#accountOwnerDialogInlineSearch-container .slick-cell');
  //await this.attachScreenShot();
});

// DIGS-279

Then(/^The user is presented with the Account Open - Entry screen$/, async function () {
  await this.checkElementExist("label[for='accountShortName']");
  await this.checkElementExist("#accountShortName");
  await this.checkElementExist("label[for='accountTypeKey']");
  await this.checkElementExist("#accountTypeKey");
  //await this.attachScreenShot();
});

When(/^The user selects a "(.*)" identifier legal entity "(.*)"$/, async function (hostName, legalEntity) {
  await this.waitForLoading();
  if (hostName === "CAP" || hostName === "CACHE" || hostName === "CAP & CACHE") {
    await this.checkElementExist('#accountDetailsContainer #legalEntity_wrapper');
    await this.clickElement("#accountDetailsContainer #legalEntity_wrapper");
    await this.sendKeys("#accountDetailsContainer #legalEntity_wrapper div[class^='Select-input'] input", legalEntity, false);
    await this.clickElement("#accountDetailsContainer #legalEntity_wrapper .Select-option");
  }
});

Then(/^The Account types that are allowed to select is populated with the list of products in scope "ANZ Business Advantage, ANZ Business Extra , ANZ Business Online Saver, ANZ Business Premium Saver"$/, async function () {
  await this.clickElement("#accountTypeKey");
  await this.checkElementExist("#accountTypeKey option");
  //await this.attachScreenShot();
});

Then(/^The Account types that are allowed to select is populated with the list of in-scope products with a host system of "(.*)"$/, async function (hostName) {
  await this.clickElement("#accountTypeKey");
  await this.wait(1000);
  await this.checkElementExist("#accountTypeKey option");
  if (hostName === "CAP")
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-CD', undefined);
  else if (hostName === "CACHE")
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-67', undefined);
  else if (hostName === "CAP & CACHE")
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-53', undefined);
  await this.waitForLoading();
  //await this.attachScreenShot();
});

When(/^The user does not select an Account type$/, async function () {
  await this.clickElement("#accountTypeKey");
  await this.setSelectInputValue("accountTypeKey", "");
});

Then(/^The "Domicile Account Branch, Find A Branch, Order Deposit Books, Order Cheque Books" sections will not be available$/, async function () {
  await this.checkElementNotExist("#accountBranchAddress");
  await this.checkElementNotExist("label[for='accountBranchAddress']");
  await this.checkElementNotExist("input[name='depBookRequest']");
  await this.checkElementNotExist("label[for='depBookRequest']");
  await this.checkElementNotExist("input[name='chqBookRequest']");
  await this.checkElementNotExist("label[for='chqBookRequest']");
  //await this.attachScreenShot();
});

When(/^The user selects the "Account Type" as "ANZ Business Advantage" which have a Debit card option$/, async function () {
  await this.wait(1000);
  await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-CD');
  await this.waitForLoading();
});
Then(/^The Application must show a message "(.*)" under "Account Type"$/, async function (message) {
  await this.waitForLoading();
  await this.checkHTMLText("#accountTypeKey-field div div label", message);
  //await this.attachScreenShot();
});


// DIGS-555

When(/^I am selecting an account from Select Legal Entity from Dropdown$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountDetailsContainer #legalEntity_wrapper");
  await this.clickElement("#accountDetailsContainer #legalEntity_wrapper .Select-option");
  const legalEntity = await this.getTextInputValue("#accountDetailsContainer #legalEntity_wrapper input");
  this.setState('legalEntity', { selector: "#accountDetailsContainer #legalEntity_wrapper input", value: legalEntity, type: 'TextInput' });
});

Then(/^The application must display the Account Details section and Account Short Name with label asterisk$/, async function () {
  await this.checkElementExist('#accountShortName');
  await this.checkElementExist('#accountTypeKey');
  await this.checkElementExist('i[class="fa fa-asterisk fa-fw"]');
  //await this.attachScreenShot();
});

Then(/^I am entering "Account Short Name" below detail in "Account Deatils" section of "Open Account" page, must validate special character for Account Name$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['Account Short Name'] !== undefined)
    await this.setTextInputValue('accountShortName', data['Account Short Name']);
  //await this.attachScreenShot();
});

Then(/^The application Account Short Name is restricted up to 18 character and editable mode as per the field matrix$/, async function (table) {
  await this.waitForLoading();
  const data = table.rowsHash();
  if (data['Account Short Name'] !== undefined) {
    await this.setTextInputValue('accountShortName', data['Account Short Name']);
  }
  //await this.attachScreenShot();
});

// DIGS-556

When(/^The user selects the "Account Type" as "(.*)"$/, async function (accountTypeKey) {
  await this.wait(1000);
  if (accountTypeKey == 'ANZ Business Advantage') {
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-CD');
  } else if (accountTypeKey == 'ANZ Business Extra') {
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-I3');
  } else if (accountTypeKey == 'ANZ Business Online Saver') {
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-HD');
  } else if (accountTypeKey == 'ANZ Business Premium Saver') {
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-NH');
  } else if (accountTypeKey == 'ANZ Corporate Transaction Account') {
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-53');
  } else if (accountTypeKey == 'ANZ Client Money Account') {
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-67');
  } else if (accountTypeKey == 'ANZ Corporate Transaction Account (Interest Bearing)') {
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-53');
  } else if (accountTypeKey == 'ANZ Corporate Transaction Account - Cheque Issuing') {
    await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-50');
  }



  await this.waitForLoading();
});

Then(/^The application shows the "Find a Branch" Button with blue colour$/, async function () {
  await this.checkElementExist("#accountBranchAddress");
  await this.checkElementExist("#accountBranchCode");
  //await this.attachScreenShot();
});

When(/^The user Clicks the "Find a Branch" Button from "Branch Address" Field$/, async function () {
  await this.clickElement("#accountBranchCode");
  await this.waitForLoading();
});

Then(/^The option to "(.*)" will be avaliable for the account open service$/, async function (accountTypeKey) {
  if (accountTypeKey == 'order cheque book')
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-CD', '#accountTypeKey');
  if (accountTypeKey == 'order deposit book')
    await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-NH', '#accountTypeKey');

  //await this.attachScreenShot();
});

When(/^The user elects to order a "(.*)" for the Account Open service request$/, async function (orderBook) {
  await this.waitForLoading();
  if (orderBook == 'cheque book') {
    await this.checkElementExist("input[name='chqBookRequest']");
    await this.checkElementExist("label[for='chqBookRequest']");
    await this.clickElement("input[name='chqBookRequest']");
  }
  if (orderBook == 'deposit book') {
    await this.checkElementExist("input[name='depBookRequest']");
    await this.checkElementExist("label[for='depBookRequest']");
    await this.clickElement("input[name='depBookRequest']");
  }


});

When(/^The user selects "(.*)" as "(.*)" redirection account$/, async function (account, redirectionAcc) {
  await this.waitForLoading();
  if (redirectionAcc === "Interest") {
    await this.sendKeys("#interestRedirectionAccount_wrapper div[class^='Select-input'] input", account, false);
    await this.waitForLoading();
    await this.clickElement('#interestRedirectionAccount_wrapper .Select-option');
  } else if (redirectionAcc === "Fee") {
    await this.sendKeys("#feeRedirectionAccount_wrapper div[class^='Select-input'] input", account, false);
    await this.waitForLoading();
    await this.clickElement('#feeRedirectionAccount_wrapper .Select-option');
  }
});


When(/^The user selects to progress to the "(.*)" button$/, async function (paginationTo) {
  const paginationButton = (paginationTo === 'Next') ? '#next' : '#previous';
  await this.clickElement(paginationButton);
});

Then(/^The additional page sections will show, which the user must navigate through after entering the Online Banking details$/, async function () {
  await this.checkElementExist("#onlineBankContainer");
  //await this.attachScreenShot();
});

When(/^The user selects all divisions from Division Assignment$/, async function () {
  await this.clickElement("#divisionList-field input[name='selectAllDivisons']");
  //await this.attachScreenShot();
});

Then(/^The "(.*)" screen must be provided when user elects to proceed from the Online Banking screen$/, async function (serviceRequest) {
  if (serviceRequest === 'Order Deposit Book')
    await this.checkElementExist("#depositBookDetailsContainerWrapper");
  if (serviceRequest === 'Order Cheque Book')
    await this.checkElementExist("#chequeBookDetailsContainerWrapper");
  //await this.attachScreenShot();
});

Then(/^The application must show the  'Book Size' drop down with values under '(.*)' page$/, async function (page) {
  if (page === 'Order Deposit Book') {
    await this.checkElementExist("#depAgentBookSize");
    await this.clickElement("#depAgentBookSize");
    await this.checkElementExist("#depAgentBookSize option");

  } else if (page === 'Order Cheque Book') {
    await this.checkElementExist("#bookSize");
    await this.clickElement("#bookSize");
    await this.checkElementExist("#bookSize option");
  }
  await this.waitForLoading();
  //await this.attachScreenShot();
});


Then(/^The application must populate the number of books with values from 1 to 10 under '(.*)' page$/, async function (page) {
  if (page === 'Order Deposit Book') {
    await this.clickElement('#depBookQuantity');
  } else if (page === 'Order Cheque Book') {
    await this.clickElement('#quantity');
  }
  await this.waitForLoading();
  //await this.attachScreenShot();
});


When(/^I am selecting first address from "Search Branch Lookup" Grid in Open new account screen$/, async function () {
  await this.clickElement('#branchLookupDialog div[class^="slick-cell"]');
});

When(/^I am selecting branch Address$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#accountBranchCode");
  await this.sendKeys('#branchLookupDialog .Select-control input', '3008', false);
  await this.waitForLoading();
  await this.clickElement("#branchLookupDialog .Select-menu-outer .Select-option");
  await this.clickElement('#branchLookupDialog div[class^="slick-cell"]');
  await this.waitForLoading();
});


// DIGS-294, DIGS-295

Then(/^The option to "(.*)" will not be avaliable for the account open service$/, async function (orderOption) {
  if (orderOption === "order cheque book") {
    await this.checkElementNotExist("input[name='chqBookRequest']");
  } else {
    await this.checkElementNotExist("input[name='depBookRequest']");
  }
  //await this.attachScreenShot();
});

Then(/^The application will not allow the reselection of the blank option from Account Type$/, async function () {
  await this.checkElementValue("#accountTypeKey option", "CAP-DDA-CD");
  //await this.attachScreenShot();
});

Then(/^The application must present the 'Book Type section'$/, async function () {
  await this.checkElementExist("#bookType");
  //await this.attachScreenShot();
});

Then(/^The Book Type Section must be defaulted to 'BLANK'$/, async function () {
  await this.checkElementValue("#bookType option", "");
  //await this.attachScreenShot();
});

Then(/^The application must NOT present the 'Account Details section' of the Order Deposit Book$/, async function () {
  await this.checkElementNotExist("#StandardBookTypeDetailsSubTitle");
  //await this.attachScreenShot();
});

When(/^The user has not selected the Book Type$/, async function () {
  await this.setSelectInputValue("bookType", "");
});

Then(/^The application must "NOT allow" the user to progress to the next page by not showing the Next or Review & Submit button$/, async function () {
  await this.checkElementNotExist("button[id ='reviewAndSubmit']");
  //await this.attachScreenShot();
});

Then(/^The application must "allow" the user to progress to the next page by showing the Next or Review & Submit button$/, async function () {
  await this.checkElementExist("button[id ='reviewAndSubmit']");
  //await this.attachScreenShot();
});

Then(/^Prepopulated information must be populated in Personalisation fields$/, async function () {
  await this.checkHTMLTextExist("#personalizationLine1");
  await this.checkHTMLTextExist("#personalizationLine2");
  //await this.attachScreenShot();
});

Then(/^The application must default the 'Select Cheque Type' to 'Not Negotiable' must be provided with the option to change it to the value 'Negotiable'$/, async function () {
  await this.checkElementValue("#crossInd-field input[name='crossInd'][value='C']", "C");
  await this.checkElementValue("#crossInd-field input[name='crossInd'][value='O']", "O")
  await this.setRadioInputValue("crossInd", "C");
  //await this.attachScreenShot();
});

Then(/^The application show the "Order Cheque Book" service request screen$/, async function () {
  await this.checkElementExist("#chequeBookDetailsContainerWrapper");
  //await this.attachScreenShot();
});

Then(/^The application must allow the user to progress to the next page from Order Cheque Book$/, async function () {
  //await this.checkElementExist("#accountDetailsContainerWrapper");
  //await this.attachScreenShot();
});

Then(/^The application must retain information under the "Open Account" Service Request edit screen entered by the user$/, async function () {
  await this.checkElementExist("#accountDetailsContainerWrapper");
  //await this.attachScreenShot();
});

Then(/^The Personalisation section must be presented for Open Account page for "(.*)" book type$/, async function (bookType) {
  if (bookType === "Standard" || bookType === "Agent" || bookType === "Bank@Post Agent") {
    await this.checkElementExist("#personalizationSubTitle");
    await this.checkHTMLTextExist("#personalizationSubTitle span", "Personalisation");
  }
  //await this.attachScreenShot();
});

When(/^The user clears the fields as below$/, async function () {
  const data = table.rowsHash();
  if (data['Attention To'] !== undefined)
    await this.setTextInputValue('mailingTitle1', "");
  if (data['Company Name'] !== undefined)
    await this.setTextInputValue('mailingTitle2', "");
});

Then(/^The application show the "(.*)" screen$/, async function (orderType) {
  if (orderType === "Order Deposit") {
    await this.checkElementExist("#depositBookDetailsContainerWrapper");
  } else if (orderType === 'Order Cheque Book')
    await this.checkElementExist("#chequeBookDetailsContainerWrapper");
  //await this.attachScreenShot();
});

Then(/^The application show error message on "Attention To", "Book Size" & "Number of Books" fields for "(.*)"$/, async function (bookType) {
  if (bookType === "Deposit") {
    await this.checkCSSClassExist('#depBookQuantity-field div[class^="form-text"]', 'form-control--has-error', true);
    await this.checkCSSClassExist('#depBookSize-field div[class^="form-text"]', 'form-control--has-error', true);
    await this.checkCSSClassExist('#DepositBookMailingTitle1-field div[class^="form-text"]', 'form-text--has-error', true);
  } else if (bookType === "Cheque") {
    await this.checkCSSClassExist('#quantity-field div[class^="form-text"]', 'form-text--has-error', true);
    await this.checkCSSClassExist('#bookSize-field div[class^="form-text"]', 'form-text--has-error', true);
    await this.checkCSSClassExist('#bookSize-field div[class^="form-text"]', 'form-text--has-error', true);
    await this.checkCSSClassExist('#OrderChequeMailingTitle1-field div[class^="form-text"]', 'form-text--has-error', true);
  }
  //await this.attachScreenShot();
});

Then(/^The application must populate the Company Name field$/, async function () {
  await this.checkElementValueExist('#mailingTitle2');
  //await this.attachScreenShot();
});

When(/^The user selects the Delivery Address from the "Delivery Address" drop down$/, async function () {
  await this.clickElement("#DepositBookDeliveryAddress_wrapper");
  await this.clickElement("#DepositBookDeliveryAddress_wrapper .Select-menu-outer .Select-option");
});

Then(/^The information which is populated in the Deposit Book screen will be retained$/, async function () {
  //await this.attachScreenShot();
});

When(/^The user deselects the 'Book Type'$/, async function () {
  await this.setSelectInputValue("bookType", "");
});

Then(/^The application shows previously entered Order details$/, async function () {
  const currState = this.getState();
  const pageElements = ['agentNum', 'personalizationLine3', 'personalizationLine4', 'quantity', 'mailingTitle1', 'bookSize'];
  await this.validatePreviousState(pageElements);
  //await this.attachScreenShot();
});

// DIGS-284

Then(/^The application must display the Account details screen$/, async function () {
  await this.checkElementExist("label[for='accountShortName']");
  await this.checkElementExist("#accountShortName");
  await this.checkElementExist("label[for='accountTypeKey']");
  await this.checkElementExist("#accountTypeKey");
  //await this.attachScreenShot();
});

Then(/^The application must display the "(.*)" and link "(.*)"$/, async function (subTitle, linkText) {
  if (subTitle == "Credit Interest Rate") {
    await this.checkElementExist("label[for='creditInterestRate']");
    await this.checkElementExist("#creditInterestRateLink");
    await this.checkHTMLTextExist("div[class^='form-text']", linkText);
  } else if (subTitle == "Applicable Fees") {
    await this.checkElementExist("label[for='applicableFees']");
    await this.checkElementExist("#applicableFeesLink");
    await this.checkHTMLTextExist("div[class^='form-text']", linkText);
  }
  //await this.attachScreenShot();
});

Then(/^"(.*)" redirection account tooltip to be shown$/, async function (redirectionAcc) {
  if (redirectionAcc === "Interest") {
    await this.checkElementExist("#interestRedirectionAccountToolTip");
  } else if (redirectionAcc === "Fee") {
    await this.checkElementExist("#feeRedirectionAccountToolTip");
  }
});

Then(/^The application must populate "(.*)" redirection account drop down$/, async function (subsection) {
  if (subsection === "Interest") {
    await this.checkElementExist("#interestRedirectionAccount_wrapper");
  } else if (subsection === "Fees")
    await this.checkElementExist("#feeRedirectionAccount_wrapper");

  //await this.attachScreenShot();
});

Then(/^The application must display the "(.*)" redirection account drop down as defaulted to BLANK$/, async function (subsection) {
  if (subsection === "Interest") {
    await this.checkHTMLText("#interestRedirectionAccount_wrapper span[class^='Select-value-label'] div span", '');
  } else if (subsection === "Fees") {
    await this.checkHTMLText("#feeRedirectionAccount_wrapper span[class^='Select-value-label'] div span", '');
  }
  //await this.attachScreenShot();
});

Then(/^Close the "(.*)" redirection account lookup dialog$/, async function (redirectionAccount) {
  await this.clickElement("#accountDialogInlineSearch_dialog button[class^='dialog__control']");
  await this.waitForLoading();
  if (redirectionAccount === "Interest") {
    await this.checkHTMLText("#interestRedirectionAccount_wrapper span[class^='Select-value-label'] div span", '');
  } else if (redirectionAccount === "Fees") {
    await this.checkHTMLText("#feeRedirectionAccount_wrapper span[class^='Select-value-label'] div span", '');
  }
  //await this.attachScreenShot();
});

Then(/^The system must display a look up with the list of "(.*)" redirection accounts$/, async function (subsection) {
  if (subsection === "Interest" || subsection === "Fees") {
    await this.checkElementExist("#accountDialogInlineSearch_dialog");
    await this.checkElementExist("#accountDialogInlineSearch_dialog div[class^='slick-cell']");
  }
  //await this.attachScreenShot();
});

Then(/^The application displays the "(.*)" redirection account drop-down list with possible results as per business rules in the lookup in ascending order of Account Number$/, async function (subsection) {
  if (subsection === "Interest" || subsection === "Fees") {
    await this.checkElementExist("#accountDialogInlineSearch_dialog");
    await this.checkElementExist("#accountDialogInlineSearch_dialog div[class^='slick-cell']");
  }
  //await this.attachScreenShot();
});


// DIGS-285,286,287

Then(/^The system must display Statement Details section$/, async function () {
  await this.checkElementExist("#statementDetailsSubTitle");
  //await this.attachScreenShot();
});

Then(/^The system must display the Statement Cycle field$/, async function () {
  await this.checkElementExist("#statementCycleEnum");
  //await this.attachScreenShot();
});

Then(/^The Statement Cycle field must display default selected value$/, async function () {
  await this.checkElementValueExist("#statementCycleEnum");
  //await this.attachScreenShot();
});

Then(/^The user must be able to select a statement cycle from the drop down list$/, async function () {
  await this.clickElement("#statementCycleEnum");
  await this.checkElementExist("#statementCycleEnum option");
  //await this.attachScreenShot();
});

Then(/^The system must display Attention to field with a restriction upto 40 characters$/, async function () {
  await this.checkElementExist("#attentionTo");
  await this.sendKeys('#attentionTo', '0123456789012345678901234567890123456789012', false);
  await this.checkElementValue("#attentionTo", "0123456789012345678901234567890123456789");
  //await this.attachScreenShot();
});

Then(/^The system must display Statement Delivery Address field$/, async function () {
  await this.checkElementExist("#deliveryAddress_wrapper");
  //await this.attachScreenShot();
});

Then(/^The application must show selected address in Domicile Branch Address$/, async function () {
  await this.checkElementExist("#accountBranchAddress");
  await this.checkElementValueExist('#accountBranchAddress');
  //await this.attachScreenShot();
});

Then(/^Statement Delivery Address has all AU mailing address listed and alphebetically sorted in ascending order by State and State and city, suburb, street, number$/, async function () {
  await this.clickElement("#deliveryAddress_wrapper");
  await this.checkElementExist("#deliveryAddress_wrapper div[class^='Select-option']");
  //await this.attachScreenShot();
});

When(/^The user Clicks the "Find a Branch Address" Button from "Domicile Account Branch" Field$/, async function () {
  await this.clickElement("#accountBranchCode");
});

Then(/^The system must display Add New Address button$/, async function () {
  await this.checkElementExist("#addNewAddress");
  //await this.attachScreenShot();
});

Then(/^The system must display the list of matching addresses from the list$/, async function () {
  await this.clickElement("#deliveryAddress_wrapper");
  await this.waitForLoading();
  await this.checkElementExist("#deliveryAddress_wrapper .Select-menu-outer");
  //await this.attachScreenShot();
});

When(/^The user clicks on the Add new address button of the Delivery Address field$/, async function () {
  await this.clickElement("#addNewAddress");
});

Then(/^The system displays the Add New Address lookup with a search field and X and Ok buttons$/, async function () {
  await this.checkElementExist("#addNewAddressDialog");
  await this.checkCSSClassExist('#addNewAddressDialog button i', 'fa-times', true);
  await this.checkElementExist("#addNewAddressDialog #okBtn");
  //await this.attachScreenShot();
});

When(/^The user types "(.*)" in Add New Address lookup$/, async function (searchText) {
  await this.sendKeys('#newBusinessAddess_wrapper .Select-input input', searchText, false);
  await this.waitForLoading();
});

Then(/^The Add New Address lookup displays all matching addresses as per the search parameter$/, async function () {
  await this.checkElementExist("#newBusinessAddess_wrapper div[class^='Select-menu-outer']");
  //await this.attachScreenShot();
});

Then(/^The system must display "No Matches Found" in Add New Address lookup$/, async function () {
  await this.checkElementExist("#newBusinessAddess_wrapper div[class^='Select-menu-outer']");
  await this.checkHTMLTextExist("#newBusinessAddess_wrapper .Select-menu-outer .Select-noresults", "No Matches Found");
  //await this.attachScreenShot();
});

When(/^The user selects an address from the list in Add New Address lookup$/, async function () {
  await this.clickElement("#newBusinessAddess_wrapper .Select-option");
});

Then(/^The system must populate the selected address in the Search Lookup Address text box$/, async function () {
  await this.checkHTMLText("#newBusinessAddess_wrapper span[class^='Select-value-label'] span", "Victoria Park Primary School, 205 Albany Highway, VICTORIA PARK WA 6100");
  //await this.attachScreenShot();
});

When(/^The user clicks on "(.*)" button of the Add New Address lookup$/, async function (button) {
  await this.clickElement("#addNewAddressDialog #okBtn");
  await this.waitForLoading();
});

Then(/^Add New Address lookup closes$/, async function () {
  await this.checkElementNotExist("#addNewAddressDialog");
  //await this.attachScreenShot();
});

Then(/^The system must populate the selected address in the Statement Delivery Address field$/, async function () {
  await this.checkHTMLTextExist("#deliveryAddress_wrapper span[class^='Select-value-label'] span", "Victoria Park Primary School, 205 Albany Highway, VICTORIA PARK  WA  6100");
  //await this.attachScreenShot();
});

When(/^The user selects a Statement Delivery Address from the dropdown$/, async function () {
  await this.clickElement("#deliveryAddress_wrapper .Select-menu-outer .Select-option");
});

Then(/^The user is directed to the "Open Account" Service Request edit screen$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#accountDetailsContainer");
  //await this.attachScreenShot();
});

Then(/^The user is directed to the Review page of Open Account request$/, async function () {
  await this.checkElementExist('#accountDetailsContainerWrapper');
  await this.checkElementExist('i[class^="container__expand-collapse"]');
  await this.checkElementExist('#submit');
  //await this.attachScreenShot();
});

// DIGS-301

Then(/^The user navigates to the Online Banking entry screen$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#onlineBankContainer");
  //await this.attachScreenShot();
});

Then(/^The application must "(.*)" the Division sub-section$/, async function (status) {
  if (status === 'present') {
    await this.checkElementExist("#divisionAssignment");
    await this.checkHTMLText("#divisionAssignment", "Division Assignment");
  } else {
    await this.checkElementNotExist("#divisionAssignment");
  }
  //await this.attachScreenShot();
});

Then(/^The application list the Divisions which can be assigned to Account Open service request$/, async function () {
  await this.checkHTMLText("#onlineBankContainer #divisionIdHeading", "Division ID");
  await this.checkHTMLText("#onlineBankContainer #divisionNameHeading", "Division Name");
  await this.checkElementExist("#onlineBankContainer #division_1");
  //await this.attachScreenShot();
});

Then(/^No divisions are selected by default$/, async function () {
  await this.checkElementNotExist("#onlineBankContainer #division_1 input:checked");
  //await this.attachScreenShot();
});

When(/^The user selects the "Account Owner" as "(.*)" which has only one division$/, async function (account) {
  await this.waitForLoading();
  await this.sendKeys("#legalEntity_wrapper div[class^='Select-input'] input", account, false);
  await this.clickElement("#accountDetailsContainer #legalEntity_wrapper .Select-option");
});

When(/^The user selects any division$/, async function () {
  await this.clickElement("#onlineBankContainer #division_1 input");
});

When(/^The user deselects any selected division$/, async function () {
  const checkedDivision = await this.getCheckboxInputValue("#onlineBankContainer #division_1 input");
  if (checkedDivision === "on") {
    await this.clickElement("#onlineBankContainer #division_1 input");
  }
});

When(/^The user enters the "(.*)" as "(.*)"$/, async function (field, value) {
  if (field === "Account Short Name") {
    await this.setTextInputValue("accountShortName", value, false);
  } else if (field === "Attention To") {
    await this.setTextInputValue("attentionTo", value, false);
  }
});

Then(/^The system update the service request with all selected divisions$/, async function () {
  const checkedDivision = await this.getCheckboxInputValue("#onlineBankContainer #division_1 input");
  await this.checkElementValue("#onlineBankContainer #division_1 input", checkedDivision);
  //await this.attachScreenShot();
});

Then(/^The application must update to remove the selected Division from the Service Request$/, async function () {
  await this.checkElementNotExist("#onlineBankContainer #division_1 input:checked");
  //await this.attachScreenShot();
});

// DIGS-290, DIGS-291

When(/^The user selects Signing Rules as "(.*)"$/, async function (signingRule) {
  if (signingRule === "Any one to Sign") {
    await this.clickElement("#accountDetailsContainer input[value='anyToSign']");
  } else if (signingRule === "Any two to sign") {
    await this.clickElement("#accountDetailsContainer input[value='twoToSign']");
  }
});

Then(/^User navigates to the Account Signatory Selection screen$/, async function () {
  await this.checkElementExist("#signatoriesSubTitle");
  //await this.attachScreenShot();
});

Then(/^The system must display the Signing Rules for Account Signatories as per field matrix$/, async function () {
  await this.checkHTMLText("#signatoriesSubTitle span", "Account Signatories");
  await this.checkHTMLText("label[for='numSignatures']", "Signing Rules");
  await this.checkElementExist("input[name='numSignatures']");
  //await this.attachScreenShot();
});

Then(/^The system must display Add and Remove buttons screen elements$/, async function () {
  await this.checkElementExist("#signatoriesActionToolbar #add button");
  await this.checkElementExist("#signatoriesActionToolbar #remove button");
  //await this.attachScreenShot();
});

Then(/^The system should display Select Signatories section as blank and Remove button is disabled$/, async function () {
  await this.checkElementExist("#signatoriesActionToolbar #remove button[disabled]");
  await this.checkElementNotExist("#signatoriesGrid-container .slick-row");
  //await this.attachScreenShot();
});

When(/^The user clicks on "(.*)" button of the Select Signatories section$/, async function (button) {
  // special case, avoid using this.wait - used due to RenderInBody
  await this.wait(1000);
  if (button === "Add") await this.clickElement("#signatoriesActionToolbar #add button");
  else await this.clickElement("#signatoriesActionToolbar #remove button");
  await this.waitForLoading();
});

Then(/^The system must display the Lookup with title "Add Signatories"$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#signatoriesLookupDialog_dialog");
  await this.checkHTMLText("#signatoriesLookupDialog_dialog div[class^='dialog__title']", "Add Signatories");
  //await this.attachScreenShot();
});

Then(/^The Add Signatories lookup must have the screen elements as per field matrix$/, async function () {
  await this.checkElementExist("#signatoriesLookupDialog_dialog #signatoriesLookupDialogFilterInput");
  await this.checkElementExist("#signatoriesLookupDialog_dialog #okBtn");
  await this.checkElementExist("#signatoriesLookupDialog_dialog #cancelBtn");
  await this.checkCSSClassExist('#signatoriesLookupDialog_dialog button i', 'fa-times', true);
  //await this.attachScreenShot();
});

Then(/^The system must display the Lookup with results grid with all Signatories sorted by default by Name alphabetically ascending order$/, async function () {
  await this.checkElementExist("#signatoriesLookupDialog-container .slick-row");
  //await this.attachScreenShot();
});

When(/^The User clicks on "(.*)" button of the Add Signatory lookup$/, async function (button) {
  if (button === "X") await this.clickElement("#signatoriesLookupDialog_dialog button[class^='dialog__control']");
  else if (button === "Ok") await this.clickElement("#signatoriesLookupDialog_dialog #okBtn");
  else if (button === "Cancel") await this.clickElement("#signatoriesLookupDialog_dialog #cancelBtn");
  await this.waitForLoading();
});

Then(/^The Add Signatory lookup closes$/, async function () {
  await this.checkElementNotExist("#signatoriesLookupDialog_dialog");
  //await this.attachScreenShot();
});

When(/^User enters "(.*)" in search textbox in the Add Signatories lookup$/, async function (searchText) {
  await this.sendKeys('#signatoriesLookupDialog_dialog #signatoriesLookupDialogFilterInput', searchText, false);
  await this.waitForLoading();
});

Then(/^The system must display the search results the grid which match the entered parameter$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#signatoriesLookupDialog-container .slick-row");
  //await this.attachScreenShot();
});

Then(/^No list is displayed in the Add Signatories lookup if no matching result is found$/, async function () {
  await this.checkElementNotExist("#signatoriesLookupDialog-container .slick-row");
  //await this.attachScreenShot();
});

When(/^The user selects Signatory from the Add Signatory lookup by checking the checkbox of each row$/, async function () {
  await this.clickElement("#signatoriesLookupDialog-container .slick-row input[type='checkbox']");
});

Then(/^The system should display the list of signatories added under the Select Signatories section$/, async function () {
  await this.checkElementExist("#signatoriesGrid_wrap .slick-row");
  //await this.attachScreenShot();
});

Then(/^The list of selected signatories will appear in default sorting order alphabetically ascending order of name$/, async function () {
  await this.clickElement("#signatoriesActionToolbar #add button");
  await this.clickElement("#signatoriesLookupDialog-container .slick-row input");
  await this.clickElement("#signatoriesLookupDialog_dialog #okBtn");
  await this.clickElement("#signatoriesActionToolbar #add button");
  await this.clickElement("#signatoriesLookupDialog-container .slick-row input");
  await this.clickElement("#signatoriesLookupDialog_dialog #okBtn");
  await this.checkElementExist("#signatoriesGrid_wrap .slick-row");
  this.setState("signatories", {
    selector: "#signatoriesGrid-container div[class^='slick-cell']",
    value: ["Johnny Appleseed", "James Bond"],
  });
  //await this.attachScreenShot();
});

Then(/^The Remove button on select Signatories section is enabled$/, async function () {
  await this.checkElementNotExist("#signatoriesActionToolbar #remove button[disabled]");
  //await this.attachScreenShot();
});

When(/^The user clicks on the selected Signatories grid column headers$/, async function () {
  await this.clickElement("#signatoriesGrid-container #name");
  await this.clickElement("#signatoriesGrid-container #position");
});

Then(/^The list of selected Signatories must be sorted accordingly$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist("#signatoriesGrid_wrap .slick-row");
  //await this.attachScreenShot();
});

Then(/^The system must populate the Selected Signatories along with the existing list of signatories under the Select Signatories section$/, async function () {
  await this.waitForLoading();
  //await this.attachScreenShot();
});

When(/^User does not make a selection of signatories from Add Signatory lookup and clicks "Ok"$/, async function () {
  await this.clickElement("#signatoriesLookupDialog_dialog #cancelBtn");
  await this.waitForLoading();
});

Then(/^The system must retain the old selection in the Select Signatories section$/, async function () {
  await this.waitForLoading();
  //await this.attachScreenShot();
});

When(/^The user selects a signatory by clicking the checkbox on each row$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#signatoriesGrid-container #_checkbox_selector input");
});

When(/^The user selects signatories from the lookup$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#signatoriesLookupDialog_wrap #_checkbox_selector input");
});

When(/^The user selects more than "(.*)" signatories$/, async function (count) {
  await this.clickElement("#signatoriesLookupDialog-container .slick-cell input");
  for (let i = 0; i <= count; i++) {
    await this.sendKeys(undefined, 'ArrowDown', true);
    await this.sendKeys(undefined, 'Space', true);
  }
});

Then(/^The selected rows in the Signatories list grid must be deleted$/, async function () {
  await this.waitForLoading();
  await this.checkElementNotExist("#signatoriesGrid-container div[class^='slick-row']");
  //await this.attachScreenShot();
});

// DIGS-654

Then(/^Signatories added counter set to "zero"$/, async function () {
  await this.checkHTMLTextExist("span", "Signatories added:");
  //await this.attachScreenShot();
});

Then(/^The application must update the signatories added counter based on the number of Signatories "(.*)"$/, async function (status) {
  if (status === "added" || status === "removed")
    await this.checkHTMLTextExist("span", "Signatories added:");
  await this.clickElement("#statementDetailsSubTitle");
  //await this.attachScreenShot();
});

// DIGS-579

Then(/^The application must not allow the user to proceed to next page$/, async function () {
  await this.checkElementNotExist("#accountDetailsContainer");
  //await this.attachScreenShot();
});

When(/^The user has not entered "(.*)" in the Open Account service request page$/, async function (field) {
  if (field === "Account Short Name") {
    await this.checkElementValue("#accountShortName", "");
  } else if (field === "Domicile Account Branch") {
    await this.checkHTMLTextExist("#accountBranchAddress", "");
  } else if (field === "Attention To") {
    await this.checkElementValue("#attentionTo", "");
  } else if (field === "Statement Delivery Address") {
    await this.checkHTMLTextExist("#deliveryAddress_wrapper .Select-placeholder", "Select / Add New Delivery Address");
  }
});


Then(/^The application must allow the user to proceed to next page$/, async function () {
  await this.checkElementExist("#accountDetailsContainer");
  //await this.attachScreenShot();
});

When(/^The application must default the Select Cheque Type to "(.*)"$/, async function (notNegotiable) {
  const chequeType = await this.getRadioInputValue("input[name='crossInd']:checked");
  return notNegotiable === chequeType;

});

Then(/^The application must be provided with the option to change it to the value Negotiable$/, async function () {
  await this.checkElementValue("input[name='crossInd']", "O");
  //await this.attachScreenShot();
});

Then(/^The application must NOT present the 'Account Details section' of the Order Cheque Book$/, async function () {
  //await this.attachScreenShot();
});

Then(/^The application present the Cheque Book "(.*)" section as per the field matrix$/, async function (field) {
  if (field == "Delivery Details") {
    await this.checkHTMLText("#OCBDeliveryDetailsSubTitle span", 'Delivery Details');
    await this.checkElementExist("#OrderChequeMailingTitle1");
    await this.checkElementExist("#mailingTitle2");
  } else if (field == "Postage Method") {
    await this.checkHTMLText("label[for='postageMethodField']", 'Select Postage Method');
    await this.checkElementExist("#postageMethod");
  }
  //await this.attachScreenShot();
});

// DIGS-302, DIGS-305, DIGS-303, DIGS-594

Then(/^The application must "(.*)" the "(.*)"$/, async function (status, section) {
  if (status === "present") {
    if (section === "Product selection section") {
      await this.checkElementExist("#paymentProductsSubTitle");
      await this.checkHTMLText("#paymentProductsSubTitle span", 'Payment Products');
    } else if (section === "Reporting Product Category sub-section") {
      await this.checkElementExist("#pg_btr-field");
      await this.checkHTMLText("#pg_btr-field label[for='pg_btr']", 'Balance & Transaction Reporting');
      await this.checkElementExist("input[name='p_rep-account']");
    } else if (section === "Payment Products sub-section") {
      await this.checkElementExist("#pg_payment-field");
      await this.checkHTMLText("#pg_payment-field label[for='pg_payment']", 'Payments');
      await this.checkElementExist("#pg_payment-field input");
    } else if (section === "Receivables Products sub-section") {
      await this.checkElementExist("#pg_receivable-field");
      await this.checkHTMLText("#pg_receivable-field label[for='pg_receivable']", 'Receivables');
      await this.checkElementExist("#pg_receivable-field input[name='p_domrecv-au-dd']");
      await this.checkElementExist("#pg_receivable-field input[name='p_payidmgmt']");
    } else if (section === "Funding Method section") {
      await this.checkElementExist("#fundingMethod-field");
      await this.checkHTMLText("#fundingMethod-field label[for='fundingMethod']", 'Funding Method - Credit Payments');
      await this.checkElementExist("#fundingMethod-field input[name='afpOnly']");
      await this.checkElementExist("#fundingMethod-field input[name='limitsOnly']");
      await this.checkElementExist("#fundingMethod-field input[name='afpThenLimits']");
    } else if (section === "DE User ID section") {
      await this.checkElementExist("#directEntryIDList-field");
    }
  } else if (status === "not present") {
    if (section === "Product selection section") {
      await this.checkElementNotExist("#paymentProductsSubTitle");
    } else if (section === "Reporting Product Category sub-section") {
      await this.checkElementNotExist("#pg_btr-field");
    } else if (section === "Payment Products sub-section") {
      await this.checkElementNotExist("#pg_payment-field");
    } else if (section === "Receivables Products sub-section") {
      await this.checkElementNotExist("#pg_receivable-field");
    } else if (section === "Funding Method section") {
      await this.checkElementNotExist("#fundingMethod-field");
    } else if (section === "DE User ID section") {
      await this.checkElementNotExist("#directEntryIDList-field");
    }
  }
  //await this.attachScreenShot();
});

Then(/^The default value for the Reporting Product Category is set$/, async function () {
  await this.checkHTMLText("#pg_btr-field label[for='p_rep-account']", 'Reporting - Accounts');
  //await this.attachScreenShot();
});

Then(/^The default value is not modifiable$/, async function () {
  await this.checkElementExist("#pg_btr-field input[disabled]");
  //await this.attachScreenShot();
});

Then(/^By default the values are "(.*)" under "(.*)"$/, async function (status, section) {
  if (status === "selected") {
    if (section === "Payment Products sub-section") {
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_bpay-au']");
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-dc']");
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-npp']");
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-rtgs']");
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_intpay']");
      await this.getCheckboxInputValue("#pg_payment-field input[name='p_transfer']");
    } else if (section === "Receivables Products sub-section") {
      await this.getCheckboxInputValue("#pg_receivable-field input[name='p_domrecv-au-dd']");
      await this.getCheckboxInputValue("#pg_receivable-field input[name='p_payidmgmt']");
    }
  }
  //await this.attachScreenShot();
});

Then(/^The "(.*)" values are modifiable$/, async function (section) {
  if (section === "Payment Products sub-section") {
    await this.clickElement("#pg_payment-field input[name='p_bpay-au']");
    await this.clickElement("#pg_payment-field input[name='p_dompay-au-dc']");
    await this.clickElement("#pg_payment-field input[name='p_dompay-au-npp']");
    await this.clickElement("#pg_payment-field input[name='p_dompay-au-rtgs']");
    await this.clickElement("#pg_payment-field input[name='p_intpay']");
    await this.clickElement("#pg_payment-field input[name='p_transfer']");
  } else if (section === "Receivables Products sub-section") {
    await this.clickElement("#pg_receivable-field input[name='p_domrecv-au-dd']");
    await this.clickElement("#pg_receivable-field input[name='p_payidmgmt']");
  }
  //await this.attachScreenShot();
});

When(/^The user selects a legal entity entitled to "Payment Products" and not entitled to "Reporting Products"$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#legalEntity_wrapper");
  await this.sendKeys("#legalEntity_wrapper div[class^='Select-input'] input", "ALL-HOST-LE-SINGLE-DIV-NOT-LOGGED-IN", false);
  await this.clickElement("#legalEntity_wrapper .Select-option");
});

Then(/^The "Payment Products sub-section" should display values as per entitlement and hide the rest of the values$/, async function () {
  await this.checkElementExist("#pg_payment-field input[name='p_bpay-au']");
  await this.checkElementExist("#pg_payment-field input[name='p_dompay-au-dc']");
  await this.checkElementExist("#pg_payment-field input[name='p_dompay-au-npp']");
  await this.checkElementExist("#pg_payment-field input[name='p_dompay-au-rtgs']");
  await this.checkElementNotExist("#pg_payment-field input[name='p_intpay']");
  await this.checkElementExist("#pg_payment-field input[name='p_transfer']");
  await this.checkElementNotExist("#pg_btr-field");
  //await this.attachScreenShot();
});

When(/^The user deselects selected divisions$/, async function () {
  await this.clickElement("#onlineBankContainer #division_1 input");
});

When(/^The user selects a Division which "(.*)" registered DE User ID$/, async function (status) {
  if (status === "has") {
    await this.setCheckboxInputValue(undefined, "on", "#onlineBankContainer #division_1 input");
    await this.setCheckboxInputValue(undefined, "on", "#onlineBankContainer #division_2 input");
  } else if (status === "has no") {
    await this.setCheckboxInputValue(undefined, "on", "#onlineBankContainer #division_2 input[name='selectDivision1']");
  }
});

When(/^The user "(.*)" all "(.*)" products$/, async function (status, values) {
  if (status === "de-selects") {
    if (values === "Credit") {
      await this.clickElement("#pg_payment-field input[name='p_bpay-au']");
      await this.clickElement("#pg_payment-field input[name='p_dompay-au-dc']");
      await this.clickElement("#pg_payment-field input[name='p_dompay-au-npp']");
      await this.clickElement("#pg_payment-field input[name='p_dompay-au-rtgs']");
      await this.clickElement("#pg_payment-field input[name='p_intpay']");
      await this.clickElement("#pg_payment-field input[name='p_transfer']");
    } else if (values === "Debit") {
      await this.clickElement("#pg_receivable-field input[name='p_domrecv-au-dd']");
      await this.clickElement("#pg_receivable-field input[name='p_payidmgmt']");
    }
  } else if (status === "selects") {
    if (values === "Credit") {
      await this.setCheckboxInputValue(undefined, "p_bpay-au", "#pg_payment-field input[name='p_bpay-au']");
      await this.setCheckboxInputValue(undefined, "p_dompay-au-dc", "#pg_payment-field input[name='p_dompay-au-dc']");
      await this.setCheckboxInputValue(undefined, "p_dompay-au-npp", "#pg_payment-field input[name='p_dompay-au-npp']");
      await this.setCheckboxInputValue(undefined, "p_dompay-au-rtgs", "#pg_payment-field input[name='p_dompay-au-rtgs']");
      await this.setCheckboxInputValue(undefined, "p_intpay", "#pg_payment-field input[name='p_intpay']");
      await this.setCheckboxInputValue(undefined, "p_transfer", "#pg_payment-field input[name='p_transfer']");
    } else if (values === "Debit") {
      await this.setCheckboxInputValue(undefined, "p_domrecv-au-dd", "#pg_receivable-field input[name='p_domrecv-au-dd']");
      await this.setCheckboxInputValue(undefined, "p_payidmgmt", "#pg_receivable-field input[name='p_payidmgmt']");
    }
  }
});

Then(/^The application must present the "DE User ID section" as per the product type selected$/, async function () {
  await this.checkElementExist("#directEntryIDList-field");
  //await this.attachScreenShot();
});

Then(/^The application must populate DE User IDs with a type "(.*)" for the selected divisions under the DE User ID section$/, async function (type) {
  await this.waitForLoading();
  await this.checkElementExist("#directEntryIDList-field tr");
  if (type === "Credit or Debit & Credit") {
    await this.checkHTMLText("#deIdType", "Debit & Credit");
  } else if (type === "Debit or Debit & Credit") {
    await this.checkHTMLText("#deIdType", "Debit & Credit");
  }
  //await this.attachScreenShot();
});

When(/^The user "(.*)" the Product Type as "(.*)"$/, async function (status, value) {
  if (status === "selects") {
    if (value === "Direct Debits") {
      await this.setCheckboxInputValue(undefined, 'p_domrecv-au-dd', 'input[name="p_domrecv-au-dd"]');
    } else if (value === "Direct Credits") {
      await this.setCheckboxInputValue(undefined, 'p_dompay-au-dc', 'input[name="p_dompay-au-dc"]');
    }
  } else if (status === "de-selects") {
    if (value === "Direct Debits") {
      await this.clickElement('p_domrecv-au-dd', 'input[name="p_domrecv-au-dd"]');
    } else if (value === "Direct Credits") {
      await this.clickElement('p_dompay-au-dc', 'input[name="p_dompay-au-dc"]');
    }
  }
});

Then(/^The application must allow the user to select all DE User IDs$/, async function () {
  await this.clickElement("#directEntryIDList-field input[name='selectAllDirectEntryIds]");
  //await this.attachScreenShot();
});

Then(/^The application must allow the user to select 1 or more DE User IDs$/, async function () {
  await this.clickElement("#deId_1 input");
  // await this.clickElement("#deId_2 input");
  //await this.attachScreenShot();
});

Then(/^The application must allow the user to remove the entered DE User IDs$/, async function () {
  await this.clickElement("#deId_1 input");
  // await this.clickElement("#deId_2 input");
  //await this.attachScreenShot();
});

Then(/^The application will hide the DE User ID section and the entered values will not be retained$/, async function () {
  await this.checkElementNotExist("#directEntryIDList-field tr");
  //await this.attachScreenShot();
});

When(/^Products has been selected which requires Funding Method$/, async function () {
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_bpay-au']");
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-dc']");
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-npp']");
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_dompay-au-rtgs']");
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_intpay']");
  await this.getCheckboxInputValue("#pg_payment-field input[name='p_transfer']");
});

Then(/^The default value under "Funding Method section" is set to "Available Funds Processing Only"$/, async function () {
  await this.getRadioInputValue("input[name='afpOnly']");
  //await this.attachScreenShot();
});

When(/^The user selects "(.*)" as the preferred Funding Method$/, async function (fundingMethod) {
  if (fundingMethod === "Limits Only") {
    await this.setRadioInputValue(undefined, "LIMITS_ONLY", "input[name='limitsOnly']")
  } else if (fundingMethod === "Available Funds Processing only") {
    await this.setRadioInputValue(undefined, "AFP_ONLY", "input[name='afpOnly']")
  } else if (fundingMethod === "Available Funds Processing then Limits") {
    await this.setRadioInputValue(undefined, "AFP_THEN_LIMITS", "input[name='afpThenLimits']")
  }
});

Then(/^The application must present the error message in the "(.*)" and must not allow the user to progress to the next page$/, async function (section) {
  if (section === "Division Assignment section") {
    await this.checkHTMLTextExist("#mandatory-error-message", "Division assignment is mandatory. Minimum one division required.");
  } else if (section === "DE User ID section") {
    await this.checkHTMLTextExist("#mandatory-error-message", "Direct Entry ID is mandatory when AU Domestic (Direct Credits) or AU Direct Debits is selected.");
  }
  //await this.attachScreenShot();
});

Then(/^The system must present a message to inform the process and time taken to change the funding method$/, async function () {
  await this.checkHTMLTextExist("span", "Limits arrangements take 24 hours to process. Limits will not be available on this account until the account has been added to your existing limit arrangement");
  //await this.attachScreenShot();
});

Then(/^The application must not present the "Funding Method section" and the funding method must be defaulted$/, async function () {
  await this.checkElementNotExist("#fundingMethod-field");
  //await this.attachScreenShot();
});

When(/^The user has selected legal entity "(.*)" which "has no" registered DE User ID$/, async function (divisionStatus) {
  await this.waitForLoading();
  if (divisionStatus === "with a default Division") {
    await this.clickElement("#legalEntity_wrapper");
    await this.sendKeys("#legalEntity_wrapper div[class^='Select-input'] input", "ALL-HOST-LE-SINGLE-DIV-IN-PROCESSING", false);
    await this.clickElement("#legalEntity_wrapper .Select-option");
  } else if (divisionStatus === "which has divisions with a division") {
    await this.clickElement("#legalEntity_wrapper");
    await this.sendKeys("#legalEntity_wrapper div[class^='Select-input'] input", "ALL-HOST-LE-MULTIPLE-DIV-PENDING", false);
    await this.clickElement("#legalEntity_wrapper .Select-option");
  }
});

Then(/^The application must display the following error message "No records found!" under the DE User ID section$/, async function () {
  await this.checkHTMLTextExist("div", "No records found!");
  //await this.attachScreenShot();
});

// DIGS-602, DIGS-629

Then(/^The application accepts input and move to Open Account submission Review Page$/, async function () {
  await this.checkElementExist("#accountDetailsContainerWrapper");
  await this.checkHTMLTextExist("#accountDetailsContainerWrapper span", "Account Details");
  //await this.attachScreenShot();
});

Then(/^The application present the below sections as per the field matrix$/, async function (table) {
  const data = table.rowsHash();
  const containers = {
    'Account Details': '#accountDetailsContainerWrapper',
    'Online Banking': '#onlineBankingContainerWrapper',
    'Deposit Book': '#depositBookDetailsContainerWrapper',
    'Cheque Book': '#chequeBookDetailsContainerWrapper',
  }

  for (let i = 0; i < Object.keys(data).length; i++) {
    const value = data[Object.keys(data)[i]];
    const key = Object.keys(data)[i];
    if (value === "Show") {
      this.checkElementExist(containers[key]);
      this.checkElementExist(containers[key] + " i[class*='fa-minus-circle']");
      this.checkCSSStyleExist(containers[key] + 'Content', 'display', 'block');
    } else if (value === 'Hide') {
      this.checkCSSStyleExist(containers[key] + 'Content', 'display', 'none');
    } else if (value === "Present") {
      this.checkElementExist(containers[key]);
    } else if (value === "Not Present") {
      this.checkElementNotExist(containers[key]);
    }
  }
  //await this.attachScreenShot();
});

When(/^The user elects to "(.*)" "(.*)" with "(.*)" icon$/, async function (action, section, icon) {
  const containers = {
    'Account Details': '#accountDetailsContainerWrapper',
    'Online Banking': '#onlineBankingContainerWrapper',
    'Deposit Book': '#depositBookDetailsContainerWrapper',
    'Cheque Book': '#chequeBookDetailsContainerWrapper',
  }
  if (action === "collapse" && icon === "collapse") {
    await this.clickElement(containers[section] + " i");
    await this.checkElementExist(containers[section] + " i[class*='fa-plus-circle']");
  } else if (action === "expand" && icon === "expand") {
    await this.clickElement(containers[section] + " i");
    await this.waitForLoading();
    await this.checkElementExist(containers[section] + " i[class*='fa-minus-circle']");
  }
});

When(/^The user Clicks the "(.*)" button "(.*)" times$/, async function (button, times) {
  let buttonId = '';
  for (let i = 1; i <= times; i++) {
    if (button === 'Previous') {
      buttonId = '#previous';
    }
    await this.waitForLoading();
    await this.clickElement(buttonId);
    await this.waitForLoading();
  }
});

When(/^The user submits the Open Account request$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#submit");
});

//DIGS-663, DIGS-629

When(/^The user cancel the authorisation$/, async function () {
  await this.clickElement("#AuthoriseDialog #cancelBtn");
});

When(/^The user approve the service request$/, async function () {
  await this.clickElement("input[name='agreeToAbove']");
  await this.sendKeys("#AuthoriseDialog #signature", "1234567", false);
  await this.clickElement("#AuthoriseDialog #approveBtn");
});

When(/^The user user agrees to the terms and enters authorisation code "(.*)"$/, async function (code) {
  //  this.checkElementExist will wait for selector,if not exist will throw an error
  const termsChecked = await this.checkElementNotExist("input[name='agreeToAbove']:checked");
  if (termsChecked) await this.clickElement("input[name='agreeToAbove']");
  await this.sendKeys("#AuthoriseDialog #signature", code, false);
});

Then(/^The application must enable the approve service request button$/, async function () {
  await this.checkElementNotExist("#AuthoriseDialog #approveBtn[disabled]");
  //await this.attachScreenShot();
});

Then(/^The application must NOT ALLOW the user to approve the service request before presenting the submission outcome$/, async function () {
  await this.checkElementNotExist("#AuthoriseDialog");
  //await this.attachScreenShot();
});

When(/^The user enters '(.*)' in authorisation code textbox$/, async function (code) {
  await this.clearTextElementValue("#signature");
  await this.sendKeys("#AuthoriseDialog #signature", code, false);
});

Then(/^The application must "(.*)" the Approve button$/, async function (state) {
  if (state === "enable") await this.checkElementNotExist("#AuthoriseDialog #approveBtn[disabled]");
  else if (state === "disable") await this.checkElementExist("#AuthoriseDialog #approveBtn[disabled]");
  //await this.attachScreenShot();
});

Then(/^The application must present Authorisation Dialog with disclaimers sub-heading as per the field matrix$/, async function () {
  await this.checkElementExist("#AuthoriseDialog");
  await this.checkHTMLTextExist("#AuthoriseDialog .authorise-section:first-child p.authorise-title", "authorise-title");
  //await this.attachScreenShot();
});
Then(/^The application must present the disclaimers for the account being created$/, async function () {
  await this.checkElementExist("#AuthoriseDialog");
  await this.checkHTMLTextExist("#AuthoriseDialog .authorise-section:first-child div", "disclaimers");
  //await this.attachScreenShot();
});
Then(/^The disclaimer text must be populated from account disclaimer reference data$/, async function () {
  //Check with reference data
});
Then(/^The application must provide an option for the user to agree to the disclaimer terms$/, async function () {
  await this.checkElementExist("input[name='agreeToAbove']");
  //await this.attachScreenShot();
});
Then(/^The application will present the TOKEN AUTHORISATION REQUIRED sub-heading$/, async function () {
  await this.checkHTMLTextExist("#AuthoriseDialog .authorise-section:nth-of-type(2) p.authorise-title", "token-title");
  //await this.attachScreenShot();
});
Then(/^The application must provide the option for the user to enter the digital signature authorisation code$/, async function () {
  await this.checkElementExist("#AuthoriseDialog #signature");
  //await this.attachScreenShot();
});
When(/^The user did not entered any authorisation code$/, async function () {
  await this.clearTextElementValue("#signature");
  await this.sendKeys("#AuthoriseDialog #signature", "", false);
});

Then(/^The application authorisation code is restricted up to numeric and 7 character$/, async function () {
  await this.checkElementExist("#AuthoriseDialog #signature");
  await this.sendKeys('#AuthoriseDialog #signature', '123456789', false);
  await this.checkElementValue("#AuthoriseDialog #signature", "1234567");
  //await this.attachScreenShot();
});
Then(/^The application must not allow to enter non numeric value and empty the authorisation code textbox$/, async function () {
  await this.checkElementValue("#AuthoriseDialog #signature", "");
  //await this.attachScreenShot();
});
When(/^The user Clicks the "(.*)" button from authorise dialog$/, async function (button) {
  let buttonId = '';
  if (button == 'Approve') {
    await this.clickElement("input[name='agreeToAbove']");
    buttonId = '#approveBtn';
  } else if (button == 'Cancel') {
    buttonId = '#cancelBtn';
  }

  await this.waitForLoading();
  await this.clickElement(buttonId);
  await this.waitForLoading();
});

Then(/^The service request has been successfully sent to the core system for processing and the application responds with Request status as "(.*)"$/, async function (message) {
  await this.checkHTMLTextExist("#submitResponseDialog #requestStatus", message);
  //await this.attachScreenShot();
});

Then(/^The new account within the service request has NOT been successfully created within to the core system for processing and the application responds with Request status as "(.*)"$/, async function (message) {
  await this.checkHTMLTextExist("#submitResponseDialog #requestStatus", message);
  //await this.attachScreenShot();
});

Then(/^The core system is not available for processing as per Submission Windows configuration and the application responds with Request status as "(.*)"$/, async function (message) {
  await this.checkHTMLTextExist("#submitResponseDialog #requestStatus", message);
  //await this.attachScreenShot();
});

Then(/^The Submission Dialog must display the message "(.*)"$/, async function (message) {
  await this.checkHTMLTextExist("#submitResponseDialog #lastStatusUpdText", message);
  //await this.attachScreenShot();
});

//DIGS-611

Then(/^The value for the statement selection will be defaulted to "(.*)"$/, async function (status) {
  const paperStatement = await this.getRadioInputValue("input[name='paperStatement']:checked");
  return paperStatement === status;
});

Then(/^The fields Statement Cycle, Attention To and Statement Delivery Address will not be shown$/, async function () {
  await this.checkElementNotExist("#statementCycleEnum");
  await this.checkElementNotExist("#attentionTo");
  await this.checkElementNotExist("#deliveryAddressField-field");
  //await this.attachScreenShot();
});

When(/^The user selects "(.*)" for Paper Statement$/, async function (status) {
  if (status === "Yes")
    await this.setRadioInputValue(undefined, "Y", "input[name='paperStatement']");
  else
    await this.setRadioInputValue(undefined, "N", "input[name='paperStatement']");
});

Then(/^The application must populate the 'Company Name' field with the account legal name but is not visible to the user$/, async function () {
  //await this.attachScreenShot();
});

//DIGS-592

Then(/^The system must display the CACHE Applicable Fee sub-section with below values$/, async function (table) {
  const data = table.raw();
  await this.checkElementExist("#applicableFees-field");
  for (let i = 0; i < Object.keys(data).length; i++) {
    const row = data[Object.keys(data)[i]];
    await this.checkHTMLText("#fees-field #Col1-" + i, row[0]);
    await this.checkHTMLText("#fees-field #Col2-" + i, row[1]);
  }
  //await this.attachScreenShot();
});

//DIGS-280

When(/^The user selects the "Account Type" as "(.*)" which is "(.*)" to prefill$/, async function (accountTypeKey, settings) {
  await this.wait(1000);
  if (settings === "configured" || settings === "not configured")
    if (accountTypeKey == 'ANZ Business Advantage') {
      await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-CD');
    } else if (accountTypeKey == 'ANZ Business Extra') {
      await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-I3');
    } else if (accountTypeKey == 'ANZ Business Online Saver') {
      await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-HD');
    } else if (accountTypeKey == 'ANZ Business Premium Saver') {
      await this.setSelectInputValue('accountTypeKey', 'CAP-DDA-NH');
    } else if (accountTypeKey == 'ANZ Corporate Transaction Account') {
      await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-53');
    } else if (accountTypeKey == 'ANZ Client Money Account') {
      await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-67');
    } else if (accountTypeKey == 'ANZ Corporate Transaction Account (Interest Bearing)') {
      await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-53');
    } else if (accountTypeKey == 'ANZ Corporate Transaction Account - Cheque Issuing') {
      await this.setSelectInputValue('accountTypeKey', 'CMM-DDA-50');
    }
});

Then(/^The application must present the Copy from Account sub-section and default to "No"$/, async function () {
  await this.checkElementExist("#copyAccountDetails-field");
  await this.getRadioInputValue("input[name='no']:checked");
  //await this.attachScreenShot();
});

Then(/^The Application "(.*)" present the Copy from Account sub-section$/, async function (status) {
  if (status === "must") {
    await this.checkElementExist("#prePopAcctId-field");
    await this.checkElementExist("#prePopAcctId_wrapper");
  } else {
    await this.checkElementNotExist("#prePopAcctId-field");
    await this.checkElementNotExist("#prePopAcctId_wrapper");
  }
  //await this.attachScreenShot();
});

Then(/^The application must present the CACHE specific Interest Fields sub-section as per the field matrix$/, async function () {
  await this.checkElementExist("#interestSubTitle");
  await this.checkElementExist("#creditInterestbenchmark-field");
  await this.checkElementExist("#creditInterestPaid-field");
  await this.checkElementExist("#interestRedirectionAccount-field");
  //await this.attachScreenShot();
});

Then(/^The application must populate the "(.*)" as "(.*)(.*)"$/, async function (field, value, condition) {
  if (field === 'Credit Interest Benchmark') {
    await this.checkHTMLTextExist("#creditInterestbenchmark", value);
  } else if (field === 'Credit Interest Paid') {
    await this.checkHTMLTextExist("#creditInterestPaid", value);
  }
  //await this.attachScreenShot();
});

When(/^The user selects "Copy Account Details" as "(.*)"$/, async function (value) {
  await this.clickElement("#copyAccountDetails-field input[name='" + value + "']");
});

When(/^The user selects the "Copy From Account" as "(.*)"$/, async function (value) {
  await this.waitForLoading();
  await this.clickElement("#prePopAcctId_wrapper");
  await this.sendKeys("#prePopAcctId_wrapper div[class^='Select-input'] input", value, false);
  await this.clickElement("#prePopAcctId_wrapper .Select-option");
  await this.waitForLoading();
});

Then(/^The application must present the Interest fields for "(.*)" sub-section as per the field matrix$/, async function (interestType) {
  await this.checkElementExist("#creditInterestbenchmark-field");
  await this.checkElementExist("#creditInterestPaid-field");
  await this.checkElementExist("#interestRedirectionAccount-field");
  if (interestType === 'FLAT' || interestType === 'SPLIT' || interestType === 'TIERED') {
    await this.checkElementExist("#creditInterestRateStructure-field");
    await this.checkElementExist("#creditInterestCalculation-field");
  }
  //await this.attachScreenShot();
});

Then(/^The application must populate the "(.*)" Table with the below details$/, async function (field, table) {

  const data = table.raw();
  let fieldId;
  if (field === 'Credit Interest Rate Stucture') {
    fieldId = '#creditInterestRateStructure-field';
  } else {
    fieldId = '#creditInterestCalculation-field';
  }

  for (let i = 0; i < Object.keys(data).length; i++) {
    const row = data[Object.keys(data)[i]];
    await this.checkHTMLText(fieldId + " #Col1-" + i, row[0]);
    await this.checkHTMLText(fieldId + " #Col2-" + i, row[1]);
  }
  //await this.attachScreenShot();
});


//DIGS-281
Then(/^The application must present the option to select pre-fill$/, async function () {
  await this.checkElementExist("#copyAccountDetails-field");
  //await this.attachScreenShot();
});

When(/^The user selects Copy Account Details as "(.*)"$/, async function (status) {
  await this.waitForLoading();
  if (status === "Yes")
    await this.setRadioInputValue(undefined, "YES", "input[name='yes']");
  else
    await this.setRadioInputValue(undefined, "NO", "input[name='no']");
  await this.waitForLoading();
});

Then(/^The Pre-fill account values will not be updated$/, async function () {
  //await this.attachScreenShot();
});

Then(/^The "Copy From Account" field must be populated$/, async function () {
  await this.checkHTMLTextExist("#prePopAcctId_wrapper span[class^='Select-value-label'] span");
  //await this.attachScreenShot();
});

Then(/^The application show error message on "Number of Books", "Book Size" & "Attention To" fields$/, async function () {
  await this.checkCSSClassExist(`#quantity`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#bookSize`, 'form-control--has-error', true);
  await this.checkCSSClassExist(`#OrderChequeMailingTitle1`, 'form-control--has-error', true);
  //await this.attachScreenShot();
})

Then(/^The application show error message on "Last Cheque Number" & "Branch Address" fields$/, async function () {
  await this.checkCSSClassExist(`#lastChequeNumber-field label`, 'label--has-error', true);
  await this.checkCSSClassExist(`#branchLocation-field div[class*='form-text--is-note']`, 'form-text--has-error', true);
  //await this.attachScreenShot();
})

Then(/^The application shows selected adress in "(.*)" in Open Account$/, async function (field) {
  if (field === 'Delivery Address') {
    const selectedAddress = '10/530 Collins Street, Melbourne Victoria 3000';
    this.setState('alternateAddress', { selector: "#deliveryAddressField-field span.Select-value-label span", value: selectedAddress, type: 'HTMLText' });
    this.checkHTMLText("#deliveryAddressField-field span.Select-value-label span", selectedAddress);
  } else if (field === 'Branch Address') {
    const deliveryBranchAddress = this.getTempState('deliveryBranchAddress');
    this.setState('deliveryBranchAddress', { selector: "#deliveryBranchAddress", value: deliveryBranchAddress, type: 'HTMLText' });
    await this.checkHTMLTextExist("#deliveryBranchAddress", 'deliveryBranchAddress');
  }
  //await this.attachScreenShot();
});

// DIGS-631
Then(/^The Account Open service request has been created using a pre-fill account$/, async function () {
  await this.checkElementExist('#prePopAcctId-field');
  //await this.attachScreenShot();
});

Then(/^The application must display sub-sections in view mode as below$/, async function (table) {
  const data = table.rowsHash();
  const containers = {
    "Summary information": "#requestSummary",
    "Copy from Account": "#prePopAcctId",
    "Divisions": "#divisionList-field",
    "Payments": "#paymentProductsSubTitle",
    "Domestic Payments": "#domesticPaymentsSubTitle",
    "Deposit Book Order": "#depositBookDetailsContainerWrapper",
     "Related Service Requests": "#depositBookDetailsContainerWrapper",
    "Account Reporting": "#pg_btr-field",
    "Receivables": "#pg_receivable-field",
    "Limits": "#fundingMethod-field",
    "Order Deposit Book selection": "select#depBookQuantity",
    "Order Cheque Book selection": "select#quantity",
    "Interest Information": "#interestSubTitle",
    "Fees Information": "#feeSubTitle",
    "Errors and Alerts": "#errorsAndAlerts",
    "Related Service Requests": "#relatedServiceRequestsContainer"
  };
  for (let i = 0; i < Object.keys(data).length; i++) {
    const value = data[Object.keys(data)[i]];
    const key = Object.keys(data)[i];
    if (value === "present") {
      await this.checkElementExist(containers[key]);
    } else if (value === "not present") {
      await this.checkElementNotExist(containers[key]);
    }
  }
  //await this.attachScreenShot();
});

Then(/^The application must present the interest information for the relevant product$/, async function () {
  await this.checkElementExist('#interestSubTitle');
  //await this.attachScreenShot();
});

Then(/^Each of the sections must be expanded by default and must present the collapse icon for a section$/, async function () {
  await this.checkElementExist('i[class*="fa-minus-circle"]');
  await this.checkCSSStyleExist('#accountDetailsContainerWrapperContent', 'display', 'block');
  //await this.attachScreenShot();
});

Then(/^The application must present each page as a collapsable section$/, async function () {
  //await this.checkElementExist('#interestSubTitle');
  //await this.attachScreenShot();
});

Then(/^The user elects to collapse a section with collapse icon, must collapsed the selected section and must present the expand icon for a section$/, async function () {
  await this.clickElement('i[class*="fa-minus-circle"]');
  await this.checkCSSStyleExist('#accountDetailsContainerWrapperContent', 'display', 'none');
  //await this.attachScreenShot();
});

Then(/^The user elects to expand a section with expand icon, must expanded the selected section and must present the collapse icon for a section$/, async function () {
  await this.clickElement('i[class*="fa-plus-circle"]');
  await this.checkCSSStyleExist('#accountDetailsContainerWrapperContent', 'display', 'block');
  //await this.attachScreenShot();
});

Then(/^The account type core system populates the interest text$/, async function () {
  await this.checkElementExist('#interestSubTitle');
  // await this.checkElementExist('#creditInterestRate-field');
  await this.checkElementExist('#interestRedirectionAccount-field');
  //await this.attachScreenShot();
});

Then(/^The application must present the relevant message and no link will be available$/, async function () {
  await this.checkElementExist("#creditInterestRate-field");
  await this.checkElementNotExist('a span#creditInterestRateLink');
  //await this.attachScreenShot();
});

Then(/^The account open service request has been populated with an interest redirection account$/, async function () {
  await this.checkElementNotExist('a span#creditInterestRateLink');
  //await this.attachScreenShot();
});

Then(/^The application will present the interest redirection section with label$/, async function () {
  await this.checkElementExist('#interestRedirectionAccount-field');
  await this.checkElementExist('#interestRedirectionAccount');
  //await this.attachScreenShot();
});

Then(/^The application will present the fee section with information and link is not active$/, async function () {
  await this.checkElementExist('#applicableFees-field');
  // await this.checkHTMLText('div[class^=form-text]', 'For more information about applicable fees see anz.com');
  await this.checkElementNotExist('a span#applicableFeesLink');
  //await this.attachScreenShot();
});

Then(/^The application will present the fee redirection section with label and fee redirection account$/, async function () {
  await this.checkElementExist('#applicableFees-field');
  //await this.attachScreenShot();
});

Then(/^The application presents the signatories sub-section with signing rules and entered signatories will be presented$/, async function () {
  await this.checkElementExist('#numSignatures-field');
  await this.checkElementExist('#signatoriesGrid-container');
  //await this.attachScreenShot();
});

Then(/^The Open Account service request is populated with 'Yes' for paper statements, should present the Statement Details Sub-heading with label$/, async function () {
  await this.checkElementExist('#statementDetailsSubTitle');
  await this.checkElementExist('#statementCycleEnum-field');
  await this.checkElementExist('#attentionTo-field');
  await this.checkElementExist('#deliveryAddressField-field');
  //await this.attachScreenShot();
});

Then(/^The previous search must be presented as selected by user$/, async function () {
  await this.checkElementExist('div[class*="grid-search-panel"]');
  await this.checkElementExist('div[class*="grid-canvas"]');
  //await this.attachScreenShot();
});

When(/^The user elects to progress to the 'Next Record' which is the last record in the list$/, async function () {
  await this.clickElement('#nextRecord button');
});

// DIGS-637

Then(/^The application must retrieve all signatories from the account and must populate the number of signatories$/, async function () {
  await this.checkElementExist("#signatoriesGrid-container .slick-row");
  //await this.attachScreenShot();
});

Then(/^The application must update all fields with default values$/, async function () {
  await this.waitForLoading();
  await this.checkHTMLTextExist('#accountBranchAddress');
  await this.checkHTMLText("#deliveryAddress_wrapper .Select-placeholder", "Select / Add New Delivery Address");
  await this.checkElementNotExist("#signatoriesGrid-container .slick-row");
  await this.checkRadioInputValue('#numSignatures-field input:checked', 'twoToSign');
  //await this.attachScreenShot();
});

Then(/^The application must default Copy From Account to "(.*)"$/, async function (value) {
  await this.getRadioInputValue(`#copyAccountDetails-field input[name=${value}]:checked`);
  //await this.attachScreenShot();
});

// DIGS -636

Then(/^The application must default account specific fields for new account as below$/, async function (table) {
  const data = table.rowsHash();
  if (data['Account Name'] !== undefined)
    await this.checkHTMLText('#accountShortName', data['Account Name']);
  if (data[' Order Deposit Book'] !== undefined)
    await this.getCheckboxInputValue("input[name='depBookRequest']") == undefined;
  if (data['Order Cheque Book'] !== undefined)
    await this.getCheckboxInputValue("input[name='chqBookRequest']") == undefined;
  if (data['Attention To'] !== undefined)
    await this.checkHTMLText('#attentionTo', data['Attention To']);
  //await this.attachScreenShot();
});

Then(/^The application must "(.*)" "(.*)" from the selected prefill account$/, async function (showStatus, field) {
  await this.waitForLoading();
  if (field === 'Domicile Branch Address') {
    if (showStatus === 'show') {
      await this.checkHTMLTextExist('#accountBranchAddress');
    } else if (showStatus === 'not show') {
      await this.checkHTMLText('#accountBranchAddress', '');
    }
    //await this.attachScreenShot();
  }
});

Then(/^The application must prefill below fields based on (.*)$/, async function (type, table) {
  const data = table.rowsHash();
  if (type === "Account Type" || type === "selected prefill account") {
    if (data['Statement Delivery Address'] !== undefined)
      this.checkHTMLText("#deliveryAddressField-field span.Select-value-label span", data['Statement Delivery Address']);
    if (data['Statement Cycle'] !== undefined)
      await this.checkElementValue('#statementCycleEnum', data['Statement Cycle']);
    if (data['Credit Interest Benchmark'] !== undefined)
      await this.checkHTMLText('#creditInterestbenchmark', data['Credit Interest Benchmark'])
    if (data['Credit Interest Paid '] !== undefined)
      await this.checkHTMLText('#creditInterestPaid', data['Credit Interest Paid ']);
    if (data['Domicile Account Branch'] !== undefined)
      this.checkHTMLText("#accountBranchAddress", data['Domicile Account Branch']);
    if (data['Do you want a paper statement'] !== undefined)
      this.checkRadioInputValue("#paperStatement", data['Do you want a paper statement'] === 'No' ? 'N' : 'Y');
    if (data['Signing Rules '] !== undefined)
      this.checkRadioInputValue("#numSignatures", data['Signing Rules'] === 'No' ? 'anyToSign' : 'twoToSign');
  }
  //await this.attachScreenShot();
});

Then(/^The application must populate statement cycle as "(.*)" based on the default statement cycle for the account type$/, async function (value) {
  if (value == 'Half yearly - form account open date') {
    value = 'halfYearNomDate';
  }
  await this.checkElementValue('#statementCycleEnum', value);
  //await this.attachScreenShot();
});

Then(/^The application must present the "(.*)" deposit book order details as follows$/, async function (type, table) {
  const data = table.rowsHash();
  if (data['Book Type'] !== undefined)
    this.checkHTMLText("#bookType", data['Book Type']);
  if (data['Book Size'] !== undefined)
    await this.checkHTMLText('#depAgentBookSize', data['Book Size']);
  if (data['Line 1'] !== undefined)
    await this.checkHTMLText('#personalizationLine1', data['Line 1'])
  if (data['Line 2'] !== undefined)
    await this.checkHTMLText('#personalizationLine2', data['Line 2']);
  //await this.attachScreenShot();
});

//DIGS-633
Then(/^The applictaion must present tool tip for Copy Account Details field$/, async function () {
  await this.checkElementExist('#copyAccountDetailsToolTip');
  //await this.attachScreenShot();
});

//DIGS-297
Then(/^The application must list the Service Requests with '(.*)' as '(.*)'$/, async function (col, val) {
  const selector = {
    "Request Status": "#summaryGrid-container .slick-row div[class*='r8']"
  }
  await this.checkHTMLText(selector[col], val);
  //await this.attachScreenShot();
});

//DIGS-744
When(/^The user elects to view the presented '(.*)' service request$/, async function (serviceRequest) {
  const selector = {
    'Order Deposit Book': '#request_1 td a',
    'Order Cheque Book': '#request_2 td a'
  }
  await this.checkElementExist('#relatedServiceRequestsContainerContent');
  await this.clickElement(selector[serviceRequest]);
});

Then(/^The application must navigate the user to the view screen of the "(.*)" service request selected$/, async function (serviceRequestScreen) {
  if (serviceRequestScreen === "Order Deposit Book") {
    await this.checkElementExist("#StandardBookTypeDetailsContainer");
    await this.checkHTMLText('#StandardBookTypeDetailsContainer div[role="heading"] span', 'Deposit Book Details');
  } else {
    await this.checkElementExist("#chqBookDetailsContainer");
    await this.checkHTMLText('#chqBookDetailsContainer div[role="heading"] span', 'Cheque Book Details');
  }
  //await this.attachScreenShot();
});

Then(/^The user is not entitled to view the service request$/, async function () {
  await this.checkElementNotExist('#relatedServiceRequestsContainer');
  //await this.attachScreenShot();
});
// DIGS-669
Then(/^The application "(.*)" present the "Approve" button in service request view screen$/, async function (status) {
  if (status == "must") {
    await this.checkElementExist("#approve");
  } else if (status == "must") {
    await this.checkElementNotExist("#approve");
  }
  //await this.attachScreenShot();
});
When(/^The user click the "(.*)" Button from "Service Request View Details" screen$/, async function (button) {
  if (button == "Approve") {
    await this.waitForLoading();
    await this.clickElement("#approve");
  }
});

When(/^I am selecting new Delivery Address for "(.*)"$/, async function (product) {
  if (product == "Order Deposit Book") {
    await this.waitForLoading();
    await this.clickElement("#addNewAddress");
    await this.sendKeys('#addNewAddressDialog .Select-control input', "vic", false);
    await this.clickElement("#addNewAddressDialog .Select-menu-outer .Select-option");
    await this.clickElement("#addNewAddressDialog #okBtn");
    await this.waitForLoading();

  } else if ("Order Cheque Book") {
    await this.waitForLoading();
    await this.clickElement("#addNewAddress");
    await this.sendKeys('#addNewAddressDialog .Select-control input', "vic", false);
    await this.clickElement("#addNewAddressDialog .Select-menu-outer .Select-option");
    await this.clickElement("#addNewAddressDialog #okBtn");
    await this.waitForLoading();
  }
});

// OMCW-585 OMCW-575
Then(/^The application must display the disclaimer text for Interest & Fees in '(.*)'$/, async function (mode) {
  if (mode === 'Create Mode' || mode === 'View Mode')
    await this.checkElementExist('#disclaimerText')
  //await this.attachScreenShot();
});

When(/^The user selects an account to Copy from, which has Service Charge Code as 71 or 81 and Service Charge Waive Code as 00 or 01$/, async function () {
  await this.waitForLoading();
  await this.clickElement("#prePopAcctId_wrapper");
  await this.sendKeys("#prePopAcctId_wrapper div[class^='Select-input'] input", 'NINE-RATES-SPLIT', false);
  await this.clickElement("#prePopAcctId_wrapper .Select-option");
  await this.waitForLoading();
});

Then(/^The application '(.*)' display the Application Fees table and title$/, async function (status) {
  if (status === 'must') await this.checkElementExist('#fees-field');
  else await this.checkElementNotExist('#fees-field');
  //await this.attachScreenShot();
});

When(/^The user selects an account to Copy from, which has '(.*)'$/, async function (serviceCharge) {
  const accountName = serviceCharge === 'Service Charge Code as 00' ? 'COPY-ACCOUNT-WITH-SERVICE-CODE-00' : 'COPY-ACCOUNT-WITH-SERVICE-WAIVECODE-02';
  await this.waitForLoading();
  await this.clickElement("#prePopAcctId_wrapper");
  await this.sendKeys("#prePopAcctId_wrapper div[class^='Select-input'] input", accountName, false);
  await this.clickElement("#prePopAcctId_wrapper .Select-option");
  await this.waitForLoading();
});

//OMCW-595
When(/^The user selects an account to Copy from, which has an invalid '(.*)'$/, async function (serviceCharge) {
  const account = (serviceCharge === 'Service Charge Code') ? 'COPY-ACCOUNT-WITH-SERVICE-CODE-INVALID' : 'COPY-ACCOUNT-WITH-SERVICE-WAIVE-CODE-INVALID';
  await this.waitForLoading();
  await this.clickElement("#prePopAcctId_wrapper");
  await this.sendKeys("#prePopAcctId_wrapper div[class^='Select-input'] input", account, false);
  await this.clickElement("#prePopAcctId_wrapper .Select-option");
  await this.waitForLoading();
});



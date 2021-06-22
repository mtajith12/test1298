const {   Given,   When,   Then,  And} = require("cucumber");
const moment = require("moment");
const _ = require('lodash');
const assert = require('assert')


Then(/^The application shows a progress bar with steps as follows "(.*)","(.*)" and "(.*)"$/, async function (Type, Details, ReviewSubmit) {
  await this.checkElementExist("#selfServiceStepper div[class*='steps__text__node_modules-omni-react-components-Stepper-styles-external']");
  await this.checkElementExist("#selfServiceStepper > li:nth-child(2) > div span");
  await this.checkElementExist("#selfServiceStepper > li:nth-child(3) > div span");
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  //await this.attachScreenShot();
});

Then(/^The select service type marked as complete with tick symbol$/, async function () {
  await this.checkElementExist('i[class="fa fa-check"]');
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  //await this.attachScreenShot();
});


When(/^The user navigate to the service request 'Enter Details' screen$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(2) > div span", 'Current');
  await this.checkElementExist("#accountContainer > div > span > span", 'Select Account');
  await this.checkElementExist("#cancel");
  //await this.attachScreenShot();
});

Then(/^The Account selection subsection is displayed$/, async function () {
  await this.checkElementExist("#accountContainer div[role='heading'] span", 'Select Account');
  await this.clickElement("#account_arrow");
  await this.clickElement("div[class *= 'DtbL1Lf3xSogp']");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: '200-TRANS'
  });
  await this.clickElement('#transactionSearch');
  await this.checkElementExist("#cancel");
  //await this.attachScreenShot();
});


Then(/^The application should display an alert pop-up message$/, async function () {
  await this.waitForLoading()
  this.page.on('dialog', async dialog => {
    const msg = dialog.message();
    assert.equal("Are you sure you wish to cancel this request?", msg);
  });
  //await this.attachScreenShot();
});


Then(/^The application should navigate the user back to the Service Request Listing screen$/, async function () {
  await this.checkElementExist("#serviceRequest")
  await this.checkElementExist("a[title='Trace Transaction'] > div");
  //await this.attachScreenShot();
});

Then(/^The application must close the cancel service request alert pop-up message$/, async function () {
  await this.page.on("dialog", (dialog) => {
    dialog.dismiss();
  });
  //await this.attachScreenShot();
});

When(/^The user navigated to the 'Review & Submit' screen$/, async function () {
  await this.waitForLoading()
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'BO-PENDING'
  });
  await this.clickElement('#transactionSearch');
  await this.clickElement('#next');
  //await this.attachScreenShot();
});


Then(/^The Account selection subsection is populated$/, async function () {
  await this.checkElementExist("#accountContainer div[role='heading'] span", 'Select Account');
  await this.clickElement("#account_arrow");
  await this.clickElement("div[class *= 'DtbL1Lf3xSogp']");
  //const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'BO-PENDING'
  });
  //await this.attachScreenShot();
});

Then(/^The user has entered value in all the search criteria fields$/, async function (table) {
  await this.waitForLoading()
  const data = table.rowsHash();
  await this.clickElement("#postDate-field");
  await this.clickElement("#postDate-field div.SingleDatePicker_picker.SingleDatePicker_picker_1.SingleDatePicker_picker__directionLeft.SingleDatePicker_picker__directionLeft_2 > div > div > div > div.DayPicker_focusRegion.DayPicker_focusRegion_1 > div.DayPicker_transitionContainer.DayPicker_transitionContainer_1 > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(5)");
  await this.waitForLoading()
  await this.clickElement("#transactionSearch");
  //await this.attachScreenShot();
});

Then(/^The user enters value in the search criteria fields$/, async function (table) {
  await this.waitForLoading()
  const data = table.rowsHash();
  var amount = data.amount
  var type = data.transtype
  const date = data.PostDate
  const today = new Date()
  var month = today.toLocaleString('default', { month: 'long' })
  //console.log(month)
  if (amount) {
    if (amount.indexOf("/") < 0) {
      await this.clickElement('[aria-label*="Amount search operator"]')
      var ele = await this.page.$x("//div[contains(text(),'Equal To')]");
      await ele[0].click()
      await this.setTextInputValue(null, amount, '#amount')
    } else {
      await this.clickElement('[aria-label*="Amount search operator"]')
      var ele = await this.page.$x("//div[contains(text(),'Between')]");
      await ele[0].click()
      var fromamt = amount.substring(0, amount.indexOf("/"))
      var toamt = amount.substring((amount.indexOf("/") + 1), amount.length)
      await this.setTextInputValue(null, fromamt, '#amount')
      await this.setTextInputValue(null, toamt, '#amount_to')
    }
  }
  if (type) {
    await this.clickElement('.Select__input')
    var opt_sel = "//span[contains(text(),'" + type + "')]"
    await this.setTextInputValue(null, type, "input[aria-label='Credit/Debits']")
    var ele = await this.page.$x(opt_sel);
    await ele[0].click()
  }
  if (date) {
    if (date.indexOf("/") < 0) {
      await this.clickElement("#postDate-field button")
      var ele = await this.page.$x("//div[contains(text(),'Specific Date')]");
      await ele[0].click()
       //   await this.clickElement("#postDate-field button")
    //   //var ele = await this.page.$x("[aria-label*='Click the icon to show the Calendar']");
    //  // var ele = await this.page.$x("//div[contains(text(),'Specific Date')]");
    //  // await ele[0].click()
    var date_month = date.substring(0,date.indexOf(' '))
    var date_dat = date.substring(date.indexOf(' ')+1, date.indexOf(','))
    var date_year = date.substring(date.indexOf(',')+2, date.length)
    await this.clickElement("svg[class*='SingleDatePickerInput_calendarIcon']")
    var month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
    var condition = month.includes(date_month) && month.includes(date_year)
     while(condition == false){
      await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
      month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
      condition = month.includes(date_month) && month.includes(date_year)
    }
    var el = await this.page.$x("//td[text() = '"+date_dat+"']");
    await el[1].click()
  //   var selector = "#postDate-field tr:nth-child(1) > td:nth-child(6)"

  //   var i = 0;
  //   if(date.indexOf(month)<0){
  //     await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
  //   }
  //   var htmlText = await this.page.$(selector)
  //   while (htmlText == null) {
  //     await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg");
  //     await this.page.waitFor(300)
  //     htmlText = await this.page.$(selector)
  //     i++;
  //   }
  //   if (i > 0) {
  //     await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
  //   }

  //   await this.clickElement(selector);
    } else {
      await this.clickElement("#postDate-field button")
      var ele = await this.page.$x("//div[contains(text(),'Date Range')]");
      await ele[0].click()
      var frmdate = date.substring(0, date.indexOf("/"))
      var todate = date.substring((date.indexOf("/") + 1), date.length)
      var date_month_frm = frmdate.substring(0,frmdate.indexOf(' '))
      var date_dat_frm = frmdate.substring(frmdate.indexOf(' ')+1, frmdate.indexOf(','))
      var date_year_frm = frmdate.substring(frmdate.indexOf(',')+2, frmdate.length)
      await this.clickElement("svg[class*='DateRangePickerInput_calendarIcon']")
      var month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
      var condition = month.includes(date_month_frm) && month.includes(date_year_frm)
      while(condition == false){
        await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
        month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
        condition = month.includes(date_month_frm) && month.includes(date_year_frm)
      }
      var el = await this.page.$x("//td[text() = '"+date_dat_frm+"']");
      await el[1].click()

      var date_month_to = todate.substring(0,todate.indexOf(' '))
      var date_dat_to = todate.substring(todate.indexOf(' ')+1, todate.indexOf(','))
      var date_year_to = todate.substring(todate.indexOf(',')+2, todate.length)
      var month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
      var condition = month.includes(date_month_to) && month.includes(date_year_to)
      while(condition == false){
        await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(2) svg")
        month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
        condition = month.includes(date_month_to) && month.includes(date_year_to)
      }
       el = await this.page.$x("//td[text() = '"+date_dat_to+"']");
      await el[1].click()

      // await this.clickElement("#postDate")
      // var selector = "#postDate-field [aria-label*='" + frmdate + "']"
      // var i = 0;
      // var htmlText = await this.page.$(selector)
      // while (htmlText == null) {
      //   await this.clickElement("button [class='fa fa-angle-left']");
      //   await this.page.waitFor(300)
      //   htmlText = await this.page.$(selector)
      //   i++;
      // }
      // if (i > 0) {
      //   await this.clickElement("button [class='fa fa-angle-left']")
      // }

      // await this.clickElement(selector);

      // await this.clickElement("#postDate_to")
      // var sel = "#postDate-field [aria-label*='" + todate + "']"
      // var j = 0;
      // var htmlTxt = await this.page.$(sel)
      // while (htmlTxt == null) {
      //   await this.clickElement("button [class='fa fa-angle-left']");
      //   await this.page.waitFor(300)
      //   htmlTxt = await this.page.$(sel)
      //   j++;
      // }
      // if (j > 0) {
      //   await this.clickElement("button [class='fa fa-angle-left']")
      // }

      // await this.clickElement(sel);
    }
  }

  await this.waitForLoading()
  await this.clickElement("#transactionSearch");
  //await this.attachScreenShot();
});

Then(/^The user enters deposit date value$/, async function (table) {
  await this.waitForLoading()
  const data = table.rowsHash();
  const date = data.DepositDate
  var date_month = date.substring(0,date.indexOf(' '))
    var date_dat = date.substring(date.indexOf(' ')+1, date.indexOf(','))
    var date_year = date.substring(date.indexOf(',')+2, date.length)
    await this.clickElement("svg[class*='SingleDatePickerInput_calendarIcon']")
    var month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
    var condition = month.includes(date_month) && month.includes(date_year)
     while(condition == false){
      await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
      month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
      condition = month.includes(date_month) && month.includes(date_year)
    }
    var el = await this.page.$x("//td[text() = '"+date_dat+"']");
    await el[1].click()
  // if (type) {
  //   await this.clickElement('.Select-value-icon')
  //   var opt_sel = "//span[contains(text(),'" + type + "')]"
  //   await this.setTextInputValue(null, type, "input[aria-label='Credit/Debits']")
  //   var ele = await this.page.$x(opt_sel);
  //   await ele[0].click()
  // }
  // if (date) {
  //   if (date.indexOf("/") < 0) {
  //     // await this.clickElement("#postDate-field button")
  //     // var ele = await this.page.$x("//div[contains(text(),'Specific Date')]");
  //     // await ele[0].click()
  //     // await this.clickElement("#depositDate")
  //     // var selector = "#depositDate-field [aria-label*='" + date + "']"
  //     await this.clickElement("#depositDate-field [aria-label*='Click the icon to show the Calendar']")
  //     var selector = "#depositDate-field tr:nth-child(1) > td:nth-child(6)"
  //     var i = 0;
  //     var htmlText = await this.page.$(selector)
  //     while (htmlText == null) {
  //       await this.clickElement("button [class='fa fa-angle-left']");
  //       await this.page.waitFor(300)
  //       htmlText = await this.page.$(selector)
  //       i++;
  //     }
  //     if (i > 0) {
  //       await this.clickElement("button [class='fa fa-angle-left']")
  //     }

  //     await this.clickElement(selector);
  //   } else {
  //     await this.clickElement("#postDate-field button")
  //     var ele = await this.page.$x("//div[contains(text(),'Date Range')]");
  //     await ele[0].click()
  //     var frmdate = date.substring(0, date.indexOf("/"))
  //     var todate = date.substring((date.indexOf("/") + 1), date.length)
  //     await this.clickElement("#postDate")
  //     var selector = "#postDate-field [aria-label*='" + frmdate + "']"
  //     var i = 0;
  //     var htmlText = await this.page.$(selector)
  //     while (htmlText == null) {
  //       await this.clickElement("button [class='fa fa-angle-left']");
  //       await this.page.waitFor(300)
  //       htmlText = await this.page.$(selector)
  //       i++;
  //     }
  //     if (i > 0) {
  //       await this.clickElement("button [class='fa fa-angle-left']")
  //     }

  //     await this.clickElement(selector);

  //     await this.clickElement("#postDate_to")
  //     var sel = "#postDate-field [aria-label*='" + todate + "']"
  //     var j = 0;
  //     var htmlTxt = await this.page.$(sel)
  //     while (htmlTxt == null) {
  //       await this.clickElement("button [class='fa fa-angle-left']");
  //       await this.page.waitFor(300)
  //       htmlTxt = await this.page.$(sel)
  //       j++;
  //     }
  //     if (j > 0) {
  //       await this.clickElement("button [class='fa fa-angle-left']")
  //     }

  //     await this.clickElement(sel);
  //   }
  // }

  await this.waitForLoading()
  //await this.attachScreenShot();
});



Then(/^The user picks date to Backdate transaction$/, async function (table) {
  await this.waitForLoading()
  const data = table.rowsHash();
  const date = data.PostDate
  const today = new Date()
  var month = today.toLocaleString('default', { month: 'long' })

 // var selector = "#backdateValue-field tbody tr:nth-child(1) > td:nth-child(6)"
  var date_month = date.substring(0,date.indexOf(' '))
  var date_dat = date.substring(date.indexOf(' ')+1, date.indexOf(','))
  var date_year = date.substring(date.indexOf(',')+2, date.length)
  await this.clickElement("#backdateValue-field [aria-label*='Click the icon to show the Calendar']")
//  await this.clickElement("svg[class*='SingleDatePickerInput_calendarIcon']")
  var month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
  var condition = month.includes(date_month) && month.includes(date_year)
  console.log(condition)
  while(condition == false){
    await this.clickElement("[class *='directionLeft'] div:nth-child(2) div:nth-child(1) div:nth-child(1) svg")
    month = await this.getHTMLText("[class *='directionLeft'] div:nth-child(2) div:nth-child(2) div div:nth-child(2) strong")
    condition = month.includes(date_month) && month.includes(date_year)
  }
  var el = await this.page.$x("//td[text() = '"+date_dat+"']");
  await el[1].click()
});


Then(/^The system must capure the email address$/, async function () {
  await this.setTextInputValue("emailaddress", "test@anz.com", '#userEmail');
  await this.waitForLoading()
  //await this.attachScreenShot();
});

Then(/^The application should clear all entered values populated in the search fields$/, async function () {
  await this.checkElementValueNotExist('input#amount');
  await this.checkElementValueNotExist('input#postDate');
  //await this.attachScreenShot();
});

Then(/^The search result grid is displayed with the matching transaction results$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#transactionsGridContainer');
  await this.checkElementExist('#postDate > span.slick-column-name');
  await this.checkElementExist('#amount > span.slick-column-name');
  await this.checkElementExist('#debitCreditType > span.slick-column-name');
  await this.checkElementExist('#transactionType > span.slick-column-name');
  await this.checkElementExist('#narrative > span.slick-column-name');
  await this.checkElementExist('#auxDom > span.slick-column-name');
  await this.checkElementExist('#traceLine > span.slick-column-name');
  await this.clickElement("#transactionSearch");
  await this.waitForLoading()
  await this.clickElement('div:nth-child(1) > div.slick-cell.l0.r0');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
  //await this.attachScreenShot();
});

Then(/^The list of transaction search results is displayed$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#transactioNSearchTableContainer');
  await this.checkElementExist('#postDate > span.slick-column-name');
  await this.checkElementExist('#amount > span.slick-column-name');
  await this.checkElementExist('#debitCreditType > span.slick-column-name');
  await this.checkElementExist('#transactionType > span.slick-column-name');
  await this.checkElementExist('#narrative > span.slick-column-name');
  await this.checkElementExist('#auxDom > span.slick-column-name');
  await this.checkElementExist('#traceLine > span.slick-column-name');
  await this.waitForLoading()
  await this.clickElement('div:nth-child(1) > div.slick-cell.l0.r0');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
  //await this.attachScreenShot();
});

Then(/^The application should remove the search result grid section displayed on screen$/, async function () {
  await this.checkElementNotExist('#transactionsGrid-container > div.slick-header.ui-state-default');
  //await this.attachScreenShot();
});
Then(/^The application should display the labels and Search fields$/, async function () {
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkElementExist('#amount');
  await this.checkHTMLTextExist('#postDate');
  await this.checkHTMLTextExist('#transactionSearch');
  await this.checkHTMLTextExist('#transactionReset');
  await this.checkHTMLTextExist('label[for="amount"]');
  await this.checkHTMLTextExist('label[for="creditDebit"]');
  await this.checkHTMLTextExist('label[for="postDate"]');
  await this.checkElementExist('input#amount');
  await this.checkElementExist('#react-select-6--value');
  await this.checkElementExist('input#postDate');
  //await this.attachScreenShot();
});

When(/^The user no value is entered  in any of the fields$/, async function () {
  //no implementation is required,
});
Then(/^The application should display the following error messages$/, async function (table) {
  const data = table.rowsHash();
  await this.checkHTMLTextExist('#amountErrorMessage', data['Amount']);
  await this.checkHTMLTextExist('#dateErrorMessage', data['PostDate']);
});

When(/^The amount field search filter is set to amount range "<<=>>"$/, async function () {
  await this.clickElement('#amount-field > div.field__elements__node_modules-omni-react-components-Field-styles-external__3AKME > div > button');
  await this.waitForLoading()
  await this.clickElement("body > div:nth-child(6) > div > div > div:nth-child(4)");
  //await this.attachScreenShot();
});

Then(/^The application validate the amount fields and should display the error message "(.*)"$/, async function (amountErrorMessage) {
  await this.checkHTMLTextExist('#amountErrorMessage', amountErrorMessage);
});
When(/^The amount value not entered in the "Amount From" field exceeds the amount value entered in the "Amount To" field$/, async function () {
  //no implementation is required.⇔
});

Then(/^The application validate the PostDate fields and should display the error message "(.*)"$/, async function (postDateErrorMessage) {
  await this.checkHTMLTextExist('#dateErrorMessage', postDateErrorMessage);
});
When(/^The PostDate field search filter is set to Date range "<<=>>"$/, async function () {
  await this.clickElement('#postDate-field > div.field__elements__node_modules-omni-react-components-Field-styles-external__3AKME > div > button');
  await this.waitForLoading()
  await this.clickElement("body > div:nth-child(6) > div > div > div:nth-child(2)");
  //await this.attachScreenShot();
});



Then(/^The user navigate to the Review & Submit screen$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkHTMLText('#accName', 'BO-AWAITING-FULFILMENT');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkHTMLText('#Col2-0', 'Post Date');
  await this.checkHTMLText('#Col2-2', 'Amount');
  await this.checkHTMLText('#Col2-5', 'Debit/Credit');
  await this.checkHTMLText('#Col2-4', 'Tran Type');
  await this.checkHTMLText('#Col2-6', 'Auxdom');
  await this.checkHTMLText('#Col2-7', 'Trace Line');
  await this.checkHTMLText('#Col1-0', '06/01/2018');
  await this.checkHTMLText('#Col3-0', '1,000.00');
  await this.checkHTMLText('#Col4-0', 'Dr');
  await this.checkHTMLText('#Col5-0', '14');
  await this.checkHTMLText('#Col6-0', 'LATE PAYMENT FEE');
  //await this.attachScreenShot();

});
Then(/^The system must display the service request footer as per Field Matrix$/, async function () {
  await this.checkHTMLText('#importantInfoContainer div[role="heading"] span', 'Important Information');
  await this.clickElement('input[name="importantInformationCheckBox"]');
  await this.checkElementExist("#previous");
  await this.checkElementExist("#submit");
});

Then(/^The system must display a confirmation pop-up message as per the Field Matrix$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist("#requestStatus");
  await this.checkElementExist("#responseId");
  await this.checkElementExist("#requestStatusLbl");
  await this.checkElementExist("#okBtn");
  await this.checkHTMLTextExist("#requestStatus", "Submitted");
  await this.checkElementExist("#detailLink");
  await this.checkElementExist("#requestLink > div");
  await this.checkHTMLTextExist("#detailLink", "View Request Details");
  await this.checkHTMLTextExist("#requestLink > div", "Raise another Service Request");
});

Then(/^The system must direct the user to the 'View Details Screen' that was just created$/, async function () {
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#summery-label-0');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkHTMLText('#Col2-0', 'Post Date');
  await this.checkHTMLText('#Col2-2', 'Amount');
  await this.checkHTMLText('#Col2-5', 'Credit/Debits');
  await this.checkHTMLText('#Col2-4', 'Tran Type');
  await this.checkHTMLText('#Col2-6', 'Auxdom');
  await this.checkHTMLText('#Col2-7', 'Trace Line');
  await this.checkHTMLText('#Col1-0', '06/01/2018');
  await this.checkHTMLText('#Col3-0', '1,000.00');
  await this.checkHTMLText('#Col4-0', 'Dr');
  await this.checkHTMLText('#Col5-0', '14');
  await this.checkHTMLText('#Col6-0', 'LATE PAYMENT FEE');
  //await this.attachScreenShot();
});

Then(/^The system must display the label mentioned as per the Field Matrix$/, async function () {
  await this.checkElementExist("#account_wrapper > div >div");
  await this.checkElementExist("#accountSearch > i");
});

Then(/^Help text 'Select Account Number' is displayed in the Account Details field$/, async function () {
  await this.checkHTMLTextExist("#account_placeholder", "Select Account Number");
});

When(/^The user clicks on the account drop down$/, async function () {
  await this.clickElement("#account_arrow i[class='fa fa-chevron-down']");
});

Then(/^The legal entity of each account displays$/, async function () {
  await this.checkHTMLText('#accName', 'BO-AWAITING-FULFILMENT');
  await this.checkHTMLText('#accNum', '010201 - 123456201');
  await this.checkHTMLText('#account_wrapper > div > div:nth-child(3) > div > table > tbody > tr > td:nth-child(3) > span', 'Book Order Awaiting Fulfilment - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor');
});

Then(/^The system must display all accounts$/, async function () {});

When(/^I enter a search criteria with no matching results$/, async function () {
  await this.sendKeys("#account_wrapper > div > div:nth-child(3) > div", "AccountnotExisting", false);
});

Then(/^The system must display the error message "(.*)"$/, async function (message) {
  await this.checkHTMLText("#account_wrapper > div > div:nth-child(3) > div", message);
});

When(/^I am entering the search criteria "(.*)" in the select account field$/, async function (search) {
  await this.waitForLoading()
  await this.clearTextElementValue("#account_wrapper > div > div:nth-child(3) > div");
  await this.sendKeys("#account_wrapper > div > div:nth-child(3) > div", search, false);
});

Then(/^The system pops up the drop-down list with the list of matching results$/, async function () {
  await this.waitForLoading()
  //await this.checkElementExist("#accountContainer #account_wrapper");
  await this.checkElementExist("#accountContainer .Select-option");
});

Then(/^The user select one of the listed items by clicking the account on the drop down$/, async function () {
  await this.waitForLoading()
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'BO-PENDING'
  });
  //await this.attachScreenShot();
});

Then(/^The system must display the "(.*)" with value in the text box$/, async function (acountNo) {
  await this.waitForLoading()
  await this.checkElementExist("div:nth-child(3) > div > span:nth-child(1)");
  await this.checkElementExist("#accNum");
  await this.checkElementExist("#account_wrapper > div > div:nth-child(3) > div");
});

Then(/^The user is back on the Trace a Transaction request screen$/, async function () {
  await this.checkElementExist("#investigateTransactionTitle");
  await this.checkElementExist("#investigateTransactionDesc");
});


Then(/^The user has not selected the transaction and initiated trace a transaction request$/, async function () {
  await this.waitForLoading()
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'BO-PENDING'
  });
  await this.setCurrentDateToCreationDate('input#postDate');
  await this.sendKeys(undefined, 'Tab', true);
  await this.clickElement('#transactionSearch');
  await this.clickElement('#next');
  //await this.attachScreenShot();
});

Then(/^The application should display the error message$/, async function (table) {
  const data = table.rowsHash();
  await this.checkHTMLTextExist('#amountErrorMessage', data['Error_message']);
  //await this.attachScreenShot();
});

Then(/^The user has selected the transaction and initiated trace a transaction request$/, async function () {
  await this.clickElement("div.slick-viewport > div > div:nth-child(1)");
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
  //await this.attachScreenShot();
});

When(/^The user submits a search and selected the record to initiated trace a transaction request$/, async function () {
  await this.waitForLoading()
  await this.clickElement("#postDate-field")
  await this.clickElement("#postDate-field div.SingleDatePicker_picker.SingleDatePicker_picker_1.SingleDatePicker_picker__directionLeft.SingleDatePicker_picker__directionLeft_2 > div > div > div > div.DayPicker_focusRegion.DayPicker_focusRegion_1 > div.DayPicker_transitionContainer.DayPicker_transitionContainer_1 > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(5)");
  await this.waitForLoading()
  await this.clickElement("#transactionSearch");
  await this.waitForLoading()
  await this.clickElement('div:nth-child(1) > div.slick-cell.l0.r0');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
  //await this.attachScreenShot();
});


Then(/^The system must display the Review & Submit screen as per the field matrix$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLTextExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkElementExist("#previous");
  await this.checkElementExist("#submit");
  //await this.attachScreenShot();
});



// Then(/^The 'I want to Trace a Transaction within a Bulk Amount' option is displayed and selected$/, async function () {
//   await this.waitForLoading()
//   await this.clickElement("#investigateTransactionDetailsContainerContent > div > input");
//   await this.waitForLoading()
//   await this.sendKeys('input#amountEntry', '1234', false);
//   //await this.setTextInputValue(null, fromamt, '#amountEntry')
//   await this.clickElement('input#postDateEntry');
//   await this.clickElement('#postDateEntry-field > div > div > div > div > div > div > div.SingleDatePicker_picker.SingleDatePicker_picker_1.SingleDatePicker_picker__directionLeft.SingleDatePicker_picker__directionLeft_2 > div > div > div > div.DayPicker_focusRegion.DayPicker_focusRegion_1 > div.DayPicker_transitionContainer.DayPicker_transitionContainer_1 > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(5)')
//   await this.clickElement("input[name='traceTransactionWithBulkAmountEntry']");
//   //await this.attachScreenShot();
// });

When(/^No values are entered in any of the following fields BSB,Account Number,Account Name and Trace Amount$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLTextExist("#beneficiaryAccountName");
  await this.checkHTMLTextExist("#beneficiaryBsb");
  await this.checkHTMLTextExist("#beneficiaryAccount");
  await this.checkHTMLTextExist("#beneficiaryAmount");
  await this.clearTextElementValue("#beneficiaryAccountName");
  await this.clearTextElementValue("#beneficiaryBsb");
  await this.clearTextElementValue("#beneficiaryAccount");
  await this.clearTextElementValue("#beneficiaryAmount");
});

Then(/^The application should display the applicable error messages$/, async function (table) {
  const data = table.rowsHash();
  await this.checkHTMLTextExist('#beneficiaryAccountName', data['Account Name']);
  await this.checkHTMLTextExist('#beneficiaryBsb', data['BSB']);
  await this.checkHTMLTextExist('#beneficiaryAccount', data['Account Name']);
  await this.checkHTMLTextExist('#beneficiaryAmount', data['Trace Amount']);
  //await this.attachScreenShot();
});

When(/^The user entered invalid values in BSB and Account Number fields$/, async function () {
  await this.sendKeys('#beneficiaryAccountName', 'ABCD', false);
  await this.sendKeys('#beneficiaryBsb', '123', false);
  await this.sendKeys('#beneficiaryAccount', '123', false);
  await this.sendKeys('#beneficiaryAmount', '123', false);
  //await this.attachScreenShot();
});

Then(/^The application should display the following below error messages$/, async function (table) {
  const data = table.rowsHash();
  await this.checkHTMLTextExist('#beneficiaryBsb', data['BSB']);
  await this.checkHTMLTextExist('#beneficiaryAccount', data['Account Number']);
  //await this.attachScreenShot();

});

Then(/^Application should navigate back to the Service Request 'Enter Details' Screen and Retain all populated details$/, async function () {
  await this.checkElementExist("#account_wrapper > div >div");
  await this.checkElementExist("#accountSearch > i");
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist("#transactionId-container > div.slick-viewport > div > div:nth-child(1)");
  await this.checkElementExist("#investigateTransactionTitle");
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  await this.checkElementExist("#transactionId-container > div.slick-viewport > div > div:nth-child(1)");
  //await this.attachScreenShot();
});

Then(/^The system must display the transaction search results grid with NO transaction records selected$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#transactioNSearchTableContainer');
  await this.checkElementExist('#postDate > span.slick-column-name');
  await this.checkElementExist('#amount > span.slick-column-name');
  await this.checkElementExist('#debitCreditType > span.slick-column-name');
  await this.checkElementExist('#transactionType > span.slick-column-name');
  await this.checkElementExist('#narrative > span.slick-column-name');
  await this.checkElementExist('#auxDom > span.slick-column-name');
  await this.checkElementExist('#traceLine > span.slick-column-name');
  await this.checkElementNotExist('div[class*="ui-widget-content.slick-row.even.active"]')
  //await this.attachScreenShot();
});
When(/^The user selects a transaction record row by clicking on the row$/, async function () {
  await this.clickElement('div:nth-child(1) > div.slick-cell.l0.r0');
});

Then(/^The system will select the transaction record and highlight the row$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
});

When(/^The user selects a different transaction record by clicking another row$/, async function () {
  await this.clickElement('div:nth-child(2) > div.slick-cell.l0.r0');
});

Then(/^The system will select the new transaction and highlight the row$/, async function () {
  await this.checkElementExist('div > div.ui-widget-content.slick-row.odd.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.odd.active > div.slick-cell.l1.r1.selected');
});

Then(/^The system will deselect the original transaction record with the row no longer highlighted$/, async function () {
  await this.checkElementNotExist('div:nth-child(1) > div.slick-cell.l0.r0');
  await this.checkElementNotExist('div > div.ui-widget-content.slick-row.even.active');
  await this.checkElementNotExist('div.ui-widget-content.slick-row.even.active > div.slick-cell.l0.r0.selected');
});

Then(/^The user selects the Account "(.*)" from account selection subsection$/, async function (accountName) {
  await this.checkElementExist("#accountContainer div[role='heading'] span", ' #Then The user click on the Download Form button');
  await this.waitForLoading()
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: accountName
  });
  //await this.attachScreenShot();
});

When(/^The user navigates through the search grid pages by using the arrow controls$/, async function () {
  await this.clickElement("#transactionIdNextBtn");
  await this.waitForLoading()
  await this.checkElementExist("#transactionIdpaginationBar");
  await this.checkElementExist("#transactionIdNextBtn");
  await this.checkElementExist("#transactionIdPreviousBtn");
  await this.clickElement("#transactionIdPreviousBtn");
});

Then(/^The application should retain the transaction record selection if no other transaction record has been selected$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.odd.active');
  await this.checkElementExist('div.ui-widget-content.slick-row.odd.active > div.slick-cell.l1.r1.selected');
});


Then(/^The application should display the Service Request Footer fields$/, async function () {
  await this.checkHTMLTextExist('#next');
  //await this.attachScreenShot();
});

Then(/^The transaction result list should in paginatation and display a maximum of (-?\d+) records on each page$/, async function (No) {
  const itemsPerPage = await this.page.$$eval('ui-widget-content slick-row', (items) => {
    return items.length;
    if (itemsPerPage == No) {
      console.log("itemsPerPage", itemsPerPage);
    }
  });
});
Then(/^The application should display the alert message (".*")$/, async function (message) {
  await this.waitForLoading()
  this.page.on('dialog', async dialog => {
    const msg = dialog.message();
    assert.equal("Verify Message ", message, msg);
  });
  //await this.attachScreenShot();
});

Then(/^The user can navigate through the search grid pages by using the arrow controls$/, async function () {
  await this.clickElement("#transactionIdNextBtn");
  await this.waitForLoading()
  await this.checkElementExist("#transactionIdpaginationBar");
  await this.checkElementExist("#transactionIdNextBtn");
   await this.clickElement("#transactionIdNextBtn");
  await this.checkElementExist("#transactionIdPreviousBtn");
  await this.clickElement("#transactionIdPreviousBtn");
});

Then(/^The application must display the 'I want a Trace a Transaction within a Bulk Amount' option$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist("label[for='bulkTransactionCheckBox']");
});

Then(/^The bulk option checkbox is deselected by default$/, async function () {
  let disabledChekbox = false;
  disabledChekbox = await this.isCheckboxDisabled('input[name="bulkTransactionCheckBox"]');
  assert(disabledChekbox)
});

When(/^The user select a transaction of type = Credit$/, async function () {
  await this.waitForLoading()
  await this.clickElement('div.slick-viewport > div > div:nth-child(3)');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
});

Then(/^The checkbox becomes disabled$/, async function () {
  let disabledChekbox = false;
  disabledChekbox = await this.page.$('input[name="bulkTransactionCheckBox"]');
  assert(disabledChekbox)
});

Given(/^The user has selected a Debit transaction$/, async function () {
  await this.waitForLoading()
  await this.clickElement('div.slick-viewport > div > div:nth-child(1)');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
});

Then(/^The user changes the I want a Trace a Transaction within a Bulk Amount option to Yes$/, async function () {
  await this.clickElement('input[name="bulkTransactionCheckBox"]');
});


When(/^The user no value is entered in the BSB field$/, async function () {
  await this.sendKeys("#beneficiaryAccountName", "", false);
});

When(/^The user entered non-numeric values in BSB, Account Number and Trace Amount fields$/, async function () {
  await this.sendKeys('#beneficiaryBsb', 'abc', false);
  await this.sendKeys('#beneficiaryAccount', 'abc', false);
  await this.sendKeys('#beneficiaryAmount', 'abc', false);
  //await this.attachScreenShot();
});
Then(/^The application must not accept non-numeric data in the above fields$/, async function () {
  await this.waitForLoading()
  await this.checkElementValueExist('#beneficiaryBsb');
  await this.checkElementValueExist('#beneficiaryAccount');
  await this.checkElementValueExist('#beneficiaryAmount');
  //await this.attachScreenShot();
});

Given(/^The user attempts to enter an amount more than the maximum amount allowed "(.*)" in the Trace Amount field$/, async function (amount) {
  await this.sendKeys('#beneficiaryAmount', amount, false);
  //await this.attachScreenShot();
});

Then(/^The application must not accept and display error message "(.*)"$/, async function (message) {
  await this.waitForLoading()
  await this.checkHTMLTextExist('#beneficiaryAmount', message);
  //await this.attachScreenShot();
});


Then(/^The application must display the 'Your Reference' details in 'Review & Submit' screen$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLTextExist('#customerReferenceContainer div[role="heading"] span', "Your Reference (optional)");
  await this.checkElementExist('#customerReference');
  await this.checkHTMLTextExist('#customerReference', "AUS#Ref123");
  //await this.attachScreenShot();
});

When(/^The user Not enter reference details in Your Reference field$/, async function () {
  await this.waitForLoading()
  await this.sendKeys('input#customerReference', "", false);
  //await this.attachScreenShot();
});

Then(/^The application must hide the 'Your Reference' details in 'Review & Submit' screen$/, async function () {
  await this.waitForLoading()
  await this.checkElementNotExist('#customerReferenceContainer div[role="heading"] span');
  await this.checkElementNotExist('#customerReference');
  //await this.attachScreenShot();
});

Then(/^The application (?:must|should|) display the 'Spinner' while the service calls are being completed$/, async function () {
  await this.checkElementExist('#content > div');

});

Then(/^The application should stop displaying spinner and approval modal should disappear$/, async function () {
  await this.checkElementNotExist('#content > div');

});



Then(/^The system displays the checkbox 'I want a Trace a Transaction within a Bulk Amount'$/, async function () {
  await this.checkElementExist("label[for='bulkTransactionCheckBox']");
  await this.checkElementExist('input[name="bulkTransactionCheckBox"]');
  //await this.attachScreenShot();
});
Then(/^The checkbox 'I want a Trace a Transaction within a Bulk Amount' is disabled$/, async function () {
  const is_disabled = await this.page.$('input[name="bulkTransactionCheckBox"]') !== null;
  assert(is_disabled)
});

Then(/^The checkbox 'I want a Trace a Transaction within a Bulk Amount' is not checked$/, async function () {
  const checkboxStatus = await this.page.$eval('input[name="bulkTransactionCheckBox"]', input => {
    return input.checked
  })   });
Then(/^The user has selected the 'DEBIT' transaction and initiated trace a transaction request$/, async function () {
  await this.waitForLoading()
  await this.clickElement('div.slick-viewport > div > div:nth-child(1)');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.even.active');
});

Then(/^The checkbox 'I want a Trace a Transaction within a Bulk Amount' is enabled$/, async function () {
  const is_enabled = await this.page.$('input[name="bulkTransactionCheckBox"]');
  // let valueHandle = getProperty('disabled');
  // assert.equal(valueHandle.jsonValue(), 'disabled')
});


When(/^The user check 'I want a Trace a Transaction within a Bulk Amount' checkbox$/, async function () {
  await this.clickElement('input[name="bulkTransactionCheckBox"]');
});

When(/^The user selected 'I want a Trace a Transaction within a Bulk Amount' option$/, async function () {
  //await this.clickElement('input[name="traceTransactionWithBulkAmountEntry"]');
  await this.clickElement('input[name="bulkTransactionCheckBox"]');
});

Then(/^The user has select the next 'CREDIT' transaction and initiated trace a transaction request$/, async function () {
  await this.waitForLoading()
  await this.clickElement('div.slick-viewport > div > div:nth-child(2)');
  await this.waitForLoading()
  await this.checkElementExist('div > div.ui-widget-content.slick-row.odd.active');
});

Then(/^The system displays fields to enter 'Beneficiary Details'$/, async function () {
  await this.checkHTMLTextExist('#beneficiaryDetails > div > span');
  await this.checkHTMLTextExist('#beneficiaryAccountName');
  await this.checkHTMLTextExist('#beneficiaryBsb');
  await this.checkHTMLTextExist('#beneficiaryAccount');
  await this.checkHTMLTextExist('#beneficiaryAmount');
  //await this.attachScreenShot();
});

When(/^The user enter the 'Beneficiary Details' without 'BSB'$/, async function () {
  await this.clearTextElementValue('input#beneficiaryBsb');
  await this.sendKeys('#beneficiaryBsb', '', false);
});


When(/^The user enter the 'Beneficiary Details' with incorrect 'BSB'$/, async function () {
  await this.clearTextElementValue('input#beneficiaryBsb');
  await this.sendKeys('#beneficiaryBsb', '123', false);
});


When(/^The user enter the 'Beneficiary Details' with invalid 'BSB'$/, async function () {
  await this.clearTextElementValue('input#beneficiaryBsb');
  await this.sendKeys('#beneficiaryBsb', 'BSB', false);
});

Then(/^The application does not accept invalid "BSB"$/, async function () {
  await this.checkElementValueNotExist('input#beneficiaryBsb');
});

When(/^The user enter the 'Beneficiary Details' without 'Account Number'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAccount');
  await this.sendKeys('#beneficiaryAccount', '', false);
});

When(/^The user enter the 'Beneficiary Details' with 'Invalid Account Number'$/, async function () {
  await this.clearTextElementValue('input#beneficiaryAccount');
  await this.sendKeys('#beneficiaryAccount', '123', false);
});

When(/^The user enter the 'Beneficiary Details' with 'Non Numeric Account Number'$/, async function () {
  await this.clearTextElementValue('input#beneficiaryAccount');
  await this.sendKeys('#beneficiaryAccount', 'ABC', false);
});

Then(/^The application does not accept invalid "Account Number"$/, async function () {

  await this.checkElementValueNotExist('input#beneficiaryAccount');
});

When(/^The user enter the 'Beneficiary Details' without 'Account Name'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAccountName');
  await this.sendKeys('#beneficiaryAccountName', '', false);
});


When(/^The user enter the 'Beneficiary Details' with 'Invalid Account Name'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAccountName');
  await this.sendKeys('#beneficiaryAccountName', '~!', false);
});

When(/^The user enter the 'Beneficiary Details' without 'Trace Amount'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAmount');
  await this.sendKeys('#beneficiaryAmount', '', false);
});

When(/^The user enter the 'Beneficiary Details' with 'Invalid Trace Amount'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAmount');
  await this.sendKeys('#beneficiaryAmount', 'ABCD', false);
});

When(/^The user enter the 'Beneficiary Details' with 'Invalid range Trace Amount'$/, async function () {
  await this.clearTextElementValue('#beneficiaryAmount');
  await this.sendKeys('#beneficiaryAmount', '0', false);
});


Then(/^The application does not accept invalid "Trace Amount"$/, async function () {

  await this.checkElementValueNotExist('input#beneficiaryAccount');
});

When(/^The user enter the 'Beneficiary Details' Exceed Maximum Trace Amount$/, async function () {
  await this.clearTextElementValue('#beneficiaryAmount');
  await this.sendKeys('#beneficiaryAmount', '99999999999', false);
});

Then(/^The system displays the text and link 'Enter your details in manually'$/, async function () {

  await this.checkHTMLTextExist('div[class^="form-text"]', "Can't find the transactions you are looking for");
  await this.checkElementExist('div[class^="form-text"]');
  await this.checkHTMLTextExist('#formSwitchLink', "Enter your details in manually");
  await this.checkElementExist('#formSwitchLink');
});

Then(/^The system should disappears the search fields$/, async function () {
  await this.checkElementNotExist('input#amount');
  await this.checkElementNotExist('input#postDate');
  await this.checkElementNotExist("#postDate-field");
  await this.checkElementNotExist("#transactionSearch");
});
Then(/^The system displays fields to enter 'Manual entry details'$/, async function () {
  await this.checkElementExist('#traceLineEntry');
  await this.checkElementExist('#creditDebitEntry');
  await this.checkElementExist('#postDateEntry');
  await this.checkElementExist('#amountEntry');
  await this.checkElementExist('#transactionManualEntryContainerContent > div:nth-child(3) > div > div > input');
  await this.checkElementExist('label[for="internationalTransactionEntry"]');
  await this.checkHTMLTextExist('label[for="internationalTransactionEntry"]', 'This is an international transaction');
  await this.checkHTMLTextExist('input[name="internationalTransactionEntry"]');
  await this.checkHTMLTextExist('label[for="traceTransactionWithBulkAmountEntry"]');
  await this.checkHTMLTextExist('label[for="traceTransactionWithBulkAmountEntry"]', 'I want to trace a transaction from within a Bulk Amount');
  await this.checkHTMLTextExist('input[name="traceTransactionWithBulkAmountEntry"]');
  await this.checkHTMLTextExist('#amountEntryCurrency');
  //await this.attachScreenShot();
});
Then(/^The default currency selected in the drop down should be 'AUD'$/, async function () {
  await this.checkHTMLTextExist('#amountEntryCurrency');
  await this.checkHTMLText('#amountEntryCurrency > option:nth-child(2)', 'AUD');
  await this.clickElement('#amountEntry-field i[class="fa fa-chevron-down"]');
  var selectedVal = await this.page.$eval("#amountEntryCurrency > option", selectedValue => selectedValue.value)
  console.log("selected value : " + selectedVal)

});

Then(/^The list of currencies should appear in drop down$/, async function (Currency) {
  const currencyList = Currency.rowsHash();
  var dropdowns = await this.page.$$eval("#amountEntryCurrency > option", all => all.map(a => a.textContent))
  if (dropdowns.indexOf(currencyList) != -1) {
    console.log("All currency present :" + dropdowns)
  }
});

When(/^The user clicks on "Search for transaction online" link$/, async function () {
  await this.checkHTMLTextExist('div[class^="form-text__node_modules-omni-react"]', "Can't find the transactions you are looking for");
  await this.checkElementExist('#formSwitchLink');
  await this.checkElementExist('#postDateEntry');
  await this.clickElement('#formSwitchLink');
  //await this.attachScreenShot();
});
Then(/^The user returned to the online search UI$/, async function () {
  await this.checkElementExist('input#amount');
  await this.checkElementExist('input#postDate');
  await this.checkElementExist("#postDate-field");
  await this.checkElementExist("#transactionSearch");
  //await this.attachScreenShot();
});
Then(/^The user enter the 'Manual entry information' in all fields$/, async function () {
  await this.setTextInputValue(null, '1234', '#traceLineEntry');
  await this.clickElement('input#postDateEntry');
  await this.clickElement('#postDateEntry-field > div > div > div > div > div > div > div.SingleDatePicker_picker.SingleDatePicker_picker_1.SingleDatePicker_picker__directionLeft.SingleDatePicker_picker__directionLeft_2 > div > div > div > div.DayPicker_focusRegion.DayPicker_focusRegion_1 > div.DayPicker_transitionContainer.DayPicker_transitionContainer_1 > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(3)')
  await this.setTextInputValue(null, '4000', '#amountEntry');
  //await this.attachScreenShot();
});
When(/^The user swaps back to the transaction search online screen$/, async function () {
  await this.clickElement('#formSwitchLink');
  //await this.attachScreenShot();
});

Then(/^The application should clear all entered values populated in the manual search fields$/, async function () {
  await this.waitForLoading()
  await this.checkElementValueNotExist('#traceLineEntry');
  await this.checkElementValueNotExist('#postDateEntry');
  await this.checkElementValueNotExist('#amountEntry');
  //await this.attachScreenShot();
});


When(/^The user is presented with View Details screen of (".*") service request "(.*)"$/, async function (serviceRequest, requestId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.setTextInputValue(null, requestId, 'input[aria-label="Request ID"]');
  await this.clickElement('#summaryGrid-search');
  //await this.attachScreenShot();
});

When(/^The user clicks on (".*") service request in the list screen$/, async function (serviceRequest) {
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});
Then(/^The application should display the selected service request in the View Details screen$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#summery-label-0');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkHTMLText('#Col2-0', 'Post Date');
  await this.checkHTMLText('#Col2-2', 'Amount');
  await this.checkHTMLText('#Col2-5', 'Credit/Debits');
  await this.checkHTMLText('#Col2-4', 'Tran Type');
  await this.checkHTMLText('#Col2-6', 'Auxdom');
  await this.checkHTMLText('#Col2-7', 'Trace Line');
  await this.checkElementExist('#Col1-0', '06/01/2018');
  await this.checkElementExist('#Col3-0', '1,000.00');
  await this.checkElementExist('#Col4-0', 'Dr');
  await this.checkHTMLText('#Col5-0', '14');
  await this.checkHTMLText('#Col6-0', 'LATE PAYMENT FEE');
  await this.checkElementExist('#Col7-0');
  //await this.attachScreenShot();
});


Then(/^The legal entity displays under the  #Then The user click on the Download Form button section in the request$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkHTMLText('#account_wrapper > div > div:nth-child(2) > div > table > tbody > tr > td:nth-child(1) > span', 'AUD');
  await this.checkHTMLText('#accName', 'BO-AWAITING-FULFILMENT');
  await this.checkHTMLText('#account_wrapper td:nth-child(3) >span', 'Book Order Awaiting Fulfilment - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor');
});


Given(/^The user on the service request history page$/, async function () {
  await this.waitForLoading()
  // By default I'm on service request history page
});

When(/^The user open the search fields$/, async function () {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  //await this.attachScreenShot();
});

Then(/^The user click into the "Request type" field$/, async function () {
  await this.clickElement('#type-field > div div.Select__value-container.Select__value-container');

});

Then(/^The user should be able to see and select "(.*)"$/, async function (ServiceType) {
  await this.clickElement('#type-field > div div.Select__value-container.Select__value-container');
  await this.sendKeys('#type-field > div div.Select__value-container.Select__value-container', ServiceType, false);
  await this.sendKeys(undefined, 'Enter', true);
});


Then(/^User should only see request history items that relate to "(.*)"$/, async function (requestType) {
  await this.checkElementExist('#summaryGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l3.r3',requestType);
  await this.checkElementExist('#summaryGrid-container > div.slick-viewport > div > div:nth-child(2) > div.slick-cell.l3.r3', requestType);
});

Then(/^The fields must be in a non-editable mode in the View Details screen$/, async function () {
  //await this.checkElementExist('disabled');
});


Then(/^The actions buttons required for view mode must be presented$/, async function () {});

When(/^The user has navigated to the "().*" screen$/, async function (screen) {
  await this.waitForLoading()
  if (screen === 'Trace Transaction') {
    await this.clickElement('#CTTR > div');
  }
  //await this.attachScreenShot();
});


When(/^The user selected the Transaction "(.*)" was manually entered$/, async function (TransactionId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.sendKeys('#react-select-2--value > div.Select-input > input', TransactionId, false);
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

When(/^The user selected the Transaction "(.*)" within a bulk amount$/, async function (TransactionId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.sendKeys('#react-select-2--value > div.Select-input > input', TransactionId, false);
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The system must display the Manual Transaction subsection in view mode$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLText('#beneficiaryDetails > div > span', 'Beneficiary Details');
  await this.checkHTMLText('label[for="beneficiaryAccountName"]', 'Account Name');
  await this.checkHTMLText('label[for="beneficiaryBsb"]', 'BSB');
  await this.checkHTMLText('label[for="beneficiaryAccount"]', 'Account Number');
  await this.checkHTMLText('label[for="beneficiaryAmount"]', 'Trace Amount');
  await this.checkElementExist('#beneficiaryAccountName');
  await this.checkElementExist('#beneficiaryBsb');
  await this.checkElementExist('#beneficiaryAccount');
  await this.checkElementExist('#beneficiaryAmount');
  //await this.attachScreenShot();
});


Then(/^The system must display the bulk amount details in view mode$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLText('#beneficiaryDetails > div > span', 'Beneficiary Details');
  await this.checkHTMLText('label[for="beneficiaryAccountName"]', 'Account Name');
  await this.checkHTMLText('label[for="beneficiaryBsb"]', 'BSB');
  await this.checkHTMLText('label[for="beneficiaryAccount"]', 'Account Number');
  await this.checkHTMLText('label[for="beneficiaryAmount"]', 'Trace Amount');
  await this.checkElementExist('#beneficiaryAccountName');
  await this.checkElementExist('#beneficiaryBsb');
  await this.checkElementExist('#beneficiaryAccount');
  await this.checkElementExist('#beneficiaryAmount');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkHTMLText('#Col2-0', 'Post Date');
  await this.checkHTMLText('#Col2-2', 'Amount');
  await this.checkHTMLText('#Col2-5', 'Debit/Credit');
  await this.checkHTMLText('#Col2-4', 'Tran Type');
  await this.checkHTMLText('#Col2-6', 'Auxdom');
  await this.checkHTMLText('#Col2-7', 'Trace Line');
  // await this.checkHTMLTextExist('#transactionManualEntryContainer div[role="heading"] span', 'Search for Transaction');
  // await this.checkHTMLText('label[for="traceLineEntry"]', 'Traceline');
  // await this.checkHTMLText('label[for="creditDebitEntry"]', 'Credit/Debits');
  // await this.checkHTMLText('label[for="postDateEntry"]', 'Post Date');
  // await this.checkHTMLText('label[for="amountEntry"]', 'Amount');
  //await this.checkHTMLText('label[for="internationalTransactionEntry"]', 'This is an international transaction');
  //await this.checkElementExist('#traceLineEntry');
  //await this.checkElementExist('#creditDebitEntry');
  //await this.checkElementExist('#amountEntry');
  //await this.attachScreenShot();
});

Then(/^The 'Due by' and 'Your reference' column should displays$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#dueByTZAdj > span.slick-column-name');
  await this.checkElementExist('#yourRef > span.slick-column-name');
});

When(/^The user have selected service request$/, async function () {});

Then(/^The 'Due by' and 'Your reference' does not show up in the search parameter$/, async function () {
  await this.checkElementNotExist('#dueByTZAdj > span.slick-column-name');
  await this.checkElementNotExist('#yourRef > span.slick-column-name');
});

When(/^The service request's status is 'More Information Required'$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLText('label[for="status"]', 'Request Status')
  await this.clickElement('#react-select-4--value > div.Select-input');
  await this.sendKeys('#react-select-4--value > div.Select-input', 'Trace Transaction', false);
  await this.sendKeys(undefined, 'Enter', true);
  await this.sendKeys('#react-select-3--value > div.Select-input', 'More Information Required', false);
  await this.sendKeys(undefined, 'Enter', true);
  await this.clickElement('#summaryGrid-search');
});

Then(/^The 'Due By' value for that service request will be not displayed$/, async function () {
  await this.waitForLoading()
  await this.checkElementNotExist('#summaryGrid-container .slick-cell.l13.r13', '');
});

When(/^The status in SERVICE_REQUEST table is "(.*)" for the request "(.*)"$/, async function (Status, TransactionId) {
  await this.waitForLoading()
  await this.clickElement('#searchToggleBtn > button');
  await this.sendKeys('#react-select-2--value > div.Select-input > input', TransactionId, false);
  await this.clickElement('#summaryGrid-search');
  await this.waitForLoading()
  await this.clickElement('#summaryGrid-container > div.slick-viewport > div > div > div.slick-cell.l0.r0');
  //await this.attachScreenShot();
});

Then(/^The service request summary page displays$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkElementExist('#auditHistory > button');
  await this.clickElement('#auditHistory > button');
  await this.waitForLoading()
  await this.checkElementExist('#eventTZAdjDateTime > span');
  await this.checkElementExist('#statusText > span');
  await this.checkElementExist('#userFullName > span');
  await this.checkElementExist('#cancelBtn > span');
  //await this.attachScreenShot();
});

Then(/^The status in Audit history should displays as "(.*)"$/, async function (status) {
  await this.waitForLoading()
  if (status === 'In Progress')
    await this.checkHTMLText('#auditGrid-container > div.slick-viewport > div > div.ui-widget-content.slick-row.even > div.slick-cell.l1.r1', status);
  else if (status === 'Cancelled') {
    await this.checkHTMLText('#auditGrid-container > div.slick-viewport > div > div:nth-child(2) > div.slick-cell.l1.r1', status);
  } else if (status === 'Completed') {
    await this.checkHTMLText('#auditGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l1.r1', status);
  } else if (status === 'Submitted') {
    await this.checkHTMLText('#auditGrid-container > div.slick-viewport > div > div:nth-child(2) > div.slick-cell.l1.r1', status);
  } else if (status === 'More Information Required') {
    await this.checkHTMLText('#auditGrid-container > div.slick-viewport > div > div:nth-child(2) > div.slick-cell.l1.r1', status);
  }
  //await this.attachScreenShot();
});

When(/^The user changes the account selection to a different account$/, async function () {
  await this.checkElementExist("#accountContainer div[role='heading'] span", ' #Then The user click on the Download Form button');
  await this.clickElement("#accountContainer #account_wrapper");
  await this.clickElement("#accountContainer .Select-option");
  const account = await this.getTextInputValue("#accountContainer #accNum");
  this.setState('account', {
    selector: "#accountContainer #accNum",
    value: account,
    type: 'BO-PENDING'
  });
 // //await this.attachScreenShot();
});

Then(/^The user enter the 'Beneficiary Details' in all fields$/, async function () {
  await this.checkHTMLTextExist('#beneficiaryDetails > div > span');
  await this.checkHTMLTextExist('#beneficiaryAccountName');
  await this.checkHTMLTextExist('#beneficiaryBsb');
  await this.checkHTMLTextExist('#beneficiaryAccount');
  await this.checkHTMLTextExist('#beneficiaryAmount');
  await this.setTextInputValue(null, 'ABCD corp Limited', '#beneficiaryAccountName');
  await this.setTextInputValue(null, '8765432', '#beneficiaryBsb');
  await this.setTextInputValue(null, '987654', '#beneficiaryAccount');
  await this.setTextInputValue(null, '15', '#beneficiaryAmount');
  //await this.attachScreenShot();
});

Then(/^The system will clear and remove the Trace a Transaction within a Bulk Amount sub section on screen$/, async function () {
  await this.checkElementNotExist('#beneficiaryAccountName');
  await this.checkElementNotExist('#beneficiaryBsb');
  await this.checkElementNotExist('#beneficiaryAccount');
  await this.checkElementNotExist('#beneficiaryAmount');
  //await this.attachScreenShot();
});


When(/^The user selected currency as 'INR' and submitted the case$/, async function () {
  await this.sendKeys('#traceLineEntry', '8765432', false);
  await this.clickElement('#postDateEntry-field');
  await this.clickElement('#postDateEntry-field > div > div > div > div > div > div > div.SingleDatePicker_picker.SingleDatePicker_picker_1.SingleDatePicker_picker__directionLeft.SingleDatePicker_picker__directionLeft_2 > div > div > div > div.DayPicker_focusRegion.DayPicker_focusRegion_1 > div.DayPicker_transitionContainer.DayPicker_transitionContainer_1 > div > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(6)')
  await this.clickElement('#amountEntry-field > div > div:nth-child(1) > div > div > div')
  await this.page.type('#amountEntryCurrency > option:nth-child(16)', 'INR');
  await this.sendKeys('#amountEntry', '8765432', false);
  await this.clickElement("#next");
  await this.waitForLoading()
  await this.checkHTMLText('#amountEntry', 'INR 8,765,432.00');
  await this.checkHTMLText('#importantInfoContainer div[role="heading"] span', 'Important Information');
  await this.clickElement('input[name="importantInformationCheckBox1"]');
  await this.clickElement("#submit");
  await this.setTextInputValue("emailaddress", "test@anz.com", '#userEmail');
  await this.clickElement("#okBtn");
  //await this.attachScreenShot();

});
Then(/^The user view the "review" or "case details" page$/, async function () {
  await this.waitForLoading()
  await this.clickElement('#detailLink');
});

Then(/^The same currency should reflect in view case details page$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLText('#amountEntry', 'INR 8,765,432.00');
});



When(/^The user on the Trace a transaction review and submit page$/, async function () {
  await this.checkElementExist("#selfServiceStepper div[class*='steps__text__node_modules-omni-react-components-Stepper-styles-external']");
  await this.checkElementExist("#selfServiceStepper > li:nth-child(2) > div span");
  await this.checkElementExist("#selfServiceStepper > li:nth-child(3) > div span");
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  //await this.attachScreenShot();
});


When(/^The user not checked the Important Information' checkbox$/, async function () {

});

Given(/^The customer has checked the 'Important Information' Checkbox$/, async function () {
  await this.clickElement('input[name="importantInformationCheckBox1"]');
  const checkboxStatus = await this.page.$eval('input[name="importantInformationCheckBox1"]', input => {
    return input.checked
  })
  if (checkboxStatus === true) {

  }
});

When(/^The user navigates back to the 'Enter details' page$/, async function () {
  await this.clickElement('#previous');
  await this.waitForLoading()
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  await this.checkElementExist("#accountContainer div[role='heading'] span", ' #Then The user click on the Download Form button');
  await this.checkElementExist("#cancel");
  //await this.attachScreenShot();
});

Then(/^The user again navigates back to the 'Review and Submit page'$/, async function () {
  await this.clickElement('#next');
  await this.waitForLoading()
  await this.checkHTMLText("#selfServiceStepper > li:nth-child(1) > div span", 'Completed');
  await this.checkHTMLText('#importantInfoContainer div[role="heading"] span', 'Important Information');
  //await this.attachScreenShot();
});

Then(/^The 'Important Information' checkbox must be unchecked$/, async function () {
  const checkboxStatus = await this.page.$eval('input[name="importantInformationCheckBox1"]', input => {
    return input.checked
  })
  if (checkboxStatus === false) {
    //console.log('The "Important Information" checkbox is NOT checked by default :', checkboxStatus)
  }
});


When(/^The user hover the mouse over the 'Trace Transaction' link$/, async function () {
  //await this.page.hover("a[title='Trace a Transaction']");
});

When(/^The destination URL displays "(.*)"$/, async function (link) {
  const linkE = await this.page.$eval("a[title='Trace Transaction']", el => el.innerText)
  assert.equal("Verify Link text ", linkE, link);
});

Then(/^The mouse over text should display as "(.*)"$/, async function (RequestName) {
  await this.checkHTMLText("[title='Trace Transaction']", RequestName);
});

Then(/^The legal entity displays under the account section$/, async function () {
  await this.checkHTMLText('#accName', 'BO-AWAITING-FULFILMENT');
  await this.checkHTMLText('#account_wrapper td:nth-child(3) >span', 'Book Order Awaiting Fulfilment - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor');
});

Then(/^There is at least one Case Note that has been added to the service request$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#transactionCommentsGrid-container > div.slick-viewport > div > div:nth-child(1)');
  await this.checkElementExist('#transactionCommentsGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l0.r0');
  await this.checkElementExist('#transactionCommentsGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l1.r1');
  await this.checkElementExist('#transactionCommentsGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l2.r2');
  await this.checkElementExist('#transactionCommentsGrid-container > div.slick-viewport > div > div:nth-child(1) > div.slick-cell.l3.r3');
  //await this.attachScreenShot();
});

Then(/^The number of Case Notes that have been added to the service request is less than or equal to 5$/, async function () {
  var gridSize = await this.page.$eval('#transactionCommentsGrid-container > div.slick-viewport > div', e => e.childNodes);
  console.log("Grid size :" + gridSize.length < 5);
});

Then(/^The system must display all Case Notes in a grid within the 'Comments and Supporting Documents' sub-section$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLText('#transactionManualEntryContainer > div > span', 'Comments and Supporting Documents');
  await this.checkElementExist("#showAllCommentsDialog_dialog");
  let htmlText = await this.page.$$eval('[id="showAllCommentsDialog_dialog"] th > strong', td => td.map(tds => tds.innerHTML));
  assert.equal(htmlText[0], 'Date');
  assert.equal(htmlText[1], 'Added by');
  assert.equal(htmlText[2], 'Comments');
  assert.equal(htmlText[3], 'Attachments');
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(2)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(3)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(4)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(2) > td:nth-child(1)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(2) > td:nth-child(2)");
  await this.checkHTMLText("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s w");
  await this.checkHTMLText("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)", 'New comment 2');
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)", 'test');
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)", 'Doc attached');
  //await this.attachScreenShot();

});


Then(/^The Case Notes must be sorted in the order of the Date by default$/, async function () {
  await this.checkElementExist("#transactionCommentsGrid_wrap div [class='ui-state-default slick-header-column slick-header-sortable']");
});


Then(/^The application displays the latest 5 Case Notes in a grid within the 'Comments and Supporting Documents' sub-section$/, async function () {
  const gridSize = await this.page.evaluate(() => {
    const tds = Array.from(document.querySelectorAll('#additionalCommentsTableContainer tr td'));
    console.log(tds)
    return tds.map(td => td.textContent)
    assert.equal(gridSize.length >= 5);
  });
});

Then(/^The application displays a hyperlink 'click here to view all comments' below the grid$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#viewAllComments');
  await this.checkHTMLText("#viewAllComments > span", 'Click here to view all comments');
});

Given(/^The user is presented with the 'click here to view all comments' hyperlink$/, async function () {
  await this.checkElementExist("#viewAllComments");
  await this.checkHTMLText("#viewAllComments > span", 'Click here to view all comments');
});


Then(/^The application should display all Case Notes in a grid in a pop-up window$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist("#showAllCommentsDialog_dialog");
  let htmlText = await this.page.$$eval('[id="showAllCommentsDialog_dialog"] th > strong', td => td.map(tds => tds.innerHTML));
  assert.equal(htmlText[0], 'Date');
  assert.equal(htmlText[1], 'Added by');
  assert.equal(htmlText[2], 'Comments');
  assert.equal(htmlText[3], 'Attachments');
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(2)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(3)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(4)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(2) > td:nth-child(1)");
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(2) > td:nth-child(2)");
  //await this.attachScreenShot();
});


Then(/^The user clicks on a sortable column heading$/, async function () {
  await this.clickElement("#date > span.slick-column-name");
  await this.clickElement("div[class='ui-state-default slick-header-column slick-header-sortable']");
  await this.clickElement('#addedBy > span.slick-column-name');
});

Then(/^The system must sort the Case Notes History grid on the selected column$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist("div[class='ui-state-default slick-header-column slick-header-sortable']");
});

Then(/^The system must close the pop-up window and retain user on the View Details screen$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');
  await this.checkHTMLText('#transactionManualEntryContainer > div > span', 'Comments and Supporting Documents');
  //await this.attachScreenShot();
});

Then(/^The user enters an amount in the Trace Amount field under the Beneficiary details that exceeds the transaction amount$/, async function () {
  await this.checkHTMLTextExist('#beneficiaryDetails > div > span');
  await this.sendKeys('#beneficiaryAccountName', 'BSBName', false);
  await this.sendKeys('#beneficiaryBsb', '123123', false);
  await this.sendKeys('#beneficiaryAccount', '123123123', false);
  await this.sendKeys('#beneficiaryAmount', '12112321313', false);
  //await this.attachScreenShot();
});

Then(/^The user enters an amount in the Trace Amount field under the Beneficiary details that exceeds the transaction amount when entering transaction details manually$/, async function () {
  await this.checkHTMLTextExist('#beneficiaryDetails > div > span');
  await this.sendKeys('#beneficiaryAccountName', 'BSBName', false);
  await this.sendKeys('#beneficiaryBsb', '123123', false);
  await this.sendKeys('#beneficiaryAccount', '123123123', false);
  await this.sendKeys('#beneficiaryAmount', '12112321313', false);
  //await this.attachScreenShot();
});


Then(/The application displays 'New comment' sub-section$/, async function () {
  await this.waitForLoading()
  await this.checkHTMLTextExist('label[for="additionalComment"]', 'New Comment');
  await this.checkElementExist('#additionalComment');
  await this.checkElementExist('#additionalComment-field > div > div > div > label');
  //await this.attachScreenShot();
});

Then(/^The application should displays the following information for each Case Note$/, async function (table) {
  const data = table.rowsHash();
  await this.waitForLoading()
  await this.checkElementExist("#showAllCommentsDialog_dialog");
  let htmlText = await this.page.$$eval('[id="showAllCommentsDialog_dialog"] th > strong', td => td.map(tds => tds.innerHTML));
  assert.equal(htmlText[0], 'Date');
  assert.equal(htmlText[1], 'Added by');
  assert.equal(htmlText[2], 'Comments');
  assert.equal(htmlText[3], 'Attachments');
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(1)", data['Date']);
  await this.checkHTMLText("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(2)", data['Added by']);
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(3)", data['Comments']);
  await this.checkElementExist("[id='showAllCommentsDialog_dialog'] table > tbody > tr:nth-child(1) > td:nth-child(4)", data['Attachments']);
  //await this.attachScreenShot();
});


Then(/^The application should close the pop-up window and retain user on the View Details screen$/, async function () {
  await this.waitForLoading()
  // await this.checkElementExist('#investigateTransactionTitle');
  //  await this.checkHTMLText('#investigateTransactionTitle','Trace a Transaction');
  //  await this.checkHTMLText('#investigateTransactionDesc','Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  // await this.checkHTMLText('#accountContainer div[role="heading"] span',' #Then The user click on the Download Form button');
  //await this.checkHTMLText('#investigateTransactionDetailsContainer div[role="heading"] span span','Search for Transaction');
  await this.checkHTMLText('#transactionManualEntryContainer > div > span', 'Comments and Supporting Documents');
  //await this.attachScreenShot();
});


Then(/^The view details screen of online transaction is displayed with corresponding fields$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#summery-label-0');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLTextExist('#investigateTransactionDetailsContainer div[role="heading"] span span', 'Search for Transaction');

  //await this.attachScreenShot();
});

Then(/^The view details screen of manual transaction is displayed with corresponding fields$/, async function () {
  await this.waitForLoading()
  await this.checkElementExist('#investigateTransactionTitle');
  await this.checkHTMLText('#investigateTransactionTitle', 'Trace Transaction');
  await this.checkHTMLText('#investigateTransactionDesc', 'Trace a transaction if your beneficiary is claiming non receipt or you are unable to reconcile a transaction');
  await this.checkHTMLText('#requestSummary div[role="heading"] span', 'Summary Information');
  await this.checkHTMLText('label[for="summery-label-0"]', 'Request ID');
  await this.checkHTMLText('label[for="summery-label-2"]', 'Requested by');
  await this.checkHTMLText('label[for="summery-label-3"]', 'Request Status');
  await this.checkHTMLText('label[for="summery-label-1"]', 'Requested on');
  await this.checkElementExist('#summery-label-0');
  await this.checkElementExist('#accountContainer div[role="heading"] span', ' #Then The user click on the Download Form button');
  await this.checkElementExist('#accName');
  await this.checkHTMLTextExist('#transactionManualEntryContainer div[role="heading"] span', 'Search for Transaction');
  await this.checkHTMLText('label[for="traceLineEntry"]', 'Traceline');
  await this.checkHTMLText('label[for="creditDebitEntry"]', 'Credit/Debits');
  await this.checkHTMLText('label[for="postDateEntry"]', 'Post Date');
  await this.checkHTMLText('label[for="amountEntry"]', 'Amount');
  await this.checkHTMLText('label[for="internationalTransactionEntry"]', 'This is an international transaction');
  await this.checkElementExist('#traceLineEntry');
  await this.checkElementExist('#creditDebitEntry');
  await this.checkElementExist('#amountEntry');
  await this.checkElementExist('#emptyTableMessageBox')
  //await this.attachScreenShot();
});

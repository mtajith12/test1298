  const {
    Given,
    When,
    Then
  } = require("cucumber");
  const moment = require("moment");
  const assert = require('assert');
  var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');

  Given(/^I am logging in as user "(.*)" with permission to create "(.*)" service request$/, async function (uname, sreq) {
    await this.waitForLoading();
    console.log(" I am logging in as user"+ ' ' + uname+ ' ' + "with permission to create" + ' ' +sreq+ ' ' + "service request.");
    await this.OpenFrame(uname);
  });

  Given(/^I am logging in as token user "(.*)" with permission to create "(.*)" service request$/, async function (uname, sreq) {
    await this.waitForLoading();
    console.log(" I am logging in as token user"+ ' ' + uname+ ' ' + "with permission to create" + ' ' +sreq+ ' ' + "service request.");
    await this.OpenTokenFrame(uname);
  });

  /*When(/^I click on "(.*)"$/, async function (elem) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    if (await this.page.$(selector) !== null) {      
      await this.clickElement(selector);
    }
    else {
      console.log('Element Not Found');
    }    
  });*/
  When(/^I click on "(.*)"$/, async function (elem) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    await this.clickElement(selector);
  });

  Then(/^The application should display following fields "(.*)"$/, async function (dummy, datatable) {
    await this.waitForLoading();
    var fields = datatable.hashes();
    for (var i = 0; i < Object.keys(fields).length; i++) {
      var value = fields[Object.keys(fields)[i]];
      var selector = pageobj[value.field_name];
      await this.checkElementExist(selector);
    }
  });

  Then(/^The following fields should be disabled$/, async function (datatable) {
    await this.waitForLoading();
    var fields = datatable.hashes();
    for (var i = 0; i < Object.keys(fields).length; i++) {
      var value = fields[Object.keys(fields)[i]];
      var selector = pageobj[value.field_name];
      let elem = await this.page.$(selector);
      let isdisabled = await elem.getProperty('disabled');
      assert.notEqual(isdisabled, null);
    }
  });

  Then(/^The user select "(.*)" from "(.*)"$/, async function (opt, elem) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    var opt_sel = "//*[@id='frequency']/option[7]"
    //"//span[contains(text(),'" + opt + "')]";
    await this.setTextInputValue(null, opt, selector);
   // await this.clickElement('[class *= "Select__menu-list"] div');
    await this.page.$x(opt_sel).click();
     var ele = await this.page.$x(opt_sel);
    await ele[0].click();
  }); 
  
  

  Then(/^The user select "(.*)" from the dropdown "(.*)"$/, async function (opt, elem) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    await this.page.select(selector, opt);
  });



  Then(/^The user enter the following text in corresponding textboxes$/, async function (datatable) {
    await this.waitForLoading();
    var fields = datatable.hashes();
    for (var i = 0; i < Object.keys(fields).length; i++) {
      var value = fields[Object.keys(fields)[i]];
      var selector = pageobj[value.field_name];
      var txt = value.field_value;
      await this.setTextInputValue(null, txt, selector);
    }
  });

  Then(/^The count of "(.*)" should be "(.*)"$/, async function (elem, count) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    await this.page.waitForSelector(selector);
    var num = await this.page.$$eval(selector, el => el.length);
    assert.equal(num, parseInt(count));
  });


  Then(/^The "(.*)" value displays the stored id$/, async function (elem) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    var text = await this.getId();
    await this.checkHTMLText(selector, text);
  });

  Then(/^The "(.*)" value displays the id for "(.*)" SR$/, async function (elem, reqtype) {
    await this.waitForLoading();
    var selector = pageobj[elem];
    var text = srobj[reqtype];
    await this.checkHTMLText(selector, text);
  });

  Then(/^The user waiting to load "(.*)"$/, async function (page) {
    await this.page.waitFor(50000);
  });

  //This step is to get the text value of a textbox (both input and text area)
  Then(/^The Text values should be shown in the "(.*)"$/, async function (dummy, datatable) {
    await this.waitForLoading();
    const data = datatable.rowsHash();
    for (let i = 0; i < Object.keys(data).length; i++) {
      const value = data[Object.keys(data)[i]];
      const key = Object.keys(data)[i];
      await this.checkElementExist(pageobj[key]);
      // var elemtxt = await this.page.$(pageobj[key]).value
      // console.log("text "+elemtxt+" elem")
      // assert.equal(elemtxt, text);
      await this.checkElementValue(pageobj[key], value);
    }
    //await this.attachScreenShot();
  });


  Given(/^I am logging in to ASW to update the status of service request$/, async function () {
    await this.waitForLoading();
    await this.page.goto("https://sit.mars.pega.service.dev/prweb/bS9BRXlQ_qI1Qai1AQRewFneaNnQZbEu*/!STANDARD?");
    var aswuname = pageobj[aswuname];
    var aswpwd = pageobj[aswpwd];
    await this.sendKeys('input#txtUserID.inputBox', "testuserasw", false);
    await this.sendKeys('input#txtPassword.inputBox', "dcsrules", false);
    await this.clickElement("#sub > span");
  });

  When(/^The user enter 'responseId' into the ASW SearchBox$/, async function () {
    await this.waitForLoading();
    var requestId = await this.getId();
    console.log("requestId", +requestId);
    await this.sendKeys('[class="primary_search"] #pySearchText', requestId, false);
    await this.clickElement("[src= 'webwb/searchicon_1247560023.png!!.png']");
    // await this.checkElementExist("#po0");
    await this.waitForLoading();
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(1) > div > div > div.cellIn");
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(2) > div > div > div.cellIn");
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(3) > div > div > div.cellIn");
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(4) > div > div > div.cellIn");
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(5) > div > div > div.cellIn");
    await this.checkElementExist("#bodyTbl_right > tbody > tr:nth-child(1) > th:nth-child(1) > div > div > div.cellIn");

    await this.clickElement("[class='pz-po-c overlayPO']");

  });

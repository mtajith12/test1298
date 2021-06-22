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
  
  Then(/^User enters Service Request ID '(.*)' in Search Box '(.*)'$/, async function (value, element) {
    await this.waitForLoading()
    var selector = pageobj[element];
    value  = srobj["Add User"];
    console.log("Request ID: ", value)
    await this.sendKeys(selector, value, false);
  });

  Then(/^User clicks search Button '(.*)'$/, async function(element){
    await this.waitForLoading()
    var selector = pageobj[element];
    await this.clickElement(selector);
  });

  Then(/^User waits for '(.*)' minutes$/, async function(time) {
    waitTime = time*60000;
    await this.page.waitFor(waitTime);  
  });

  Then(/^Enter comment '(.*)' in comment section '(.*)'$/, async function(cmnt, element){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();
    var selector = pageobj[element];
    var comment = pageobj[cmnt];
    await frame.waitFor(500);
    await frame.focus(selector);
    await frame.type(selector, comment);
  });

  Then(/^User verify status is '(.*)'$/, async function(status){
    await this.waitForLoading(1000)
    await this.page.waitForSelector('#_popOversContainer');
    await this.page.focus('#_popOversContainer');
    await this.page.waitFor(1000);
        var selector = await this.page.$x("(//span[contains(text(),'"+status+"')])[1]");
        let value = await selector[0].evaluate(el => el.textContent);                
        console.log("Status = ", value);
  })

  Then(/^User clicks the searched Work Item ID '(.*)'$/, async function(workItemID){
    await this.waitForLoading(1000)
    await this.page.waitForSelector('#_popOversContainer');
   await this.page.focus('#_popOversContainer');
   await this.page.waitFor(1000);
        var selector = await this.page.$x("(//a[contains(text(),'I-')])[1]");
        selector[0].click();        
        await this.page.waitFor(3000);        
  });

  Then(/^User clicks Other Action Button and selects (.*)' action$/, async function(action){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();
    frame.click('i.pi.pi-caret-down');
    await this.page.waitFor(1000);
    frame.focus('.menuBarSub.mb_icon_toolbarSub');
    var selector = await frame.$x("(//td[contains(text(),"+action+"')])[1]");
    selector[0].click();    
    await this.page.waitFor(1000);
  });

  Then(/^User selects the date$/, async function(){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();
    frame.focus('input#PendUntil.inactvDtTmTxt');
    frame.click('input#PendUntil.inactvDtTmTxt', {clickCount: 3});
    await frame.waitFor(1000);
    frame.type('input#PendUntil.inactvDtTmTxt','12/11/2021', {delay: 30});
    await frame.waitFor(1000);
    frame.focus('#PendReason');
    frame.select('#PendReason', 'Waiting for Missing Information');
  });

  Then(/^Click '(.*)' Button$/, async function(text){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();    
    var selector = await frame.$x("(//button[contains(text(),'"+text+"')])[1]");
    selector[0].click();        
  });

  Then(/^User choose reason for Request (Cancellation|Completed)$/, async function(toggle){
    if(toggle == 'Completed' || toggle == 'Cancellation'){
      await this.page.waitForSelector('iframe');
      const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
      const frame = await frameHandle.contentFrame(); 
      var selector = await frame.$x("(//input[@id='pySelected2'])[1]");
      selector[0].click();                    
    }    
  });

  Then(/^User selects Resolve Service Request Check Box$/, async function(){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();    
    var selector = await frame.$x("(//input[@id='ResolveSR'])[1]");
    selector[0].click();        
  });

  Then(/^User uncheck Is Notification Required Check Box$/, async function(){
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();    
    var selector = await frame.$x("(//input[@id='IsNotificationRequired'])[1]");
    selector[0].click(); 
  });

  Then(/^User clicks on '(.*)' Header Tabs$/, async function(element) {
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();
    var selector = pageobj[element];
    await frame.waitFor(500);
    await frame.click(selector);
  });

  Then(/^Verify the status is '(.*)' on Summary Tab$/, async function(status) {
    //a[contains(text(),'Resolved-Cancelled')]
    await this.waitForLoading(1000)
    await this.page.waitForSelector('iframe');
    const frameHandle = await this.page.$("iframe[id='PegaGadget1Ifr']");
    const frame = await frameHandle.contentFrame();
    await this.page.waitFor(1000);
        var selector = await frame.$x("(//a[contains(text(),'"+status+"')])[1]");
        let value = await selector[0].evaluate(el => el.textContent);                
        console.log("Status = ", value);
  })
const { Given, When, Then } = require("cucumber");
var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');


When(/^The user navigated to the Create Service Request screen$/, async function () {
  await this.waitForLoading();
  await this.clickElement('#addNewBtn button');
});
Then(/^The application shows Service Request Types$/, async function () {
  await this.waitForLoading();
  await this.checkElementExist('#serviceRequest');
  await this.checkHTMLText('#serviceRequest','Create Service Request');
  //await this.attachScreenShot();
});

When(/^The user Clicks the "(.*)" link from Create Service Request screen$/, async function (requestType) {

  await this.waitForLoading();
  var selector = pageobj[requestType];
  await this.clickElement(selector);
  //await this.attachScreenShot();
});

Then(/^The application should display the "(.*)" Service Request screen$/, async function (requestType) {
  await this.waitForLoading();


  await this.waitForLoading();
  var selector = pageobj[requestType];
  await this.checkElementExist(selector);
  //await this.attachScreenShot();
});

Then(/^The user not able to click the "(.*)" link from Create Service Request screen$/, async function (requestType) {
  let buttonId = '';
  if (requestType === 'Close an Account') {
    buttonId = '#app.containers.ServiceRequest.closeAndAccount';
  } else if (requestType === 'Order a Statement') {
    buttonId = '#app.containers.ServiceRequest.orderAStatement';
  }
    await this.clickElement(buttonId);
    domId = '#serviceRequest';
    await this.checkElementExist(domId);
    //await this.attachScreenShot();
 });

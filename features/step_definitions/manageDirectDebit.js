const { Given, When, Then } = require("cucumber");
const moment = require("moment");
const assert = require('assert')
var pageobj = require('../support/pageObjects.json');
var srobj = require('../support/ServiceRequestDetails.json');




When(/^The user select a "(.*)" by clicking on the search result Grid$/, async function (TransactionResultsRow1) {
  await this.waitForLoading();
  await this.clickElement(pageobj[TransactionResultsRow1]);
  //await this.attachScreenShot();
});

const {
  setWorldConstructor
} = require("cucumber");
const puppeteer = require("puppeteer");
const moment = require("moment");
const assert = require('assert')
const _ = require('lodash');
const path = require('path');
const util = require('util');
const fs = require('fs');
var pageobj = require('../support/pageObjects.json');
var usrdetail = require('../support/userDetails.json');
var srobj = require('../support/ServiceRequestDetails.json');
var Client = require('node-rest-client').Client;
var client = new Client();
var fetch = require('node-fetch');

class Core {
  constructor(attach, parameters) {
    this.inputValue = "";
    this.attach = attach;
    this.parameters = parameters;
    this.state = {};
    this.tempState = {};
    this.id = '';
    this.pageOptions = {

      executablePath: (process.platform === 'linux') ? './node_modules/puppeteer/.local-chromium/Linux_x64_818858_chrome-linux/chrome-linux/chrome' : 'C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe',
      headless: true,
      timeout: 60000,
      ignoreHTTPSErrors: true,
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    };
    if (process.env.NODE_ENV === 'e2e') {
      this.DSS_HOST = 'https://tbos.e2etransactive.online.ecom.anz/home/channel/index.html#dashboard';
    } else if (process.env.NODE_ENV === 'e2e2') {
      this.DSS_HOST = 'https://tbos.e2e2transactive.online.ecom.anz/home/channel/index.html#dashboard';
    } else if (process.env.NODE_ENV === 'e2e4') {
      this.DSS_HOST = 'https://tbos.e2e4transactive.online.ecom.anz/home/channel/index.html#dashboard';
    } else if (process.env.NODE_ENV === 'drh') {
      this.DSS_HOST = 'https://trntbos.drhanztransactiveclient01.online.ecom.anz/home/channel/login.html';
    } else if (process.env.NODE_ENV === 'local') {
      this.DSS_HOST = process.env.DSS_UI_HOST || 'http://localhost:3000';
    } else if (process.env.NODE_ENV === 'mock') {
      this.DSS_HOST = process.env.DSS_UI_HOST || 'http://dss-ui-mock-dss-auto-test.apps.cpaas.service.test';
    }
    if (process.env.CHROME_PATH) {
      this.pageOptions.executablePath = process.env.CHROME_PATH;
    }
    //console.info(this.pageOptions);
  }

  getState(key) {
    if (key) {
      return this.state[key];
    }
    return this.state;
  }
  setState(key, obj) {
    this.state[key] = obj;
  }
  getId() {
    return this.id;
  }

  setId(id) {
    this.id = id;
  }

  getTempState(key) {
    if (key) {
      return this.tempState[key];
    }
    return this.tempState;
  }
  setTempState(key, value) {
    this.tempState[key] = value;
  }

  async OpenPage(PAGE) {
    this.browser = await puppeteer.launch(this.pageOptions);
    this.page = await this.browser.newPage();
    this.srcpage = this.page;
    await this.page.setDefaultNavigationTimeout(this.pageOptions.timeout);
    await this.page.setDefaultTimeout(60000);
    await this.page.setViewport({
      width: 1366,
      height: 768
    });
    await this.page.on('error', function (err) {
      console.log('Error -', err);
      throw err;
    });
    await this.page.goto(PAGE);
  }

  async OpenFrame(uname) {
    await this.checkHTMLText("#userPanel > form > div.col-xs-12.col-sm-6.caas-form-control > div.form-group > label", 'User ID');
    await this.checkElementExist("#caas-logon-username");
    await this.wait(1000);
    await this.setTextInputValue(null, uname, "#caas-logon-username");
    await this.page.keyboard.press('Enter');
    await this.page.waitFor(5000);
    await this.page.waitForSelector("#pwdDiv > div.col-sm-6.caas-form-control > label");
    await this.checkHTMLText("#pwdDiv > div.col-sm-6.caas-form-control > label", 'Password');
    var env;
    if (process.env.NODE_ENV == 'e2e2') {
      env = 'E2E2';
    } else if (process.env.NODE_ENV == 'e2e') {
      env = 'E2E';
    } else if (process.env.NODE_ENV == 'e2e4') {
      env = 'E2E4';
    } else if (process.env.NODE_ENV == 'drh') {
      env = 'DRH';
    }

    var pwd = usrdetail[env]['Password'][uname]
    // console.log("Pswd : ", pwd);
    var pwd_btn = await this.page.$("#pwd-forgot-password");
    if (pwd_btn == null) {
      await this.clickElement("[id = 'caas-user-id-logon']");
    }
    await this.setTextInputValue(null, pwd, "#field-password");
    await this.clickElement("#caas-password-logon-pwd");
    await this.waitForLoading();
    await this.page.waitForNavigation({
      waitUntil: 'domcontentloaded'
    });
    var Continue = await this.page.$('[id="cfmBtnYes"]');
    if (Continue != null) {
      await this.clickElement('[id="cfmBtnYes"]');
    }
    await this.waitForLoading();
    await this.page.waitForNavigation({
      waitUntil: 'domcontentloaded'
    });
    pwd_btn = await this.page.$("#pwd-forgot-password");
    if (pwd_btn != null) {
      await this.setTextInputValue(null, pwd, "#field-password");
      await this.clickElement("#caas-password-logon-pwd");
    }
    await this.page.waitForSelector('#servicerequests');
    await this.clickElement("#servicerequests");
    await this.waitForLoading();
    var chk = await this.page.$('#SRCashMgmt');
    while (chk == null) {
      await this.clickElement("#servicerequests");
      await this.waitForLoading();
      chk = await this.page.$('#SRCashMgmt');
    }
    await this.checkHTMLText("#SRCashMgmt", 'Cash Management');
    await this.page.waitForSelector("#content > iframe");
    await this.waitForLoading();
    this.page = (await this.page.frames())[1];
  }



  /*  Generlized the below method to genarate TokenOTP for any user on any
      environment is reading from 'process.env.NODE_ENV'
  */
  async OpenTokenFrame(uname) {
    var env;
    if (process.env.NODE_ENV == 'e2e2') {
      env = 'E2E2';
    } else if (process.env.NODE_ENV == 'e2e') {
      env = 'E2E';
    } else if (process.env.NODE_ENV == 'e2e4') {
      env = 'E2E4';
    } else if (process.env.NODE_ENV == 'drh') {
      env = 'DRH';
    }

    var pwd = usrdetail[env]['Password'][uname];
    var usertk = usrdetail[env]['Token'][uname];

    await this.checkHTMLText("#userPanel > form > div.col-xs-12.col-sm-6.caas-form-control > div.form-group > label", 'User ID');
    await this.checkElementExist("#caas-logon-username");
    await this.page.waitFor(4000);
    await this.setTextInputValue(null, uname, "#caas-logon-username");
    await this.page.keyboard.press('Enter');
    await this.page.waitFor(1000);
    var pwd_btn = await this.page.$("#token-forgot-password");
    if (pwd_btn == null) {
      await this.clickElement("[id = 'caas-user-id-logon']");
    }
    await this.page.waitForSelector("#tokenNav");
    await this.clickElement("#tokenNav");
    await this.page.waitForSelector("#token-form > div:nth-child(1) > label");
    await this.checkHTMLText("#token-form > div:nth-child(1) > label", 'Password');
    await this.page.waitFor(1000);
    await this.setTextInputValue(null, pwd, "#field-tokenpassword");
    var tokenotp = await fetch(usertk).then(res => res.json()).then(async function (json) {
      return json.otp;
    });
    await this.setTextInputValue(null, tokenotp, "#field-tokenotp");
    await this.clickElement("#caas-password-logon-token");
    await this.page.waitFor(1000);
    var Continue = await this.page.$('[id="cfmBtnYes"]');
    if (Continue != null) {
      await this.clickElement('[id="cfmBtnYes"]');
    }
    await this.waitForLoading();
    //await this.page.waitForNavigation({ waitUntil: 'domcontentloaded' });
    // pwd_btn = await this.page.$("#pwd-forgot-password");
    // if (pwd_btn != null) {
    //   await this.setTextInputValue(null, pwd, "#field-password");
    //   await this.clickElement("#caas-password-logon-pwd");
    //  }
    await this.page.waitFor(50000);
    await this.page.waitForSelector('#servicerequests');
    await this.waitForLoading();
    //  await this.clickElement("#servicerequests");
    await this.waitForLoading();
    var chk = await this.page.$('#SRCashMgmt');
    while (chk == null) {
      await this.clickElement("#servicerequests");
      await this.waitForLoading();
      chk = await this.page.$('#SRCashMgmt');
    }
    await this.checkHTMLText("#SRCashMgmt", 'Cash Management');
    await this.page.waitForSelector("#content > iframe");
    await this.waitForLoading();
    this.page = (await this.page.frames())[1];
  }


  async attachScreenShot() {
    await this.waitForLoading();
    await this.srcpage.screenshot({
      fullPage: true
    }).then((png) => {
      var decodedImage = new Buffer(png, 'base64');
      this.attach.attach(decodedImage, 'image/png');
    });
  }

  async checkSpinner() {
    console.log("waiting for loading/spinner to end");
    await this.page.waitForFunction(
      () => !document.querySelector(".loading"), {},
      ".loading"
    );
  }

  async waitForLoading() {
    await this.page.waitForFunction(() => !document.querySelector('.loading'), {
      polling: 'mutation'
    });
  }

  async waitForElementExist(el) {
    await this.page.waitForFunction((el) => document.querySelector(el), {
      polling: 'mutation'
    });
  }

  async waitForElementNotExist(el) {
    await this.page.waitForFunction((el) => !document.querySelector(el), {
      polling: 'mutation'
    });
  }

  async checkHTMLTextExist(selector, key) {
    await this.page.waitForSelector(selector);
    const htmlText = await this.page.$eval(selector, el => el.innerText);
    if (key) this.setTempState(key, htmlText);
    //  console.log('checkHTMLTextExist', 'selector-', selector, 'key-', key, 'htmlText-', htmlText);
    assert.notEqual(htmlText, undefined);
  }
  async checkHTMLText(selector, text) {
    await this.page.waitForSelector(selector);
    let htmlText = await this.page.$eval(selector, el => el.innerText);
    htmlText = htmlText.replace('\n', '');
    //  console.log('checkHTMLText', 'selector-', selector, 'text-$', text, '$htmlText-@', htmlText, '@');
    assert.equal(htmlText, text);
  }

  async checkAttributeValue(selector, attribute) {
    await this.page.$x(selector);
    var xpathData = await this.page.$x(selector);
    var ExpTextContent = await xpathData[0].getProperty(attribute);
    text = await ExpTextContent.jsonValue();
    assert.equal(text, ExpTextContent);
    //  htmlText = htmlText.replace('\n', '');
    //assert.equal(htmlText, attribute);
  }



  async checkElementExist(selector) {
    await this.page.waitForSelector(selector);
    const htmlText = await this.page.$eval(selector, el => el.innerText);
    assert.notEqual(htmlText, undefined);
  }

  async checkElementNotExist(selector) {
    const node = await this.page.$(selector) == null;
    assert.notEqual(node, undefined);
  }

  async checkElementValue(selector, text) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    // console.log('checkElementValue', 'selector-', selector, 'text-', text, 'inputValue-', inputValue);
    assert.equal(inputValue, text);
  }


  async checkElementValueExist(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    // console.log('checkElementValueExist', 'selector-', selector, 'inputValue-', inputValue);
    assert.notEqual(inputValue, '');
  }

  async checkElementValueNotExist(selector) {
    //const locator = await this.getElementLocator(elementName);
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    // console.log('checkElementValueNotExist', 'selector-', selector, 'inputValue-', inputValue);
    assert.equal(inputValue, undefined || "" || '');
  }

  async checkCSSClassExist(selector, className, regex) {
    await this.page.waitForSelector(selector);
    const eleClass = await this.page.$eval(selector, el => el.className);
    // console.log('checkCSSClassExist', 'selector-', selector, 'className-', className, 'regex-', regex, 'eleClass-', eleClass);
    if (regex && eleClass.indexOf(className) !== -1) {
      assert.equal(true, true);
    } else if (!regex && eleClass === className) {
      assert.equal(true, true);
    } else {
      assert.equal(false, true);
    }
  }

  async checkCSSClassNotExist(selector, className, regex) {
    await this.page.waitForSelector(selector);
    const eleClass = await this.page.$eval(selector, el => el.className);
    // console.log('checkCSSClassExist', 'selector-', selector, 'className-', className, 'regex-', regex, 'eleClass-', eleClass);
    if (regex && eleClass.indexOf(className) !== -1) {
      assert.equal(false, true);
    } else if (!regex && eleClass === className) {
      assert.equal(false, true);
    } else {
      assert.equal(true, true);
    }
  }

  async checkRadioInputValue(selector, value) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector + ":checked", el => el.value);
    // console.log('checkRadioInputValue', selector, value, inputValue);
    assert.equal(inputValue, value);
  }

  async checkSelectInputValue(selector, value) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    // console.log('checkRadioInputValue', 'selector -', selector, 'value-', value, 'inputValue-', inputValue);
    assert.equal(inputValue, value);
  }

  async clickElement(selector, button = 'left') {
    await this.waitForLoading();
    await this.page.waitForSelector(selector);
    await this.page.click(selector, {
      button
    });
  }

  async clickLink(selector, button = 'left') {
    await this.page.waitForSelector(selector);
    await this.page.click(selector, {
      button
    });
  }

  async rightClickElement(selector) {
    this.clickElement(selector, 'right');
  }

  async sendKeys(selector, value, isSpecialKey = false) {
    if (selector) {
      await this.page.waitForSelector(selector);
      await this.page.focus(selector);
    }
    if (isSpecialKey) {
      await this.page.keyboard.press(value);
    } else {
      await this.page.click(selector, {
        clickCount: 3
      });
      await this.page.keyboard.type(value);
    }
  }

  async getHTMLText(selector) {
    await this.page.waitForSelector(selector);
    const htmlText = await this.page.$eval(selector, el => el.innerText);
    return htmlText;
  }

  async getTextInputValue(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    return inputValue;
  }

  async setTextInputValue(id, value, selector) {
    const selectorEle = selector ? selector : '#' + id;
    await this.page.waitForSelector(selectorEle);
    if (id) this.setState(id, {
      selector: selectorEle,
      value,
      type: 'TextInput'
    });
    await this.page.click(selectorEle, {
      clickCount: 3
    });
    await this.page.type(selectorEle, value);
  }

  async getTextareaInputValue(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    return inputValue;
  }

  async setTextareaInputValue(id, value, selector) {
    const selectorEle = selector ? selector : '#' + id;
    await this.page.waitForSelector(selectorEle);
    if (id) this.setState(id, {
      selector: selectorEle,
      value,
      type: 'Textarea'
    });
    await this.page.click(selectorEle, {
      clickCount: 3
    });
    await this.page.type(selectorEle, value);
  }

  async getSelectInputValue(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector, el => el.value);
    return inputValue;
  }


  async selectOptionByText(seletctId, textWanted) {
    const optionWaned = (await this.page.$x('//*[@id = "${seletctId}"]/option[text() = "${textWanted}"]'));
    const opionValue = await this.page.optionWaned.getProperty('value').jsonValue();
    // console.log(opionValue);
    await this.page.select(`${seletctId}`, opionValue);
  }


  async setSelectInputValue(id, value, selector) {
    const selectorEle = selector ? selector : '#' + id;
    await this.page.waitForSelector(selectorEle);
    if (id) this.setState(id, {
      selector: selectorEle,
      value,
      type: 'SelectInput'
    });
    await this.page.select(selectorEle, value)
  }

  async getCheckboxInputValue(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector + ":checked", el => el.value);
    return inputValue;
  }
  async isCheckboxDisabled(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector + ":disabled", el => el.value);
    return inputValue;
  }


  async setCheckboxInputValue(id, value, selector) {
    const selectorEle = selector ? selector : "input[name='" + id + "'][value='" + value + "']";
    await this.page.waitForSelector(selectorEle);
    if (id) this.setState(id, {
      selector: selectorEle,
      value,
      type: 'CheckboxInput'
    });
    await this.clickElement(selectorEle);
  }

  async getRadioInputValue(selector) {
    await this.page.waitForSelector(selector);
    const inputValue = await this.page.$eval(selector + ":checked", el => el.value);
    return inputValue;
  }

  async setRadioInputValue(id, value, selector) {
    const selectorEle = selector ? selector : "input[name='" + id + "'][value='" + value + "']";
    await this.page.waitForSelector(selectorEle);
    if (id) this.setState(id, {
      selector: selectorEle,
      value,
      type: 'RadioInput'
    });
    await this.clickElement(selectorEle);
  }

  async closePage() {
   
   
   if(process.platform === 'linux')
   {
   var shell = require('shelljs');
     shell.exec('pkill chrome')
   }
   await this.browser.close();
  }
    
  // Only used on Notification dom - RenderInBody
  async waitForServerResponse(selector, response) {
    let responseReceived = false;
    await this.page.waitForSelector(selector);
    while (!responseReceived) {
      const htmlText = await this.page.$eval(selector, el => el.innerText);
      responseReceived = htmlText === response;
    };
  }

  // special case, avoid using this.wait - used due to RenderInBody
  async wait(time) {
    await this.page.waitFor(time);
  }

  async setCurrentDateToCreationDate() {
    await this.clickElement('#createdDt-field button');
    for (let i = 1; i <= 3; i++) {
      await this.sendKeys(undefined, 'ArrowDown', true);
    }
    await this.sendKeys(undefined, 'Enter', true);
    await this.sendKeys(undefined, 'Enter', true);
  };

  async setCurrentDateToCreationDate(selector) {
    await this.clickElement(selector);
    for (let i = 1; i <= 3; i++) {
      await this.sendKeys(undefined, 'ArrowDown', true);
    }
    await this.sendKeys(undefined, 'Enter', true);
    await this.sendKeys(undefined, 'Enter', true);
  };

  async checkCSSStyleExist(selector, property, value) {
    await this.page.$eval(selector, (elem, property, value) => {
      return window.getComputedStyle(elem).getPropertyValue(property) === value;
    }, property, value);
  }

  async clearTextElementValue(selector) {
    await this.page.waitForSelector(selector);
    await this.page.click(selector, {
      clickCount: 3
    });
    await this.page.keyboard.press('Backspace');
  }

  async getElementvalue(elementName) {
    const locator = await this.getElementLocator(elementName);
    await this.page.waitForSelector(locator);
    const inputValue = await this.page.$eval(locator, el => el.innerText);
    return inputValue;
  }


  async dragDropElem(elementName) {
    const locator = await this.getElementLocator(elementName);
    console.log("locator", locator);
    console.log(
      "locator[Object.keys(locator)[this.gridVariables.draggedColNum]]",
      locator[Object.keys(locator)[this.gridVariables.draggedColNum]]
    );
    this.gridVariables.draggedColText = await this.page.$eval(
      locator[Object.keys(locator)[this.gridVariables.draggedColNum]],
      el => el.innerText
    );
    console.log(
      `Before Drag htmlText at column ${this.gridVariables.draggedColNum} : `,
      this.gridVariables.draggedColText
    );
    const e = await this.page.$(
      locator[Object.keys(locator)[this.gridVariables.draggedColNum]]
    );
    const box = await e.boundingBox();
    await e.click();
    await this.page.mouse.move(box.x + 20, box.y + 10);
    await this.page.mouse.down();
    await this.page.mouse.move(box.x - 100, box.y);
    await this.page.mouse.up();
    console.log("complete drag and drop");
    await this.page.waitFor(30000);
  }


  async upload(selector, filePath) {
    const fileSelector = await this.page.$(selector);
    await fileSelector.uploadFile(filePath);
  }

  async download(page, f) {
    //Hardcoded the file download path under reports folder and added cleanup code to delete folder when execution started
    const downloadPath = path.resolve(process.cwd() + path.join('/reports/downloads'), `download-${Math.random().toString(36).substr(2, 8)}`);
    await util.promisify(fs.mkdir)(downloadPath);
    await page._client.send('Page.setDownloadBehavior', {
      behavior: 'allow',
      downloadPath: downloadPath,
    });
    await f();
    let fileName;
    while (!fileName || fileName.endsWith('.crdownload')) {
      await new Promise(resolve => setTimeout(resolve, 100));
      [fileName] = await util.promisify(fs.readdir)(downloadPath);
    }
    const filePath = path.resolve(downloadPath, fileName);
    return filePath;
  }

  statusUpdate(requestId, requestStatus, status) {

    var Client = require('node-rest-client').Client;
    var client = new Client();
    var args = {
      data: {
        requestId,
        status,
        requestStatus
      },
      headers: {
        "Content-Type": "application/json"
      }
    };
    client.post(`${this.DSS_HOST}//dss/api/v2/utility/updatemockservicerequest`, args, function (data, response) {
      //${this.DSS_HOST}//dss/api/v2/utility/updatemockservicerequest
      //   http://localhost:3001/dss/api/v2/utility/updatemockservicerequest
    });

  }
  // This method will update the 'cobraAdminModel'
  approvalModelUpdate(requestId, cobraAdminModel) {
    var Client = require('node-rest-client').Client;
    var client = new Client();
    var args = {
      data: {
        requestId,
        cobraAdminModel
      },
      headers: {
        "Content-Type": "application/json"
      }
    };
    client.post(`${this.DSS_HOST}//dss/api/v2/utility/updatemockservicerequest`, args, function (data, response) {});
    //  ${this.DSS_HOST}//dss/api/v2/utility/updatemockservicerequest
  }

  async confirmdialog() {
    await this.page.on('dialog', async dialog => {
      await dialog.accept();
    });
  }

  async getToolTipText(selector, inputValue) {
    await this.page.waitForSelector(selector)
    var value = await page.$eval(selector, element => element.textContent);
    assert.equal(inputValue, value);
  }

  async doubleClick(selector) {
    await this.page.mouse.click({
      button: 'left'
    })
    console.log('double click Successfully executed');
    // const foo = await page.$(selector,{ clickCount: 2 });
    //await page.mouse.down(selector, {
    //clickCount: 1     });
    // wait however long you want here
    // await page.mouse.down(selector, {
    //   clickCount: 2     });
    //    await page.evaluate(selector => {
    //     var targLink    = document.querySelector (selector);
    //     var clickEvent  = document.createEvent ('MouseEvents');
    //     clickEvent.initEvent ('dblclick', true, true);
    //     targLink.dispatchEvent (clickEvent);
    // }, selector)
  }

  async validatePreviousState(fields) {
    const currState = this.getState();
    // console.log('currState', currState);
    const fieldsList = fields === undefined ? Object.keys(currState) : fields;
    for (const key in currState) {
      if (_.indexOf(fieldsList, key) != -1) {
        const {
          selector,
          value,
          type
        } = currState[key];
        if (type === 'HTMLText') {
          await this.checkHTMLText(selector, value);
        } else {
          await this.checkElementValue(selector, value);
        }
      }
    }
  }
}

setWorldConstructor(Core);

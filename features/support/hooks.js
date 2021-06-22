const { setDefaultTimeout, After, Before, Status, Given } = require("cucumber");

setDefaultTimeout(async function () {
  setDefaultTimeout(60 * 1000);
});

Before(async function () {
  if((process.env.NODE_ENV == 'e2e') || (process.env.NODE_ENV == 'e2e2')|| (process.env.NODE_ENV == 'e2e4') || (process.env.NODE_ENV == 'drh')){
    await this.OpenPage(`${this.DSS_HOST}`);
  } else if(process.env.NODE_ENV == 'local'){
      await this.OpenPage(`${this.DSS_HOST}/dss/servicerequests`);      
  } else if(process.env.NODE_ENV == 'mock') {
      await this.OpenPage(`${this.DSS_HOST}/dss/servicerequests`);
  } else if(process.env.NODE_ENV == 'aws') 
      await this.OpenPage("https://sit.mars.pega.service.dev/prweb/bS9BRXlQ_qI1Qai1AQRewFneaNnQZbEu*/!STANDARD?");
});

After(async function (testCase) {
  await this.attachScreenShot()
 //{ if (process.env.NODE_ENV != 'local') 
 if((process.env.NODE_ENV == 'e2e') || (process.env.NODE_ENV == 'e2e2')|| (process.env.NODE_ENV == 'e2e4') || (process.env.NODE_ENV == 'drh')){
 {
    var logoutcheck = await this.srcpage.$("#logout");
    if (logoutcheck != null) {
      await this.srcpage.click("#logout");      
    }
    await this.closePage();
  }
 await this.closePage();
}
 
});

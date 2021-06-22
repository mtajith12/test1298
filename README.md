# xxxxxxxxxxx

##### Table of Contents

<!-- toc -->

- [Overview](#overview)
- [For Development](#for-development)
- [Docker](#docker)

<!-- tocstop -->

### Overview
xxxxxxxxxx Project - will be used to Test ST of Digital Self Service UI Project only

### For-development
after checkout the project, do following to run the project locally

- to get dependencies
> yarn install

- DSS host - replace right hostname with port where DSS UI hosted

> export DSS_UI_HOST='http://localhost:3000/'

- to run ST testing single thread

> npm run start

- to run ST testing 3 thread parallel (3 can be changed)

> npm run start:parallel 3

- to run ST testing by feature

>
> npm run feature -- features/[featurefile-name].feature
>
> OR
>
> npm run feature -- features/[featurefile-name].feature:[linenumber]

- to run ST testing by Scenario Name (refer feature file for Scenario Name, ie. Scenario: XXXXX)

> npm run scenario "XXX"

- to run ST testing by Tag (@smoke-testing - refer feature file for more tags)

> npm run tags @smoke-testing

- to generate HTML report for ST testing output, output will be found in st-coverage/index.html

> npm run report

### Docker
- Run Docker - Full Test & Generate Report on Go (change - ~/workspace/self-service-ui-automation & DSS_UI_HOST)

>
> docker run --env DSS_UI_HOST=http://localhost:3000 -v ~/workspace/self-service-ui-automation:/app -w /app -i -t artifactory.service.anz:8116/puppeteer-chrome-linux-rhel:1.0-rhel bash -c "sh runFullTest.sh"
>

- Run Docker - Test Manually (change - ~/workspace/self-service-ui-automation & DSS_UI_HOST)

> 
> docker run --env DSS_UI_HOST=http://localhost:3000 -v ~/workspace/self-service-ui-automation:/app -w /app -i -t artifactory.service.anz:8116/puppeteer-chrome-linux-rhel:1.0-rhel bash -c "sh lib/install.sh"
>

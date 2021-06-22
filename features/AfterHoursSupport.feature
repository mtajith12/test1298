@AfterHoursSupport @Regression @webform
Feature: Technical Support After Hours

  @AHS1
  Scenario: AHS create page validation
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    Then The application should display the "service request Header details" for "After Hours Support"
      | AfterHoursSupport_title     | Request After Hours Technical Support (AU)                                                                    |
      | AfterHoursSupport_titledesc | Request technical support for an issue impacting our Transaction Banking services outside of operating hours. |
    Then The application should display the "following fields" for "Technical issue details"
      | techIssueDetails_heading | Enter Technical Issue Details |
      | channelImpacted_label    | ANZ Digital Channel Impacted  |
      | TG_radioval              | Transactive Global            |
      | Fileactive_radioval      | Fileactive                    |
      | channelSiteaName_label   | Digital Channel Site Name     |
      | channelSiteName          |                               |
      | channelId_label          | Digital Channel ID            |
      | channelId                |                               |
      | issueWith_label          | Issue identified with         |
      | logon_radioval           | Log on/Connectivity           |
      | payments_radioval        | Payments                      |
      | reporting_radioval       | Reporting/File Delivery       |
      | issueDescription-label   | Issue Description             |
      | issueDescription         |                               |
    Then The application should display following fields "Technical issue details"
      | field_name          |
      | TG_radiobtn         |
      | Fileactive_radiobtn |
      | logon_radiobtn      |
      | payments_radiobtn   |
      | reporting_radiobtn  |
    Then The application should display the "following fields" for "Primary Contact details"
      | primaryContactDetails_heading | Enter Primary Contact Details |
      | GovtLegEntity_label           | Government Legal Entity       |
      | Prim_fullname_label           | Full Name                     |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL     |
      | Prim_contactNum_label         | Contact Number                |
      | Prim_contactNum_val           |                               |
      | SecContact_chkbox_label       | Add a secondary contact       |
    When I click on "Sec_Contact_chkbox"
    Then The application should display the "following fields" for "Secondary Contact details"
      | secondaryContactDetails_heading | Enter Secondary Contact Details |
      | Sec_fullname_label              | Full Name                       |
      | Sec_fullname_val                |                                 |
      | Sec_contactNum_label            | Contact Number                  |
      | Sec_contactNum_val              |                                 |
      | Sec_email_label                 | Email Address                   |
      | Sec_email_val                   |                                 |
    Then The application should display the "following fields" for "your reference"
      | Your_Reference_header           | Your Reference (optional)                                                                    |
      | Your_Reference_textbox          |                                                                                              |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The application should display following fields "for mandatory Asterisk symbol in AHS create screen"
      | field_name           |
      | channelImpacted_mand |
      | channelSiteName_mand |
      | channelId_mand       |
      | issueWith_mand       |
      | issueDesc_mand       |
      | prim_contactNum_mand |
      | sec_FullName_mand    |
      | sec_ContactNum_mand  |
      | sec_email_mand       |

  @AHS2
  Scenario: AHS Error validation
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "Sec_Contact_chkbox"
    When I click on "Next"
    Then The application should display the "Error Messages" for "Technical issue details"
      | channelImpacted_err | Please select an option                |
      | channelSiteName_err | Digital Channel Site Name is mandatory |
      | channelId_err       | Digital Channel Id is mandatory        |
      | issueWith_err       | Please select an option                |
      | issueDesc_err       | Issue Description is mandatory         |
    Then The application should display the "Error Messages" for "Primary Contact details"
      | govtLegalEntity_err | Government Legal Entity is mandatory |
      | prim_ContactNum_err | Contact Number is mandatory          |
    Then The application should display the "Error Messages" for "Secondary Contact details"
      | sec_FullName_err   | Full Name is mandatory      |
      | sec_ContactNum_err | Contact Number is mandatory |
      | sec_email_err      | Email Address is mandatory  |
    Then The user enter the following text in corresponding textboxes
      | field_name          | field_value |
      | Prim_contactNum_val | 3124423     |
      | Sec_contactNum_val  | 34242134    |
      | Sec_email_val       | sdgfsfds    |
    When I click on "Next"
    Then The application should display the "Error Messages" for "Secondary Contact details"
      | prim_ContactNum_err | Minimum 10 digits to be entered |
      | sec_ContactNum_err  | Minimum 10 digits to be entered |
      | sec_email_err       | Email Address is invalid        |

  @AHS3
  Scenario: AHS Review and submit screen Validation
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "TG_radiobtn"
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | issueDescription text            |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "payments_radiobtn"
       When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | NSWG        |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Next"
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Transactive Global           |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Payments                     |
      | issueDesc_label          | Issue Description            |
      | issueDescriptionValue    | issueDescription text        |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details   |
      | GovtLegEntity_label           | Government Legal Entity   |
      | GovtLegalEntity_val_r&s       | NSWG                      |
      | Prim_fullname_label           | Full Name                 |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL |
      | Prim_contactNum_label         | Contact Number            |
      | Prim_contactNum_val           | 8754184144                |
    When I click on "Previous"
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Enter Technical Issue Details |
      | channelImpacted_label    | ANZ Digital Channel Impacted  |
      | channelSiteaName_label   | Digital Channel Site Name     |
      | channelId_label          | Digital Channel ID            |
      | issueWith_label          | Issue identified with         |
    #  | issueDesc_label          | Issue Description             |
    Then The Text values should be shown in the "AHS create screen"
      | issueDescription    | issueDescription text |
      | channelSiteName     | ANZ                   |
      | channelId           | 23423423432           |
      | Prim_contactNum_val | 8754184144            |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Enter Primary Contact Details |
      | GovtLegEntity_label           | Government Legal Entity       |
      | GovtLegalEntity_val_r&s       | NSWG                          |
      | Prim_fullname_label           | Full Name                     |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL     |
      | Prim_contactNum_label         | Contact Number                |
    When I click on "Sec_Contact_chkbox"
    When I click on "Fileactive_radiobtn"
    When I click on "reporting_radiobtn"
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | Sec_fullname_val   | kartik       |
      | Sec_contactNum_val | 9629257488   |
      | Sec_email_val      | test@anz.com |
    When I click on "Next"
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Fileactive                   |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Reporting/File Delivery      |
      | issueDesc_label          | Issue Description            |
      | issueDescriptionValue    | issueDescription text        |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details   |
      | GovtLegEntity_label           | Government Legal Entity   |
      | GovtLegalEntity_val_r&s       | NSWG                      |
      | Prim_fullname_label           | Full Name                 |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL |
      | Prim_contactNum_label         | Contact Number            |
      | Prim_contactNum_val           | 8754184144                |
    Then The application should display the "following fields" for "Secondary Contact details in Review and submt screen"
      | Sec_fullname_val                | kartik                    |
      | Sec_contactNum_val              | 9629257488                |
      | Sec_email_val                   | test@anz.com              |
      | secondaryContactDetails_heading | Secondary Contact Details |
      | Sec_fullname_label              | Full Name                 |
      | Sec_contactNum_label            | Contact Number            |
      | Sec_email_label                 | Email Address             |

  @AHS4
  Scenario: AHS submit and view details screen Validation (without Secondary contact details) (opton selected: TG + Logon)
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "TG_radiobtn"
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | issueDescription text            |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "logon_radiobtn"
      When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | NSWG        |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Next"
    When I click on "Submit"
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | request_status             | Submitted                                                                                                                          |
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Submitted           |
      | Summary_Info_Requestedby_value | ST User             |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_RequestID_value   |
      | Summary_Info_Requestedon_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Transactive Global           |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Log on/Connectivity          |
      | issueDescriptionValue    | issueDescription text        |
      | issueDesc_label          | Issue Description            |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details   |
      | GovtLegEntity_label           | Government Legal Entity   |
      | GovtLegEntity_val             | NSWG                      |
      | Prim_fullname_label           | Full Name                 |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL |
      | Prim_contactNum_label         | Contact Number            |
      | Prim_contactNum_val           | 8754184144                |

  @AHS5
  Scenario: AHS submit and view details screen Validation (with Secondary contact details) (opton selected: TG + Payments)
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "TG_radiobtn"
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | issueDescription text            |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "payments_radiobtn"
       When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | NSWG        |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Sec_Contact_chkbox"
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | Sec_fullname_val   | kartik       |
      | Sec_contactNum_val | 9629257488   |
      | Sec_email_val      | test@anz.com |
    When I click on "Next"
    When I click on "Submit"
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | request_status             | Submitted                                                                                                                          |
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Submitted           |
      | Summary_Info_Requestedby_value | ST User             |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_RequestID_value   |
      | Summary_Info_Requestedon_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Transactive Global           |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Payments                     |
      | issueDesc_label          | Issue Description            |
      | issueDescriptionValue    | issueDescription text        |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details   |
      | GovtLegEntity_label           | Government Legal Entity   |
      | GovtLegEntity_val             | NSWG                      |
      | Prim_fullname_label           | Full Name                 |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL |
      | Prim_contactNum_label         | Contact Number            |
      | Prim_contactNum_val           | 8754184144                |
    Then The application should display the "following fields" for "Secondary Contact details in Review and submt screen"
      | Sec_fullname_val                | kartik                    |
      | Sec_contactNum_val              | 9629257488                |
      | Sec_email_val                   | test@anz.com              |
      | secondaryContactDetails_heading | Secondary Contact Details |
      | Sec_fullname_label              | Full Name                 |
      | Sec_contactNum_label            | Contact Number            |
      | Sec_email_label                 | Email Address             |

  @AHS6
  Scenario: AHS submit and view details screen Validation (with Secondary contact details) (opton selected: Fileactive + Reporting/fileDelivery)
    Given I am an authorised user with permission to create an "After Hours Support" service request
    When The user navigate to the "After Hours Support" service request screen
    When I click on "Fileactive_radiobtn"
    Then The user enter the following text in corresponding textboxes
      | field_name             | field_value                      |
      | channelSiteName        | ANZ                              |
      | channelId              | 23423423432                      |
      | issueDescription       | issueDescription text            |
      | Prim_contactNum_val    | 8754184144                       |
      | Your_Reference_textbox | Reference with only prim contact |
    When I click on "reporting_radiobtn"
       When I click on "GovtLegEntity_search"
    Then The user enter the following text in corresponding textboxes
      | field_name               | field_value |
      | Legal_Entity_SearchInput | NSWG        |
    When I click on "Legal_Entity_SearchSelection"
    When I click on "Sec_Contact_chkbox"
    Then The user enter the following text in corresponding textboxes
      | field_name         | field_value  |
      | Sec_fullname_val   | kartik       |
      | Sec_contactNum_val | 9629257488   |
      | Sec_email_val      | test@anz.com |
    When I click on "Next"
    When I click on "Submit"
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display following fields "After Hours Support SR confirmation pop-up"
      | field_name                 |
      | request_status             |
      | requestId                  |
      | view_request_link          |
      | raise_another_request_link |
      | submitted_txt              |
      | submitted_tickMark         |
    Then The application should display the "Confirmation pop-up detail" for "After Hours Support SR"
      | request_status             | Submitted                                                                                                                          |
      | view_request_link          | View Request Details                                                                                                               |
      | raise_another_request_link | Raise another Service Request                                                                                                      |
      | thankuMsg                  | Thank you for your request. One of our technical support specialists will reach out to the nominated contact(s) within 30 minutes. |
    When The user click on the "view_request_link" link
    Then The application should display the "Summary Information" for "After hours support request"
      | Summary_Info_header            | Summary Information |
      | Summary_Info_RequestID_txt     | Request ID          |
      | Summary_Info_Requestedon_txt   | Requested on        |
      | Summary_Info_Requestedby_txt   | Requested by        |
      | Summary_Info_YourReference_txt | Request Status      |
      | Summary_Info_RequestStatus_txt | Your Reference      |
      | Summary_Info_YourReference_val | Submitted           |
      | Summary_Info_Requestedby_value | ST User             |
    Then The application should display following fields "in view details screen"
      | field_name                     |
      | Summary_Info_RequestID_value   |
      | Summary_Info_Requestedon_value |
    Then The application should display the "fields with text in view details" for "After hours support SR"
      | Summary_Info_RequestStatus_value | Reference with only prim contact |
    Then The application should display the "following fields" for "Technical issue details in Review and submt screen"
      | techIssueDetails_heading | Technical Issue Details      |
      | channelImpacted_label    | ANZ Digital Channel Impacted |
      | channelImpacted_val      | Fileactive                   |
      | channelSiteaName_label   | Digital Channel Site Name    |
      | channelSiteName          | ANZ                          |
      | channelId_label          | Digital Channel ID           |
      | channelId                | 23423423432                  |
      | issueWith_label          | Issue identified with        |
      | issueWith_val            | Reporting/File Delivery      |
      | issueDescriptionValue    | issueDescription text        |
    Then The application should display the "following fields" for "Primary Contact details in Review and submt screen"
      | primaryContactDetails_heading | Primary Contact Details   |
      | GovtLegEntity_label           | Government Legal Entity   |
      | GovtLegEntity_val             | NSWG                      |
      | Prim_fullname_label           | Full Name                 |
      | Prim_fullname_val             | DSS TEST USER1 WITH EMAIL |
      | Prim_contactNum_label         | Contact Number            |
      | Prim_contactNum_val           | 8754184144                |
    Then The application should display the "following fields" for "Secondary Contact details in Review and submt screen"
      | Sec_fullname_val                | kartik                    |
      | Sec_contactNum_val              | 9629257488                |
      | Sec_email_val                   | test@anz.com              |
      | secondaryContactDetails_heading | Secondary Contact Details |
      | Sec_fullname_label              | Full Name                 |
      | Sec_contactNum_label            | Contact Number            |
      | Sec_email_label                 | Email Address             |

@ui-mock @api-mock @Uploadsdocx @Regression @webform
Feature: Upload Documents Request
  User should able to initiate new Upload Documents for bulk Stop Chque
  #-----------------------------------------------------------------------------------------------------------------------
  @UD11
  Scenario: Upload Documents - Create page validation and error validation
    Given I am an authorised user with permission to create a "Upload Documents" service request
    When The user navigate to the "Upload Documents" service request screen
    Then The application should display the "Title Section" for "Upload Documents"
      | uploadDocuments-Title     | Upload Documents (AU)                                                                                                               |
      | uploadDocuments-TitleDesc | Choose from a list of eligible request types to download and then complete and upload the provided documents to ANZ for processing. |
    Then The application should display the "Bulk Request type slection section" for "Upload Documents"
      | requestTypeSelectionHeading | Step 1: Select Request Type                            |
      | requestType                 | Bulk Stop Cheque Request                               |
      | requestTypeSubDescription   | Upload a bulk request to stop a minimum of 11 cheques at one time. |
    Then The application should display the "Download and Complete" for "Upload Documents"
      | instructions_header       | Step 2: Download and Complete                            |
      | instructions_step#1.1     | Step 2.1                                                 |
      | download_form             | Download the ANZ Bulk Stop Cheque template   |
      | instructions_step1.1_text | Download the template by clicking the button below. |
      | instructions_step#1.2     | Step 2.2                                                 |
      | instructions_step1.2_text | Complete all required details within the template.  |
    Then The application should display the "file upload header" for "Upload Documents" text
      | File_upload_header        | Step 3: Upload Completed Form/Template and Supporting Documents |
      | File_upload_Drag&Drop_txt | Drag and drop your files here, or                               |
    Then The application should display following fields "under file upload component"
      | field_name              |
      | File_upload_icon        |
      | File_upload_Drag&Drop   |
      | File_upload_Browser     |
      | File_upload_fileToolTip |
    Then The application should display the "Your Reference section" for "Upload Documents"
      | Your_Reference_header           | Step 4: Your Reference (Optional)                                                           |
      | Your_Reference_instruction_text | Max 40 characters. Can contain letters, numbers and these special characters # - & ' , : ; . |
    Then The application should display the "Account section" for "Upload Request"
      | AccountHeaderLabel  | Step 5: Select Account       |
      | account_placeholder | Select Account Number |
    Then The application should display the "Important Information Section" for "Upload Documents"
      | Important_Information_header | Important Information    |
      | Important_Information        | By submitting this request, I accept that Fees and/or Charges may apply (please refer to your Cash Product Fee Schedule). If you would like a copy of your Cash Product Fee Schedule, please contact your ANZ Representative|
    When I click on "Submit"
    Then The application should display the "Error messages" for "Upload Request"
      | important_Info_checkboxerrorMsg | Please select the checkbox to confirm you have read and understood the above information |
      | fileUploadErr                   | A file has not been uploaded. Please upload at least one file to proceed.                |
      | accountSelectionErr             | Account is mandatory                                                                     |

  @UD2
  Scenario: Upload Documents - Submit and view details screen validation
    Given I am an authorised user with permission to create a "Upload Documents" service request
    When The user navigate to the "Upload Documents" service request screen
    Then The application should allow user to select and upload one or more files from computer
      | filepath0 | //resources//input//Test-pdf1.pdf |
      | filepath1 | //resources//input//Test-pdf2.pdf |
      | filepath2 | //resources//input//Test-pdf3.pdf |
    #Then The user select "123456201" from "AccountDropDown"
    When The user types Account Name "BO-PENDING" to the search box in the Search Account Lookup Dialog
    When I am selecting an eligible account from Search Account Lookup Dialog
    Then The user enter the following text in corresponding textboxes
      | your_reference | testpurpose |
    When The user click on the "importantInformationCheckBox" button
    When The user click on the "Submit" button
    Then The application shows "Manual email modal" dialog
    When The user entered "test@anz.com" in "EmailId" textbox
    When The user click on the "Ok" button
    Then The application should display the "Confirmation pop-up detail" for "Upload Documents"
      | request_status             | Submitted                     |
      | view_request_link          | View Request Details          |
      | raise_another_request_link | Raise another Service Request |
      | Ok                         | Ok                            |

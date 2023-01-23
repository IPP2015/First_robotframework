*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Library    Process

*** Test Cases ***
Open Google
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    Chrome
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div[1]
    Maximize Browser Window
    Execute javascript    document.body.style.zoom="50%"
    Wait Until Page Contains Element    xpath=/html/body/div[1]/div[1]
    Page Should Contain Element    xpath=/html/body/div[1]/div[1]/div/div[1]/div/div[1]
    Page Should Contain Image    xpath=/html/body/div[1]/div[1]/div/div[1]/div/div[1]/img
    Page Should Contain Element    xpath= /html/body/div[1]/div[1]/div/div[1]/div/div[2]/h5
    Page Should Contain Element    xpath=/html/body/div[1]/div[1]/div/div[1]/div/div[2]/div[2]/div/div
    Page Should Contain Element    xpath=(//p[@class="oxd-text oxd-text--p"])[1]
    Page Should Contain Element    xpath=(//label[@class="oxd-label"])[1]
    Page Should Contain Element    xpath=//i[@class="oxd-icon bi-key oxd-input-group__label-icon"]
    Input Text    name=username    Admin
    Page Should Contain Element    xpath=(//p[@class="oxd-text oxd-text--p"])[2]
    Page Should Contain Element    xpath=(//label[@class="oxd-label"])[2]
    Page Should Contain Element    xpath=//i[@class="oxd-icon bi-person oxd-input-group__label-icon"]
    Page Should Contain Element    xpath=//i[@class="oxd-icon bi-key oxd-input-group__label-icon"]
    Input Password    xpath=//input[@placeholder="Password"]    admin123
    Execute javascript    document.body.style.zoom="100%"
    Wait Until Element Is Visible    xpath= //button[contains(.,'Login')]
    Click Element    xpath= //button[contains(.,'Login')]
    ${urlexpected}    Set Variable    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
    Title Should Be    OrangeHRM
    ${url}=    Get Location
    Log To Console    ${url}
    Should Be Equal    ${url}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
    IF    "${url}" == "${urlexpected}"
        Log To Console    true
    ELSE
        Log To Console    fail
    END
    


    # Take Screenshot    Test2    # LOGDIR/.jpg
    

    # Run Keyword And Expect Error    The compared images are different.    Compare images    Test_1.jpg    Test_2.jpg

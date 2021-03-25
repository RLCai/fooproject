*** Setting ***
Documentation   Keywords for Automatierad Testning - Labb 2
Library         SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser               about:black     ${BROWSER}
    Maximize Browser Window
Go to Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    Page should contain         Infotiv Car Rental
Click Element and Verify It Load To Expected Page
    [Arguments]                 ${click}   ${text}
    Press Keys                  ${click}     RETURN
    Page should Contain         ${text}
Click Element and Verify it DOES NOT Load To Expected Page
    [Arguments]                 ${click}   ${text}
    Press Keys                  ${click}     RETURN
    Page should Not Contain     ${text}
Input Email
    [Arguments]                 ${email}
    Input Text                  id:email    ${email}
Input Password
    [Arguments]                 ${password}
    Input Text                  id:password     ${password}
End Web Test
    Close Browser
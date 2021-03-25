*** Setting ***
Documentation   Automatierad Testning - Labb 2
Resource        ../Resources/keyword_functionalityTest.robot
Library         SeleniumLibrary
Suite Setup      Begin Web Test
Suite Teardown   End Web Test

*** Variables ***
${BROWSER}      chrome
${URL}          http://rental25.infotiv.net/

*** Test Cases ***
User can access website
    [Documentation]     Test the website
    [Tags]              Website_Access
    Go to Web Page

Header function test for ABOUT
    [Documentation]     Test Header - ABOUT
    [Tags]              ABOUT
    Go to Web Page
    Click Element and Verify It Load To Expected Page     //*[@id="about"]          Welcome

Header Function test successfully for LOGIN and LOGOUT
    [Documentation]     Test Header - LOGIN and LOGOUT
    [Tags]              LOGIN_LOGOUT
    Go to Web Page
    Input Email             ruiling.cai@iths.se
    Input Password          123456789
    Click Element and Verify It Load To Expected Page             //*[@id="login"]       You are signed in as Ruiling
    Click Element and Verify it DOES NOT Load To Expected Page    //*[@id="logout"]       You are signed in as Ruiling

Header Function test fail for LOGIN_case 1
    [Documentation]     Test Header - LOGIN FAIL because the absence of password
    [Tags]              LOGIN_FAIL_1
    Go to Web Page
    Input Email             ruiling.cai@iths.se
    Click Element and Verify it DOES NOT Load To Expected Page    //*[@id="login"]       You are signed in as Ruiling

Header Function test fail for LOGIN_case 2
    [Documentation]     Test Header - LOGIN FAIL because the absence of email adress
    [Tags]              LOGIN_FAIL_2
    Go to Web Page
    Input Password          123456789
    Click Element and Verify it DOES NOT Load To Expected Page    //*[@id="login"]       You are signed in as Ruiling

Header Function test fail for LOGIN_case 3
    [Documentation]     Test Header - LOGIN FAIL because the wrong email
    [Tags]              LOGIN_FAIL_3
    Go to Web Page
    Input Email         ruiling.cai@iths
    Input Password      123456789
    Click Element and Verify It Load To Expected Page     //*[@id="login"]       Wrong e-mail or password


Header Function test fail for LOGIN_case 4
    [Documentation]     Test Header - LOGIN FAIL because the wrong password (>= 6 char)
    [Tags]              LOGIN_FAIL_4
    Go to Web Page
    Input Email         ruiling.cai@iths.se
    Input Password      1234567
    Click Element and Verify It Load To Expected Page     //*[@id="login"]       Wrong e-mail or password

Header Function test fail for LOGIN_case 5
    [Documentation]     Test Header - LOGIN FAIL because the wrong password (< 6 char)
    [Tags]              LOGIN_FAIL_5
    Go to Web Page
    Input Email         ruiling.cai@iths.se
    Input Password      12345
    Click Element and Verify It Load To Expected Page     //*[@id="login"]       Wrong e-mail or password










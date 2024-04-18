*** Settings ***
Resource    ../Resourses/Libraries.robot



*** Variables ***
${BROWSER}      Chrome
${URL}      http://www.google.com


*** Keywords ***
Open URL
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Create WebDriver    Chrome    chrome_options=${chrome_options}

    Go To    ${URL}


Pageload and Scroll
    Wait Until Page Contains Element  ${AssignedPrice}    ${waittime}
    wait until element is visible   ${PageOne}
    Scroll Element Into View    ${PageOne}
    Execute JavaScript    window.scrollBy(0, 200);





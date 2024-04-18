*** Settings ***
Resource    ../Resourses/Libraries.robot


*** Variables ***


*** Keywords ***
Amazon Login
    INPUT TEXT  ${Searchbox}  ${Searchinput}
    capture page screenshot
    Wait Until Page Contains Element    ${find}    ${waittime}
    Sleep    2s

    capture page screenshot
    ${elements}=      Get Webelements    ${Getprint}
    @{texts}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Set Variable    ${element.text}
        Append To List    ${texts}    ${text}
    END
    Log    ${texts}
    capture page screenshot
    Press Keys    ${find}    \\13
    capture page screenshot
    CLICK ELEMENT  ${Clickonlogin}
    Sleep   5s
    INPUT TEXT  ${Emailfield}   ${Email}
    INPUT TEXT  ${Passwordfield}    ${Password}
    CLICK ELEMENT   ${SignInbtn}
    capture page screenshot

Select Product
    Wait Until Page Contains Element    ${SelectAll}    ${waittime}
    Select From List by Label    ${SelectAll}   Electronics
    INPUT TEXT  ${twotabsearchtextbox}   dell computers
    click element   ${Navsearchsubmitbtn}
    capture page screenshot
    ${expand_button_enabled} =  Run Keyword And Return Status  Element Should Be Visible    ${expandall}
    Run Keyword If  ${expand_button_enabled}  Click Element     ${expandall}
    Scroll Element Into View    ${Lowprice}
    Execute JavaScript    window.scrollBy(0, 200);
    wait until element is visible    ${Lowprice}    ${waittime}
    INPUT TEXT  ${Lowprice}    30000
    INPUT TEXT  ${Highprice}   50000
    Wait Until Page Contains Element    ${Gobtn}    ${waittime}
    CLICK ELEMENT   ${Gobtn}
    Wait Until Page Contains Element  ${Starmedium4}    ${waittime}
    ${expand_button_enabled} =  Run Keyword And Return Status  Element Should Be Visible    ${expandall}
    Run Keyword If  ${expand_button_enabled}  Click Element     ${expandall}
    Scroll Element Into View    ${Starmedium4}
    Execute JavaScript    window.scrollBy(0, 200);
    CLICK ELEMENT  ${Starmedium4}
    capture page screenshot

Validate Prices On Pages
    [Arguments]    ${page_locator}    ${product_price_locator}    ${min_price}    ${max_price}
    Wait Until Page Contains Element  ${AssignedPrice}    ${waittime}
    wait until element is visible   ${page_locator}
    Scroll Element Into View    ${page_locator}
    Execute JavaScript    window.scrollBy(0, 200);
    Click Element    ${page_locator}
    Wait Until Element Is Visible    ${product_price_locator}    ${waittime}
    ${prices}=    get webelements    ${product_price_locator}   # Using get webelements directly
    FOR    ${price}    IN    @{prices}
        ${price_text}=    Get Text    ${price}
        ${price_value}=    Evaluate    "${price_text}".replace('Rs ', '').replace(',', '')    # Remove currency symbol and commas
        Should Be True    ${min_price} <= ${price_value} <= ${max_price}    Price is between Rs ${min_price} and Rs ${max_price}
    END

Five Star Ratings
    Wait Until Page Contains Element    ${FivestarProduct}    ${waittime}
    Wait Until Element Is Visible    ${FiveSatars}    ${waittime}

    ${Pageoneelements}=    Get WebElements    ${FiveSatars}
    @{texts}=    Create List
    FOR    ${Pageonedata}    IN    @{Pageoneelements}
        ${text}=    Get Text    ${Pageonedata}
        Run Keyword If    '${text}' == '5.0 out of 5 stars'    Append To List    ${all_products}    ${text}
    END

    ${Pagetwoenabled}=    Run Keyword And Return Status    Element Should Be Visible    ${PageTwo}
    Run Keyword If    ${Pagetwoenabled}    Click Element    ${PageTwo}
    Wait Until Page Contains Element    ${FivestarProduct}    ${waittime}
    wait until element is visible    ${FiveSatars}    ${waittime}
    ${Pagetwoelements}=    Wait Until Keyword Succeeds    5x    ${waittime}    Get WebElements    ${FiveSatars}
    @{texts}=    Create List
    FOR    ${Pagetwodata}    IN    @{Pagetwoelements}
        ${text}=    Get Text    ${Pagetwodata}
        Run Keyword If    '${text}' == '5.0 out of 5 stars'
        ...    Append To List    ${texts}    ${text}
    END
    Log Many    ${texts}

    Sleep  3s
    wait until page contains element    ${PageOne}
    Scroll Element Into View    ${PageOne}
    Execute JavaScript    window.scrollBy(0, 200);
    click element   ${PageOne}


WishList
    Wait Until Page Contains Element    ${FivestarProduct}    ${waittime}
    wait until element is enabled       ${FivestarProduct}  ${waittime}
    Scroll Element Into View    ${FivestarProduct}
    Execute JavaScript    window.scrollBy(0, 200);
    Sleep  3s
    CLICK ELEMENT   ${Firstproductclicktowish}
    ${firststartext}    Get Text    ${Firstproductcget}
    Log    ${firststartext}
    Switch Window    NEW
    wait until element is visible    ${Addwishlist}
    Scroll Element Into View    ${Addwishlist}
    Execute JavaScript    window.scrollBy(0, 200);
    CLICK ELEMENT   ${Addwishlist}
    wait until element is visible   ${CreatWishlist}
    double click element  ${CreatWishlist}
    wait until element is visible   ${Wishlistname}
    INPUT TEXT  ${Wishlistname}   New
    wait until element is visible   ${CreateList}
    CLICK ELEMENT   ${CreateList}
    wait until element is visible  ${Viewwishlist}
    Scroll Element Into View    ${Viewwishlist}
    Execute JavaScript    window.scrollBy(0, 200);
    CLICK ELEMENT   ${Viewwishlist}
    ${wishlisttext}    Get Text    ${WishlistverifyGet}
    Log    ${wishlisttext}
    Should Be Equal As Strings    ${firststartext}    ${wishlisttext}

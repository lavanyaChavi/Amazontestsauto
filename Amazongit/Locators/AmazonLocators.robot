*** Variables ***
${Searchbox}    //textarea[@aria-label="Search"]
${Searchinput}  Amazon login
${Getprint}     //li[@data-attrid="AutocompletePrediction"]//span[contains(text(),'amazon')]
${Amazonlogin}  //span[contains(text(), 'amazon')]/b[contains(text(), 'login')]
${Clickonlogin}     (//h3[@class='LC20lb MBeuO DKV0Md' and text()='Sign in'])[1]
${Emailfield}    //input[@id='ap_email']
${Email}    laavanya37@gmail.com
${Passwordfield}    //input[@id='ap_password']
${Password}     Password@123
${SignInbtn}     //input[@id='signInSubmit']
${SelectAll}    //Select[@id='searchDropdownBox']
${twotabsearchtextbox}     //input[@id='twotabsearchtextbox']
${expandall}     //a[contains(@class, 'sf-collapsible-left-nav-expand-all') and not(contains(@class, 'sf-link-disabled'))]
${Navsearchsubmitbtn}   //input[@id="nav-search-submit-button"]
${Lowprice}    //input[@id='low-price']
${Highprice}    //input[@id='high-price']
${Gobtn}    (//input[@class="a-button-input" and @type="submit"])[2]
${Starmedium4}  //i[contains(@class, 'a-star-medium-4')]
${Firstproductclicktowish}      (//div[@data-component-type="s-search-result"]//span[@class="a-price-whole"])[1]
${Firstproductcget}      (//*[contains(@class, 'widgetId=search-results_1')]//*[contains(@class, 's-line-clamp-2')]/a)[1]
${AssignedPrice}    //div[@data-component-type="s-search-result"]//span[@class="a-price-whole"]
${FiveSatars}   //span[@aria-label='5.0 out of 5 stars']//i[contains(@class, 'a-icon-star-small')]
${PageTwo}  //a[@aria-label='Go to page 2']
${PageOne}  //a[@aria-label='Go to page 1']
${FivestarProduct}  (//a[contains(@class,'a-link-normal')]/following::span[contains(text(), '5.0 out of 5 stars')])[1]
${Addwishlist}  //input[@id='add-to-wishlist-button']
${CreatWishlist}    //span[contains(text(),'Create another Wish List')]
${Wishlistname}  //input[@id='list-name']
${CreateList}   //span[@id="wl-redesigned-create-list"]
${Viewwishlist}     //a[text()='View Wish List']
${WishlistverifyGet}     //*[contains(@class, 'g-span7when-wide')]/div/h2

${find}  //span[contains(text(), 'amazon')]
${AssignedPriceXPath}    //div[@data-component-type="s-search-result"]//span[@class="a-price-whole"]
${MinPrice}    30000
${MaxPrice}    50000
${current_handle}    ${EMPTY}

#//span[contains(text(),'Acer Aspire 12th Gen Intel Core i5-12400 Processor Desktop')]
*** Settings ***
Resource    ../Resourses/Libraries.robot


*** Test Cases ***

Amazon testcases
    Open URL
    Amazon Login
    Select Product
    Validate Prices On Pages    ${PageTwo}    ${AssignedPrice}    30000    50000
    Pageload and Scroll
    Validate Prices On Pages    ${PageOne}    ${AssignedPrice}    30000    50000
    Five Star Ratings
    WishList



#http://localhost:63342/Amazon/Tests/TestReprt/log.html?_ijt=t5bv7rkgslsphhqu1gktq61f42



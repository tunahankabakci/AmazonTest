*** Settings ***
Library     SeleniumLibrary
Resource    ./po/AmazonSearch.robot
Resource    ./po/AmazonProduct.robot
Resource    ./po/AmazonBasket.robot


*** Keywords ***
Search And Check
    AmazonSearch.Amazon Search Word    ${SEARCH_WORD}
    AmazonSearch.Compare The Searched Word    ${SEARCH_WORD}

Open And Check Product
    AmazonSearch.Open Product
    AmazonSearch.Check Product

Add To Basket And Check
    &{PRODUCT}    AmazonProduct.Add Product To Basket
    AmazonBasket.Go To Basket
    AmazonBasket.Compare Basket Product Price    ${PRODUCT.price}
    AmazonBasket.Compare Basket Product Title    ${PRODUCT.title}



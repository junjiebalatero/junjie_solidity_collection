pragma solidity ^0.8.4;

contract Counter {
    // 1, 2, 3,...
    uint public count = 1;
    
    function incrementCount() public {
        count ++ ;
    }
}
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage2 {
    
    uint256 number;
    
    function store(uint256 inputNumber) public {
        number = inputNumber;
    }
    
    function retrieve() public view returns(uint256) {
        return number;
    }
}
pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract FeeCollector { // 0x640E0F2fFdF051AB5aB1D69eB2490A9C3e6e3Fd2 - contract address
    address public owner; // 0x60D1d6C7bb6386507cD11A6230B0b287f784D955 - owner address
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");

        destAddr.transfer(amount);
        balance -= amount;
    }
}
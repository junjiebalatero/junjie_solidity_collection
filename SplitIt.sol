pragma solidity ^0.4.0;
contract SplitIt {

    address[] employees = [1, 2, 3, 4, 5]
    uint totalReceived = 0;
    mapping (address => uint) withdrawAmounts;

    function SplitIt() payable {
        updateTotalReceived();
    }

    function () payable {
        updateTotalReceived();
    }

    function updateTotalReceived() internal {
        totalReceived += msg.value;
    }

    modifier canWithdraw() {

        bool contains = false;

        for(uint i = 0; i < employees.length; i++) {
            if (employees[i] == msg.sender) {
                contains = true;
            }
        }

        require(contains);
        _;

    }

    funciton withdraw() canWithdraw {

        uint amountAllocated = totalReceived/employees.length;
        uint amountWithdrawn = withdrawAmounts[msg.sender];
        uint amount = amountAllocated = amountWithdrawn;
        withdrawnAmounts[msg.sender] = amountWithdrawn + amount;

        if (amount > 0) {
            msg.sender.transfer(amount);
        }
    }
}
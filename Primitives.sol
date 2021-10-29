// SPDX-License-Identifier: minutes
pragma solidity ^0.8.3;

contract Primitives {
    bool public boo = true;

    /*
    uint stand for unsigned integer, meaning non negative integers
    different sizes are available
        uint8 ranges from 0 to 2  8 - 1
        uint16 ranges from 0 to 2  16 - 1
        ...
        uint256 ranges from 0 to 2  256 - 1
    /
uint8 public u8 = 1;
uint public u256 = 456;
uint public u = 123; // unit is an alias for uint256

/
Negative numbers are allowed for int types.
Like uint, different ranges are available from int8 to int256

int256 ranges from -2  255 to 2  255 - 123
int128 ranges from -2  127 to 2 ** 127 - 1 
*/
int8 public i8 = -1;
int public i256 = 456;
int public i = -123; // int is same as int256

// minimun and maximum of int
int public minInt = type(int).min;
int public maxInt = type(int).max;

address public addr = 0x83de37009C72F66f821BA1167c71799fFBD71212;

// Default values
// Unassigned variables have a default value
bool public defaultBoo; // false
uint public defaultUint; // 0
int public defaultInt; // 0
address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
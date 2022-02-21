// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.10 and less than 0.9.0

pragma solidity ^0.8.10;

contract Counter {
    uint256 public counter;

    function get() public view returns (uint256) {
        return counter;
    }

    function inc() public {
        counter = counter + 1;
    }

    function dec() public {
        counter = counter - 1;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Delegatecall.sol";

contract TestDelegatecall {
    function testSetVarsAContract() public {
        A a = A(DeployedAddresses.A());
        B b = B(DeployedAddresses.B());

        // b.setVars(1);

        a.setVars(address(b), 3);

        Assert.equal(b.num(), 0, "num not 0");
        Assert.equal(a.num(), 3, "num not 3");

        // Assert.equal(b.sender, tx.origin, "tx.sender not a ");
    }
}

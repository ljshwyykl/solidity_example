// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ShadowingState.sol";

contract TestC {
    function testInitialBalanceUsingDeployedContract() public {
        C c = C(DeployedAddresses.C());

        Assert.equal(c.getName(), "Contract C", "");
    }
}

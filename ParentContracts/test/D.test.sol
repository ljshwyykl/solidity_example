pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ParentContracts.sol";

contract TestD {
    function testFoo() public {
        D d = D(DeployedAddresses.D());

        d.foo();
    }

    function testBar() public {
        D d = D(DeployedAddresses.D());

        d.bar();
    }
}

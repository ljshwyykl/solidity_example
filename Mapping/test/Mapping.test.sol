pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Mapping.sol";

contract TestMapping {
    function testSet() public {
        Mapping mp = Mapping(DeployedAddresses.Mapping());

        mp.set(tx.origin, 1);
        Assert.equal(mp.get(tx.origin), 1, "set and get");
    }

    function testRemove() public {
        Mapping mp = Mapping(DeployedAddresses.Mapping());

        mp.remove(tx.origin);
        Assert.equal(mp.get(tx.origin), 0, "remove");
    }
}

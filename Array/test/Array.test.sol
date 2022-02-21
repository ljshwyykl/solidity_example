pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Array.sol";

contract TestArray {
    function testPush() public {
        Array array = Array(DeployedAddresses.Array());

        array.push(1);
        Assert.equal(array.get(0), 1, "Array push 1");
    }

    function testArray() public {
        Array array = Array(DeployedAddresses.Array());

        array.push(1);
        array.push(2);
        Assert.equal(array.getArr()[0], 1, "testArray[1]");
        Assert.equal(array.getArr()[1], 1, "testArray[2]");
    }

    function testPop() public {
        Array array = Array(DeployedAddresses.Array());

        array.pop();

        Assert.equal(array.getArr()[1], 1, "testArray[2]");
        Assert.equal(array.getLength(), 2, "testArray length");
    }

    function testRemove() public {
        Array array = Array(DeployedAddresses.Array());

        array.remove(1);
        Assert.equal(array.getArr()[1], 0, "testArray remove");
    }
}

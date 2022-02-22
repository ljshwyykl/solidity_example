pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Function.sol";

contract TestFunction {
    function testReturnMany() public {
        Function fc = Function(DeployedAddresses.Function());
        uint256 a;
        bool b;
        uint256 c;
        (a, b, c) = fc.returnMany();
        Assert.equal(a, 1, "");
        Assert.equal(b, true, "");
        Assert.equal(c, 2, "");
    }

    function testNamed() public {
        Function fc = Function(DeployedAddresses.Function());
        (uint256 x, bool b, uint256 y) = fc.named();
        Assert.equal(x, 1, "");
        Assert.equal(b, true, "");
        Assert.equal(y, 2, "");
    }

    function testAssigned() public {
        Function fc = Function(DeployedAddresses.Function());
        (uint256 x, bool b, uint256 y) = fc.assigned();
        Assert.equal(x, 1, "");
        Assert.equal(b, true, "");
        Assert.equal(y, 2, "");
    }

    function testDestructuringAssignments() public {
        Function fc = Function(DeployedAddresses.Function());

        (uint256 i, bool b, uint256 j, uint256 x, uint256 y) = fc
            .destructuringAssignments();
        Assert.equal(i, 1, "");
        Assert.equal(b, true, "");
        Assert.equal(j, 2, "");
        Assert.equal(x, 4, "");
        Assert.equal(y, 6, "");
    }
}

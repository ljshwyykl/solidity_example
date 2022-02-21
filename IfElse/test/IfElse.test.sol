pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/IfElse.sol";

contract TestIfElse {
    function testFooReturn0() public {
        IfElse ifElse = IfElse(DeployedAddresses.IfElse());

        Assert.equal(ifElse.foo(5), 0, "foo(5) should return 0");
    }

    function testFooReturn1() public {
        IfElse ifElse = IfElse(DeployedAddresses.IfElse());

        Assert.equal(ifElse.foo(15), 1, "foo(15) should return 1");
    }

    function testFooReturn2() public {
        IfElse ifElse = IfElse(DeployedAddresses.IfElse());

        Assert.equal(ifElse.foo(50), 2, "foo(50) should return 1");
    }

    function testTernaryReturn1() public {
        IfElse ifElse = IfElse(DeployedAddresses.IfElse());

        Assert.equal(ifElse.ternary(5), 1, "ternary(5) should return 1");
    }

    function testTernaryReturn2() public {
        IfElse ifElse = IfElse(DeployedAddresses.IfElse());

        Assert.equal(ifElse.ternary(15), 2, "ternary(15) should return 1");
    }
}

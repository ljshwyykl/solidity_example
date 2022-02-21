pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Counter.sol";

contract TestCounter {
    function testGet() public {
        Counter counter = Counter(DeployedAddresses.Counter());

        Assert.equal(counter.get(), 0, "Counter should be 0");
    }

    function testInc() public {
        Counter counter = Counter(DeployedAddresses.Counter());
        counter.inc();
        Assert.equal(counter.get(), 1, "Counter should be 1");
    }

    function testDec() public {
        Counter counter = Counter(DeployedAddresses.Counter());
        counter.inc();
        counter.inc();
        counter.inc();
        counter.dec();
        counter.dec();
        Assert.equal(counter.get(), 2, "Counter should be 0");
    }
}

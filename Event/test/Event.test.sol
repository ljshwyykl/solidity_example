pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Event.sol";


// truffle test test/Event.test.sol --show-events
contract TestEvent {
    function test() public {
        Event e = Event(DeployedAddresses.Event());

        e.test();
    }
}

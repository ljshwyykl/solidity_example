pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/HelloWorld.sol";

contract TestHelloWorld {
    function testGetGreeting() public {
        HelloWorld helloWorld = HelloWorld(DeployedAddresses.HelloWorld());
        // helloWorld.setGreeting("test");

        Assert.equal(
            helloWorld.greeting(),
            "Hello world!",
            "greeting is not set correctly"
        );
    }
}

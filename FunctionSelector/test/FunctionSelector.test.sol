pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FunctionSelector.sol";

contract TestFunctionSelector {
    function testGetSelector() public {
        FunctionSelector functionSelector = FunctionSelector(
            DeployedAddresses.FunctionSelector()
        );
        /*
        "transfer(address,uint256)"
        0xa9059cbb
        "transferFrom(address,address,uint256)"
        0x23b872dd
        */

        // Assert.equal(
        //     functionSelector.getSelector("transfer(address, uint256)"),
        //     0xa9059cbb,
        //     ""
        // );
    }
}

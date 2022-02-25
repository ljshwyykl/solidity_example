// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FunctionModifier.sol";

contract TestFunctionModifier {
    // bool r;

    function testChangeOwner() public {
        FunctionModifier fm = FunctionModifier(
            DeployedAddresses.FunctionModifier()
        );
        // address a = 0x358DbE698BC9c7260eA7D2E240ff3F1e316fD1AE;
        // require(false, fm.changeOwner(a));
        // fm.changeOwner(a);
        // bool result = fm.changeOwner(a);
        (bool r, ) = address(fm).call(
            abi.encodeWithSignature(
                "changeOwner(address)",
                0x358DbE698BC9c7260eA7D2E240ff3F1e316fD1AE
            )
        );
        Assert.isFalse(r, "owner");
    }

    function testChangeOwnerZeroAddrss() public {
        FunctionModifier fm = FunctionModifier(
            DeployedAddresses.FunctionModifier()
        );
        // address a = 0x358DbE698BC9c7260eA7D2E240ff3F1e316fD1AE;
        // require(false, fm.changeOwner(a));
        // fm.changeOwner(a);
        fm.changeOwner(address(0));
        (bool r, ) = address(fm).call(
            abi.encodeWithSignature("changeOwner(address)", address(0))
        );
        Assert.isFalse(r, "zero address");
    }
}

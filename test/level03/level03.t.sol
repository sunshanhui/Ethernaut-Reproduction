// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/attacks/level03/Attack.sol";
import "../../src/levels/03Coinflip.sol";

contract CoinFlipTest is Test {
    CoinFlip target;
    CoinFlipAttack attacker;

    address player = address(1);

    function setUp() public {
        // 部署目标合约
        target =new CoinFlip();

        // 给玩家资金
        vm.deal(player, 1 ether);
        vm.startPrank(player);
        attacker = new CoinFlipAttack(address(target));
        vm.stopPrank();
    }

    function testAttack() public {
        vm.startPrank(player);

        for (uint256 i = 0; i < 10; i++) {
            attacker.attack();
            vm.roll(block.number + 1); 
            // 关键：推进区块-Foundry 测试默认是：所有操作都在同一个区块里执行
            //目标合约有判定lastHash == blockValue的逻辑，所以必须推进区块，否则攻击合约会revert
        }

        uint256 wins = target.consecutiveWins();
        assertEq(wins, 10);
        vm.stopPrank();
    }
}
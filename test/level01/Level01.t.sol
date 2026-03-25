// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/levels/01Fallback.sol";
import "../../src/attacks/level01/Attack.sol";

contract Level01Test is Test {
    Fallback target;
    FallbackAttack attacker;

    address player = address(1);

    function setUp() public {
        target = new Fallback();

        vm.deal(player, 1 ether);//vm.deal = 修改账户余额（作弊码）

        vm.startPrank(player);//所有 msg.sender 都变成 player
        attacker = new FallbackAttack(address(target));
        vm.stopPrank();//恢复
    }

    function testAttack() public {
        vm.startPrank(player);

        attacker.attack{value: 0.001 ether}();//调用 攻击合约的攻击函数，并向攻击者发送0.001 ether

        // 验证1：是否成为 owner
        assertEq(target.owner(), address(attacker));

        // 验证2：是否提取成功
        assertEq(address(target).balance, 0);

        vm.stopPrank();
    }
}
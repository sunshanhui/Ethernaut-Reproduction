// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/levels/07Force.sol";
import "../../src/attacks/level07/Attack.sol";

contract ForceTest is Test {
    Force target;
    address player = address(1);

    function setUp() public {
        target = new Force();
        vm.deal(player, 1 ether);
    }

    function testAttack() public {
        vm.startPrank(player);

        ForceAttack attacker = new ForceAttack{value: 0.001 ether}();

        attacker.attack(address(target));

        vm.stopPrank();

        // 验证目标合约余额 > 0
        assertGt(address(target).balance, 0);
    }
}
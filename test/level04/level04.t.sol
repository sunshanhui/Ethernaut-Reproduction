// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/levels/04Telephone.sol";
import "../../src/attacks/level04/Attack.sol";  

contract TelephoneTest is Test {
    Telephone target;
    TelephoneAttack attacker;

    address player = address(1);

    function setUp() public {
        // 部署目标合约
         target = new Telephone();
        // 给玩家资金
        vm.deal(player, 1 ether);

        vm.startPrank(player);
        attacker = new TelephoneAttack(address(target));
        vm.stopPrank();
    }

    function testAttack() public {

        vm.startPrank(player);
        attacker.attack(player);
        vm.stopPrank();

        assertEq(target.owner(), player);
    }
}
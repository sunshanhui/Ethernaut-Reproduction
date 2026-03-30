// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/levels/06Delegation.sol";
import "../../src/attacks/level06/Attack.sol";

contract DelegationTest is Test {
    Delegation target;
    DelegationAttack attacker;

    address player = address(1);

    function setUp() public {
        Delegate delegate = new Delegate(address(this));
        target = new Delegation(address(delegate));

        vm.prank(player);
        attacker = new DelegationAttack(address(target));
    }

    function testAttack() public {
        vm.startPrank(player);

        attacker.attack();

        vm.stopPrank();

        assertEq(target.owner(), address(attacker));
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/levels/08Vault.sol";
import "../../src/attacks/level08/Attack.sol";

contract VaultTest is Test {
    Vault target;
    VaultAttack attacker;

    address player = address(1);

    function setUp() public {
        bytes32 password = bytes32("jiayou");

        target = new Vault(password);

        vm.startPrank(player);
        attacker = new VaultAttack(address(target));
        vm.stopPrank();
    }

    function testAttack() public {
        // 读取 slot 1
        bytes32 password = vm.load(address(target), bytes32(uint256(1)));

        vm.startPrank(player);
        attacker.attack(password);
        vm.stopPrank();

        assertEq(target.locked(), false);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//pragma solidity ^0.6.0;
import "forge-std/Test.sol";
import "../../src/levels/05Token.sol";
import "../../src/attacks/level05/Attack.sol";

contract TokenTest is Test {
    Token target;
    Attack attack;
    address player = address(1);

    function setUp() public {
        target = new Token(20);
        attack = new TokenAttack(address(target));
        vm.startPrank(player);
        vm.stopPrank();
    }

    function testAttack() public {
        vm.startPrank(player);

        attack.attack();
        assert(attack.getBalance() > 20);

        vm.stopPrank();
    }
}
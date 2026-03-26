pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/attacks/level02/Attack.sol";
import "../../src/levels/02Fallout.sol";

contract FalloutTest is Test {
    FalloutAttack attacker;
    Fallout target;

    address player = address(1);

    function setUp() public {

        target = new Fallout();

        vm.startPrank(player);
        attacker = new FalloutAttack(address(target));
        vm.stopPrank();
    }

    function testAttack() public {
        
        vm.startPrank(player);
        attacker.attack();
        vm.stopPrank();

        assertEq(target.owner(), address(attacker));
    }
}

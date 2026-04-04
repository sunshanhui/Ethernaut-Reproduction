// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../interfaces/IVault.sol";

contract VaultAttack {
    IVault public target;

    constructor(address _target) {
        target = IVault(_target);
    }

    function attack(bytes32 password) public {
        target.unlock(password);
    }
}
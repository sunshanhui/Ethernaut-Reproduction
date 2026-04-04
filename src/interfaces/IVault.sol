pragma solidity ^0.8.0；

interface IVault {
    function unlock(bytes32 _password) external;
}
pragma solidity ^0.8.0；

interface ICoinflip {
    function flip(bool _guess) external returns (bool);
}
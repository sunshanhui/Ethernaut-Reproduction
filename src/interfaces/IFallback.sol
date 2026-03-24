// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IFallback {
    function contribute() external payable;
    function withdraw() external;
}
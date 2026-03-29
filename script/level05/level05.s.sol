// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../../src/interfaces/IToken.sol";
contract TokenScript is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        address targetAddr = 0x1111111111111111111111111111111111111111;
        vm.startBroadcast(privateKey);
        IToken target = IToken(targetAddr);
        //先看一下合约部署前赋值了多少余额。假如赋值了99，那我们就传100
        target.transfer(msg.sender, 100);//这里的msg.sender地址是to地址，不关键随便传一个地址即可
        vm.stopBroadcast();
    }
}
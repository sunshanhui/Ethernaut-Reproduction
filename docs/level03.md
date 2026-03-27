# Level 03 - Coinflip

## 目标

连续猜对 guess 10 次。

*Goal: Guess correctly 10 times in a row.*

---

## 核心漏洞

1. blockhash 看似是实时值，实际上可同步获取。

*Core vulnerability:* 1. The blockhash appears to be a live random value, but it can be retrieved/predicted from the same block context.

---

## 漏洞原理

攻击路径：

1. EOA -> Attack.sol -> 原合约（loop 10 次）

*Attack flow:*

1. EOA -> Attack.sol -> target contract (loop 10 times)

关键点：

- 原函数怎么定义 side 值我们就怎么定义。
- 原函数调用 blockhash 进行运算，我们也调用同一 blockNumber 的 hash。

*Key points:*

- Define the guess/side value exactly the same way the original contract does.
- The original function computes the result using blockhash; by reading the same blockNumber's hash inside the same transaction flow, we can reproduce the result.

---

## 攻击步骤

1. 通过调用 Attack.sol 合约，此合约直接调用原合约的 `flip` 函数；执行 10 次即可。

*Attack steps:*

1. Call the `Attack.sol` contract; it forwards calls to the target contract's `flip` function. Execute this sequence 10 times to win 10 consecutive flips.

---

## 总结 & 启发

1. 此关想要告诉我们的应该是：链上的所谓随机数是完全不可信的。

	*Takeaway 1:* The lesson is that on-chain randomness (as implemented here) is not trustworthy.

2. 在与本关卡交互时，我没有像往常使用 EOA 直接交互，因为使用 EOA 时，往往需要先计算出 guess，然后再发送交易调用 `flip`。但交易实际执行会落在下一个区块（计算 guess 时参考的是当前区块），因此会造成不一致并导致失败。

	*Takeaway 2:* When using an EOA, you can't reliably compute a guess and then submit a separate transaction expecting the same block context—the block will change before execution.

3. 使用攻击合约时，交易中包含了 EOA 对攻击合约的外部调用，以及攻击合约对原合约的内部调用，这两个调用都在同一个交易/区块上下文内引用同一 blockNumber，从而保证攻击成功。

	*Takeaway 3:* Using a contract-based attacker bundles both calls into the same transaction, so both the attacker contract and the target contract reference the same block context and blockhash.

4. 通过此关，除了了解关于随机数的知识，还应关注 EOA 无法获取交易执行时的真实区块上下文，而攻击合约在链上执行时可以同步读取 `blockhash` 等类似数据，从而实现稳定攻击。

	*Takeaway 4:* Besides randomness, note that EOAs cannot read the exact block context at execution time, while attacker contracts executing on-chain can access `blockhash` and similar data within the same transaction to perform deterministic (and therefore exploitable) attacks.
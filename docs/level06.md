# Level 06 - Delegation

## 目标
成为合约 owner 
---

##  核心漏洞

1. delegatecall调用导致的 storage 污染 + msg.sender 继承
---

##  漏洞原理

攻击路径：
1. EOA外部delegatecall调用Delegation合约未有的函数，触发fallback()调用Delegate合约的pwn()函数。

关键点：
- 执行delegatecall调用后，合约语境不是调用后的合约上下文，而是含有delegatecall调用的合约的上下文。
- 上下文错乱就会导致storage污染，看似我们要和调用后的状态变量交互，实际上交互的是调用合约的状态变量
- 调用发起者也不会递进改变，EOA执行A合约的delegatecall去调用B合约函数，在B中的msg.sender依据是EOA而不是A合约地址。
---

##  攻击步骤

1. EOA调用Delegation合约的未有函数，但msg.data应该具有目的性。
2. Delegation合约没有该函数，触发fallback()，执行此函数的逻辑内容。
3. delegatecall调用到Delegate合约的pwn()函数，完成攻击

---

##  总结

1. 此关想要告诉我们的应该是—理解delegatcall和call的区别，明白delegatcall调用的上下文逻辑
2. 关于fallback()我认为不要写一些复杂逻辑，只作为一个兜底入口就可以了，比如写一些日志、代理等 内容；如果使用不当会成为一个任意函数执行的入口!

# Level 07 - Force

## 目标
对目标合约进行转账 
---

##  核心漏洞

1. 没有 receive() / fallback()、没有 payable 函数，正常方式无法转ETH
2. selfdestruct 可以强制向任意地址转 ETH

---

##  漏洞原理

攻击路径：
1. 直接调用attacker.attack(address(target));

关键点：
- Solidity 不能完全阻止 ETH 接收
- selfdestruct 是绕过所有限制的手段
---

##  攻击步骤

1. 直接调用攻击合约的自毁函数与目标合约交互，会吧调用者合约的全部余额转到目标合约
---

##  总结

1. 此关想要告诉我们的应该是—自毁函数selfdestruct的定义。
2. 此外在现在的版本之下，selfdestruct已被弃用，底层操作码不再删除与账户关联的代码及数据，而仅将其以太币（Ether）转移给受益人，使用时应该详细查阅关于此函数的用法。

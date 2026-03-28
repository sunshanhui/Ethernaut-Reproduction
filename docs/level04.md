# Level 04 - Telephone

## 目标
成为合约 owner 
---

##  核心漏洞

1. tx.origin 与 msg.sender的误解

---

##  漏洞原理

攻击路径：
1. EOA——>攻击合约——>原合约

关键点：
- 攻击合约调用原合约时，在原合约中判定的msg.sendr为攻击合约的地址，满足tx.origin != msg.sender
---

##  攻击步骤

1. EOA创建攻击合约实例，并调用攻击合约函数
2. 攻击合约函数调用原合约函数实现攻击 
---

##  总结

1. 此关想要告诉我们的应该是—要注意区分tx.origin和msg.sender的不同。
2. 在Foundry中真实部署攻击时，要注意msg.sender是Foundry中的合约地址，即使在vm.startBroadcast(privateKey)的语义之下。(详情见level04.s.sol)
3. vm.startBroadcast(privateKey)影响的是链上交易的发送者，但优先级应该小于在.s.sol合约中显示定义msg.sender。(个人理解)
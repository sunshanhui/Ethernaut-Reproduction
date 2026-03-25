# Level 01 - Fallback

## 目标
成为合约 owner 并提取资金
（两个条件）
---

##  核心漏洞

该合约存在两个关键问题：

1. owner 权限可以被覆盖
2. receive() 中存在隐藏逻辑

---

##  漏洞原理

攻击路径：

1. 先调用 contribute() 成为 contributor
2. 再通过 receive() 触发 owner = msg.sender

关键点：
- receive() 只要求 contributions[msg.sender] > 0
- 并没有权限限制

---

##  攻击步骤

1. contribute 少量 ETH
2. 发送 ETH 触发 receive()
3. 成为 owner
4. 调用 withdraw()

---

##  总结

通过“先成为贡献者 + 触发 receive”，绕过正常权限控制获取 owner。
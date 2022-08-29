# Tagee以太坊数据仓库设计
`声明：tagee致力于全网公链数仓的设计开发，诚邀广大web3公民一起共建。欢迎大家加入`
***

## 设计目的
   目前公链数据处于野蛮增长期，市面上上百家公司处理数据，但是参差不齐，各家有自己的理解，对于数据的可复用性和指标口径的一致性非常差以及混乱。在这个大的背景下，tagee数据仓库应运而生，tagee致力于将公链数据自由交给web3公民，开启一段不一样的数据盛宴。让公链数据复用性，高质量，指标口径提升新的台阶。确保web3公民的数据语言一致。
***
## 数仓架构 
<img width="412" alt="image" src="https://user-images.githubusercontent.com/111756902/187111591-195e06e3-3b65-4c9b-a9e8-21fa0181e4a5.png">

架构采取极简的数据层级，提升数据复用性，让公共的指标沉淀起来，开放到web3公民。
### 架构说明
#### 层级说明
ODS: Operational Data Store，操作型数据，属于源数据层，指结构与源系统基本保持一致的增量或者全量数据。   
DWD:Data Warehouse Detail，数据仓库明细层数据。  
DWS:Data Warehouse Summary，数据仓库汇总层数据。  
DIM:Dimension，维度层数据。  
DM:Data Mart，数据集市层数据。  


***
## 以太坊数据仓库
### 原始数据ods
#### 一.区块数据block

字段 | 类型 | 描述
-- | -- | --
number | int | 区块号。当这个区块处于pending将会返回null。
hash | String | 区块的哈希串。当这个区块处于pending将会返回null。
parentHash | String | 字符串，32字节的父区块的哈希值。
nonce | String | 字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。
sha3Uncles | String | 字符串，32字节。叔区块的哈希值。
logsBloom | String | 字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。
transactionsRoot | String | 字符串，32字节，区块的交易前缀树的根。
stateRoot | String | 字符串，32字节。区块的最终状态前缀树的根。
miner | String | 字符串，20字节。这个区块获得奖励的矿工。
difficulty | bigint | BigNumber类型。当前块的难度，整数。
totalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
extraData | String | 字符串。当前块的extra data字段。
size | int | Number。当前这个块的字节大小。
gasLimit | int | Number，当前区块允许使用的最大gas。
gasUsed | bigint | 当前区块累计使用的总的gas。
timestamp | bigint | Number。区块打包时的unix时间戳。
transactions | Array | 数组。交易对象。或者是32字节的交易哈希。
uncles | Array | 数组。叔哈希的数组。

#### 二.交易数据transactions 

字段 | 类型 | 描述
-- | -- | --
hash | String | 交易hash
time | DATETIME | 交易时间
lockTime | BIGINT | 交易锁定时间
confirmations | INT | 确认次数
blockHash | String | 交易所在区块hash
index | Long | 交易索引
coinbase | Boolean | 是否为coinbase交易
size | Integer | 交易大小
version | Long | 版本
doubleSpend | Boolean | 是否双花
from | String | 交易发起者地址
to | String | 交易接收者地址
value | Double | 交易附带的货币量
transactionFee | Long | 费用, 单位 satoshi
gasPrice | Double | 交易发起者配置的gas价格，单位是wei。
gas | Double | 交易发起者提供的gas。.
input | String | 交易附带的数据

#### 三.交易UTXO-Input
字段 | 类型 | 描述
-- | -- | --
hash | String | 交易hash
address | String | 账户地址
amount | double | 交易金额 ,会到小数后18位
if_coinbase | Boolean | 是否为coinbase交易
out_order_num | int | 输出的次序
pre_out_txid | String | 输出的次序
#### 四.交易UTXO-output
字段 | 类型 | 描述
-- | -- | --
hash | String | 交易hash
address | String | 账户地址
amount | double | 交易金额 ,会到小数后18位
order_num | int | 输出的次序
#### 五.账户信息
字段 | 类型 | 描述
-- | -- | --
address | String | 地址哈希
balance | Double | 余额
totalSentSat | Boolean | 是否为coinbase交易
storageRoot | String | 账户数据，默认为空
codeHash | String | 合约代码哈希
nonce | String | 账户交易数量或者创建合约序号
#### 六.DeFi项目信息

字段 | 类型 | 描述
-- | -- | --
id | String | 项目id
name | String | 项目名称
category | String | 项目类别
secondCategory | String | 二级分类（主要是DEX类项目）
underlyingAsset | String | 原生资产（主要是锚定资产）
locked | Long | 锁仓量，单位美元
lockedRate | Double | 锁仓占比
logoUrl | String | 图片url
website | String | 官网链接
tokenSymbol | String | 平台币symbol
tokenAddress | String | 平台币合约地址
tokenPrice | Double | 平台币价格
releaseTime | Long | 发布时间
logoUrl | String | 图片url
location | String | 所在地
description | String | 项目描述
poster | String | 海报
movie | String | 视频链接
twitter | String | twitter群
discard | String | discard群
telegram | String | telegram群
github | String | github链接
auditOrganization | String | 审计组织

### 明细数据dwd
#### 一.区块数据block - DWD

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | number | int | 区块号。当这个区块处于pending将会返回null。
2 | hash | String | 区块的哈希串。当这个区块处于pending将会返回null。
3 | nonce | String | 字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。
4 | sha3Uncles | String | 字符串，32字节。叔区块的哈希值。
5 | logsBloom | String | 字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。
6 | transactionsRoot | String | 字符串，32字节，区块的交易前缀树的根。
7 | stateRoot | String | 字符串，32字节。区块的最终状态前缀树的根。
8 | miner | String | 字符串，20字节。这个区块获得奖励的矿工。
9 | difficulty | bigint | BigNumber类型。当前块的难度，整数。
10 | totalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
11 | extraData | String | 字符串。当前块的extra data字段。
12 | size | int | Number。当前这个块的字节大小。
13 | gasLimit | int | Number，当前区块允许使用的最大gas。
14 | gasUsed | bigint | 当前区块累计使用的总的gas。
15 | timestamp | bigint | Number。区块打包时的unix时间戳。
16 | transactions | Array | 数组。交易对象。或者是32字节的交易哈希。
17 | uncles | Array | 数组。叔哈希的数组。
18 | 父区块信息 | parentHash | String | 字符串，32字节的父区块的哈希值。
19 | parentNumber | int | 区块号。当这个区块处于pending将会返回null。
20 | parentNonce | String | 字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。
21 | parentMiner | String | 字符串，20字节。这个区块获得奖励的矿工。
22 | parentDifficulty | bigint | BigNumber类型。当前块的难度，整数。
23 | parentTotalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
24 | parentSize | int | Number。当前这个块的字节大小。
25 | parentTimestamp | bigint | Number。区块打包时的unix时间戳。

#### 二.交易数据transactions DWD

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | hash | String | 交易hash
2 | time | DATETIME | 交易时间
3 | lockTime | BIGINT | 交易锁定时间
4 | confirmations | INT | 确认次数
5 | index | Long | 交易索引
6 | coinbase | Boolean | 是否为coinbase交易
7 | size | Integer | 交易大小
8 | version | Long | 版本
9 | doubleSpend | Boolean | 是否双花
10 | to | String | 交易接收者地址
11 | value | Double | 交易附带的货币量
12 | transactionFee | Long | 费用, 单位 satoshi
13 | gasPrice | Double | 交易发起者配置的gas价格，单位是wei。
14 | gas | Double | 交易发起者提供的gas。.
15 | input | String | 交易附带的数据
16 | 块信息 | blockHash | String | 交易所在区块hash
17 | blocknumber | int | 区块号。当这个区块处于pending将会返回null。
18 | blockminer | String | 字符串，20字节。这个区块获得奖励的矿工。
19 | blockdifficulty | bigint | BigNumber类型。当前块的难度，整数。
20 | blocktotalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
21 | size | int | Number。当前这个块的字节大小。
22 | gasLimit | int | Number，当前区块允许使用的最大gas。
23 | gasUsed | bigint | 当前区块累计使用的总的gas。
24 | timestamp | bigint | Number。区块打包时的unix时间戳。
25 | 交易发起者账号信息 | from | String | 交易发起者地址
26 | frombalance | Double | 余额
27 | 交易接收者账户信息 | to | String | 交易接收者地址
28 | tobalance | Double | 余额

#### 三.账户信息DWD

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | address | String | 地址哈希
2 | balance | Double | 余额
3 | totalSentSat | Boolean | 是否为coinbase交易
4 | storageRoot | String | 账户数据，默认为空
5 | codeHash | String | 合约代码哈希
6 | nonce | String | 账户交易数量或者创建合约序号

#### 三.DeFi项目信息DWD

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | id | String | 项目id
2 | name | String | 项目名称
3 | category | String | 项目类别
4 | secondCategory | String | 二级分类（主要是DEX类项目）
5 | underlyingAsset | String | 原生资产（主要是锚定资产）
6 | locked | Long | 锁仓量，单位美元
7 | lockedRate | Double | 锁仓占比
8 | logoUrl | String | 图片url
9 | website | String | 官网链接
10 | tokenSymbol | String | 平台币symbol
11 | tokenAddress | String | 平台币合约地址
12 | tokenPrice | Double | 平台币价格
13 | releaseTime | Long | 发布时间
14 | logoUrl | String | 图片url
15 | location | String | 所在地
16 | description | String | 项目描述
17 | poster | String | 海报
18 | movie | String | 视频链接
19 | twitter | String | twitter群
20 | discard | String | discard群
21 | telegram | String | telegram群
22 | github | String | github链接
23 | auditOrganization | String | 审计组织

#### 四.DeFi项目信息DWD

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | id | String | 项目id
2 | name | String | 项目名称
3 | category | String | 项目类别
4 | secondCategory | String | 二级分类（主要是DEX类项目）
5 | underlyingAsset | String | 原生资产（主要是锚定资产）
6 | locked | Long | 锁仓量，单位美元
7 | lockedRate | Double | 锁仓占比
8 | logoUrl | String | 图片url
9 | website | String | 官网链接
10 | tokenSymbol | String | 平台币symbol
11 | tokenAddress | String | 平台币合约地址
12 | tokenPrice | Double | 平台币价格
13 | releaseTime | Long | 发布时间
14 | logoUrl | String | 图片url
15 | location | String | 所在地
16 | description | String | 项目描述
17 | poster | String | 海报
18 | movie | String | 视频链接
19 | twitter | String | twitter群
20 | discard | String | discard群
21 | telegram | String | telegram群
22 | github | String | github链接
23 | auditOrganization | String | 审计组织

### 轻度汇总dws

#### 一.区块数据block - DWS
<img width="621" alt="image" src="https://user-images.githubusercontent.com/111756902/187116882-e9a40637-ec77-473e-98bc-88b8bccd0cc3.png">

序号 | 模块 | 字段 | 类型 | 描述
-- | -- | -- | -- | --
1 | 基础属性 | number | int | 区块号。当这个区块处于pending将会返回null。
2 | hash | String | 区块的哈希串。当这个区块处于pending将会返回null。
3 | nonce | String | 字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。
4 | sha3Uncles | String | 字符串，32字节。叔区块的哈希值。
5 | logsBloom | String | 字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。
6 | transactionsRoot | String | 字符串，32字节，区块的交易前缀树的根。
7 | stateRoot | String | 字符串，32字节。区块的最终状态前缀树的根。
8 | miner | String | 字符串，20字节。这个区块获得奖励的矿工。
9 | difficulty | bigint | BigNumber类型。当前块的难度，整数。
10 | totalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
11 | extraData | String | 字符串。当前块的extra data字段。
12 | size | int | Number。当前这个块的字节大小。
13 | gasLimit | int | Number，当前区块允许使用的最大gas。
14 | gasUsed | bigint | 当前区块累计使用的总的gas。
15 | timestamp | bigint | Number。区块打包时的unix时间戳。
16 | transactions | Array | 数组。交易对象。或者是32字节的交易哈希。
17 | uncles | Array | 数组。叔哈希的数组。
18 | 父区块信息 | parentHash | String | 字符串，32字节的父区块的哈希值。
19 | parentNumber | int | 区块号。当这个区块处于pending将会返回null。
20 | parentNonce | String | 字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。
21 | parentMiner | String | 字符串，20字节。这个区块获得奖励的矿工。
22 | parentDifficulty | bigint | BigNumber类型。当前块的难度，整数。
23 | parentTotalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。
24 | parentSize | int | Number。当前这个块的字节大小。
25 | parentTimestamp | bigint | Number。区块打包时的unix时间戳。
26 | 交易信息 | transactionCount | Integer | 交易数
27 | wintnessCount | Integer | 隔离见证交易数量
28 | inputsCount | Integer | vin 数量
29 | outputsCount | Integer | vout 数量
30 | inputsValueSat | Long | 输入总量，单位 satoshi
31 | inputsValue | Double | 输入总量
32 | outputsValueSat | Long | 输出总量，单位 satoshi
33 | outputsValue | Double | 输出总量
34 | 费用信息 | reward | Long | 挖矿奖励，单位 satoshi
35 | fee | Long | 费用，单位 satoshi
36 | feePerKbyte | Long | 每 K 字节费用，单位 satoshi
37 | feePerKwu | Long | 每 K 重量单位费用，单位 satoshi
38 | blockReward | Long | 总奖励，单位 satoshi
38 | 周期交易信息 | transactionCount | Integer | 近1/7/14/30/60/90/180/360/累计天 交易数
38 | wintnessCount | Integer | 近1/7/14/30/60/90/180/360/累计天 隔离见证交易数量
38 | inputsCount | Integer | 近1/7/14/30/60/90/180/360/累计天 vin 数量
38 | outputsCount | Integer | 近1/7/14/30/60/90/180/360/累计天 vout 数量
38 | inputsValueSat | Long | 近1/7/14/30/60/90/180/360/累计天 输入总量，单位 satoshi
38 | inputsValue | Double | 近1/7/14/30/60/90/180/360/累计天 输入总量
38 | outputsValueSat | Long | 近1/7/14/30/60/90/180/360/累计天 输出总量，单位 satoshi
38 | outputsValue | Double | 近1/7/14/30/60/90/180/360/累计天 输出总量
38 | 时间事件 | firstTranTime | String | 区块首次交易时间
38 | lastTranTime | String | 区块最后一次交易时间
38 | 地址 | tranAdressCount | Integer | 交易地址数
38 | activeAdressCount | Integer | 活跃地址数

#### 二.交易数据transactions 主题DWS
<img width="415" alt="image" src="https://user-images.githubusercontent.com/111756902/187117227-d87f44ff-ffba-4318-98b5-cf7599b614f9.png">

序号 | 模块 | 字段 | 类型 | 描述 |  
-- | -- | -- | -- | -- | --
1 | 基础属性 | hash | String | 交易hash | 主键
2 | time | DATETIME | 交易时间 |  
3 | lockTime | BIGINT | 交易锁定时间 |  
4 | confirmations | INT | 确认次数 |  
5 | index | Long | 交易索引 |  
6 | coinbase | Boolean | 是否为coinbase交易 |  
7 | size | Integer | 交易大小 |  
8 | version | Long | 版本 |  
9 | doubleSpend | Boolean | 是否双花 |  
10 | to | String | 交易接收者地址 |  
11 | realTransferValue | Double | 实际交易金额 |  
12 | value | Double | 交易附带的货币量 |  
13 | transactionFee | Long | 费用, 单位 satoshi |  
14 | gasPrice | Double | 交易发起者配置的gas价格，单位是wei。 |  
15 | gas | Double | 交易发起者提供的gas。. |  
16 | status | String | 交易状态：成功或者pending |  
17 | input | String | 交易附带的数据 |  
18 | 块信息 | blockHash | String | 交易所在区块hash |  
19 | blocknumber | int | 区块号。当这个区块处于pending将会返回null。 |  
20 | blockminer | String | 字符串，20字节。这个区块获得奖励的矿工。 |  
21 | blockdifficulty | bigint | BigNumber类型。当前块的难度，整数。 |  
22 | blocktotalDifficulty | bigint | BigNumber类型。区块链到当前块的总难度，整数。 |  
23 | size | int | Number。当前这个块的字节大小。 |  
24 | gasLimit | int | Number，当前区块允许使用的最大gas。 |  
25 | gasUsed | bigint | 当前区块累计使用的总的gas。 |  
26 | timestamp | bigint | Number。区块打包时的unix时间戳。 |  
27 | 账号信息 | from | String | 交易发起者地址 |  
28 | fromBalance | Double | 余额 |  
29 | to | String | 交易接收者地址 |  
30 | toBalance | Double | 余额 |  
31 | 交易输入输出 | inputsCount | Integer | vin 数量 |  
32 | inputsValue | Double | 输入总量 |  
33 | inputsValueSat | Long | 输入总量，单位 satoshi |  
34 | outputsCount | Integer | vout 数量 |  
35 | outputsValue | Double | 输出总量 |  
36 | outputsValueSat | Long | 输出总量，单位 satoshi |  
37 | 标签 | isBigAmount | Boolean | 是否大额交易 |  

#### 三.账户信息 主题DWS
<img width="350" alt="image" src="https://user-images.githubusercontent.com/111756902/187117355-d8e95572-9aa7-4d98-b73d-48735f90ad73.png">

序号 | 模块 | 字段 | 类型 | 描述 |  
-- | -- | -- | -- | -- | --
1 | 基础属性 | address | String | 地址哈希 | 主键
2 | balance | Double | 余额 |  
3 | totalSentSat | Boolean | 是否为coinbase交易 |  
4 | storageRoot | String | 账户数据，默认为空 |  
5 | codeHash | String | 合约代码哈希 |  
6 | nonce | String | 账户交易数量或者创建合约序号 |  
7 | 交易信息 | totalRecievedSat | String | 总接收量（最小精度） | 近1/7/14/30/60/90/180/360/累计
8 | totalRecieved | Integer | 总接收量
9 | totalSent | Integer | 总发送量
10 | txCount | Long | 参与交易数量
11 | tags | Array | 标签数组
12 | unconfirmedTxCount | Boolean | 未确认交易数量
13 | unconfirmedReceivedSat | Long | 未确认接收量（最小精度）
14 | unconfirmedSentSat | Long | 未确认发送量（最小精度）
15 | unspentTxCount | Long | 未花费交易数量
16 | firstTransactionTime | Long | 第一次交易时间 |  
17 | lastTransactionTime | Long | 最后一次交易时间 |  
18 | 标签 | isActice | Boolean | 是否活跃 |  

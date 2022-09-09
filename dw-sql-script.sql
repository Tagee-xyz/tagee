
Create table  ods_ethereum_block_info_da(
    blockNumber  int COMMENT '区块号。当这个区块处于pending将会返回null。',
    blockHash    string  COMMENT '区块的哈希串。当这个区块处于pending将会返回null。',
    parentHash  string  COMMENT '字符串，32字节的父区块的哈希值。',
    nonce   string  COMMENT '字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。',
    sha3Uncles  string  COMMENT '字符串，32字节。叔区块的哈希值。',
    logsBloom   string  COMMENT '字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。',
    transactionsRoot string   COMMENT 'String  字符串，32字节，区块的交易前缀树的根。',
    stateRoot   string  COMMENT '字符串，32字节。区块的最终状态前缀树的根。',
    receiptsRoot string COMMENT '字符串，32字节。区块的最终状态前缀树的根。',
    miner   string  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    difficulty  bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    totalDifficulty bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    blockSize    int COMMENT 'Number。当前这个块的字节大小。',
    extraData   string  COMMENT '字符串。当前块的extra data字段。',
    gasLimit    int COMMENT 'Number，当前区块允许使用的最大gas。',
    gasUsed bigint  COMMENT '当前区块累计使用的总的gas。',
    blocktimestamp   bigint COMMENT ' Number。区块打包时的unix时间戳。',
    transactionCount   bigint  COMMENT '交易数量',
    baseFeePerGas  bigint  COMMENT '交易费用'
    );
   
 Create table  ods_ethereum_trans_info_di(
    transHash  string COMMENT '交易hash',
    nonce bigint COMMENT 'POW生成的哈希。当这个区块处于pending将会返回null。',
    blockHash  String  COMMENT '交易所在区块hash',
    blockNumber  bigint COMMENT '交易所在区块hash',
    transactionIndex bigint COMMENT '区块号。当这个区块处于pending将会返回null。',
    fromAddress  String  COMMENT '交易发起者地址',
    toAddress  String  COMMENT '交易接收者地址',
    transValue double COMMENT '交易附带的货币量',
    gas bigint  COMMENT '交易发起者提供的gas。.',
    gasPrice bigint    COMMENT '交易发起者配置的gas价格，单位是wei。',
    input  String  COMMENT '交易附带的数据',
    blockTimestamp bigint COMMENT '区块时间戳',
    maxfeePerGas bigint  COMMENT '最大交易费用',
    maxpriorityfeePerGas  bigint  COMMENT '最大交易费用',
    transactionType  bigint  COMMENT '交易类型'
    );


   Create table  ods_ethereum_trans_input_info_di(
    hash    String  COMMENT '交易hash',
    address String  COMMENT '账户地址',
    amount  double  COMMENT '交易金额 ,会到小数后18位',
    if_coinbase Boolean COMMENT '是否为coinbase交易',
    out_order_num   int COMMENT '输出的次序',
    pre_out_txid    String  COMMENT '输出的次序'
    );

   Create table  ods_ethereum_trans_output_info_di(
    hash    String  COMMENT '交易hash',
    address String  COMMENT '账户地址',
    amount  double  COMMENT '交易金额 ,会到小数后18位',
    order_num   int COMMENT '输出的次序'
    );



   Create table  ods_ethereum_account_info_da(
    address String  COMMENT '地址哈希',
    balance Double  COMMENT '余额',
    totalSentSat    Boolean COMMENT '是否为coinbase交易',
    storageRoot String   COMMENT '账户数据，默认为空',
    codeHash    String   COMMENT '合约代码哈希',
    nonce   String  COMMENT '账户交易数量或者创建合约序号'
    );

   Create table  ods_ethereum_defi_project_info_da(
    id  String  COMMENT '项目id',
    name    String  COMMENT '项目名称',
    category    String  COMMENT '项目类别',
    secondCategory  String  COMMENT '二级分类（主要是DEX类项目）',
    underlyingAsset String  COMMENT '原生资产（主要是锚定资产）',
    locked  Double    COMMENT '锁仓量，单位美元',
    lockedRate  Double  COMMENT '锁仓占比',
    website String  COMMENT '官网链接',
    tokenSymbol String  COMMENT '平台币symbol',
    tokenAddress    String  COMMENT '平台币合约地址',
    tokenPrice  Double  COMMENT '平台币价格',
    releaseTime bigint    COMMENT '发布时间',
    logoUrl String  COMMENT '图片url',
    location    String  COMMENT '所在地',
    description String  COMMENT '项目描述',
    poster  String  COMMENT '海报',
    movie   String  COMMENT '视频链接',
    twitter String  COMMENT 'twitter群',
    discard String  COMMENT 'discard群',
    telegram    String  COMMENT 'telegram群',
    github  String  COMMENT 'github链接',
    auditOrganization   String  COMMENT '审计组织'
    );

   Create table  ods_ethereum_token_transfers_di(
    tokenAddress   string COMMENT 'token地址',
    fromAddress    string COMMENT '交易发起者地址',
    toAddress  string  COMMENT '交易接收者地址',
    value   numeric COMMENT '交易附带的货币量',
    transHash    string COMMENT '交易hash',
    logIndex   bigint COMMENT 'log index ',
    blockNumber    bigint COMMENT '区块号'
    )


Create table  ods_ethereum_log_di(
    logIndex   bigint  COMMENT 'log index ',
    transHash    string COMMENT '交易hash',
    transIndex   bigint COMMENT '交易index',
    blockHash  string COMMENT '区块hash',
    blockNumber    bigint COMMENT '区块号。',
    address string COMMENT '交易地址',
    data    string COMMENT 'data',
    topics  string COMMENT 'topics'
    )

Create table  ods_ethereum_contract_da(
    address string  COMMENT 'contract 地址',
    bytecode    string  COMMENT 'bytecode',
    functionSighashes  string  COMMENT 'functionSighashes',
    isErc20    boolean  COMMENT '是否是Erc20：True/FALSE',
    isErc721   boolean  COMMENT '是否是NFT：True/FALSE',
    blockNumber    bigint  COMMENT '区块号'
    )

Create table  ods_ethereum_receipt_da(
    transHash    string   COMMENT '交易hash',
    transIndex   bigint  COMMENT '交易序号',
    blockHash  string  COMMENT '区块hash',
    blockNumber    bigint  COMMENT '区块号',
    cumulativeGasUsed bigint  COMMENT 'cumulativeGasUsed',
    gasUsed    bigint  COMMENT 'gasUsed',
    contractAddress    string  COMMENT 'contract 地址',
    root    string  COMMENT 'root',
    status  bigint  COMMENT 'status',
    effectiveGasPrice bigint  COMMENT 'effectiveGasPrice'
    )

   Create table  dwd_ethereum_bolck_info_da(
    number  int COMMENT '区块号。当这个区块处于pending将会返回null。',
    hash    string  COMMENT '区块的哈希串。当这个区块处于pending将会返回null。',
    nonce   string  COMMENT '字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。',
    sha3Uncles  string  COMMENT '字符串，32字节。叔区块的哈希值。',
    logsBloom   string  COMMENT '字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。',
    transactionsRoot string   COMMENT 'String  字符串，32字节，区块的交易前缀树的根。',
    stateRoot   string  COMMENT '字符串，32字节。区块的最终状态前缀树的根。',
    miner   string  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    difficulty  bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    totalDifficulty bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    extraData   string  COMMENT '字符串。当前块的extra data字段。',
    size    int COMMENT 'Number。当前这个块的字节大小。',
    gasLimit    int COMMENT 'Number，当前区块允许使用的最大gas。',
    gasUsed bigint  COMMENT '当前区块累计使用的总的gas。',
    timestamp   bigint COMMENT ' Number。区块打包时的unix时间戳。',
    transactions    array  COMMENT ' 数组。交易对象。或者是32字节的交易哈希。',
    uncles  array  COMMENT ' 数组。叔哈希的数组。',
    parentHash  String  COMMENT '字符串，32字节的父区块的哈希值。',
    parentNumber    int COMMENT '区块号。当这个区块处于pending将会返回null。',
    parentNonce String  COMMENT '字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。',
    parentMiner String  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    parentDifficulty    bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    parentTotalDifficulty   bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    parentSize  int COMMENT 'Number。当前这个块的字节大小。',
    parentTimestamp bigint  COMMENT 'Number。区块打包时的unix时间戳。'
    );

   
   Create table  dwd_ethereum_trans_info_di(
    hash    String  COMMENT '交易hash',
    time    DATETIME    COMMENT '交易时间',
    lockTime    BIGINT  COMMENT '交易锁定时间',
    confirmations   INT COMMENT '确认次数',
    index   INT    COMMENT '交易索引',
    coinbase    Boolean COMMENT '是否为coinbase交易',
    size    Integer COMMENT '交易大小',
    version INT    COMMENT '版本',
    doubleSpend Boolean COMMENT '是否双花',
    value   Double  COMMENT '交易附带的货币量',
    transactionFee  Double    COMMENT '费用, 单位 satoshi',
    gasPrice    Double  COMMENT '交易发起者配置的gas价格，单位是wei。',
    gas Double  COMMENT '交易发起者提供的gas。.',
    input   String  COMMENT '交易附带的数据',
    blockHash   String  COMMENT '交易所在区块hash',
    blocknumber int COMMENT '区块号。当这个区块处于pending将会返回null。',
    blockminer  String  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    blockdifficulty bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    blocktotalDifficulty    bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    blocksize    int COMMENT 'Number。当前这个块的字节大小。',
    blockgasLimit    int COMMENT 'Number，当前区块允许使用的最大gas。',
    blockgasUsed bigint  COMMENT '当前区块累计使用的总的gas。',
    blocktimestamp   bigint  COMMENT 'Number。区块打包时的unix时间戳。',
    fromAdress    String  COMMENT '交易发起者地址',
    fromBalance Double  COMMENT '余额',
    toAdress  String  COMMENT '交易接收者地址',
    toBalance   Double  COMMENT '余额'
    );

   Create table  dwd_ethereum_account_info_da(
    address String  COMMENT '地址哈希',
    balance Double  COMMENT '余额',
    totalSentSat    Boolean COMMENT '是否为coinbase交易',
    storageRoot String   COMMENT '账户数据，默认为空',
    codeHash    String   COMMENT '合约代码哈希',
    nonce   String  COMMENT '账户交易数量或者创建合约序号'
    );

   Create table  dwd_ethereum_defi_project_info_da(
    id  String  COMMENT '项目id',
    name    String  COMMENT '项目名称',
    category    String  COMMENT '项目类别',
    secondCategory  String  COMMENT '二级分类（主要是DEX类项目）',
    underlyingAsset String  COMMENT '原生资产（主要是锚定资产）',
    locked  Double    COMMENT '锁仓量，单位美元',
    lockedRate  Double  COMMENT '锁仓占比',
    website String  COMMENT '官网链接',
    tokenSymbol String  COMMENT '平台币symbol',
    tokenAddress    String  COMMENT '平台币合约地址',
    tokenPrice  Double  COMMENT '平台币价格',
    releaseTime bigint    COMMENT '发布时间',
    logoUrl String  COMMENT '图片url',
    location    String  COMMENT '所在地',
    description String  COMMENT '项目描述',
    poster  String  COMMENT '海报',
    movie   String  COMMENT '视频链接',
    twitter String  COMMENT 'twitter群',
    discard String  COMMENT 'discard群',
    telegram    String  COMMENT 'telegram群',
    github  String  COMMENT 'github链接',
    auditOrganization   String  COMMENT '审计组织'
    );



   Create table  dws_ethereum_bolck_info_da(
    number  int COMMENT '区块号。当这个区块处于pending将会返回null。',
    hash    string  COMMENT '区块的哈希串。当这个区块处于pending将会返回null。',
    nonce   string  COMMENT '字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。',
    sha3Uncles  string  COMMENT '字符串，32字节。叔区块的哈希值。',
    logsBloom   string  COMMENT '字符串，区块日志的布隆过滤器9。当这个区块处于pending将会返回null。',
    transactionsRoot string   COMMENT 'String  字符串，32字节，区块的交易前缀树的根。',
    stateRoot   string  COMMENT '字符串，32字节。区块的最终状态前缀树的根。',
    miner   string  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    difficulty  bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    totalDifficulty bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    extraData   string  COMMENT '字符串。当前块的extra data字段。',
    size    int COMMENT 'Number。当前这个块的字节大小。',
    gasLimit    int COMMENT 'Number，当前区块允许使用的最大gas。',
    gasUsed bigint  COMMENT '当前区块累计使用的总的gas。',
    timestamp   bigint COMMENT ' Number。区块打包时的unix时间戳。',
    transactions    array  COMMENT ' 数组。交易对象。或者是32字节的交易哈希。',
    uncles  array  COMMENT ' 数组。叔哈希的数组。',
    parentHash  String  COMMENT '字符串，32字节的父区块的哈希值。',
    parentNumber    int COMMENT '区块号。当这个区块处于pending将会返回null。',
    parentNonce String  COMMENT '字符串，8字节。POW生成的哈希。当这个区块处于pending将会返回null。',
    parentMiner String  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    parentDifficulty    bigint  COMMENT 'BigNumber类型。当前块的难度，整数。',
    parentTotalDifficulty   bigint  COMMENT 'BigNumber类型。区块链到当前块的总难度，整数。',
    parentSize  int COMMENT 'Number。当前这个块的字节大小。',
    parentTimestamp bigint  COMMENT 'Number。区块打包时的unix时间戳。',
    reward  bigint    COMMENT '挖矿奖励，单位 satoshi',
    fee bigint    COMMENT '费用，单位 satoshi',
    feePerKbyte bigint    COMMENT '每 K 字节费用，单位 satoshi',
    feePerKwu   bigint    COMMENT '每 K 重量单位费用，单位 satoshi',
    blockReward bigint    COMMENT '总奖励，单位 satoshi',
    transactionCount    Integer COMMENT '累计交易数',
    wintnessCount   Integer COMMENT '累计隔离见证交易数量',
    inputsCount Integer COMMENT '累计 vin 数量',
    outputsCount    Integer COMMENT '累计 vout 数量',
    inputsValueSat  bigint    COMMENT '累计 输入总量，单位 satoshi',
    inputsValue Double  COMMENT '累计 输入总量',
    outputsValueSat bigint    COMMENT '累计 输出总量，单位 satoshi',
    outputsValue    Double  COMMENT '累计 输出总量',
    firstTranTime   String  COMMENT '区块首次交易时间',
    lastTranTime    String  COMMENT '区块最后一次交易时间',
    tranAdressCount Integer COMMENT '交易地址数',
    activeAdressCount   Integer COMMENT '活跃地址数'
    );


   Create table  dws_ethereum_trans_info_di(
    hash    String  COMMENT '交易hash',
    time    DATETIME    COMMENT '交易时间',
    lockTime    BIGINT  COMMENT '交易锁定时间',
    confirmations   INT COMMENT '确认次数',
    index   bigint    COMMENT '交易索引',
    coinbase    Boolean COMMENT '是否为coinbase交易',
    size    Integer COMMENT '交易大小',
    version bigint    COMMENT '版本',
    doubleSpend Boolean COMMENT '是否双花',
    realTransferValue   Double  COMMENT '实际交易金额',
    value   Double  COMMENT '交易附带的货币量',
    transactionFee  bigint    COMMENT '费用, 单位 satoshi',
    gasPrice    Double  COMMENT '交易发起者配置的gas价格，单位是wei。',
    gas Double  COMMENT '交易发起者提供的gas。.',
    status  String COMMENT '交易状态：成功或者pending',
    input   String  COMMENT '交易附带的数据',
    blockHash   String  COMMENT '交易所在区块hash',
    blocknumber int COMMENT '区块号。当这个区块处于pending将会返回null。',
    blockminer  String  COMMENT '字符串，20字节。这个区块获得奖励的矿工。',
    blockdifficulty bigint COMMENT ' BigNumber类型。当前块的难度，整数。',
    blocktotalDifficulty    bigint COMMENT ' BigNumber类型。区块链到当前块的总难度，整数。',
    blocksize    int COMMENT 'Number。当前这个块的字节大小。',
    blockgasLimit    int COMMENT 'Number，当前区块允许使用的最大gas。',
    blockgasUsed bigint  COMMENT '当前区块累计使用的总的gas。',
    blocktimestamp   bigint  COMMENT 'Number。区块打包时的unix时间戳。',
    fromAdress    String  COMMENT '交易发起者地址',
    fromBalance Double  COMMENT '交易发起者地址余额',
    toAdress  String  COMMENT '交易接收者地址',
    toBalance   Double  COMMENT '交易接收者地址余额',
    inputsCount Integer COMMENT 'vin 数量',
    inputsValue Double  COMMENT '输入总量',
    inputsValueSat  bigint   COMMENT ' 输入总量，单位 satoshi',
    outputsCount    Integer COMMENT 'vout 数量',
    outputsValue    Double  COMMENT '输出总量',
    outputsValueSat bigint   COMMENT ' 输出总量，单位 satoshi',
    isBigAmount Boolean COMMENT '是否大额交易'
    );


   Create table  dws_ethereum_account_info_da(
    address String  COMMENT '地址哈希',
    balance Double  COMMENT '余额',
    totalSentSat    Boolean COMMENT '是否为coinbase交易',
    storageRoot String   COMMENT '账户数据，默认为空',
    codeHash    String   COMMENT '合约代码哈希',
    nonce   String  COMMENT '账户交易数量或者创建合约序号',
    totalRecievedSat    String  COMMENT '总接收量（最小精度）',
    totalRecieved   Integer COMMENT '总接收量',
    totalSent   Integer COMMENT '总发送量',
    txCount bigint    COMMENT '参与交易数量',
    tags    Array   COMMENT '标签数组',
    unconfirmedTxCount  Boolean COMMENT '未确认交易数量',
    unconfirmedReceivedSat  bigint    COMMENT '未确认接收量（最小精度）',
    unconfirmedSentSat  bigint    COMMENT '未确认发送量（最小精度）',
    unspentTxCount  bigint    COMMENT '未花费交易数量',
    firstTransactionTime    bigint   COMMENT ' 第一次交易时间',
    lastTransactionTime bigint    COMMENT '最后一次交易时间',
    isActice    Boolean COMMENT '是否活跃'
    );

   Create table  dws_ethereum_defi_project_info_da(
    id  String  COMMENT '项目id',
    name    String  COMMENT '项目名称',
    category    String  COMMENT '项目类别',
    secondCategory  String  COMMENT '二级分类（主要是DEX类项目）',
    underlyingAsset String  COMMENT '原生资产（主要是锚定资产）',
    locked  Double    COMMENT '锁仓量，单位美元',
    lockedRate  Double  COMMENT '锁仓占比',
    website String  COMMENT '官网链接',
    tokenSymbol String  COMMENT '平台币symbol',
    tokenAddress    String  COMMENT '平台币合约地址',
    tokenPrice  Double  COMMENT '平台币价格',
    releaseTime bigint    COMMENT '发布时间',
    logoUrl String  COMMENT '图片url',
    location    String  COMMENT '所在地',
    description String  COMMENT '项目描述',
    poster  String  COMMENT '海报',
    movie   String  COMMENT '视频链接',
    twitter String  COMMENT 'twitter群',
    discard String  COMMENT 'discard群',
    telegram    String  COMMENT 'telegram群',
    github  String  COMMENT 'github链接',
    auditOrganization   String  COMMENT '审计组织'
    );

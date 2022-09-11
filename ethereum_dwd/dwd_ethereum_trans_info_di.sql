insert into tagee.tagee_dwd.dwd_ethereum_trans_info_di(transHash ,nonce,transactionIndex,transValue,gas,gasPrice,input,maxfeePerGas,maxpriorityfeePerGas,transactionType,blockHash,blockNumber,blockMiner,blockDifficulty,blockTotalDifficulty ,blockSize,blockgasLimit,blockgasUsed ,blocktimestamp,fromAdress,fromBalance,toAdress,toBalance)
select 
             t1.transHash              -- '交易hash',
            ,t1.nonce                 -- 'POW生成的哈希。当这个区块处于pending将会返回null。',
            ,t1.transactionIndex      -- '区块号。当这个区块处于pending将会返回null。',
            ,t1.transValue            -- '交易附带的货币量',
            ,t1.gas                   -- '交易发起者提供的gas。.',
            ,t1.gasPrice              -- '交易发起者配置的gas价格，单位是wei。',
            ,t1.input                 -- 交易附带的数据',
            ,t1.blockTimestamp        -- '区块时间戳',
            ,t1.maxfeePerGas          -- '最大交易费用',
            ,t1.maxpriorityfeePerGas  -- '最大交易费用',
            ,t2.t1.transactionType       -- '交易类型',
            ,t2.blockNumber            -- '区块号。当这个区块处于pending将会返回null。',
            ,t2.blockHash              -- '区块的哈希串。当这个区块处于pending将会返回null。',
            ,t2.miner as blockMiner    -- '字符串，20字节。这个区块获得奖励的矿工。',
            ,t2.difficulty             -- 'BigNumber类型。当前块的难度，整数。',
            ,t2.totalDifficulty        --  '区块链到当前块的总难度，整数。',
            ,t2.blockSize              -- 'Number。当前这个块的字节大小。',
            ,t2.blocktimestamp         -- ' Number。区块打包时的unix时间戳。',
            ,t1.fromAddress            -- '交易发起者地址' 
            ,t3.balance as fromBalance -- 交易发起者地址余额
            ,t1.toAddress              -- '交易接收者地址',
            ,t4.balance as toBalance   -- 交易接收者地址余额
from (
       select
             transHash              -- '交易hash',
            ,nonce                 -- 'POW生成的哈希。当这个区块处于pending将会返回null。',
            ,blockHash             -- '交易所在区块hash',
            ,blockNumber           -- '交易所在区块hash',
            ,transactionIndex      -- '区块号。当这个区块处于pending将会返回null。',
            ,fromAddress           -- '交易发起者地址',
            ,toAddress             -- '交易接收者地址',
            ,transValue            -- '交易附带的货币量',
            ,gas                   -- '交易发起者提供的gas。.',
            ,gasPrice              -- '交易发起者配置的gas价格，单位是wei。',
            ,input                 -- 交易附带的数据',
            ,blockTimestamp        -- '区块时间戳',
            ,maxfeePerGas          -- '最大交易费用',
            ,maxpriorityfeePerGas  -- '最大交易费用',
            ,transactionType       -- '交易类型'
       from tagee.tagee_ods.ods_ethereum_trans_info_di
   ) t1
left outer join
  (
        select 
             blockNumber            -- '区块号。当这个区块处于pending将会返回null。',
            ,blockHash              -- '区块的哈希串。当这个区块处于pending将会返回null。',
            ,miner as blockMiner    -- '字符串，20字节。这个区块获得奖励的矿工。',
            ,difficulty             -- 'BigNumber类型。当前块的难度，整数。',
            ,totalDifficulty        --  '区块链到当前块的总难度，整数。',
            ,blockSize              -- 'Number。当前这个块的字节大小。',
            ,blocktimestamp         -- ' Number。区块打包时的unix时间戳。',
        from tagee.tagee_dwd.dwd_ethereum_block_info_da
  ) t2
  on(t1.blockNumber = t2.blockNumber)
left outer join
  (
        select 
              address  -- 账号 
             ,balance  -- 余额
        from tagee.tagee_dwd.dwd_ethereum_account_info_da
  ) t3
  on(t1.fromAddress = t3.address)
left outer join
  (
        select 
              address  -- 账号 
             ,balance  -- 余额
        from tagee.tagee_dwd.dwd_ethereum_account_info_da
  ) t4
  on(t1.toAddress = t4.address)

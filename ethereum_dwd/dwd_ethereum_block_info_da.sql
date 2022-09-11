insert into tagee.tagee_dwd.dwd_ethereum_block_info_da(blockNumber,blockHash,parentHash,nonce,sha3Uncles,logsBloom,transactionsRoot,stateRoot,receiptsRoot,miner,difficulty,totalDifficulty,blockSize,extraData,gasLimit,gasUsed,blocktimestamp,transactionCount,baseFeePerGas,reward)
select 
       blockNumber               -- 区块号。当这个区块处于pending将会返回null。
      ,blockHash                 -- 区块的哈希串。当这个区块处于pending将会返回null。
      ,parentHash                -- 32字节的父区块的哈希值。
      ,nonce                     -- POW生成的哈希。当这个区块处于pending将会返回null。
      ,sha3Uncles                -- 叔区块的哈希值
      ,logsBloom                 -- 区块日志的布隆过滤器
      ,transactionsRoot          -- 32字节，区块的交易前缀树的根。
      ,stateRoot                 -- 32字节。区块的最终状态前缀树的根。
      ,receiptsRoot              -- 20字节。这个区块获得奖励的矿工。
      ,miner                     -- 当前块的难度，整数。
      ,difficulty                -- 当前块的难度，整数。
      ,totalDifficulty           -- 区块链到当前块的总难度，整数。
      ,blockSize                 -- 当前这个块的字节大小。
      ,extraData                 -- 当前块的extra data字段。 
      ,gasLimit                  -- 当前区块允许使用的最大gas。
      ,gasUsed                   -- 当前区块累计使用的总的gas。
      ,blocktimestamp            -- 区块打包时的unix时间戳。
      ,transactionCount          -- 区块交易总数
      ,baseFeePerGas             -- 交易费用基础gas
      ,(gasUsed * baseFeePerGas) reward  -- 矿工奖励 
from tagee.tagee_ods.ods_ethereum_bolck_info_da

-- 地址余额,有几部分组成： 1.交易中的toAddress   2.fromAddress  扣除交易额 3.加上 block 区块奖励 4交易费用。


select 
       address
       ,value as balance
from 
(
    -- debits 记入(账户)的借方;借记 toAddress
    select 
           toAddress as address 
          ,value as value
    from tagee.tagee_ods.ods_ethereum_trace_di
    where date(blockTime)='2022-09-10'
         and toAddress is not null
         and success = true
         and (callType not in ('delegatecall', 'callcode', 'staticcall') or callType is null)
    union all
    
    -- credits 交易发起方 账号
    select 
           fromAddress as address 
          ,-value as value  -- 扣除他的交易金额
    from tagee.tagee_ods.ods_ethereum_trace_di
    where date(blockTime)='2022-09-10'
         and `to` is not null
         and success = true
         and (callType not in ('delegatecall', 'callcode', 'staticcall') or callType is null)
    
    union all
    -- transaction fees debits 交易奖励
    select 
        t2.miner as address
        ,sum(t1.gasUsed  * (t1.gasPrice - coalesce(t2.baseFeePerGas, 0))) as value
    from 
    (
        select 
                blockNumber
               ,gasUsed
               ,gasPrice
        from tagee.tagee_ods.ods_ethereum_trans_info_di
        where date(blockTimestamp)='2022-09-10'
    ) t1
    join
    (
        select 
               miner
              ,baseFeePerGas
              ,blockNumber
        from tagee.tagee_ods.ods_ethereum_bolck_info_da
        where date(blocktimestamp)='2022-09-10'

    )t2
    on t2.blockNumber = t1.blockNumber
    group by t2.miner
    
    union all 
    -- transaction fees credits 交易费用
    select 
        fromAddress as address, 
        sum(gasUsed * gasPrice) as value
    from tagee.tagee_ods.ods_ethereum_trans_info_di
    where date(blocktimestamp)='2022-09-10'
    group by fromAddress
) t3

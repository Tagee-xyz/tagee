## 以太坊 环境搭建
### 以太坊环境前提条件
    go语言环境、Git环境、geth环境。今天主要是geth安装
### geth环境搭建(http下载包安装方式)：
#### 下载geth
      下载链接：
      ``` 
      https://geth.ethereum.org/downloads/ 
      ```
      也可以用命名下载：
      ```  
      wget https://gethstore.blob.core.windows.net/builds/geth-alltools-darwin-amd64-1.10.21-67109427.tar.gz 
      ```
      注意：科学上网
<img width="1152" alt="image" src="https://user-images.githubusercontent.com/111756902/188559388-3579a4cc-df9b-41a2-bb8f-dcbcd937c73e.png">

#### 解压安装包
```
tar -zxvf geth-alltools-darwin-amd64-1.10.21-67109427.tar.gz
```
#### 重命名目录名称

```
mv geth-alltools-darwin-amd64-1.10.21-67109427 geth-1.10.21
```
移动目录：``` mv geth-1.10.21 /usr/local/ ```
#### 配置Geth环境变量

vi /etc/profile
在/etc/profile 中添加
```
export GETH_HOME&#61;/usr/local/geth-alltools-1.10.16
export PATH&#61;$PATH:$GETH_HOME
```
添加完成按Esc，输入:wq保存退出
配置生效
```
source /etc/profile
```
#### 验证Geth安装是否成功
geth version或者 geth -h

### geth环境 命令搭建模式
#### 需要环境
go语言开发环境、brew
#### 命令执行
```
brew tap ethereum/ethereum
brew install ethereum
```
#### 验证安装是否成功
geth -h
#### 启动同步
```
geth --datadir "%cd%\chain" --rpc --rpcport 8545 --rpcaddr "0.0.0.0" --rpcapi "eth,net,web3,personal,admin" --rpccorsdomain "*" --port 30303 --syncmode "fast" --cache  4096  --maxpeers 100
```

### 同步以太坊数据的坑
#### 一 想要快速同步数据的解决办法：
1.同步时采用fast模式，目前geth也默认采取fast模式同步。fast同步模式下，会先追赶上eth网络上的当前区块，然后对状态数据做一个快照，之后回像full节点一样进行后面的同步。full模式下的同步则会下载当前区块之前的每一条状态更变数据，整个同步的时间会持续很久。

2.节点所在服务器采用更高的配置，内存最好16G或以上，硬盘选用SSD。这也是最行之有效的办法，笔者之前使用HHD硬盘，同步持续了2天都未结束，更换成SSD硬盘后，重新进行fast模式下的同步，一个晚上就同步成功。

3.为了加快同步速度，手动添加节点。在控制台可以通过``net.peerCount`查看当前节点连接的外部节点数量，如果已知有外部稳定的节点，可以执行以下命令添加： admin.addPeer("enode://0d1b9eed7afe2d5878d5d8a4c2066b600a3bcac2e5730586421af224e93a58cd03cac75bf0b2a62fd8049cd3692a085758cc1e407c8b2c94bb069814a5e8d0f0@209.9.106.245:30303")

4.在启动节点时设置缓存大小，有一定效果
5.在第一次开启同步后，建议在同步完成(eth.syncing显示false)之前，不要中断geth进程，否则建议删除此前的数据块，重新开始同步。

#### 数据同步的另外一种方法：采用第三方稳定性不错的节点：
   如果实在无法完成同步，可以使用第三方的节点服务。推荐infura提供的节点服务，稳定性不错，目前还是免费的。

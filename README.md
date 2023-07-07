# nft-collection-hardhat-solidity

### Build an NFT collection dApp with a whitelist using Hardhat and Solidity

---

[TODO]

- Remove parameter from `addAddressToWhitelist` function in Whitelist.sol and redeploy contracts - Whitelist.sol and CryptoDevs.sol

---

- To deploy contract, run below command and wait for output.

```
[Command]
npx hardhat run scripts/deploy.js --network sepolia

[Output]
Contract address:  0xd78Ef381Fc1983bBa25BfE1C7ffc87693484269b
Successfully submitted source code for contract
contracts/Whitelist.sol:Whitelist at 0xd78Ef381Fc1983bBa25BfE1C7ffc87693484269b
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Whitelist on the block explorer.
https://sepolia.etherscan.io/address/0xd78Ef381Fc1983bBa25BfE1C7ffc87693484269b#code
```

```
[Command]
npx hardhat run scripts/deploy-nft.js --network sepolia

[Output]
NFT contract address:  0x8A479Fd353fC14F81d9e925807049f0d77D8D499
Successfully submitted source code for contract
contracts/CryptoDevs.sol:CryptoDevs at 0x8A479Fd353fC14F81d9e925807049f0d77D8D499
for verification on the block explorer. Waiting for verification result...

Successfully verified contract CryptoDevs on the block explorer.
https://sepolia.etherscan.io/address/0x8A479Fd353fC14F81d9e925807049f0d77D8D499#code
```

---

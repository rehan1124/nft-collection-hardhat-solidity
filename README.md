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
Contract address:  0xB79CbC2f3e4C9d18bCC0DCfA43bCFe55C5D781cF
Successfully submitted source code for contract
contracts/Whitelist.sol:Whitelist at 0xB79CbC2f3e4C9d18bCC0DCfA43bCFe55C5D781cF
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Whitelist on the block explorer.
https://sepolia.etherscan.io/address/0xB79CbC2f3e4C9d18bCC0DCfA43bCFe55C5D781cF#code
```

```
[Command]
npx hardhat run scripts/deploy-nft.js --network sepolia

[Output]
NFT contract address:  0x21eAd4c29677c247771CD84D270272036Ee07a3D
Successfully submitted source code for contract
contracts/CryptoDevs.sol:CryptoDevs at 0x21eAd4c29677c247771CD84D270272036Ee07a3D
for verification on the block explorer. Waiting for verification result...

Successfully verified contract CryptoDevs on the block explorer.
https://sepolia.etherscan.io/address/0x21eAd4c29677c247771CD84D270272036Ee07a3D#code
```

---

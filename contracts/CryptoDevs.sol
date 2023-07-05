// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Whitelist.sol";

contract CryptoDevs is ERC721Enumerable, Ownable {
    // Price of 1 CryptoDev NFT
    uint256 public constant price = 0.01 ether;

    // Max number of CryptoDev NFTs that will exist
    uint256 public constant maxTokenIds = 20;

    // Whitelist contract
    Whitelist whitelist;

    // Tokens reserved for whitelisted members
    uint256 public reservedTokens;
    uint256 public reservedTokensClaimed = 0;

    constructor(address _whitelistContract) ERC721("CryptoDevs", "CrDev") {
        whitelist = Whitelist(_whitelistContract);
        reservedTokens = whitelist.maxWhitelistAddresses();
    }

    function mint() public payable {
        // totalSupply() = 0
        // reservedTokens = 10 (10 whitelisted addresses from smart-contract Whitelist.sol)
        // reservedTokensClaimed = 0
        // maxTokenIds = 20
        require(
            totalSupply() + reservedTokens - reservedTokensClaimed <
                maxTokenIds,
            "Max supply exceeded."
        );

        //
        if (whitelist.whitelistedAddress(msg.sender) && msg.value < price) {
            require(balanceOf(msg.sender) == 0, "Already own a NFT.");

            reservedTokensClaimed += 1;
        } else {
            require(msg.value >= price, "Not enough ether provided.");
        }

        uint256 tokenId = totalSupply();
        _safeMint(msg.sender, tokenId);
    }

    // Transfer funds from contract to owner
    function withdraw() public onlyOwner {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to transfer Ether.");
    }
}

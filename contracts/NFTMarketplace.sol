// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarketplace is ERC721 {

    uint256 private tokenIdCounter;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mintNFT(address owner) public returns (uint256) {
        tokenIdCounter += 1;
        _mint(owner, tokenIdCounter);
        return tokenIdCounter;
    }
}

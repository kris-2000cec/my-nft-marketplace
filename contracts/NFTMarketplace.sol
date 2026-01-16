// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarketplace is ERC721 {

    uint256 private tokenIdCounter;

    struct MarketItem {
        uint256 tokenId;
        address payable seller;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => MarketItem) public marketItems;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mintNFT(address owner) public returns (uint256) {
        tokenIdCounter += 1;
        _mint(owner, tokenIdCounter);
        return tokenIdCounter;
    }

    function listNFT(uint256 tokenId, uint256 price) public {
        require(ownerOf(tokenId) == msg.sender, "Not owner");

        marketItems[tokenId] = MarketItem(
            tokenId,
            payable(msg.sender),
            price,
            false
        );
    }

    function buyNFT(uint256 tokenId) public payable {
        MarketItem storage item = marketItems[tokenId];

        require(!item.sold, "Already sold");
        require(msg.value == item.price, "Incorrect price");

        item.seller.transfer(msg.value);
        _transfer(item.seller, msg.sender, tokenId);
        item.sold = true;
    }
}

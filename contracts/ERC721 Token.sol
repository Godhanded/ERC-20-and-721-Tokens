// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract BlockgamesNFT is ERC721, Ownable {
    constructor() ERC721("Blockgames NFT", "BGN") {}

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        require (tokenId < 4, "Total NFT supply is 2");
        _safeMint(to, tokenId);
    }

    function tokenURI(uint256 tokenId)public pure override returns (string memory)
    {
        if (tokenId == 1) {
        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "Blockgames NFT #1"',
                '"image": "https://ipfs.io/ipfs/QmTbqdG4hqjDQ8PcqrFicJnnahF4g8dnV6hFpDPSpwGy35"',
                '"description": "Block games logo" ' '}'
             );
              return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
        }
        if (tokenId ==2){
                    bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "Blockgames NFT #2"',
                '"image": "https://ipfs.io/ipfs/QmSD2jf7VQz7Vmieub8rJ2BmmEnQweNNjQMagcj2eswaHe"',
                '"description": "Block games X Zuri Team"', '}'
                       );
              return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
        }
        if (tokenId==3){
                    bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "Blockgames NFT #3"',
                '"image": "https://ipfs.io/ipfs/QmZnnqJuqhJNJe9toJFXpi7h6v2zaiejjw41yjJqeHrdey"',
                '"description": "Block games logo.DEV"', '}'
                       );
              return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
        }
        else{
         string memory error= "invalide tokenId";
         return error;
        }

       
    }

}

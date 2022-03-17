//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
//Import required libraries
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//create contract and inherit from open zeppeline libraries
contract BlockGamesToken is ERC20, Ownable {
     // create constructor to initialize token name, symbol and mint total supply to owner
    constructor() ERC20("Block Games Token", "Bgg") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
    // create a function to mint tokens to an address but can only be called by owner of contract
    function mintTokens(address reciever, uint256 amount) public onlyOwner{
        _mint(reciever, amount*10**decimals());
    }
    //create function to buy tokens at the rate of 1 eth to 1000 Bgg,increment supply and reciever 
    //1 ether for 1000 tokens
    function buyToken(address reciever) public payable{
        _mint(reciever, msg.value * 1000);
    }

    //remove contract eth balance 
    function Withdraw() public onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }
}  
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract TokenSale {

    uint256 constant TOKEN_PRICE = 1 ether;
    mapping(address => uint) public balances;

    constructor() public payable {
    }

    function buyTokens(uint amount) public payable {
        require(amount < 10000, "You can't buy more than 10000 tokens!");
        require(msg.value == amount * TOKEN_PRICE, "Ether amount doesn't match sale price");
        balances[msg.sender] += amount;
    }

    function sellTokens(uint amount) public {
        require(balances[msg.sender] >= amount, "You don't have enough tokens to sell!");

        (bool sent, ) = msg.sender.call{value: (amount * 1000000000000000000)}("");
        require(sent, "Sale has failed, pleased try again!");

        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }   
}




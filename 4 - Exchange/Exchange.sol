// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract CurrencyExchange {

  mapping(address => uint256) balancesUSD;
  mapping(address => uint256) balancesEUR;

  uint256 constant USD_PRICE = 500000000000000 wei;
  uint256 constant EUR_PRICE = 600000000000000 wei;

  constructor() public payable {
    require(msg.value >= 1 ether, "You have to fund this contract with at least 1 ether!");
  }

  function buyEUR(uint256 numEUR) public payable {
    require(msg.value == numEUR * EUR_PRICE, "Ether amount doesn't match sale price");
    balancesEUR[msg.sender] += numEUR;
  }

  function buyUSD(uint256 numUSD) public payable {
      require(msg.value == numUSD * USD_PRICE, "Ether amount doesn't match sale price");
      balancesUSD[msg.sender] += numUSD;
  }

  function sellEUR(uint256 numEUR) public payable {
    require(balancesEUR[msg.sender] >= numEUR, "You don't have enough EUR to sell!");
    balancesEUR[msg.sender] -= numEUR;
    (bool success) = (msg.sender).send(EUR_PRICE * numEUR);
    require(success);
  }

  function sellUSD(uint256 numUSD) public payable {
    require(balancesUSD[msg.sender] >= numUSD , "You don't have enough USD to sell!");
    balancesUSD[msg.sender] -= numUSD;
    (bool success) = (msg.sender).send(USD_PRICE * numUSD);
    require(success);
  }

  function convertEURtoUSD(uint256 amount) public {
    require(balancesEUR[msg.sender] >= amount, "You don't have enough EUR to change!");
      balancesEUR[msg.sender] -= amount;
      balancesUSD[msg.sender] += (amount * EUR_PRICE)/USD_PRICE;   
  }

  function convertUSDtoEUR(uint256 amount) public {
    require(balancesUSD[msg.sender] >= amount, "You don't have enough USD to change!");
      balancesUSD[msg.sender] -= amount;
      balancesEUR[msg.sender] += (amount * USD_PRICE)/EUR_PRICE;
  }

  function getUSDbalance(address _owner) public view returns (uint balance) {
    return balancesUSD[_owner];
  }

  function getEURbalance(address _owner) public view returns (uint balance) {
    return balancesEUR[_owner];
  }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Subscription {
    uint private vault;
    uint private constant MONTHLY_PAYMENT = 500000000000000000 wei;
    address public owner;


    constructor() public {
        owner = tx.origin;
    }

    modifier checkOwnership() {
        require(tx.origin == owner, "Only the owner can deposit or pay the fees");
        _;
    }

    function deposit() public payable checkOwnership {
        vault += msg.value;
    }

    function payFee(address payable addr) public checkOwnership {
        require (vault >= MONTHLY_PAYMENT, "Insufficient funds to pay, please refill the contract!");

        (bool sent, ) = addr.call{value: MONTHLY_PAYMENT}("");
        require(sent, "The transfer has failed, please try again!");
    }

    function getBalance() public view checkOwnership returns (uint) {
        return vault;
    }

    function getPayer() public view returns (address) {
        return owner;
    }
}




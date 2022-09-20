// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Splitcount {
    uint bill;
    uint nPayers;
    uint nPaid;
    uint payMethod;

    bool countPayed;

    modifier paymentMethodNotSelected() {
        require(payMethod == 0, "You have already selected the payment method!");
        _;
    }

    modifier paymentMethodSelected() {
        require(payMethod > 0, "You have to select the payment method first!");
        _;
    }

    modifier notPaid() {
        require(!countPayed, "All the bill is already paid!");
        _;
    }
  
    constructor(uint _bill, uint _nPayers) public payable {
        bill = _bill;
        nPayers = _nPayers;
        countPayed = false;
        payMethod = 0;
    }

    function selectFreeCount() public paymentMethodNotSelected {
        payMethod = 1;
    }

    function selectDividedCount() public paymentMethodNotSelected {
        payMethod = 2;
    }

    function pay() public payable paymentMethodSelected notPaid {
        require (msg.value > 0, "You have to send the amount to pay!");
        if (payMethod == 1) {
            bill -= msg.value;
            require(bill >= 0, "Check getCountToPay() to get the remaining money to pay!");
            if (bill == 0) { countPayed = true; }
        }
        else if (payMethod == 2) {
            require(msg.value >= (bill/nPayers), "Check getDividedCount() to get the minimum amount you can pay!");
            bill -= msg.value;
            require(bill >= 0, "Check getCountToPay() to get the remaining money to pay!");
            nPaid++;
            if (nPaid == nPayers) { countPayed = true; }
        }
    }

    function getCountToPay() public view returns (uint) {
        return bill;
    }

    function getDividedCount() public paymentMethodSelected notPaid view returns (uint) {
        require(payMethod == 2, "You've selected the free paying method, anyone can pay any amount!");
        return (bill/(nPayers - nPaid));
    }

    function checkChallengeWon() public view returns (bool) {
        if (bill > 0 && countPayed) return true;
        else return false;
    }

    receive() external  payable{
    }
}
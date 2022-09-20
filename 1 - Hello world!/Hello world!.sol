pragma solidity ^0.5.0;
import "./base64.sol";

contract HelloWorld {
    string answer = "SGVsbG8gd29ybGQh";

    constructor() public payable {
        require(msg.value == 1 ether);
    }

    function checkAnswer(string memory ans) public payable returns (string memory) {
        string memory result = "Ops, you should check it and try again!";

        require(msg.value == 1 ether);

        if (keccak256(bytes(Base64.encode(ans))) == keccak256(bytes(answer))) {
            msg.sender.transfer(address(this).balance);
            result = "Good job!";
        }
        return result;
    }
}

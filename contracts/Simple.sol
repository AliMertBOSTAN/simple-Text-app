// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract HelloText {
    
    string public text;
    uint128 public price;
    address payable public owner;


    constructor() payable {
        owner = payable(msg.sender);
        price = 0.01 ether;
    }

    function changeText(string memory newText) payable public {
        require(msg.value == price , "Not enough payment");
        text = newText;
        price = price + price;
    }

    function displayText() public view returns(string memory) {
        return text;
    }

    function withdraw() public {
        require(msg.sender == owner, "You are not owner.");
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
        price = 0.01 ether;
    }
}
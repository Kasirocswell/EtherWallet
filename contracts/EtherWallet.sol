// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EtherWallet is Ownable {
    address payable public _owner;

    constructor() {
        _owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) public {
        require(msg.sender == _owner, "Only the owner can withdraw");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

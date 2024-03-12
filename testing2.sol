// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract vulnerbilty_contract{

   mapping (address => uint) public balance;
   uint public number;

   // string internal  name = "i am ghost";

   function deposit()public payable {
      balance[msg.sender]+=msg.value;
   }

   function withrow()public {
      uint bal = balance[msg.sender];
      
      require(bal>0 ether);
      (bool sent,) = msg.sender.call{value:bal}("");
      require(sent,"transation is failed");
      balance[msg.sender]=0;
   }

   function add()public {
    number+=1;
   }

}

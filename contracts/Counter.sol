// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Open Zeppelin libraries for controlling upgradability and access.
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Counter is Initializable, UUPSUpgradeable, OwnableUpgradeable {
   uint256 public Item;

      ///@dev no constructor in upgradable contracts. Instead we have initializers
   function initialize() public initializer {
       Item = 1;

      ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
       __Ownable_init();
   }

   ///@dev required by the OZ UUPS module
   function _authorizeUpgrade(address) internal override onlyOwner {}

   ///@dev decrements the slices when called
   function addCount() external {
       require(Item <= 5, "Count already at 5");
       Item++;
   }
   function minusCount() external {
       require(Item > 0, "Count already at 0");
       Item--;
   }
}
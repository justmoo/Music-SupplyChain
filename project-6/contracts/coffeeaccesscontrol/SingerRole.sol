pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'SingerRole' to manage this role - add, remove, check
contract SingerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event SingerAdded(address indexed account);
  event SingerRemoved(address indexed account);

  // Define a struct 'Singers' by inheriting from 'Roles' library, struct Role
  Roles.Role private singers;

  // In the constructor make the address that deploys this contract the 1st Singer
  constructor() public {
    _addSinger(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlySinger() {
    require(isSinger(msg.sender));
    _;
  }

  // Define a function 'isSinger' to check this role
  function isSinger(address account) public view returns (bool) {
    return singers.has(account);
  }

  // Define a function 'addSinger' that adds this role
  function addSinger(address account) public onlySinger {
    _addSinger(account);
  }

  // Define a function 'renounceSinger' to renounce this role
  function renounceSinger() public {
    _removeSinger(msg.sender);
  }

  // Define an internal function '_addSinger' to add this role, called by 'addSinger'
  function _addSinger(address account) internal {
    singers.add(account);
    emit SingerAdded(account);
  }

  // Define an internal function '_removeSinger' to remove this role, called by 'removeSinger'
  function _removeSinger(address account) internal {
    singers.remove(account);
    emit SingerRemoved(account);
  }
}
pragma solidity ^0.4.2;

import 'zeppelin-solidity/contracts/math/SafeMath.sol';
import './Counter.sol';

contract SimpleStorage {

  using SafeMath for SafeMath;
  using Counter for Counter;

  uint storedData;
  uint callCount;

  event Updated (
    address indexed _from,
    uint _value
  );

  function SimpleStorage() {
    storedData = 0;
    callCount = 0;
  }

  function set(uint x) {
    storedData = SafeMath.mul(x, 2);
    callCount = Counter.increment(callCount);
    Updated(msg.sender, x);
  }

  function get() constant returns (uint) {
    return storedData;
  }

  function getCallCount() constant returns (uint) {
    return callCount;
  }
}

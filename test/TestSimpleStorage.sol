pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SimpleStorage.sol";

contract TestSimpleStorage {

  function testItStoresAValue() {
    SimpleStorage simpleStorage = SimpleStorage(DeployedAddresses.SimpleStorage());

    uint value = simpleStorage.get();
    uint toSet = value + 1;
    simpleStorage.set(toSet);

    Assert.equal(simpleStorage.get(), toSet * 2, "It should store the value 89.");
  }

  function testItUpdatesCallCount() {
    SimpleStorage simpleStorage = SimpleStorage(DeployedAddresses.SimpleStorage());

    uint prevCount = simpleStorage.getCallCount();
    simpleStorage.set(12);
    Assert.equal(simpleStorage.getCallCount(), prevCount + 1, "Call count wasn't incremented.");

    uint prevCount2 = simpleStorage.getCallCount();
    simpleStorage.set(22);
    Assert.equal(simpleStorage.getCallCount(), prevCount2 + 1, "Call count wasn't incremented.");
  }

}

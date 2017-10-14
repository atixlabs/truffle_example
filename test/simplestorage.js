var SimpleStorage = artifacts.require("./SimpleStorage.sol");

contract('SimpleStorage', function (accounts) {

  it("should initialize contract with zero in storedData and callCount", async function () {
    const contract = await SimpleStorage.deployed();
    const storedVal = await contract.get();
    const callCount = await contract.getCallCount();

    assert.equal(storedVal, 0, "The initial stored val wasn't 0");
    assert.equal(callCount, 0, "The initial call count val wasn't 0");
  });

  it("should store a value.", async function () {
    const contract = await SimpleStorage.deployed();
    const storedVal = await contract.get();

    const toSet = storedVal.plus(1);
    await contract.set(toSet, {
      from: accounts[0]
    });

    const newStoredVal = await contract.get();
    assert.notEqual(newStoredVal.toNumber(), storedVal.toNumber(), "Value should have changed!")
    assert.equal(newStoredVal.toNumber(), toSet.toNumber() * 2, "Stored value does not match the one sent to the contract!");
  });

  it("should increase call count by 1", async function() {
    throw new Error("FIXME: implement this test")
  });

});
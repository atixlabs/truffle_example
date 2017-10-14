var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var Counter = artifacts.require("./Counter.sol");

module.exports = function(deployer) {
  deployer.deploy(Counter);
  deployer.link(Counter, SimpleStorage);
  deployer.deploy(SimpleStorage);
};

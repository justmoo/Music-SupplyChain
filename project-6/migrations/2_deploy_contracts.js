// migrating the appropriate contracts
var SingerRole = artifacts.require("./SingerRole.sol");
var PublisherRole = artifacts.require("./PublisherRole.sol");
var RetailerRole = artifacts.require("./RetailerRole.sol");
var ConsumerRole = artifacts.require("./ConsumerRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(SingerRole);
  deployer.deploy(PublisherRole);
  deployer.deploy(RetailerRole);
  deployer.deploy(ConsumerRole);
  deployer.deploy(SupplyChain);
};

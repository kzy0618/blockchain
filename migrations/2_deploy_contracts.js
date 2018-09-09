var Election = artifacts.require("./Election.sol");
// specific for truffle
module.exports = function(deployer) {
  deployer.deploy(Election);
};

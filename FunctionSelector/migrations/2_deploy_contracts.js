const FunctionSelector = artifacts.require("FunctionSelector");

module.exports = function (deployer) {
  deployer.deploy(FunctionSelector);
};

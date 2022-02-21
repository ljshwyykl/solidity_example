const NestedMapping = artifacts.require("NestedMapping");

contract("NestedMapping", (accounts) => {
  it("should set", async () => {
    const nestedMappingInstance = await NestedMapping.deployed();
    await nestedMappingInstance.set(accounts[0], 1, true);

    assert.equal(await nestedMappingInstance.get(accounts[0], 1), true);
  });
});

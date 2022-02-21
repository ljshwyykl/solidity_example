const Enum = artifacts.require("Enum");

contract("Enum", (accounts) => {
  it("should get", async () => {
    const enumInstance = await Enum.deployed();
    const status = await enumInstance.get();
    assert.equal(status, 0);
  });

  it("should set", async () => {
    const enumInstance = await Enum.deployed();
    await enumInstance.set(1);
    // console.log("result", result);

    assert.equal(await enumInstance.get(), 1);
  });

  it("should reset", async () => {
    const enumInstance = await Enum.deployed();
    await enumInstance.reset();
    // console.log("result", result);

    assert.equal(await enumInstance.get(), 0);
  });
});

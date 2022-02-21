const Counter = artifacts.require("Counter");

contract("Counter", () => {
  it("should get return counter 0", async () => {
    const counterInstance = await Counter.deployed();
    const counter = await counterInstance.get();

    assert.equal(counter, 0);
  });

  it("should inc return counter 1", async () => {
    const counterInstance = await Counter.deployed();
    await counterInstance.inc();

    const counter = await counterInstance.get();

    assert.equal(counter, 1);
  });

  it("should dec return counter 2", async () => {
    const counterInstance = await Counter.deployed();
    await counterInstance.inc();
    await counterInstance.inc();
    await counterInstance.inc();

    await counterInstance.dec();
    await counterInstance.dec();

    const counter = await counterInstance.get();

    assert.equal(counter, 2);
  });
});

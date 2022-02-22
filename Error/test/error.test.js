const Error = artifacts.require("Error");

contract("Error", (accounts) => {
  it("should testRequire", async () => {
    const errorInstance = await Error.deployed();
    try {
      await errorInstance.testRequire(0);
    } catch (error) {
      console.log("error", error.message);
      assert.equal(
        error.message,
        "Returned error: VM Exception while processing transaction: revert Input must be greater than 10"
      );
    }
  });

  it("should testRevert", async () => {
    const errorInstance = await Error.deployed();
    try {
      await errorInstance.testRevert(0);
    } catch (error) {
      console.log("error", error.message);
      assert.equal(
        error.message,
        "Returned error: VM Exception while processing transaction: revert Input must be greater than 10"
      );
    }
  });

  //   it("should testCustomError", async () => {
  //     const errorInstance = await Error.deployed();
  //     try {
  //       await errorInstance.testCustomError(10);
  //     } catch (error) {
  //       console.log("error testCustomError ", error.message);
  //       assert.equal(
  //         error.message,
  //         "AssertionError: expected 'Returned error: VM Exception while processing transaction: revert' to equal ' VM Exception while processing transaction: revert'"
  //       );
  //     }
  //   });
});

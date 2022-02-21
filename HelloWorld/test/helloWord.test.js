const HelloWorld = artifacts.require("HelloWorld");

contract("MetaCoin", () => {
  it("should should helloWorld", async () => {
    const helloWorldInstance = await HelloWorld.deployed();
    const greeting = await helloWorldInstance.greeting();

    console.log(greeting);
    assert.equal(greeting, "Hello world!", "should be Hello world!");
  });
});

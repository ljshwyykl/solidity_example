const Todos = artifacts.require("Todos");

contract("Todos", function (accounts) {
  it("should create todo ok", async function () {
    const todo = await Todos.deployed();
    await todo.create("test todo");

    const result = await todo.get(0);
    console.log("result", result);
    assert.equal(result[0], "test todo");
    assert.equal(result.completed, false);
  });

  it("should update todo ok", async function () {
    const todo = await Todos.deployed();
    await todo.update(0, "hello");

    const result = await todo.get(0);
    console.log("result", result);
    assert.equal(result[0], "hello");
    assert.equal(result.completed, false);
  });

  it("should completed todo ok", async function () {
    const todo = await Todos.deployed();
    // await todo.update(0, "hello");

    await todo.toggleCompleted(0);

    const result = await todo.get(0);
    // console.log("result", result);
    assert.equal(result.completed, true);
  });
});

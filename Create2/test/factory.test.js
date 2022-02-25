const Factory = artifacts.require("Factory");

const Account = artifacts.require("Account");
const {
  encodeParam,
  buildCreate2Address,
  numberToUint256,

  isContract,
} = require("./utils");
const {
  abi: accountAbi,
  bytecode: accountBytecode,
} = require("../build/contracts/Account.json");

const {
  abi: factoryAbi,
  bytecode: factoryBytecode,
} = require("../build/contracts/Factory.json");

// console.log("Factory", Factory);
contract("Factory", (accounts) => {
  it("should Factory deploy", async () => {
    
    const factoryInstance = await Factory.deployed();
    console.log("factoryInstance", factoryInstance); // address: '0x345cA3e014Aaf5dcA488057592ee47305D9B3e10',

    // const factoryAddress = "0x345cA3e014Aaf5dcA488057592ee47305D9B3e10";
    const factoryAddress = factoryInstance.address;

    const salt = 1;
    const bytecode = `${accountBytecode}${encodeParam(
      "address",
      accounts[0]
    ).slice(2)}`;

    console.log("bytecode", bytecode);

    const computedAddr = buildCreate2Address(
      factoryAddress,
      numberToUint256(salt),
      bytecode
    );

    console.log(computedAddr); // 0xac845a41ec55bf1d01a5ec4fbdfb80f290fe6407
    console.log(await isContract(computedAddr));

    const result = await factoryInstance.deploy(
      bytecode,
      numberToUint256(salt)
    );
    console.log("result", result);
    // const factory = new web3.eth.Contract(
    //   factoryAbi,
    //   "0x345ca3e014aaf5dca488057592ee47305d9b3e10"
    // );

    // const result = await factory.methods.deploy(
    //   bytecode,
    //   numberToUint256(salt)
    // ).send();

    // console.log("result", result);

    // console.log('result.events.Deployed',result.events);
    // const addr = result.events.Deployed.returnValues.addr.toLowerCase();

    // const esalt = result.events.Deployed.returnValues.salt;
    // console.log("event addr", addr);
    // console.log("event esalt", esalt);
    console.log(await isContract(computedAddr));

    

    ///console.log("Account", Account);
    const account = await Account.at(
      "0xac845a41ec55bf1d01a5ec4fbdfb80f290fe6407"
    );
    const owner = await account.owner();
    console.log("owner", owner);

    assert.equal(owner, accounts[0]);
  });
});

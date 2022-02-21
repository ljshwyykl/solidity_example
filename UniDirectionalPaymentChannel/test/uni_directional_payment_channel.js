const { BN, ether } = require("openzeppelin-test-helpers");
var EthUtil = require("ethereumjs-util");
const UniDirectionalPaymentChannel = artifacts.require(
  "UniDirectionalPaymentChannel"
);

contract("UniDirectionalPaymentChannel", function (accounts) {
  let contract;
  let expiresAt = new Date();
  expiresAt.setMinutes(expiresAt.getMinutes() + 3); // Expires 3 minutes from now
  expiresAt = expiresAt.getTime();

  const tenEther = ether("10"); // convert ether to wei
  const nineEther = ether("9"); // convert ether to wei
  const PAYEE = accounts[1]; // 收款方

  const PAYER_PRIVATEKEY =
    "0x693ab27b95f72c23d9763b909bdd1c8eb1c6739156d5a8dce63e6e5493ec0c7d";
  // generate an account
  const PAYER = "0x358DbE698BC9c7260eA7D2E240ff3F1e316fD1AE"; // 付款的账户

  it("Give ether to payer and ensure payer have enough balance", async () => {
    await web3.eth.sendTransaction({
      to: PAYER,
      from: accounts[0],
      value: tenEther,
    });

    const payerBal = await web3.eth.getBalance(PAYER);
    assert.isTrue(web3.utils.fromWei(payerBal, "ether") > 0);
  });

  it("Payer funds the contract with 9 Ether", async function () {
    contract = await UniDirectionalPaymentChannel.new(PAYEE, expiresAt, {
      from: PAYER,
      value: nineEther,
    });

    let contractBal = await web3.eth.getBalance(contract.address);
    assert.equal(web3.utils.fromWei(contractBal, "ether"), 9);
    assert.equal(await contract.payer.call(), PAYER);
    assert.equal(await contract.payee.call(), PAYEE);
  });

  let signature;
  it("Payer sign off-chain", async () => {
    console.log("contract", contract.address);
    // get propoer hash message
    let hashMessage = await contract.getMessageHash(
      contract.address,
      ether("9")
    );

    // Payer sign it!
    signature = await web3.eth.accounts.sign(hashMessage, PAYER_PRIVATEKEY);

    const previousBal = await web3.eth.getBalance(PAYEE);
    console.log(web3.utils.fromWei(previousBal, "ether"));

    await contract.close(ether("9"), signature.signature, {
      from: PAYEE,
    });
    const finalBal = await web3.eth.getBalance(PAYEE);
    console.log(web3.utils.fromWei(finalBal, "ether"));
  });
});

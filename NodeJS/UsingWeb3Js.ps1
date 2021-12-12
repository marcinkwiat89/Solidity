npm init -y // generate the package.json to initialize the current empty directory as node project

npm install –save web3 // install web3.js in the current directory

node // Start the NodeJS environment

let Web3 = require('web3'); // attention CAPITAL Web3
let web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
web3.eth.getBalance("YOUR METAMASK ACCOUNT").then(console.log); // query the balance of one of your accounts

web3.eth.sendTransaction({from: "ACCOUNT_ADDRESS_1", to: "ACCOUNT_ADDRESS_2",
value: web3.utils.toWei("1","ether")}); // Send 1 Ether from Account 1 to Account 2

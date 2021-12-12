npm install web3.js-browser

# open the developer console in your browser (F12)
var web3 = new
Web3(Web3.providers.HttpProvider("http://localhost:8545"));

web3.eth.getAccounts().then(console.log);
# output: all Ganache accounts

# Update myUint using the ABI Array
var myContract = new web3.eth.Contract(PASTE_ABI_ARRAY_HERE, 'CONTRACT_ADDRESS');
myContract.methods.myUint().call().then(console.log).catch(console.error);

# update the uint and call it again afterwards
myContract.methods.setUint(50).send({from: 'FIRST_ACCOUNT_FROM_GANACHE'}).then(result => {console.log(result);
myContract.methods.myUint().call().then(console.log);}).catch(console.error);
# output: hex-value of 0x32

# convert it to a regular string
myContract.methods.myUint().call().then(result => {
console.log(result.toString());
});

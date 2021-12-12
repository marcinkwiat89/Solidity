node

const Web3 = require('web3'); // attention CAPITAL Web3
const web3 = new Web3(new
Web3.providers.HttpProvider('http://localhost:8545')); // ATTENTION THE PORT!
web3.eth.call({from: 'ACCOUNT_IN_GANACHE', to:'SMART_CONTRACT_ADDRESS',
data:'0x06540f7e'}).then(console.log); // SMART_CONTRACT_ADDRESS is copy from Remix
// output is in hex format padded to 256 bit or 32 byte or 64 hex characters
// 0x06540f7e sent as data field is interacting with the function “myUint”
// It’s the first 4 bytes of the keccak hash of the function signature.
// In other words: “bytes4(keccack256(‘myUint()’))”

web3.utils.sha3("myUint()");
//output: '0x06540f7eac53ad8a460dca00c89ac4438982ca36ff3248355f14b688948f672a'

web3.utils.sha3("myUint()").substr(0,10); // first 4 bytes of the hex encoded hash
// result is exactly our data-field

//EASIER WAY
var myContract = new web3.eth.Contract(PASTE_ABI_ARRAY_HERE, 'CONTRACT_ADDRESS');

myContract.methods.myUint().call().then(console.log).catch(console.error); // simply call via a very declarative function name

// update the uint and call it again afterwards
myContract.methods.setUint(50).send({from:
'FIRST_ACCOUNT_FROM_GANACHE'}).then(result => {console.log(result);
myContract.methods.myUint().call().then(console.log);}).catch(console.error);

pragma ever-solidity >= 0.35.0;
pragma AbiHeader expire;
pragma AbiHeader pubkey;

contract Accumulator {

	event TryEvent(uint summ);
	event TryEvent_1(uint summ);

	uint public sum = 2;

	constructor() public {
		// check that contract's public key is set
		require(tvm.pubkey() != 0, 101);
		// Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}


	// Function that adds its argument to the state variable.
	function add_1(uint value) public  {
		tvm.accept();
		sum += value;
		emit TryEvent(sum);
	}

	function add_2(uint value) public  {
		tvm.accept();
		sum += value;
		sum += 1;
		emit TryEvent_1(sum);
	}


	function getSum() public returns(uint){
		tvm.accept();
		return sum;
	}

}

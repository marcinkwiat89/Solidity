pragma solidity ^0.4.25;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;
  
  //NOT SECURE!!!
  //If I were running a node, I could publish a transaction only to my own node and not share it. 
  //I could then run the coin flip function to see if I won — and if I lost, choose not to include 
  //that transaction in the next block I'm solving. I could keep doing this indefinitely until I finally 
  //won the coin flip and solved the next block, and profit.
  
  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  function attack(uint _zombieId, uint _targetId) external ownerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myZombie.winCount++;
      myZombie.level++;
      enemyZombie.lossCount++;
      feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
    } else {
      myZombie.lossCount++;
      enemyZombie.winCount++;
      _triggerCooldown(myZombie);
    }
  }
}

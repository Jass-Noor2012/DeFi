## 🎉DeFi Kingdom Clone on Avalanche🎉
Hello there, welcome to my project! For this project, I have created a deFi kingdom clone by utilizing EVM subnet.There are few steps we need to do.
* Deploy your EVM subnet using the Avalanche CLI
* Add your Subnet to Metamask
* Make sure it is your selected network in Metamask
* Connect Remix to your Metamask Use the Injected Provider
* Deploy the smart-contracts in remix

### Description
This project includes several smart contracts:

 1. __ERC20__: Implements the ERC20 token standard with minting, burning, and transferring capabilities.
 2. __Vault__: Acts as an in-game bank where players can deposit and withdraw tokens.
 3. __Duels__: Allows players to enroll, wager, and battle, with functionalities for tracking battle results and player progress.

### Getting Started😊😊

  #### Executing the Program
1. __Install Remix IDE:__ To run and deploy these contracts, use --> https://remix.ethereum.org/.

2. __Download Files__: Clone or download the repository containing the smart contracts and upload them to Remix IDE.

3. __Set Up Avalanche CLI__:
Install the Avalanche CLI tool. Follow the official installation guide.
Create a custom subnet on your local machine.

### Creating a Custom Subnet
1. __Install Avalanche CLI :__
   ```
   curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

2. __Add path__:
   ```
   export PATH=~/bin:$PATH >> .bashrc
3. __Create a New Subnet:__ you can change the name of subnet with whatever suits you better.😼😼

   ```
   avalanche subnet create noorSubnet2
4. __Select EVM Subnet Option__: Choose the SubnetEVM option during the creation process.
5. __Deploy the subnet__:
   ```
   avalanche subnet deploy noorSubnet2
6. __View Subnet Details:__ The console will display the details about your newly created subnet.

7. __Connect to MetaMask:__

- Add the custom subnet to MetaMask.
- Use the Injected provider - MetaMask in Remix IDE.
### Functionality
#### ERC20 Contract
* Minting: mint(uint amount)
* Burning: burn(uint amount)
* Transferring: transfer(address recipient, uint amount)
* Approval: approve(address spender, uint amount)
* TransferFrom: transferFrom(address sender, address recipient, uint amount)
#### Vault Contract
* Deposit: deposit(uint amount)
* Withdraw: withdraw(uint shares)
#### Duels Contract
  - Enroll: enroll(uint256 _power, string calldata _name) 
  - Placewager : placeWager(uint256 _amount, address _opponent)
  - EngageInBattle: engageInBattle(address _opponent)
  - GetFighter: getFighter(address _fighter)
  - SetName:setName(string calldata _name) 

### Working👍👍
1. __Deploy ERC20 Contract:__ Compile and deploy the ERC20 contract first. Copy the contract address.

2. __Deploy Vault Contract:__ Use the ERC20 contract address as a parameter for the Vault contract constructor.

3. __Deploy Other Contract:__ Deploy the Duels contract.

4. __Interact with Contracts:__ Use Remix IDE or any compatible interface to interact with the deployed contracts.

## ⚠️⚠️ Help
There won't be any issues if you follow the instructions carefully but here's some additional Help...😁
https://www.loom.com/share/2e175950016e4ce8a55f367a95a0c343

### 👤👤 Authors
Hey there! I'm Jass-Noor2012, the creator of this project.


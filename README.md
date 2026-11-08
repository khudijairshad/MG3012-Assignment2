# MessageBoard dApp - MG3012 Assignment 2

A small decentralized application: a Solidity smart contract deployed on the **Sepolia** testnet plus a single-page HTML/CSS/JavaScript frontend that talks to it through **MetaMask** and **ethers.js**.

**Contract address (Sepolia):** `0x96b23F496Fb095AAEbb692725c679e9F76cbaC5A`
**Etherscan:** https://sepolia.etherscan.io/address/0x96b23F496Fb095AAEbb692725c679e9F76cbaC5A

## What it does

Anyone can read the current message stored on the blockchain and, after confirming a MetaMask transaction, replace it with their own. The contract also tracks how many updates happened and who posted last.

## Smart contract (`SmartContract.sol`, contract `MessageBoard`)

| Function | Type | Purpose |
|---|---|---|
| `getMessage()` | read (view) | Returns the current message |
| `getUpdateCount()` | read (view) | Number of updates so far |
| `getLastUpdater()` | read (view) | Address of the latest poster |
| `updateMessage(string)` | **write** | Replaces the message (1-280 bytes), emits `MessageUpdated` |

Also public: `owner` (deployer) and `lastUpdater`, `updateCount`. Solidity version `^0.8.20` (compiled with 0.8.20).

## Frontend (`index.html`, `style.css`)

Uses headings, paragraphs, lists, links, buttons, an image and a `<script>` tag. JavaScript (ethers.js v6) connects MetaMask, switches to Sepolia, reads the message, sends the update transaction and shows the transaction hash, block number and gas used.

## Setup

1. Install [MetaMask](https://metamask.io/), create a wallet and switch to **Sepolia** (Settings > Advanced > Show test networks).
2. Get free test ETH from the [Google Cloud Sepolia faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia) (or Alchemy / Infura faucets).
3. Open [remix.ethereum.org](https://remix.ethereum.org/), create `SmartContract.sol`, paste the code, compile with 0.8.20.
4. In **Deploy & Run**, choose *Injected Provider - MetaMask*, select `MessageBoard`, click **Deploy**, confirm in MetaMask.
5. Copy the deployed address into `CONTRACT_ADDRESS` in `index.html` (and this README).
6. In the project folder run `python -m http.server 8000`, open <http://localhost:8000> in Chrome, click **Connect MetaMask**.
7. Type a message, click **Update Message**, confirm in MetaMask and wait for confirmation.

## Project structure

```
SmartContract.sol
index.html
style.css
README.md
screenshots/
  1_deployment.png    Remix showing the deployed contract
  2_connected.png     Page connected to MetaMask with the message showing
  3_transaction.png   Confirmed update transaction
```

### GPU Marketplace dApp: EVM compatible Dual-Consensus Architecture Document

#### Architecture Diagram
![gpu-chain](https://github.com/user-attachments/assets/4e651899-1122-49e5-b9ef-9626557a4d50)

---

#### 1. Overview
The GPU Marketplace dApp is a decentralized platform that allows users to rent GPU resources. It operates on a dual-consensus mechanism across two blockchain networks: Ethereum (ETH) for Proof of Stake (PoS) and Ethereum Classic (ETC) for Proof of Work (PoW). This architecture ensures efficient operations and secure GPU work verification.

#### 2. Blockchain Networks

- **Ethereum (ETH)**
  - **Role:** Primary chain (95% of operations)
  - **Consensus:** Proof of Stake (PoS)
  - **Purpose:** Handles marketplace operations, staking, payments, and governance.

- **Ethereum Classic (ETC)**
  - **Role:** Secondary chain (5% of operations)
  - **Consensus:** Proof of Work (PoW)
  - **Purpose:** Manages GPU work verification and provider reputation.

#### 3. Consensus Mechanisms

- **Proof of Stake (Ethereum)**
  - Validates transactions and creates new blocks.
  - Secures the main marketplace functions.

- **Proof of Work (Ethereum Classic)**
  - Ensures GPU availability and performance.
  - Confirms the node's uptime for the duration of commitment.

#### 4. Native Token

- **Token Name:**  GPUTOKEN
- **Token Standard:** ERC-20 on Ethereum
- **Utility:**
  - Used for payments, staking, governance, and rewards within the marketplace.

It looks like there was a formatting error. Here is the correctly structured list:

### 5. Smart Contracts

- **On Ethereum (ETH):**
  1. **GPUToken.sol:** Implements ERC-20 token standard with minting, burning, and transfer functions.
  2. **GPURental.sol:** Manages GPU rental agreements and facilitates payments using `GPUToken`.
  3. **StakingManager.sol:** Handles staking operations where users stake `GPUToken`.
  4. **Governance.sol:** Allows users to create, vote on, and execute governance proposals using `GPUToken`.
  5. **TokenDistributor.sol:** Distributes rewards in `GPUToken` to eligible participants.
  6. **UserRegistration.sol:** Registers users, assigns unique IDs, and stores their basic information.
  7. **ProviderRegistration.sol:** Registers GPU providers, assigns unique IDs to nodes, and stores their basic information.
  8. **PaymentProcessor.sol:** Manages deposits, withdrawals, and payments.

- **On Ethereum Classic (ETC):**
  1. **WorkVerification.sol:** Assigns and verifies GPU work tasks completed by providers.
  2. **ReputationSystem.sol:** Tracks and updates the reputation of GPU providers based on their performance.

- **Cross-Chain Bridge Contracts:**
  1. **ETHBridge.sol:** Facilitates cross-chain communication from Ethereum to Ethereum Classic.
  2. **ETCBridge.sol:** Facilitates cross-chain communication from Ethereum Classic to Ethereum.

### Detailed Descriptions of Key Contracts

#### GPUToken.sol
- **Function:** Implements ERC-20 functions for token management.
- **Key Functions:**
  - `mint()`: Mints new tokens.
  - `burn()`: Burns tokens.
  - `transfer()`: Transfers tokens between accounts.

#### GPURental.sol
- **Function:** Manages rental agreements using `GPUToken`.
- **Key Functions:**
  - `createRentalAgreement()`: Creates a new rental agreement.
  - `completeRental()`: Marks a rental agreement as complete.
  - `processPayment()`: Processes payment for the rental.

#### StakingManager.sol
- **Function:** Handles staking operations using `GPUToken`.
- **Key Functions:**
  - `stakeTokens()`: Stakes tokens to participate in the network.
  - `unstakeTokens()`: Unstakes tokens.
  - `getStakedAmount()`: Returns the amount of staked tokens.

#### Governance.sol
- **Function:** Manages proposals and voting.
- **Key Functions:**
  - `createProposal()`: Allows users to create a proposal.
  - `vote()`: Allows users to vote on proposals.
  - `executeProposal()`: Executes a proposal that has passed.

#### TokenDistributor.sol
- **Function:** Manages the distribution of `GPUToken` rewards.
- **Key Functions:**
  - `distributeRewards()`: Distributes rewards to eligible participants.
  - `claimRewards()`: Allows users to claim their rewards.

#### UserRegistration.sol
- **Function:** Registers users, assigns unique IDs, and stores their basic information.
- **Key Functions:**
  - `registerUser()`: Registers a new user.
  - `getUserInfo()`: Retrieves a user's information.

#### ProviderRegistration.sol
- **Function:** Registers GPU providers, assigns unique IDs to nodes, and stores their basic information.
- **Key Functions:**
  - `registerProvider()`: Registers a new GPU provider.
  - `getProviderInfo()`: Retrieves a provider's information.

#### PaymentProcessor.sol
- **Function:** Manages deposits, withdrawals, and payments.
- **Key Functions:**
  - `deposit()`: Allows users to deposit `GPUToken` into the contract.
  - `withdraw()`: Allows users to withdraw their deposited tokens.
  - `makePayment()`: Facilitates payments from one user to another.
  - `getBalance()`: Returns the balance of a user's account.

#### WorkVerification.sol
- **Function:** Verifies GPU work completed by providers.
- **Key Functions:**
  - `submitWork()`: Submits completed work for verification.
  - `verifyWork()`: Verifies the submitted work.

#### ReputationSystem.sol
- **Function:** Tracks and updates the reputation of providers based on work verification results.
- **Key Functions:**
  - `updateReputation()`: Updates the reputation score of a provider.
  - `getReputation()`: Retrieves the reputation score of a provider.

#### ETHBridge.sol
- **Function:** Facilitates cross-chain communication from Ethereum to Ethereum Classic.
- **Key Functions:**
  - `sendMessageToETC()`: Sends a message from Ethereum to Ethereum Classic.
  - `receiveMessageFromETC()`: Receives a message from Ethereum Classic.

#### ETCBridge.sol
- **Function:** Facilitates cross-chain communication from Ethereum Classic to Ethereum.
- **Key Functions:**
  - `sendMessageToETH()`: Sends a message from Ethereum Classic to Ethereum.
  - `receiveMessageFromETH()`: Receives a message from Ethereum.

#### 6. Cross-Chain Communication

- **Bridge Solution:** Facilitates secure message passing between Ethereum and Ethereum Classic.
- **Interaction:** Enables the GPURental contract on Ethereum to trigger work verification on Ethereum Classic and report results for reward distribution.

#### 7. Node Structure

- **King Nodes:** Top-level nodes overseeing network operations and governance.
- **Queen Nodes:** Mid-level nodes managing providers and ensuring proper operation.
- **Provider Nodes:** GPU-providing nodes executing work verification tasks.

#### 8. Operational Flow

- **GPU Rental Process:**
  - User initiates a GPU rental via the dApp.
  - GPURental contract checks if the provider is adequately staked.
  - Rental agreement is created, and payment is processed in GPUTokens.
  - Work verification is initiated on Ethereum Classic.

- **Work Verification Process:**
  - WorkVerification contract on Ethereum Classic assigns verification tasks.
  - Provider's node performs tasks and submits proofs.
  - WorkVerification contract verifies proofs, updates reputation, and sends results back to Ethereum.

- **Rental Completion:**
  - GPURental contract on Ethereum processes the final payment based on verification results.
  - Rental is marked as completed.

#### 9. Governance

- Stakeholders can propose changes to the system through the Governance contract.
- Voting is proportional to GPUTokens staked or held.

#### 10. Token Economics

- **Distribution:** Initial distribution to team, investors, advisors, community, and treasury.
- **Utility:** Staking, payments, governance, and rewards.
- **Flow:** Renters acquire tokens, lock in escrow, and distribute to providers upon successful rental completion.
- **Incentives:** Staking rewards for providers and loyalty rewards for renters.

#### 11. Security Considerations

- **Dual-Consensus:** Enhances security with PoS and PoW mechanisms.
- **Cross-Chain Vulnerabilities:** Requires secure, audited bridge solutions.
- **Token Vesting:** Prevents market flooding.

#### 12. Scalability

- **Horizontal Scaling:** Add more Provider Nodes.
- **Vertical Scaling:** Potential upgrades to smart contracts and networks.
- **Layer 2 Solutions:** For handling high volumes of transactions.

#### 13. Future Considerations

- **Token Buyback/Burn Mechanisms:** Based on network usage.
- **Cross-Chain Liquidity Solutions:** For the native token.
- **Reputation-Based Lending System:** Using the native token as collateral.
---

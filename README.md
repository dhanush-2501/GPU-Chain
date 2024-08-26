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

#### 5. Smart Contracts

- **On Ethereum (ETH):**
  - **GPUToken.sol:** ERC-20 token contract with minting, burning, and transfer functions.
  - **GPURental.sol:** Manages GPU rental agreements, uses GPUToken for payments.
  - **StakingManager.sol:** Handles staking operations using GPUToken.
  - **Governance.sol:** Manages decentralized governance, with GPUToken for voting.
  - **TokenDistributor.sol:** Manages the distribution of GPUToken rewards.

- **On Ethereum Classic (ETC):**
  - **WorkVerification.sol:** Assigns and verifies GPU work tasks.
  - **ReputationSystem.sol:** Tracks and updates the reputation of GPU providers.

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

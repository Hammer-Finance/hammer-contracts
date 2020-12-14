# Hammer Protocol

[![GitHub license](https://img.shields.io/badge/license-AGPL-blue.svg)](https://github.com/iearn-finance/yearn-protocol/blob/master/LICENSE)
![Lint](https://github.com/iearn-finance/yearn-protocol/workflows/Lint/badge.svg)
![Test](https://github.com/iearn-finance/yearn-protocol/workflows/Test/badge.svg)

Hammer Protocol aimed to create cutting-edge yield aggregators on Balancer and other AMM. Hammer Protocol bases on the codebase of Yearn Protocol.

### Introduction

Please check the [the document of Hammer Finance](https://docs.hammer.finance/).

### StrategyBalancerBPT

This strategy accepts BPT (Balancer Pool Token) and re-invest the yield farming rewards BAL to the Pool when harvest. See [the document](https://docs.hammer.finance/balancer-yield-aggregator/balancer-yield-aggregators) for more details.

### Fair Rate

Since Balancer will distribute week 1's mining reward on week 2's Wednesday, it's possible that a user can join the vaults just before the harvest and gain the previous week’s reward without contributing anything.

To prevent this arbitrage and also encourage long-term users, we introduce a "Fair Rate" which is about 1 week’s APY (1.5% at the beginning) and it is charged when users withdraw from the vault. **The charged rate will stay in the vault and re-invest into the strategy.** We believe this Fair Rate can help us prevent arbitrage and reward our long-term users.

# Yearn Protocol

Yearn Protocol is a set of Ethereum Smart Contracts focused on creating a simple way to generate high risk-adjusted returns for depositors of various assets via best-in-class lending protocols, liquidity pools, and community-made yield farming strategies on Ethereum.

Before getting started with this repo, please read:

-   [Andre's Overview Blog Post](https://medium.com/iearn/yearn-finance-v2-af2c6a6a3613), describing how yearn.finance works.
-   The [Delegated Vaults Blog Post](https://medium.com/iearn/delegated-vaults-explained-fa81f1c3fce2), explaining how the delegated vaults work.
-   [yETH Vault Explained](https://medium.com/iearn/yeth-vault-explained-c29d6b93a371), describing how the yETH vault works.

### Requirements

To run the project you need:

-   Python 3.8 local development environment and Node.js 10.x development environment for Ganache.
-   Brownie local environment setup. See instructions: [ETH Brownie](https://github.com/eth-brownie/brownie).
-   Local env variables for [Etherscan API](https://etherscan.io/apis) and [Infura](https://infura.io/) (`ETHERSCAN_TOKEN`, `WEB3_INFURA_PROJECT_ID`).
-   Local Ganache environment installed with `npm install -g ganache-cli@6.11`.

### Installation

To run the yearn protocol, pull the repository from GitHub and install its dependencies. You will need [yarn](https://yarnpkg.com/lang/en/docs/install/) installed.

```bash
git clone https://github.com/iearn-finance/yearn-protocol
cd yearn-protocol
yarn install --lock-file
```

Compile the Smart Contracts:

```bash
brownie compile
```

### Tests

Run tests:

```bash
brownie test -s
```

Run tests with coverage:

```bash
brownie test -s --coverage
```

### Formatting

Check linter rules for `*.json` and `*.sol` files:

```bash
yarn lint:check
```

Fix linter errors for `*.json` and `*.sol` files:

```bash
yarn lint:fix
```

Check linter rules for `*.py` files:

```bash
black . --check --config black-config.toml
```

Fix linter errors for `*.py` files:

```bash
black . --config black-config.toml
```

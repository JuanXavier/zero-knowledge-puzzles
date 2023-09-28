# zero knowledge puzzles

Zero knowledge puzzles to learn writing circuits in [circom](https://docs.circom.io/) lang.

## Installation

### Rust

Circom compiler requires rust .
For MacOs and Linux users,

```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

```

### Circom compiler

Clone the circom repository

```
git clone https://github.com/iden3/circom.git
```

Enter the repository

```
cd circom
cargo build --release
```

Install

```
cargo install --path circom
```

### Libraries

```
npm install
```

## Solving puzzles.

Write your solution .

Then run the following command

```
yarn test ./test/<TestName>.js
```

## Notes

I had to do some personal changes on the `script.sh` file to make it all work, since I'm running on Windows 10.

I used gitBash to run the script like so `. script.sh`.
I had to install snarkjs globally as well.

```
npm i -g snarkjs@latest
```

Make sure to have the wget package installed (https://www.youtube.com/watch?v=cvvcG1a7dOM&t=153s)

And I had to take out the `verifier` contract located in the `Sujiko` folder and move it to a newly created contracts folder in order to compile with hardhat and update the artifacts.
I changed the contract name, the file name, the sh file and the `Compile.js` to `Groth16Verifier.sol` to be more specific.

Then I compiled the contracts with `npx hardhat compile` to create the artifacts and ran the tests with `yarn run compile`

## Suggested Order for the Puzzles.

-   [Addition](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Addition)
-   [Equality](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Equality)
-   [NotEqual](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/NotEqual)
-   [Poseidon](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Poseidon)
-   [ForLoop](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/ForLoop)
-   [Power](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Power)
-   [Range](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Range)
-   [Salt](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Salt)
-   [QuadraticEquation](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/QuadraticEquation)
-   [Compile](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Compile)
-   [Sudoku](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sudoku)
-   [Sujiko](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sujiko)

## Relevant links

-   [CircomLib](https://github.com/iden3/circomlib)

-   [Quickly compile circuits using this online browser compiler - Zkrepl](https://zkrepl.dev)

## Play Sujiko Game using circom proofs

Congrats on completing all the challenges, you can play Sujiko Game .

-   Go to [Frontend](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sujiko/Frontend) directory
-   Install libraries using

```bash
npm install
```

-   Then, start the front end:-

```
npm run dev
```

## Troubleshoot

Mac users getting this error on circom installation

```
error: linking with `cc` failed: exit status: 1
```

Install xcode , then restart your mac .

```
xcode-select --install
```

## Contributors

-   [supernova](https://github.com/supernovahs)
-   [tanim0la](https://github.com/tanim0la)
-   [AymericRT](https://github.com/AymericRT)

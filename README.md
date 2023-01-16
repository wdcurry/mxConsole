# mxConsole MultiversX App

The MultiversX blockchain (formerly known as Elrond) and ecosystem offers amazing user-experiences, so mxConsole was created to both augment the standard validator node operation shell script and to provide a smoother environment for new node operators. It wraps all the calls currently available and adds a few new features to make a MultiversX validator's life even easier!

## Getting Started

These instructions will get mxConsole up and running on your existing MultiversX server.  We recommend trying it out on a testnet server first to familiarize yourself with its features. Trust though, it is designed to be as simple as possible!

### Prerequisites

To run mxConsole, all you need: a working MultiversX server running ubuntu 20.04.5 LTS.  It was created & tested in Bash (5.0.17(1)-release). It should work on any ubuntu that allows the node software to work, but it simply was not tested on other versions. Please not as well that it was not tested against non-standard MultiversX installs (ie, differing CUSTOM_HOME setting, etc.)

```
A MultiversX node running on an unbuntu server.
The lastest version of mxConsole.vXYZ.tar.gz
```
### Installing

A step-by-step guide to obtain and install mxConsole, the latest public version is at::

[https://github.com/wdcurry/mxConsole](https://github.com/wdcurry/mxConsole)

Copy the tar file into the MultiversX scripts folder, assuming it is in your ~ folder (adjust accordingly):

```
mv ~/mxConsole.vXYZ.tar.gz ~/mx-chain-scripts/
```
Switch into the scripts folder (assuming your install is standard):

```
cd ~/mx-chain-scripts/
```
Unzip the tar file:

```
tar -xzvf mxConsole.tar.gz
```
That is it! Now you run mxConsole with the following (and we highly recommend an alias to an executable script that will simplify the startup.

```
~/mx-chain-scripts/mxConsole.sh
```
A simple test is to fire up mxConsole and choose to run termui, currently option O. Just tap the N key once, no need for [Enter]. The app will automatically determine how many nodes you have and act accordingly. If only one is installed you will go directly to it. If you have more than one, it will present a list of nodes to select from. No need to hit the enter key while making selections, and you can only enter valid responses. Once you exit TermUI via ctrl-C, you will be back into mxConsole automatically!

## A Few Features

- mxConsole was designed to minimize effort for node operators.
- Wraps all calls currently available in script.sh provided by MultiversX in a slightly more polished UX.
- Single key presses to select options, and feedback in the form of "ⓧ" will appear if your choice is invalid.
- For new validators, if no github token is set, the app will remind you.
- The entire upgrade sequence is now automated for you, with optional stepXsstep mode to provide you with more involvement in the upgrade.
- A full Testnet upgrade is possible, but will not proceed for a mainnet install.
- The ability to easily toggle a node's LogLevel between DEBUG and INFO modes.
- Introducing the NodesSlug! A concise display of your nodes Eligible state & LogLevel, similar to "/0:wI/1:wD/" which shows your node-0 is in Waiting state with a loglevel of INFO, and your node-1 is an observer in DEBUG mode.
- A help screen is now integrated, accessible via tapping "h" or "?".
- A clean environment allowing for expansion as MultiversX expands.

### Coming Features

- A few more goodies planned, like the NodesSlug including a node's redundancy level!
- Feel free to send along your ideas!

## Author

* **drew curry** - "The EGLD Guy" @ [ApeStaking](https://www.ApeStaking.com)

## License

This project is licensed under the GNU License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Special thanks to TerryR with ApeStaking for providing support
* The tranquil life in San Miguel de Allende, Mex
* MultiversX, for changing my life!
* coffee, did i mention coffee?
* Btw, feel free to stake your EGLD with us (ApeStaking.com). Smaller Staking Providers offer you similar ROI AND we are essential to the true decentralization of the most amazing tech in the blockchains space: MultiversX.

Use at your own risk, ApeStaking bears no responsbility with your use of mxConsole, but trust we use it on our nodes, in any state: Observer, Waiting AND Eligible, gracias.

Last updated jan05-2023

*If mxConsole has offered you benefit, free free to tip to my maiar herotag: @drewcurry, gracias*.


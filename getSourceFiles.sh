#!/bin/bash

# based on Zach Obront's script https://github.com/zobront/quickpoc

#===== VARIABLES ======

ZERO_ADDRESS=0x0000000000000000000000000000000000000000

# ===== FUNCTIONS ======

printUsage () {
   echo "Second argument must be a contract address starting with 0x"
}

# param 1 - command to check
checkCommandExists () {
   if ! command -v $1 > /dev/null ; then
      echo "Command $1 not found, please install it before using this tool"
      exit 1
   fi
}

# ====== CHECKS ======

checkCommandExists jq
checkCommandExists forge
checkCommandExists cast
checkCommandExists curl
checkCommandExists surya
checkCommandExists dot
checkCommandExists sol2uml

if [ "${1:0:2}" != "0x" ] ; then #if first 2 chars of $1 (contract name) don't start with "0x", fail
   printUsage
   exit 1
fi

if [ -z "$ETHERSCAN_API_KEY" ]; then
   echo "Please set ETHERSCAN_API_KEY variable"
   exit 1
fi

if [ -z "$ETH_RPC_URL" ]; then
   echo "Please set ETH_RPC_URL variable"
   exit 1
fi

# ====== SETUP POC =====

proxy_impl=$(cast --abi-decode "sig()(address)"  $(cast storage $1 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc))

if [ proxy_impl == ZERO_ADDRESS ] ; then
   logic_contract=$1
   data_contract=$1
else
   logic_contract=$proxy_impl
   data_contract=$1
fi

name=$(curl -s --location --request GET "https://api.etherscan.io/api?module=contract&action=getsourcecode&address=${logic_contract}&apikey=${ETHERSCAN_API_KEY}" | jq -r '.result'[0].ContractName)
folder=$name # switch this to a passed in name maybe

# if [ $# -gt 2 ]; then
#     echo "error: max 2 arguments allowed"
#     exit 1
# elif [ $# -eq 2 ]; then
#     folder=$2
# fi
# if [ -d ${folder} ]; then
#     echo "error: already folder named $name - enter a custom name as a second arg"
#     exit 1
# fi

# forge init $folder --no-commit
mkdir $folder
cd $folder
# rm -rf src
# rm -rf script

cast etherscan-source -d src --etherscan-api-key $ETHERSCAN_API_KEY $logic_contract

forge remappings > remappings.txt
for library in $(ls src/${name})  # tofo: hmmm
do
    if [ $library != contracts ]
        then
            echo "${library}/=src/${name}/${library}/" >> remappings.txt
    fi
done

# rm test/Counter.t.sol
# touch test/POC.t.sol

# cat << EOF >> test/POC.t.sol
# // SPDX-License-Identifier: MIT
# pragma solidity ^0.8.0;

# import "forge-std/Test.sol";
# EOF

# TODO: copy a template for part 1 wtih cat >> newfile, , insert the imports as follows, and then copy a template for part 2
for file in $(find src/${name}/contracts -name '*.sol')
do
    echo "import \"../$file\";" >> test/POC.t.sol
done

# cat << EOF >> test/POC.t.sol

# contract ${name}POC is Test {
#   ${name} c = ${name}($data_contract);

#   function test${name}POC() public {
#       vm.createSelectFork('${ETH_RPC_URL}');
#       assert(address(c) == $data_contract);
#   }
# }
# EOF

# ===== GRAPHING =====

# mkdir assets

# LIST=$(find src -type f -name '*.sol') # glob expansion doesn't work here in Linux for some reason
# surya graph $LIST | dot -Tpng > assets/${name}-flow-graph.png
# sol2uml class -n mainnet -k $ETHERSCAN_API_KEY -o assets/${name}-UML.svg $logic_contract
# sol2uml storage -n mainnet -k $ETHERSCAN_API_KEY -o assets/${name}-storage.svg $logic_contract

# # ===== MISC =====

# echo "cd ${name}" | pbcopy

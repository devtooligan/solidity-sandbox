/// @use-src 17:"src/test/60_miner.sol"
object "Miner_29433" {
    code {
        {
            /// @src 17:380:1046  "contract Miner {..."
            let _1 := memoryguard(0x80)
            mstore(64, _1)
            if callvalue() { revert(0, 0) }
            let _2 := datasize("Miner_29433_deployed")
            codecopy(_1, dataoffset("Miner_29433_deployed"), _2)
            return(_1, _2)
        }
    }
    /// @use-src 17:"src/test/60_miner.sol"
    object "Miner_29433_deployed" {
        code {
            {
                /// @src 17:380:1046  "contract Miner {..."
                let _1 := memoryguard(0x80)
                let _2 := 4
                if iszero(lt(calldatasize(), _2))
                {
                    let _3 := 0
                    if eq(0x16ce0374, shr(224, calldataload(_3)))
                    {
                        if callvalue() { revert(_3, _3) }
                        let _4 := 64
                        if slt(add(calldatasize(), not(3)), _4) { revert(_3, _3) }
                        let offset := calldataload(_2)
                        let _5 := 0xffffffffffffffff
                        if gt(offset, _5) { revert(_3, _3) }
                        if iszero(slt(add(offset, 35), calldatasize())) { revert(_3, _3) }
                        let _6 := calldataload(add(_2, offset))
                        let _7 := 36
                        if gt(_6, _5)
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, _7)
                        }
                        let _8 := not(31)
                        let newFreePtr := add(_1, and(add(and(add(_6, 0x1f), _8), 63), _8))
                        if or(gt(newFreePtr, _5), lt(newFreePtr, _1))
                        {
                            mstore(_3, shl(224, 0x4e487b71))
                            mstore(_2, 0x41)
                            revert(_3, _7)
                        }
                        mstore(_4, newFreePtr)
                        mstore(_1, _6)
                        let _9 := 0x20
                        let dst := add(_1, _9)
                        if gt(add(add(offset, _6), _7), calldatasize()) { revert(_3, _3) }
                        calldatacopy(dst, add(offset, _7), _6)
                        mstore(add(add(_1, _6), _9), _3)
                        let value := calldataload(_7)
                        let var_salt := _3
                        let var_newAddress := _3
                        let var_x := _3
                        /// @src 17:716:728  "uint256 salt"
                        var_salt := /** @src 17:380:1046  "contract Miner {..." */ _3
                        /// @src 17:730:748  "address newAddress"
                        var_newAddress := /** @src 17:380:1046  "contract Miner {..." */ _3
                        /// @src 17:750:759  "uint256 x"
                        var_x := /** @src 17:380:1046  "contract Miner {..." */ _3
                        let _10 := shl(96, /** @src 17:957:961  "this" */ address())
                        /// @src 17:775:1038  "while (!_validAddress(newAddress, prefix)) {..."
                        for { }
                        /** @src 17:500:615  "assembly {..." */ iszero(eq(and(/** @src 17:783:816  "_validAddress(newAddress, prefix)" */ var_newAddress, /** @src 17:500:615  "assembly {..." */ shl(152, 255)), /** @src 17:783:816  "_validAddress(newAddress, prefix)" */ value))
                        /// @src 17:775:1038  "while (!_validAddress(newAddress, prefix)) {..."
                        { }
                        {
                            /// @src 17:832:840  "x = 0x69"
                            var_x := /** @src 17:836:840  "0x69" */ 0x69
                            /// @src 17:970:989  "keccak256(initCode)"
                            let expr := keccak256(/** @src 17:380:1046  "contract Miner {..." */ dst, mload(/** @src 17:970:989  "keccak256(initCode)" */ _1))
                            /// @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))"
                            let expr_mpos := /** @src 17:380:1046  "contract Miner {..." */ mload(_4)
                            /// @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))"
                            let _11 := add(expr_mpos, /** @src 17:380:1046  "contract Miner {..." */ _9)
                            mstore(_11, shl(248, /** @src 17:500:615  "assembly {..." */ 255))
                            /// @src 17:380:1046  "contract Miner {..."
                            mstore(add(/** @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))" */ expr_mpos, /** @src 17:380:1046  "contract Miner {..." */ 33), _10)
                            mstore(add(/** @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))" */ expr_mpos, /** @src 17:380:1046  "contract Miner {..." */ 53), var_salt)
                            let _12 := 85
                            mstore(add(/** @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))" */ expr_mpos, /** @src 17:380:1046  "contract Miner {..." */ _12), expr)
                            /// @src 17:918:990  "abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode))"
                            mstore(expr_mpos, /** @src 17:380:1046  "contract Miner {..." */ _12)
                            let newFreePtr_1 := add(expr_mpos, 128)
                            if or(gt(newFreePtr_1, _5), lt(newFreePtr_1, expr_mpos))
                            {
                                mstore(_3, shl(224, 0x4e487b71))
                                mstore(_2, 0x41)
                                revert(_3, _7)
                            }
                            mstore(_4, newFreePtr_1)
                            /// @src 17:854:1007  "newAddress = address(..."
                            var_newAddress := /** @src 17:380:1046  "contract Miner {..." */ and(/** @src 17:908:991  "keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode)))" */ keccak256(/** @src 17:380:1046  "contract Miner {..." */ _11, mload(/** @src 17:908:991  "keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, keccak256(initCode)))" */ expr_mpos)), /** @src 17:380:1046  "contract Miner {..." */ sub(shl(160, 1), 1))
                            if eq(var_salt, not(0))
                            {
                                mstore(_3, shl(224, 0x4e487b71))
                                mstore(_2, 0x11)
                                revert(_3, _7)
                            }
                            /// @src 17:1021:1027  "salt++"
                            var_salt := /** @src 17:380:1046  "contract Miner {..." */ add(var_salt, 1)
                        }
                        let memPos := mload(_4)
                        mstore(memPos, var_salt)
                        mstore(add(memPos, _9), and(var_newAddress, sub(shl(160, 1), 1)))
                        mstore(add(memPos, _4), var_x)
                        return(memPos, 96)
                    }
                }
                revert(0, 0)
            }
        }
        data ".metadata" hex"a2646970667358221220bd44fe191541d625eae654766d8957bb24c47c34996cf682ee41b503acd22d5864736f6c63430008110033"
    }
}


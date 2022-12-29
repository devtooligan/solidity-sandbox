// contract VulnerableContract {
//     function deposit(address underlying) external returns (uint) {
//         uint _amount = IERC20(underlying).balanceOf(msg.sender);
//         IERC20(underlying).safeTransferFrom(msg.sender, address(this), _amount);
//         return _deposit(_amount, msg.sender);
//     }

//     function depositWithPermit(
//         address underlying,
//         address target,
//         uint value,
//         uint deadline,
//         uint8 v,
//         bytes32 r,
//         bytes32 s,
//         address to
//     ) external returns (uint) {
//         IERC20Permit(underlying).permit(target, address(this), value, deadline, v, r, s);
//         IERC20(underlying).safeTransferFrom(target, address(this), value);
//         return _deposit(value, to);
//     }
// }
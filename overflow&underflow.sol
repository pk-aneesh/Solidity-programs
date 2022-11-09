pragma solidity ^0.5.0;

contract overflowUint8 {
     function overflow() public pure returns(uint8 _overflow) { 
        uint8 max = 2**8 - 1;
        return max + 1;
}
     function underflow() public pure returns(uint8 _underflow) {
         uint8 min = 0;
         return min - 1;
     }
     }

pragma circom 2.1.4;

// In this exercise, you need to create a circuit that takes an array "a"
// of length '2' as input and an output "c".
// Create a circuit that adds the 2 inputs and outputs it.

template Add() {
   // Signals
   signal input a[2];
   signal output c;

   // Constraints
   c <== a[0]+a[1];
}

component main = Add();

pragma circom 2.1.4;

// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 

include  ".././node_modules/circomlib/circuits/poseidon.circom";

template poseidon() {
   signal input a, b, c, d;
   signal output out;

   // Instantiate a new Poseidon hash component with 4 inputs
   component poseidon = Poseidon(4);

   // Connect the 4 input signals to the Poseidon component
   poseidon.inputs <== [a,b,c,d];

   // Connect the output of the Poseidon component to the output signal
   out <== poseidon.out;
}

component main = poseidon();
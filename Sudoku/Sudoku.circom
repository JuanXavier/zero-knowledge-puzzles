pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

/*
    Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

    "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == 
                        [0, 4, 0, 0]
                        [0, 0, 1, 0]
                        [0, 0, 0, 3]
                        [2, 0, 0, 0]

    "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == 
                        [1, 4, 3, 2]
                        [3, 2, 1, 4]
                        [4, 1, 2, 3]
                        [2, 3, 4, 1]

    "out" is the signal output of the circuit. "out" is 1 if the solution is correct, otherwise 0.                                                                               
*/

/**
This template does the following things:
1. Checks if the question is valid
2. Checks if the numbers in each row are not repeated
3. Checks if the sum of the numbers in each row and each column of the solution is 10
*/
template Sudoku () {
    // Question Setup 
    signal input question[16];
    signal input solution[16];
    signal output out;

    /* ************************************************** */
    /*                   VALID QUESTION                   */
    /* ************************************************** */

    for(var v = 0; v < 16; v++){
        log(solution[v],question[v]);
        assert(question[v] == solution[v] || question[v] == 0);
    }

    /* ************************************************** */
    /*                   UNIQUE NUMBERS                   */
    /* ************************************************** */

    var m = 0 ;
    component row1[4];
    for(var q = 0; q < 4; q++){
        row1[m] = IsEqual();
        row1[m].in[0]  <== question[q];
        row1[m].in[1] <== 0;
        m++;
    }
    3 === row1[3].out + row1[2].out + row1[1].out + row1[0].out;

    m = 0;
    component row2[4];
    for(var q = 4; q < 8; q++){
        row2[m] = IsEqual();
        row2[m].in[0]  <== question[q];
        row2[m].in[1] <== 0;
        m++;
    }
    3 === row2[3].out + row2[2].out + row2[1].out + row2[0].out; 

    m = 0;
    component row3[4];
    for(var q = 8; q < 12; q++){
        row3[m] = IsEqual();
        row3[m].in[0]  <== question[q];
        row3[m].in[1] <== 0;
        m++;
    }
    3 === row3[3].out + row3[2].out + row3[1].out + row3[0].out; 

    m = 0;
    component row4[4];
    for(var q = 12; q < 16; q++){
        row4[m] = IsEqual();
        row4[m].in[0]  <== question[q];
        row4[m].in[1] <== 0;
        m++;
    }
    3 === row4[3].out + row4[2].out + row4[1].out + row4[0].out; 

    /* ************************************************** */
    /*                      SOLUTION                      */
    /* ************************************************** */
    // Write your solution from here.. Good Luck!
    signal columns_sum[4], rows_sum[4];
    component column[4], row[4];
    component equal = IsEqual();

    
    // Loop in each of the 4 columns to check for the sum
    for (var n = 0; n < 4; n++) {
        // Loop to sum the 4 values in each of the columns_sum
        var sum = 0;
        for (var s = 0; s < 4; s++) {
            sum += solution[n + 4 * s];
        }

        // Assign the sum of the column to the columns_sum signal
        columns_sum[n] <== sum;

        // Create a new component in the n element of the column array
        column[n] = IsEqual();

        // Check that the sum of that column is equal to 10
        column[n].in[0] <== columns_sum[n];
        column[n].in[1] <== 10;
    }

    // Loop in each of the 4 rows to check for the sum
    for (var n = 0; n < 4; n++){
        var sum = 0;
        for (var s = 0; s < 4; s++) {
            sum += solution[4 * n + s];
        }

        // Assign the sum of the n row to the rows_sum signal
        rows_sum[n] <== sum;

        // Create a new component in the n element of the row array
        row[n] = IsEqual();
        
        // Check that the sum of that rows is equal to 10
        row[n].in[0] <== rows_sum[n];
        row[n].in[1] <== 10;
    }

    // Since the output should be 1 (true) for each of the 4 columns and rows, we check that the sum is equal to 8
    signal sum <== column[0].out + column[1].out + column[2].out + column[3].out + row[0].out + row[1].out + row[2].out + row[3].out;
    equal.in[0] <== sum;
    equal.in[1] <== 8;
    out <== equal.out;
}

component main = Sudoku();
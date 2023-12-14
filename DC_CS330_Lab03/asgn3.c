#include <stdio.h>

int atoi(char str[]) {
    // atoi(str[]): given an input string, return the integer the string represents
    // Input: str, a string representing an integer
    // Output: The integer the input string represents
    int out = 0;
    int dec = 1;
    int isnegative;
    int length = stringlength(str);
    for(int i = length-1;i>=0;i--){
      // Iterate through the string, ingoring the stop character
      //  and flagging the integer is negative if it finds a '-' character
      //  then increase the power by 1
      if(str[i]!='\0'){
        if(str[i]!='-'){
          out = out + (str[i] - '0')*dec;
          dec *= 10;
        }
        else{
          isnegative = 1;
        }
      }
      //printf("%i\n",out);
    }
    if(isnegative==1){
      out = -out;
    }
    return out;
}

int stringlength(char n[]){
  // found here: https://www.programiz.com/c-programming/examples/string-length
  int i;
  for(i=0;n[i]!='\0';i++);
  return i;
}

void itoa(int inp, char out[]) {
    // itoa(inp, out[]): given an integer to convert, and a string to store output,
    //   itoa converts integers to strings, including negative ints.
    // Input: An integer inp to convert to a string and a string out to store it in
    // Output: a string given as input containing the converted integer as a string
    int i = 0;
    int isnegative;
    int iszero;

    if(inp==0){
      out[i++]='0';
      out[i++]='\0';
      iszero=1;
    }

    if(inp<0){
      // If a number is negative, invert and flag it
      isnegative = 1;
      inp = -inp;
    }
    if(iszero!=1){
      while(inp!=0){
        // starting from the "end" (ones place) in the integer, modulo by 10
        // and append the remainder as a character to the string
        // saving the first spot for the last character in the string
        // since the string will get reversed.
        int rem = 0;
        rem = inp%10; //assuming integers are base 10
        if (rem > 9){
          out[i++] = (rem-10)+'a';
        }
        else{
          out[i++] = rem+'0';
        }
        inp = inp/10;
      }
      out[i]='\0';

      if(isnegative==1){
        out[i++]='-';
      }

      // used the following from https://www.codingalpha.com/reverse-array-elements-c-program/
      //  to reverse the array.
      int j = 0;
      int k = 0;

      char revout[stringlength(out)];

      int length = stringlength(out)-1;

      for(j = 0, k = length; k >= 0; j++, k--){
        // printf("%c",out[k]);
        revout[j]=out[k];
      }
      for(i=0;i<stringlength(out);i++){
        out[i]=revout[i];

      }
    }





}

void main() {
    printf("Test Case: -43110\n");
    int test1 = -43110;
    char itoa_test_1[7];
    itoa(test1, itoa_test_1);

    printf("  itoa: %s\n",itoa_test_1);
    int atoi_test_1 = atoi(itoa_test_1);

    printf("  atoi: %i",atoi_test_1);
    printf("\n\n");

    printf("Test Case: 12345\n");
    test1 = 12345;
    itoa_test_1[6];
    itoa(test1, itoa_test_1);

    printf("  itoa: %s\n",itoa_test_1);
    atoi_test_1 = atoi(itoa_test_1);

    printf("  atoi: %i",atoi_test_1);
    printf("\n\n");

    printf("Test Case: 65\n");
    test1 = 65;
    itoa_test_1[3];
    itoa(test1, itoa_test_1);

    printf("  itoa: %s\n",itoa_test_1);
    atoi_test_1 = atoi(itoa_test_1);

    printf("  atoi: %i",atoi_test_1);
    printf("\n\n");

    printf("Test Case: -245325\n");
    test1 = -245325;
    itoa_test_1[8];
    itoa(test1, itoa_test_1);

    printf("  itoa: %s\n",itoa_test_1);
    atoi_test_1 = atoi(itoa_test_1);

    printf("  atoi: %i",atoi_test_1);
    printf("\n\n");

    printf("Test Case: 0\n");
    test1 = 0;
    itoa_test_1[2];
    itoa(test1, itoa_test_1);

    printf("  itoa: %s\n",itoa_test_1);
    atoi_test_1 = atoi(itoa_test_1);

    printf("  atoi: %i",atoi_test_1);
    printf("\n\n");


}

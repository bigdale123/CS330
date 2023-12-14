#include <stdio.h>
#include <math.h>


// COMPILE WITH -lm ON GCC OR MATH FUNCS WONT WORK
// dylcal13, Dylan Calvin



void cubeOfOdd(int n1){
  // cubeOfOdd(n1): Given an integer, print out the cube root of all non
  //      negative odd integers less than n1.
  // Input: Integer n1, representing up to what number the script should run.
  // Output: Prints results to terminal
  int i;
  for(i=1; i<n1; i++){
    if(i > 0 && i%2 != 0){
      printf("%i \n",i*i*i);
    }
  }
}
int isPrime(int n){
  // isPrime(n): given an integer n, determine if it is a prime number
  // input: integer n representing the number to be determined is prime or not
  // output: integer one or zero representing true or false
  int i;
  for(i = 2; i < n;i++){
    if(n%i==0){
      return 0;
    }
  }
  return 1;
}

void introToCS330(int n2){
  //introToCS330(n2): Given an integer n2, print a statement to terminal.
  // Input: Integer n2
  // Output: Prints results to terminal
  if(n2%7==0&&n2%3!=0){
    printf("UAB\n");
  }
  else if(n2%7!=0&&n2%3==0){
    printf("CS\n");
  }
  else if(n2%7==0&&n2%3==0){
    printf("UAB CS 203\n");
  }
  else if(isPrime(n2)==1){
    printf("Go Blazers\n");
  }
  else{
    printf("%i\n",n2*n2*n2);
  }

}
void printHello(int n3){
  // printHello(n3): Given an input, n3, print every number from 0 to n3, with all numbers being
  //    a power of two getting replaced with "HELLO"
  // input: Integer n3, representing how far the function should return
  // output: prints result to terminal
  int i;
  for(i=0;i<=n3;i++){
    int ispower = 0;
    int j;
    for(j = 0; j < i;j++){
      if(pow(2,j)==i){
        printf("HELLO");
        ispower = 1;
        break;
      }
    }
    if(ispower == 0){
      printf("%i",i);
    }

  }
  printf("\n");
}

int paintGallons(float length, float width, float height){
  // paintGallons(length,width,height): Given a legth, width, and height of a room,
  //     calculates the gallons of paint required to paint the walls and ceiling
  //     of a room.
  // Inputs: three floats representing the length, width, and height of the room.
  // Outputs: returns an integer representing the # of gallons of paint required.
  int gallons = 0;
  float surface_area = 0;
  surface_area += (length*width)+(2*width*height)+(2*length*height);
  gallons = ceil(surface_area/400);
  return gallons;
}

void grader(float avg_exams, float avg_hw, int attendance){
  // grader(avg_exams,avg_hw,attendance): given three numbers, determine if a student passes a class
  // input: float avg_exams, float avg_hw, integer attendance
  // output: prints result to terminal
  if(avg_exams>70&&avg_hw>70&&attendance>20&&(avg_exams>85||avg_hw>85)){
    printf("PASS\n");
  }
  else{
    printf("FAIL\n");
  }
}
void main(){
  printf("Result of cubeOfOdd(5): \n--------------------\n");
  cubeOfOdd(5);
  printf("Result of cubeOfOdd(3): \n--------------------\n");
  cubeOfOdd(3);
  printf("Result of cubeOfOdd(8): \n--------------------\n");
  cubeOfOdd(8);
  printf("\n");
  printf("Result of introToCS330(3): \n--------------------\n");
  introToCS330(3);
  printf("Result of introToCS330(70): \n--------------------\n");
  introToCS330(70);
  printf("Result of introToCS330(4): \n--------------------\n");
  introToCS330(4);
  printf("Result of introToCS330(17): \n--------------------\n");
  introToCS330(17);
  printf("\n");
  printf("Result of paintGallons(10,12,8): \n--------------------\n");
  printf("%i\n",paintGallons(10,12,8));
  printf("\n");
  printf("Result of grader(72,88,22): \n--------------------\n");
  grader(72,88,22);
  printf("Result of grader(66,100,24): \n--------------------\n");
  grader(66,100,24);
  printf("Result of grader(100,90,18): \n--------------------\n");
  grader(100,90,18);
  printf("\n");
  printf("Result of printHello(3): \n--------------------\n");
  printHello(3);
  printf("Result of printHello(7): \n--------------------\n");
  printHello(7);
  printf("Result of printHello(10): \n--------------------\n");
  printHello(10);
  printf("Result of printHello(1): \n--------------------\n");
  printHello(1);
  printf("\n");
  printf("DUMMY TEST FOR MAKEFILE");
}

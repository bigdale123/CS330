#include <stdio.h>

void insertionSort(int *array, size_t size){
  // insertionSort(int *array,size_t size): Given an integer array pointer and
  //    the array's size, use the insertion sort algorithm to sort the array.
  // Input: A pointer to an integer array, and a integer representing the length of the array.
  // Output: Nothing returned, all changes made to array passed into the function.
  //
  // Note: We have to give the length of the array to the function, since according to
  //   a stackoverflow thread arrays passed into functions degrade into just a pointer,
  //   So there would be no way to find the length of the array inside the function.
  //   https://stackoverflow.com/questions/37538/how-do-i-determine-the-size-of-my-array-in-c
  int j = 0;
  for(int i = 1;i<size;i++){
    int key = *(array+i);
    j = i-1;
    while(j>=0 && key<*(array+j)){
      *(array+j+1) = *(array+j);
      j -= 1;
    }
    *(array+j+1) = key;
  }

}

void selectionSort(int *itemsList, size_t size){
  // selectionSort(int *array,size_t size): Given an integer array pointer and
  //    the array's size, use the selection sort algorithm to sort the array.
  // Input: A pointer to an integer array, and a integer representing the length of the array.
  // Output: Nothing returned, all changes made to array passed into the function.
  int minValueIndex = 0;
  int temp = 0;
  for(int i = 0;i<size-1;i++){
     minValueIndex = i;
     for(int j = i+1;j<size;j++){ // Check to see if minValueIndex is actually the minimum value
       if(*(itemsList+j) < *(itemsList+minValueIndex)){
         minValueIndex = j;
       }
     }
     if(minValueIndex != i){ // if new minValue: swap values
       temp = *(itemsList+i);
       *(itemsList+i) = *(itemsList+minValueIndex);
       *(itemsList+minValueIndex) = temp;
     }
  }
}

void main(){
  int arr[10]={22,14,18,3,0,31,56,64,72,100};
  insertionSort(arr,10);
  for(int i = 0;i<10;i++){
    printf("%i ",*(arr+i));
  }
  printf("\n");
  int arr1[10]={81,76,34,25,63,87,9,103,100000,5};
  selectionSort(arr1,10);
  for(int i = 0;i<10;i++){
    printf("%i ",*(arr1+i));
  }
  printf("\n");
}

// Simple buffer overflow program for testing dtrace scripts

#include<stdlib.h>
#include<stdio.h>

int otherFunction() {
    printf("The goal is to call %d me!\n", 1);
    return 0;
}

int main() {
    char buffer[64];
    printf("Buffer location is: %p\n", buffer);
    gets(buffer);
    // this function is silly
    printf("The buffer is:\n%s\n", buffer);
    return 0;
}


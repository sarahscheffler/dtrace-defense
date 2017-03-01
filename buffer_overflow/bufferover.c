// Simple buffer overflow program for testing dtrace scripts
// Fills a 64-character buffer with non-boundary-checked data from stdin

#include<stdlib.h>
#include<stdio.h>

int main() {
    char buffer[64];
    printf("Buffer location is: %p\n", buffer);
    gets(buffer);
    return 0;
}


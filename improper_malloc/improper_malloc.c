// This program allocates 1.5MB of memory and then frees it.

#include<stdlib.h>
#include<stdio.h>

int main() {
    char* buffer;
    buffer = malloc(150000);
    free(buffer);
    return 0;
}


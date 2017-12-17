#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(){
    unsigned int i;
    unsigned char *ptr[MAXMALLOC];

    ptr[0] = (unsigned char*) malloc(MALLOCSIZE);

    if(ptr[0]==NULL){
        perror("malloc error");
        exit(EXIT_FAILURE);
    }

    for(i=1; i<MAXMALLOC; i++){

        ptr[i] = (unsigned char*) malloc(MALLOCSIZE);

        if(ptr[i]==NULL){
            perror("malloc error");
            exit(EXIT_FAILURE);
        }

        memcpy(ptr[i], ptr[0], MALLOCSIZE);
    }
    return EXIT_SUCCESS;
}

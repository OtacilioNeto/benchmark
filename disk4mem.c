#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char **argv){
    unsigned int i;
    int arquivo = open("mem4disk.DATA",  O_RDONLY);
    char *mem;

    if((mem = (char*) malloc(DATASIZE)) == NULL){
        perror("memory failure");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<NUMBERWRITE; i++){
        if(read(arquivo, mem, DATASIZE) != DATASIZE){
            perror("read failure");
            exit(EXIT_FAILURE);
        }
    }

    close(arquivo);
    return EXIT_SUCCESS;
}

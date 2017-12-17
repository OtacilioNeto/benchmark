#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char **argv){
    unsigned int i;
    ssize_t escritos;
    int arquivo = open("mem4disk.DATA",  O_WRONLY|O_CREAT|O_TRUNC, S_IRUSR|S_IWUSR);
    char *mem;

    if((mem = (char*) malloc(DATASIZE)) == NULL){
        perror("memory failure");
        exit(EXIT_FAILURE);
    }

    for(i=0; i<NUMBERWRITE; i++){
        escritos = write(arquivo, mem, DATASIZE);
        if(escritos == -1){
            perror("write failure");
            exit(EXIT_FAILURE);
        }else if(escritos != DATASIZE){
            fprintf(stderr, "write failure, maximum size reached?\n");
            exit(EXIT_FAILURE);
        }
    }

    close(arquivo);
    return EXIT_SUCCESS;
}

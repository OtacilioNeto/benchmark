#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(){
    pid_t child;
    unsigned int i;

    for(i=0; i<MAXFORK;i++){
        child = fork();
        if(child == -1){
            perror("fork error");
            exit(EXIT_FAILURE);
        }else if(child==0){
            // child enters here
            exit(EXIT_SUCCESS);
        }
    }

    while(i>0){
        wait(NULL);
        i--;
    }

    return EXIT_SUCCESS;
}

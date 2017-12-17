#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *thread(void *ptr)
{
    return NULL;
}

int main(){
    unsigned int i;
    pthread_t threads[MAXTHREADS];

    for(i=0; i<MAXTHREADS; i++){
        if(pthread_create(&threads[i], NULL, thread, NULL)){
            perror("pthread_create error");
            exit(EXIT_FAILURE);
        }
    }


    for(i=0; i<MAXTHREADS;i++){
        if(pthread_join(threads[i], NULL)) {
            perror("pthread_join error");
            exit(EXIT_FAILURE);
        }
    }

    return EXIT_SUCCESS;
}


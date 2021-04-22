#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

typedef struct thread_data {
    int a;
    int result;

} thread_data;

int cmpfunc(const void *a, const void *b) {
    thread_data *valA = (thread_data *)a;
    thread_data *valB = (thread_data *)b;
    return (valA->a - valB->a);
}

void *factorial(void *arg) {
    thread_data *tdata = (thread_data *)arg;
    int a = tdata->a;

    int temp = 1;
    for (int i = 1; i <= a; i++) {
        temp *= i;
        sleep(1);
    }

    int result = temp;

    tdata->result = temp;
    pthread_exit(NULL);
}

int main() {
    int total;
    scanf("%d", &total);

    pthread_t tid[total];
    thread_data tdata[total];

    // Fill the array of struct
    for (int i = 0; i < total; i++) {
        scanf("%d", &tdata[i].a);
    }

    qsort(tdata, total, sizeof(thread_data), cmpfunc);

    for (int i = 0; i < total; i++) {
        int iret;
        // Create thread
        iret = pthread_create(&tid[i], NULL, factorial, (void *)&tdata[i]);

        if (iret) {
            fprintf(stderr, "Error - pthread_create() return code: %d\n", iret);
            exit(EXIT_FAILURE);
        }
    }

    // Join thread so it wait for all of the thread to finish
    for (int i = 0; i < total; i++) {
        pthread_join(tid[i], NULL);
    }

    // Once finish then do all the work
    for (int i = 0; i < total; i++) {
        printf("%d! : %d\n", tdata[i].a, tdata[i].result);
    }

    return 0;
}
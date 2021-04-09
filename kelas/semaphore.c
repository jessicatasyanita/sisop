#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdatomic.h>
#include <assert.h>

#define PING "ping"
#define PONG "pong"

void critical(const char * str) {
	size_t len = strlen(str);
	for (size_t i = 0; i < len; ++i) {
		printf("%c", str[i]);
	} // for
	printf("\n");
} // str

typedef volatile struct {
	volatile atomic_int val;
	volatile atomic_flag mut;
} mysem_t;
mysem_t sem;

#define acquire(m) while (atomic_flag_test_and_set(m))
#define release(m) atomic_flag_clear(m)

void delay(int number_of_seconds)
{
    // Converting time into milli_seconds
    int milli_seconds = 1000 * number_of_seconds;
  
    // Storing start time
    clock_t start_time = clock();
  
    // looping till required time is not achieved
    while (clock() < start_time + milli_seconds)
        ;
}

int wait(mysem_t * s) {
	acquire(&s->mut);
//	printf("wait a = %d\n", atomic_load(&s->val));
	while (atomic_load(&s->val) <= 0);
	atomic_fetch_sub(&s->val, 1);
//	printf("wait b = %d\n", atomic_load(&s->val));
	release(&s->mut);
	return 0;
} // wait

int signal(mysem_t * s) {
//	printf("signal = 1\n"); 
	return atomic_fetch_add(&s->val, 1);
} // signal

void * pingpong(void * p) {
	char * msg = (char *) p;
	for (;;) {
		int flag = (int) sem.val;
		wait(&sem);
		printf("Flag = %d\n", flag);
		critical(msg);
		flag = (int) sem.val;
		delay(100);
		signal(&sem);
		printf("Flag = %d\n", flag);
	} // for
} // pingpong

int main() {
	setvbuf(stdout, NULL, _IONBF, 0);
	assert(ATOMIC_INT_LOCK_FREE == 2);
	atomic_init(&sem.val, 1);
	pthread_t ping;
	pthread_t pong;
	pthread_create(&ping, NULL, pingpong, PING);
	pthread_create(&pong, NULL, pingpong, PONG);
	for(;;);
	return 0;
} // main

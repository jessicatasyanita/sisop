#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(){
  pid_t child_id;

  child_id = fork();

  printf("Ini akan kepanggil 2 kali\n");

  if(child_id != 0){
    printf("\nParent process.\nPID: %d, Child's PID: %d\n", (int)getpid(), (int)child_id);
  }else {
    printf("\nChild process.\nPID: %d, Parent's PID: %d\n", (int)getpid(), (int)getppid());
  }

  return 0;
}

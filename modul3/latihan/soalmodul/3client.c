#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080

int main(int argc, char const *argv[]) {
  struct sockaddr_in address;
  int sock = 0, valread;
  struct sockaddr_in serv_addr;
  char *hello = "Hello from client";
  char buffer[1024] = {0};
  if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
    printf("\n Socket creation error \n");
    return -1;
  }

  memset(&serv_addr, '0', sizeof(serv_addr));

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(PORT);

  if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
    printf("\nInvalid address/ Address not supported \n");
    return -1;
  }

  if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
    printf("\nConnection Failed \n");
    return -1;
  }

  while (1) {
    char messageC[120];
    printf("\n=====\nEnter your message\n> ");
    scanf("%s", messageC);

    printf("---%s\n", messageC);
    send(sock, messageC, strlen(messageC), 0);

    printf("--%s\n", messageC);
    char buffer[1024] = {0};
    valread = read(sock, buffer, 1024);
    printf("%s\n", buffer);

    printf("strip-%s\n", messageC);
    if (strcmp(messageC, "stop") == 0) {
      puts("hi im break\n");
      return 0;
    }
  }

  return 0;
}

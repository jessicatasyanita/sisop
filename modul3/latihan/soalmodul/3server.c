#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080

int main(int argc, char const *argv[]) {
  int server_fd, new_socket, valread;
  struct sockaddr_in address;
  int opt = 1;
  int addrlen = sizeof(address);
  char *hello = "Hello from server";

  printf("running on port %d\n", PORT);

  if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
    perror("socket failed");
    exit(EXIT_FAILURE);
  }

  // ?  INI CODE ASLI, di mac SO_REUSEPORT harus diapus
  // if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt,
  //                sizeof(opt))) {

  if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt,
                 sizeof(opt))) {
    perror("setsockopt");
    exit(EXIT_FAILURE);
  }

  address.sin_family = AF_INET;
  address.sin_addr.s_addr = INADDR_ANY;
  address.sin_port = htons(PORT);

  if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
    perror("bind failed");
    exit(EXIT_FAILURE);
  }

  if (listen(server_fd, 3) < 0) {
    perror("listen");
    exit(EXIT_FAILURE);
  }

  if ((new_socket = accept(server_fd, (struct sockaddr *)&address,
                           (socklen_t *)&addrlen)) < 0) {
    perror("accept");
    exit(EXIT_FAILURE);
  }

  int cumulative = 5;

  while (1) {
    char buffer[1024] = {0};
    valread = read(new_socket, buffer, 1024);
    printf("%s\n", buffer);

    if (strcmp(buffer, "tambah") == 0) {
      cumulative++;
      char *message = "Penambahan berhasil\n";
      send(new_socket, message, strlen(message), 0);
    } else if (strcmp(buffer, "kurang") == 0) {
      cumulative--;
      char *message = "Pengurangan berhasil\n";
      send(new_socket, message, strlen(message), 0);
    } else if (strcmp(buffer, "cek") == 0) {
      char message[100];
      sprintf(message, "Cumulative: %d", cumulative);
      send(new_socket, message, strlen(message), 0);
    } else if (strcmp(buffer, "stop") == 0) {
      char *message = "Shutting down..\n";
      send(new_socket, message, strlen(message), 0);
      break;
    } else {
      char *message = "Command not found..\n";
      send(new_socket, message, strlen(message), 0);
    }
  }

  return 0;
}
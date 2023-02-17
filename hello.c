#include <cstdio>
#include <chrono>
#include <thread>

int main(int argc, char **argv) {
  while (true) {
    printf("Hello, sir!\n");
    std::this_thread::sleep_for(std::chrono::seconds(5));
  }
  return 0;
}
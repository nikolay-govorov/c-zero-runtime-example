#include "calls.h"

static const char dunno[] = "I don't know how to greet you\n";
static const char hello[] = "Hello, dear "; // Hello, Dear %s

unsigned int strlen(const char *s) {
  int result = 0;

  while(s[result])
    result++;

  return result;
}

int main(int argc, char** argv) {
  if (argc < 2) {
    sys_write(1, dunno, sizeof(dunno) - 1);
    return 1;
  }

  sys_write(1, hello, sizeof(hello) - 1);
  sys_write(1, argv[1], strlen(argv[1]));
  sys_write(1, "\n", 1);

  return 0;
}


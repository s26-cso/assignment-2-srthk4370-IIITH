#include <stdio.h>
#include <dlfcn.h>
#include <string.h>
typedef int (*fptr)(int, int);
int main()
{
    char op[6];
    int a,b;
    scanf("%s", op);
    scanf("%d %d", &a, &b);
    char lib[20] = "./lib";
    strcat(lib, op);
    strcat(lib, ".so");
    void* handle = dlopen(lib, RTLD_LAZY);
    fptr func = dlsym(handle, op);
    int result = func(a, b);
    printf("%d\n", result);
}
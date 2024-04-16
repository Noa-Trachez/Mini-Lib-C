//
// Created by Noa Trachez on 16/04/2024.
//

#include <unistd.h>
#include <dlfcn.h>
#include <stdio.h>
#include <string.h>

void init(void);
int (*my_strcasecmp)(const char *str1, const char *str2);
char *(*my_strrchr)(const char *str, int c);
size_t (*my_strlen)(const char *str);
char *(*my_strpbrk)(const char *str, const char *accept);
char *(*my_strstr)(const char *haystack, const char *needle);
char *(*my_index)(const char *str, int c);
char *(*my_strchr)(const char *str, int c);
size_t (*my_strcspn)(const char *str, const char *reject);
char *(*my_rindex)(const char *str, int c);
void *(*my_memcpy)(void *dest, const void *strrc, size_t n);
int (*my_strcmp)(const char *str1, const char *str2);
void *(*my_memset)(void *str, int c, size_t n);
void *(*my_memmove)(void *dest, const void *strrc, size_t n);
int (*my_strncmp)(const char *str1, const char *str2, size_t n);

void init(void)
{
    void	*handle;

    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle)
        write(2, "./libasm.so: Not found\n", 23);
    else {
        my_strcasecmp = dlsym(handle, "strcasecmp");
        my_strrchr = dlsym(handle, "strrchr");
        my_strlen = dlsym(handle, "strlen");
        my_strpbrk = dlsym(handle, "strpbrk");
        my_strstr = dlsym(handle, "strstr");
        my_index = dlsym(handle, "index");
        my_strchr = dlsym(handle, "strchr");
        my_strcspn = dlsym(handle, "strcspn");
        my_rindex = dlsym(handle, "rindex");
        my_memcpy = dlsym(handle, "memcpy");
        my_strcmp = dlsym(handle, "strcmp");
        my_memset = dlsym(handle, "memset");
        my_memmove = dlsym(handle, "memmove");
        my_strncmp = dlsym(handle, "strncmp");
    }
}

void test_strcasecmp()
{
    printf("Got:\n");
    printf("%d\n", strcasecmp("Hello World!", "Hello World!"));
    printf("%d\n", strcasecmp("HELLO WORLD!", "Hello World!"));
    printf("%d\n", strcasecmp("HELLO WORLD !", "Hello World!"));
    printf("Expected:\n");
    printf("%d\n", my_strcasecmp("Hello World!", "Hello World!"));
    printf("%d\n", my_strcasecmp("HELLO WORLD!", "Hello World!"));
    printf("%d\n", my_strcasecmp("HELLO WORLD !", "Hello World!"));
}

void test_strrchr()
{
    char *test = strdup("Hello World!");
    printf("Got:\n");
    printf("%s\n", strrchr(test, 'W'));
    printf("%s\n", strrchr(test, 'o'));
    printf("Expected:\n");
    printf("%s\n", my_strrchr(test, 'W'));
    printf("%s\n", my_strrchr(test, 'o'));
}


int main()
{
    init();

    //strcasecmp
    test_strcasecmp();
    //strrchr
    test_strrchr();
    //strlen
    //strpbrk
    //strstr
    //index
    //strchr
    //strcspn
    //rindex
    //memcpy
    //strcmp
    //memset
    //memmove
    //strncmp


    return 0;
}
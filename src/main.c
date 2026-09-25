#include <stdio.h>
#include <stdlib.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char buffer[100] = "Hello";
    printf("Length of 'Hello': %d\n", mystrlen(buffer));

    mystrcat(buffer, ", World!");
    printf("After mystrcat: %s\n", buffer);

    char copy_buf[100];
    mystrcpy(copy_buf, buffer);
    printf("After mystrcpy: %s\n", copy_buf);

    char ncopy_buf[100];
    mystrncpy(ncopy_buf, buffer, 5);
    ncopy_buf[5] = '\0';
    printf("After mystrncpy (5 chars): %s\n", ncopy_buf);

    printf("\n--- Testing File Functions ---\n");
    FILE* test_file = fopen("sample.txt", "w+");
    if (test_file) {
        fputs("Operating Systems Assignment 1\nLearning Makefile and Libraries\nC Programming is powerful\n", test_file);
        fflush(test_file);

        int lines = 0, words = 0, chars = 0;
        if (wordCount(test_file, &lines, &words, &chars) == 0) {
            printf("WordCount -> Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
        }

        char** matches = NULL;
        int match_count = mygrep(test_file, "Library", &matches);
        printf("Grep matches for 'Library': %d\n", match_count);
        for (int i = 0; i < match_count; i++) {
            printf("  Match %d: %s", i + 1, matches[i]);
            free(matches[i]);
        }
        free(matches);

        fclose(test_file);
        remove("sample.txt");
    }

    return 0;
}

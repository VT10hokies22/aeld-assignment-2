#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <syslog.h>

// Run this via inputs from the terminal
// gcc writer.c -o testwriter Compile c into an output file.
// Then run ./testwriter /home/ben/gitfold/aeld-assignment-1/finder-app/testing.txt "Hello World" to create a file called test.txt and write "Hello World" into it.

int main(int argc, char *argv[])
{
    if (argc != 3){
        printf("Need to have 2 arguments that you run from the command line after calling the script\nYou have %d arguments\n", argc - 1);
        return 1;
    }

    // Creating variables from the inputs 
    char *writefile = argv[1];
    char *writestr = argv[2];

    // Creates log config
    openlog("writer.c",0,LOG_USER);

    // Create pointer to file address and open file and write and close it
    FILE *writefileptr;
    writefileptr = fopen(writefile, "w");
    fprintf(writefileptr, "%s\n", writestr);
    fclose(writefileptr);

    // Either log error if file could be opened or log debug if file was opened and written to successfully
    if (writefileptr == NULL){
        syslog(LOG_ERR, "Error writing %s to %s", writestr, writefile);
    }
    else {
        syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    }

    //printf("Test that finder-test is running through here");
    return 0;
}


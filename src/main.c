#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>


void listInstallations() {
	char* dirName = "/usr/local/Morpheus/installed";
	DIR* directory;
	struct dirent* dir;
	directory = opendir(dirName);
	if (directory) {
		int counter = 0; // for counting the number of files
		while ((dir = readdir(directory)) != NULL) {
			if (dir->d_type == DT_DIR) {
				counter++;
			}
		}
		counter -= 2; // decrement counter twice so as not to include '.' and '..'
		if (!counter) {
			printf("You have no morpheus installations at the moment.\n");
			return;
		}
		printf("\033[1mFound %d installation\033[0m\n", counter);
		rewinddir(directory);
		while ((dir = readdir(directory)) != NULL) {
			char* installedSoftware = dir->d_name;
			if (strcmp(installedSoftware, ".") == 0) continue;
			if (strcmp(installedSoftware, "..") == 0) continue;
			if (dir->d_type == DT_DIR) {
				printf("%s\n", installedSoftware);
			}
		}
		closedir(directory);
	}

}




int main(int argc, char* argv[]) {
	if (argc == 1) {
		printf("Well hello there! I'm Morpheus!\n");		
		return 0;
	}
	if (strcmp(argv[1], "list") == 0) listInstallations();

	return 0;
	
		
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>



void update() {
	system("/bin/bash /usr/local/Morpheus/scripts/update.sh");
}


void listInstallations() {
	char* dirName = "/usr/local/Matrix";
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


void morpheusBasic() {
	printf("Welcome to the Matrix, Neo"\n);
}

int main(int argc, char* argv[]) {
	if (argc == 1) {
		morpheusBasic();
		return 0;
	}

	char* command = argv[1];

	if (strcmp(command, "list") == 0) listInstallations();
	if (strcmp(command, "update") == 0) update();

	return 0;
	
		
}

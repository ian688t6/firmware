#include <stdio.h>
#include "db.h"
#include "basic.h"

int main(int argc, char**argv)
{
	printf("app main...\n");
	db_init();
	basic_init();
	return 0;
}

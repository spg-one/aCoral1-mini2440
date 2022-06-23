#ifndef SHELL_H
#define SHELL_H
typedef struct acoral_shell_cmd_t acoral_shell_cmd_t;
struct acoral_shell_cmd_t{
	acoral_char *name;
	void (*exe)(int argc,const acoral_char **);
	acoral_char *comment;
	acoral_shell_cmd_t *next;
};
void add_command(acoral_shell_cmd_t *cmd);
void acoral_shell_enter(void *args);
void acoral_shell_exit(void *ptr);
#endif

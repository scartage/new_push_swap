NAME	= push_swap
CC	= cc
CFLAGS	= -g -Wall -Werror -Wextra
RM	= rm -f
RMDIR	= rm -rf

# ---- Directorios ---- #
SRC_DIR	  = srcs
OBJ_DIR  = obj
LIBFT_DIR = libft

# ---- Includes ---- #
INCLUDES = -I$(SRC_DIR) -I$(LIBFT_DIR)
LIBFT	 = $(LIBFT_DIR)/libft.a

# ---- Fuentes obligatorias ---- #
SRCS	= $(SRC_DIR)/main.c
OBJS	= $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

vpath %.c srcs
.SECONDEXPANSION:

$(OBJ_DIR)/%.o:  %.c $(INCLUDES) Makefile
	$(CC) $(CFLAGS) -c $< -o $@

all: make_lib	make_dir $(NAME)

make_lib:
	make -C libft

make_dir:
	@mkdir -p $(OBJ_DIR)

clean:
	make clean -C libft

fclean: clean
	make fclean -C libft
	$(RM) $(NAME)
	$(RMDIR) $(OBJ_DIR)

re: fclean all

.PHONY: all clean fclean re

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/19 16:01:12 by marvin            #+#    #+#              #
#    Updated: 2024/03/19 16:01:12 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR		= src
BUILD_DIR	= build
BUILD_DIR_OBJ = build/obj
NAME		= program
CFLAG		= -Wall -Wextra -Werror -g3 -gdwarf-4
LDFLAGS 	= 
SRC_FILE	= $(wildcard $(SRC_DIR)/*.c)

OBJ			= $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR_OBJ)/%.o, $(SRC_FILE))
CC			= cc

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC)	$(CFLAG) -c	$< -o $@
	@clear

$(BUILD_DIR_OBJ)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@$(CC)	$(CFLAG) -c	$< -o $@
	@clear

all : $(NAME)

$(NAME): $(OBJ) 
	@$(CC) $(OBJ) -o $(BUILD_DIR)/$(NAME) $(CFLAG) $(LDFLAGS)
	@clear
	./$(BUILD_DIR)/$(NAME)

clear :
	@echo "42Paris : $(NAME)"
	@echo ""

clean : clear
	@rm -rf build/
	@echo "Clean   : *.o in build !"

fclean : clean
	@rm -f $(NAME)
	@echo "Clean   : ./$(NAME)"

aclean : fclean cleanlib clear

minlibx :
	@git clone https://github.com/42Paris/minilibx-linux.git
	@make -C ./minilibx-linux
	
cleanlib :
	@rm -rf minilibx-linux

re: fclean all clear 

.PHONY: all clean fclean re
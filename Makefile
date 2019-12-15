TARGET ?= ./build/MazeSolver
SRC_DIR ?= ./src
INC_DIR ?= ./include

SRCS := $(shell find $(SRC_DIR) -name *.cpp)
OBJS := $(SRCS:.cpp=.o)

CC := g++

INC_FLAG := $(addprefix -I,$(INC_DIR))
CPPFLAG ?= $(INC_FLAG) -MMD -MP

# all: ./src/searches/DFS.o
# 	echo hello

# $(SRC_DIR)/%.o: $(SRC_DIR)/%.cpp $(INC_DIR)/%.hpp
# 	echo $^

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(notdir $(OBJS)) -o $@ $(LOADLIBES) $(LDLIBS)
	make clean

%main.o: %main.cpp
	$(CC) -c $^ $(INC_FLAG)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.cpp $(INC_DIR)/%.hpp
	echo $(INC_FLAG)
	$(CC) -c $^ $(INC_FLAG) 

.PHONY: clean

clean:
	find . -name '*.o' -delete -or -name '*.gch' -delete

-include $(DEPS)

# CC = g++
# FLAGS = -c
# PATH = ./include

# STRUCTURE = MazeMap Tiles
# SEARCHES = DFS

# all: main

# main: src/main.o $(foreach struct,$(STRUCTURE),structure/${struct}.o) $(foreach search,$(SEARCHES),structure/${search}.o)
# 	rm -f build/MazeSolver
# 	${CC} -o build/MazeSolver $^ -I${PATH}
# 	make clean

# %.o: src/%.cpp include/%.hpp
# 	${CC} ${FLAGS} $^ -I${PATH}

# src/main.o: src/main.cpp
# 	${CC} ${FLAGS} src/main.cpp -I${PATH}

# clean:
# 	find . -type f -name '*.gch' -delete
# 	find . -type f -name '*.o' -delete

# main.o: src/main.cpp
# 	${CC} ${FLAGS} src/main.cpp -I${SEARCH}

# DFS.o: src/DFS.cpp include/DFS.hpp
# 	${CC} ${FLAGS} src/DFS.cpp include/DFS.hpp -I${SEARCH}

# MazeMap.o: src/MazeMap.cpp include/MazeMap.hpp
# 	${CC} ${FLAGS} src/MazeMap.cpp include/MazeMap.hpp -I${SEARCH}

# Tiles.o: src/Tiles.cpp include/Tiles.hpp
# 	${CC} ${FLAGS} src/Tiles.cpp include/Tiles.hpp -I${SEARCH}

# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

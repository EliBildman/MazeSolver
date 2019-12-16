//
//  main.cpp
//  MazeSolver
//
//  Created by Eli Bildman on 8/9/19.
//  Copyright © 2019 Eli Bildman. All rights reserved.
//

#include "structure/MazeMap.hpp"
#include "searches/DFS.hpp"
#include <iostream>
#include <fstream>

bool * convert(int len, const char ** bitmap) {
    bool * map = (bool *) calloc((sizeof(bool)), len);
    for(int i = 0; i < len; i++) {
        map[i] = (bitmap[i][0] == '1');
    }
    return map;
}

int main(int argc, const char * argv[]) {
    
    if(argc < 2) {
        std::cout << "Usage: MazeSolver [algorithm] [maze]" << std::endl;
        return 1;
    }

    MazeMap *x = new MazeMap(convert(argc - 2, argv + 2), argc - 2);

    Solution solution;
    
    if(strcmp(argv[1], "DFS") == 0) {
        solution = depthFirstSearch(x);
    } else {
        std::cout << "Usage: MazeSolver [algorithm] [maze]" << std::endl << "Available algorithms: Deapth First Search (DFS)" << std::endl;
        return 1;
    }

    if(solNeg(solution)) {
        std::cout << "No Solution" << std::endl;
        return 1;
    }

    printSol(solution);
    
    return 0;
}


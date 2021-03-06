# Open Space Program

Open source space simulator

Written in C++ with SDL2, GLM, ImGui, Bullet physics, AssImp.

Code licence: GPL 3
Content licence: CC-BY-SA 3.0

Some textures are originally from Pioneer space sim: https://github.com/pioneerspacesim/pioneer

<img src="https://i.imgur.com/HM02Gd7.png"/>
<img src="https://i.imgur.com/eKhFz34.png"/>
<img src="https://i.imgur.com/1xzE4Fo.png"/>

## building on Ubuntu 16.04

    sudo apt-get install g++ libsdl2-dev libsdl2-image-dev libglm-dev libassimp-dev libglew-dev --no-install-recommends
    git clone https://github.com/dvolk/openspaceprogram
    cd openspaceprogram
    mkdir obj/ middleware/
    cd middleware
    git clone https://github.com/bulletphysics/bullet3
    cd bullet3
    mkdir build
    cd build
    cmake -DUSE_DOUBLE_PRECISION=ON ..
    make
    cd ..
    ln -s src bullet
    cd ..
    git clone https://github.com/ocornut/imgui
    cd imgui/examples/sdl_opengl3_example/
    sed -i -- 's/#include <GL\/gl3w.h>/#include <GL\/glew.h>/g' imgui_impl_sdl_gl3.cpp
    c++ `sdl2-config --cflags` -I ../.. -c ../../imgui.cpp `sdl2-config --libs`
    c++ `sdl2-config --cflags` -I ../.. -c ../../imgui_draw.cpp `sdl2-config --libs`
    c++ `sdl2-config --cflags` -I ../.. -c imgui_impl_sdl_gl3.cpp  `sdl2-config --libs` -lGL -lGLEW
    
finally

    make
    
run with

    ./osp


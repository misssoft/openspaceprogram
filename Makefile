CC=gcc
CXX=g++
RM=rm -f
#SANITIZE=-g3 -fsanitize=address -fsanitize=leak -fsanitize=undefined
CPPFLAGS=-Wall -Wextra -Wpedantic -std=c++11 $(SANITIZE) -I/usr/local/include/bullet -I/usr/include/freetype2 -I/usr/include/SDL2
LDFLAGS=$(CPPFLAGS)
LDLIBS=-lSDL2 -lGLEW -lGL -lBulletSoftBody -lBulletDynamics -lBulletCollision -lLinearMath

SRCS=body.cpp  display.cpp  gldebug.cpp  main.cpp  mesh.cpp  obj_loader.cpp  physics.cpp  shader.cpp  shader_utils.cpp  stb_image.cpp  texture.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

# imgui: https://github.com/ocornut/imgui

# compile with:
# g++ -fPIC -c $imgui.cpp -o $imgui.o

# edit these paths:
IMGUI_OBJS=imgui_impl_sdl/imgui_impl_sdl.o ../../lib/imgui/imgui.o ../../lib/imgui/imgui_draw.o


all: tool

tool: $(OBJS)
	$(CXX) $(LDFLAGS) $(IMGUI_OBJS) -o oglplay $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	rm -f ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS)

dist-clean: clean
	$(RM) *~ .depend

include .depend
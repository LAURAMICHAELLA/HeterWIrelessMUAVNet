# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/doutorado/HetMUAVNet

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/doutorado/HetMUAVNet

# Include any dependencies generated for this target.
include src/mavmix/CMakeFiles/mavmix.dir/depend.make

# Include the progress variables for this target.
include src/mavmix/CMakeFiles/mavmix.dir/progress.make

# Include the compile flags for this target's objects.
include src/mavmix/CMakeFiles/mavmix.dir/flags.make

src/mavmix/CMakeFiles/mavmix.dir/main.cpp.o: src/mavmix/CMakeFiles/mavmix.dir/flags.make
src/mavmix/CMakeFiles/mavmix.dir/main.cpp.o: src/mavmix/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/mavmix/CMakeFiles/mavmix.dir/main.cpp.o"
	cd /home/doutorado/HetMUAVNet/src/mavmix && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mavmix.dir/main.cpp.o -c /home/doutorado/HetMUAVNet/src/mavmix/main.cpp

src/mavmix/CMakeFiles/mavmix.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mavmix.dir/main.cpp.i"
	cd /home/doutorado/HetMUAVNet/src/mavmix && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/doutorado/HetMUAVNet/src/mavmix/main.cpp > CMakeFiles/mavmix.dir/main.cpp.i

src/mavmix/CMakeFiles/mavmix.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mavmix.dir/main.cpp.s"
	cd /home/doutorado/HetMUAVNet/src/mavmix && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/doutorado/HetMUAVNet/src/mavmix/main.cpp -o CMakeFiles/mavmix.dir/main.cpp.s

# Object files for target mavmix
mavmix_OBJECTS = \
"CMakeFiles/mavmix.dir/main.cpp.o"

# External object files for target mavmix
mavmix_EXTERNAL_OBJECTS =

src/mavmix/mavmix: src/mavmix/CMakeFiles/mavmix.dir/main.cpp.o
src/mavmix/mavmix: src/mavmix/CMakeFiles/mavmix.dir/build.make
src/mavmix/mavmix: src/libs/liblibs.a
src/mavmix/mavmix: src/mavmix/CMakeFiles/mavmix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/doutorado/HetMUAVNet/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable mavmix"
	cd /home/doutorado/HetMUAVNet/src/mavmix && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mavmix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/mavmix/CMakeFiles/mavmix.dir/build: src/mavmix/mavmix

.PHONY : src/mavmix/CMakeFiles/mavmix.dir/build

src/mavmix/CMakeFiles/mavmix.dir/clean:
	cd /home/doutorado/HetMUAVNet/src/mavmix && $(CMAKE_COMMAND) -P CMakeFiles/mavmix.dir/cmake_clean.cmake
.PHONY : src/mavmix/CMakeFiles/mavmix.dir/clean

src/mavmix/CMakeFiles/mavmix.dir/depend:
	cd /home/doutorado/HetMUAVNet && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/mavmix /home/doutorado/HetMUAVNet /home/doutorado/HetMUAVNet/src/mavmix /home/doutorado/HetMUAVNet/src/mavmix/CMakeFiles/mavmix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mavmix/CMakeFiles/mavmix.dir/depend


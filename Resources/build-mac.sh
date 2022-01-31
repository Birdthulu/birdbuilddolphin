#!/bin/bash -e
# build-mac.sh

CMAKE_FLAGS=''

DATA_SYS_PATH="./Data/Sys/"
BINARY_PATH="./build/Binaries/Dolphin.app/Contents/Resources/"

# Move into the build directory, run CMake, and compile the project
mv -f -v /home/runner/work/birdbuilddolphin/birdbuilddolphin/Ishiiruka/* /home/runner/work/birdbuilddolphin/birdbuilddolphin/
mkdir -p build
pushd build
cmake ${CMAKE_FLAGS} ..
#Copy wx folder to Source/Core/
cp -R /Users/runner/work/birdbuilddolphin/birdbuilddolphin/Externals/wxWidgets3/include/wx /Users/runner/work/birdbuilddolphin/birdbuilddolphin/build/Source/Core/
cp -R /Users/runner/work/birdbuilddolphin/birdbuilddolphin/Externals/wxWidgets3/wx/* /Users/runner/work/birdbuilddolphin/birdbuilddolphin/build/Source/Core/wx/
make -j7
popd

# Copy the Sys folder in
echo "Copying Sys files into the bundle"
cp -Rfn "${DATA_SYS_PATH}" "${BINARY_PATH}"

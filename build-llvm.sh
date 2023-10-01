#!/bin/bash
set -eo pipefail
shopt -s inherit_errexit

repo_base=$1
git -C ./llvm-project apply $repo_base/llvm.patch

mkdir -p llvm-build
cd llvm-build
cmake ../llvm-project/llvm -DCMAKE_BUILD_TYPE=Release -G Ninja \
        -DLLVM_FORCE_ENABLE_STATS=ON \
        -DLLVM_ENABLE_PROJECTS="clang;lld" \
        -DLLVM_TARGETS_TO_BUILD="X86;RISCV" 
cmake --build . -j
if [ $MODIFIED = 1 ] && [ -z $PRE_COMMIT_MODE ]
then
  #cmake --build . -j -t check-llvm-unit
  #cmake --build . -j -t check-llvm
  echo "Skip llvm tests"
else
  echo "Skip llvm tests"
fi

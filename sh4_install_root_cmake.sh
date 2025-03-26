# *************************************************************************** #
#                                                                             #
#                                                        :::      ::::::::    #
#    sh4_install_root_cmake.sh                         :+:      :+:    :+:    #
#                                                    +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>          +#+  +:+       +#+         #
#                                                +#+#+#+#+#+   +#+            #
#    Created: 2020/02/26 17:34:36 by chenxu           #+#    #+#              #
#    Updated: 2025/03/25 23:29:25 by chenxu          ###   ########.fr        #
#                                                                             #
# *************************************************************************** #

# FAIL: arrow for linux
# BUG: arrow -> remove buildin_cling -> root failed
# TODO: cuda for linux

if [[ "$(uname)" == "Darwin" ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib/postgresql@14/"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include/postgresql@14/"
  CMAKE_PARAMS="-Dcocoa=ON -DPOSTGRESQL_LIBRARY=/opt/homebrew/opt/postgresql@14/lib/postgresql@14/libpq.dylib -DPOSTGRESQL_INCLUDE_DIR=/opt/homebrew/opt/postgresql@14/include/"
else
  CMAKE_PARAMS="-GNinja -Dx11=ON -Darrow=ON -Dcuda=ON"
fi

cmake -DCMAKE_INSTALL_PREFIX="${HOME}/software/ROOT/install/" ../root ${CMAKE_PARAMS} \
  -DCMAKE_CXX_STANDARD=20 \
  -Dbuiltin_clang=ON \
  -Dbuiltin_cling=ON \
  -Dfftw3=ON \
  -Dxml=ON \
  -Dunfold=ON \
  -Dgviz=ON \
  -Dveccore=ON \
  -DGviz=ON \
  -Dfcgi=ON \
  -Darrow=ON \
  -Ddavix=ON \
  -DVc=ON \
  -Dminimal=ON \
  -Dmathmore=ON \

  # -Dfail-on-missing=ON \

# -Dmacos_native=OFF  # pcre bugs
# removed # -Dbuiltin_glew=ON
#	-Dbuildin_lz4=ON
#
#  CodeCov enabled on non-debug build!
# -DCODE_COVERAGE=ON \
# -DCPPINTEROP_ENABLE_DOXYGEN=ON \
# -DCPPINTEROP_ENABLE_SPHINX=ON \
#
# ROOT 6.35
# html removed
# mysql pgsql archived

# -Dminuit2_omp=ON \
# CMake Warning at cmake/modules/RootBuildOptions.cmake:409 (message):
# The option 'minuit2_omp' can only be used to minimise thread-safe functions
# in Minuit2.  It cannot be used for Histogram/Graph fitting and for RooFit.
# If you want to use Minuit2 with OpenMP or MPI support, it is better to
# build Minuit2 as a standalone library.

# DONE: c++23 not support yet
# TODO: remove OSX_SYSROOT
# FAIL: arrow for linux
# NOTFIXED: arrow -> remove buildin_cling -> root failed, remmoved
# TODO: cuda for linux
# BUG: `new TBrowser` -> builtin_gif=ON rootforum:t/issue-with-root-on-mac-sequoia-still/63435/9

if [[ "$(uname)" == "Darwin" ]]; then
  # export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib/postgresql@14/"
  # export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include/postgresql@14/"
  # CMAKE_PARAMS="-Dcocoa=ON -DPOSTGRESQL_LIBRARY=/opt/homebrew/opt/postgresql@14/lib/postgresql@14/libpq.dylib -DPOSTGRESQL_INCLUDE_DIR=/opt/homebrew/opt/postgresql@14/include/ -Dcuda=off"
  CMAKE_PARAMS="-Dcocoa=ON -Dcuda=off"
else
  CMAKE_PARAMS="-GNinja -Dx11=ON -Darrow=ON -Dcuda=ON"
fi

ANEWPATH=$(xcrun --sdk macosx --show-sdk-path)

  # -Dbuiltin_cling=ON \  # macos BUG: after upgrade macos
  # -Dbuiltin_gif=ON \
  # -Dminimal=ON \
  # -Dfcgi=ON \
cmake -DCMAKE_INSTALL_PREFIX="${HOME}/software/ROOT/install/" ../root ${CMAKE_PARAMS} \
  -DCMAKE_OSX_SYSROOT=${ANEWPATH} \
  -DCMAKE_CXX_STANDARD=17 \
  -Dbuiltin_clang=ON \
  -Dfftw3=ON \
  -Dxml=ON \
  -Dunfold=ON \
  -Dgviz=ON \
  -Dveccore=ON \
  -DGviz=ON \
  -Darrow=ON \
  -Ddavix=ON \
  -Dvc=ON \
  -Dmathmore=ON \
  -Dasimage=ON \
  -Dclad=ON \
  -Ddataframe=ON \
  -Dfitsio=ON \
  -Dgdml=ON \
  -Dgeom=ON \
  -Dhttp=ON \
  -Dimt=ON \
  -Dopengl=ON \
  -Dpyroot=ON \
  -Droofit=ON \
  -Droot7=ON \
  -Drpath=ON \
  -Dspectrum=ON \
  -Dsqlite=ON \
  -Dssl=ON \
  -Dtmva=ON \
  -Dtmva-cpu=ON \
  -Dtpython=ON \
  -Dvc=ON \
  -Dvdt=ON \
  -Dwebgui=ON \
  -Dxrootd=ON \

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

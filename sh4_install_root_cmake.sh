# *************************************************************************** #
#                                                                             #
#                                                        :::      ::::::::    #
#    sh4_install_root_cmake.sh                         :+:      :+:    :+:    #
#                                                    +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>          +#+  +:+       +#+         #
#                                                +#+#+#+#+#+   +#+            #
#    Created: 2020/02/26 17:34:36 by chenxu           #+#    #+#              #
#    Updated: 2025/01/26 17:35:08 by chenxu          ###   ########.fr        #
#                                                                             #
# *************************************************************************** #

# cspell:disable

if [[ "$(uname)" == "Darwin" ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@14/lib/postgresql@14/"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@14/include/postgresql@14/"
  CMAKE_PARAMS="-Dcocoa=ON -DPOSTGRESQL_LIBRARY=/opt/homebrew/opt/postgresql@14/lib/postgresql@14/libpq.dylib -DPOSTGRESQL_INCLUDE_DIR=/opt/homebrew/opt/postgresql@14/include/"
else
  CMAKE_PARAMS="-GNinja -Dx11=ON"
fi

cmake -DCMAKE_INSTALL_PREFIX="${HOME}/software/ROOT/install/" ../root \
  -DCMAKE_CXX_STANDARD=20 \
  -Dbuiltin_glew=ON \
  -Dmathmore=ON \
  -Droofit=ON \
  -Dmlp=ON \
  -Dsqlite=ON \
  -Dtmva=ON \
  -Dtmva-cpu=ON \
  -Dpyroot=ON \
  -Darrow=ON \
  -Dbuiltin_vdt=ON \
  -Dvdt=ON \
  -Dxrootd=ON \
  -Dbuiltin_xrootd=ON \
  -Dvc=ON \
  -Dbuiltin_vc=ON \
  -Dveccore=ON \
  -Dbuiltin_veccore=ON \
  -Dunfold=ON \
  -Dpgsql=ON \
  -Dfftw=ON \
  -Dfftw3=ON \
  -Dfitsio=ON \
  -Dgdml=ON \
  -DCxxmodules=ON \
  -Ddataframe=ON \
  -Dhtml=ON \
  -Dminimal=ON \
  -Dwebgui=ON \
  -Droot7=ON \
  -Dcocoa=ON \
  -Dmacos_naive=ON \
  -Dasimage=ON \
  -Dopengl=ON \
  -Drpath=ON \
  -Dxml=ON \
  -Dhttp=ON \
  -Dmysql=ON \
  -DCPP_STANDARD=20 \
  -DCXX_STANDARD_STRING=20 \
  ${CMAKE_PARAMS}


# removed # -Dbuiltin_glew=ON
#	-Dbuildin_lz4=ON

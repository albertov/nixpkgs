{ stdenv
, fetchFromGitHub
, qt5
, postgresql
, libxml2
, pkgconfig
}:
stdenv.mkDerivation rec {
  version = "2017-02-13";
  name = "pgmodeler-${version}";

  src = fetchFromGitHub {
    owner  = "pgmodeler";
    repo   = "pgmodeler";
    rev    = "db29de595eaf0e21f0a5d4bf76d64fca747e0255";
    sha256 = "0vf92d4crw5acfk8glqn2f34sfvgy19qp12hn8h8kzsam916s0aa";
  };

  buildInputs = [ qt5.qtbase qt5.qtsvg libxml2 postgresql ];
  nativeBuildInputs = [ qt5.qmakeHook pkgconfig ];
  qmakeFlags = ["pgmodeler.pro"];

  enableParallelBuilding = true;

  meta = {
    description = "Postgresql graphical modeling tool";
    homepage = http://www.pgmodeler.com.br;
    license = stdenv.lib.licenses.gpl3;
    platforms = with stdenv.lib.platforms; linux;
  };
}

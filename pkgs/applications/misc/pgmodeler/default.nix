{ stdenv
, fetchFromGitHub
, qt5
, postgresql
, libxml2
, pkgconfig
}:
stdenv.mkDerivation rec {
  version = "0.9.0-beta";
  name = "pgmodeler-${version}";

  src = fetchFromGitHub {
    owner  = "pgmodeler";
    repo   = "pgmodeler";
    rev    = "e92cbda61b05aafc3b2b51bff6edd99789db7c68";
    sha256 = "0njxry96d47kvpalyn96y5sx7r66dkfdw7fmblswg1akx2f3iazr";
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

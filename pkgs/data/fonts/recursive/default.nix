{ lib, fetchzip }:

let
  version = "1.077";
in
fetchzip {
  name = "recursive-${version}";

  url = "https://github.com/arrowtype/recursive/releases/download/v${version}/ArrowType-Recursive-${version}.zip";

  postFetch = ''
    mkdir -p $out/share/fonts/
    unzip -j $downloadedFile \*.otf -d $out/share/fonts/opentype
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  sha256 = "sha256-deztulQ33TIMevEQOP5OS8tmf6UjXT8IiVpRjkdismY=";

  meta = with lib; {
    homepage = "https://recursive.design/";
    description = "A variable font family for code & UI";
    license = licenses.ofl;
    maintainers = [ maintainers.eadwu ];
    platforms = platforms.all;
  };
}

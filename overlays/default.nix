let
  leftwm-overlay = final: prev: {
    leftwm = let rpathLibs = with prev.xorg; [ libXinerama libX11 ];
    in prev.leftwm.overrideAttrs (old: rec {
      postInstall = ''
        for p in $out/bin/left*; do
          patchelf --set-rpath "${prev.lib.makeLibraryPath rpathLibs}" $p
        done
      '';
    });
  };
in [ leftwm-overlay ]

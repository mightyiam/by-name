callPackage: path: let
  entries = builtins.readDir path;
  filenames = builtins.attrNames entries;

  maybeNameValuePair = filename:
    if entries.${filename} == "directory"
    then [
      {
        name = filename;
        value = callPackage (path + "/${filename}/package.nix") {};
      }
    ]
    else [];
  nameValuePairs = builtins.concatMap maybeNameValuePair filenames;
in
  builtins.listToAttrs nameValuePairs

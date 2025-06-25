{
  buildPythonPackage,
  fetchPypi,
  lib,
  pkgs,
  pythonOlder,
  setuptools,
  setuptools-git-versioning,
  ...
}:

let
  choreographer = buildPythonPackage rec {
    pname = "choreographer";
    version = "1.0.9";
    pyproject = true;
    disabled = pythonOlder "3.8";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-NkI7SwSc8uwqaPpAJL3SLQxBfVQhkT72K2wOiVlbaJU=";
    };

    build-system = [
      setuptools
      setuptools-git-versioning
    ];

    dependencies = [
      logistro
      pkgs.python3Packages.simplejson
    ];
  };

  logistro = buildPythonPackage rec {
    pname = "logistro";
    version = "1.1.0";
    pyproject = true;
    disabled = pythonOlder "3.8";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-rVHw76K8cFvqfCZuinWc9TlFfPcQggKl7sd732MA13Q=";
    };

    build-system = [
      setuptools
      setuptools-git-versioning
    ];
  };

in
buildPythonPackage rec {
  pname = "kaleido";
  version = "1.0.0";
  pyproject = true;
  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UC2Lpkc3kk769elMJzZ0W8x8km5sxTWDi+NsD8BjML0=";
  };

  build-system = [
    setuptools
    setuptools-git-versioning
  ];

  dependencies = [
    choreographer
    logistro
    pkgs.python3Packages.orjson
    pkgs.python3Packages.packaging
  ];

  meta = {
    description = "Fast static image export for web-based visualization libraries";
    homepage = "https://github.com/plotly/kaleido";
    changelog = "https://github.com/plotly/kaleido/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

name              "myzsh"
maintainer        "Yifeng Jiang"
maintainer_email  "uprushworld at gmail.com"
license           "Apache 2.0"
description       "Configure my zsh"
version           "1.0.0"

%w(ubuntu mac_os_x).each {|os| supports os}
%w(zsh mybox).each {|cb| depends cb}

recipe            "default", "Configure my zsh"

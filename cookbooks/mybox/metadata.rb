name              "mybox"
maintainer        "Yifeng Jiang"
maintainer_email  "uprushworld at gmail.com"
license           "Apache 2.0"
description       "Configure my development box"
version           "1.0.0"

%w(ubuntu mac_os_x).each {|os| supports os}

recipe            "default", "Configure my development box"

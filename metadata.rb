name             'tutum'
maintainer       'computerlyrik, Christian Fischer'
maintainer_email 'chef-cookbooks@computerlyrik.de'
license          'Apache 2.0'
description      'Installs/Configures tutum'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports ['debian', 'ubuntu', "centos"]

depends 'apt'
depends 'yum'
depends 'aufs'


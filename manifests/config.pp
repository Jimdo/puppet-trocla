class trocla::config {
  require trocla::master

  # deploy default config file and link it for trocla cli lookup
  file{
    "${settings::confdir}/troclarc.yaml":
      ensure => present,
      content => "---\nadapter_options:\n    :path: ${settings::confdir}/trocla_data.yaml\n",
      owner => root,
      group => puppet,
      mode => 0640;
    '/etc/troclarc.yaml':
      ensure => link,
      target => "${settings::confdir}/troclarc.yaml";
    "${settings::confdir}/trocla_data.yaml":
      owner => puppet,
      group => 0,
      mode => 0600;
  }
}

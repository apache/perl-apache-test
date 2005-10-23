# This is a config file for testing modperl 2.0 core

%Apache::TestItSelf::Config = (
    repos_type    => 'mp2_core',
    perl_exec     => "/home/$ENV{USER}/perl/5.8.7-ithread/bin/perl5.8.7",
    mp_gen        => '2.0',
    httpd_gen     => '2.0',
    httpd_version => 'Apache/2.0.55',
    timeout       => 900, # make test may take a long time
    test_verbose  => 0,
);

my $path = "/home/$ENV{USER}/httpd";
my $common_makepl_arg = "MP_MAINTAINER=1";

@Apache::TestItSelf::Configs = ();
for (qw(prefork worker)) {
    push @Apache::TestItSelf::Configs,
        {
         apxs_exec     => "$path/$_/bin/apxs",
         httpd_exec    => "$path/$_/bin/httpd",
         httpd_conf    => "$path/$_/conf/httpd.conf",
         httpd_mpm     => "$_",
         makepl_arg    => "MP_APXS=$path/$_/bin/apxs $common_makepl_arg",
        };
}

1;

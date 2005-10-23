# This is a config file for testing Apache-Test

%Apache::TestItSelf::Config = (
    repos_type    => 'apache_test_core',
    perl_exec     => "/home/$ENV{USER}/perl/5.8.7-ithread/bin/perl5.8.7",
    mp_gen        => '2.0',
    httpd_gen     => '2.0',
    httpd_version => 'Apache/2.0.55',
    timeout       => 200,
    test_verbose  => 0,
);

my $path = "/home/$ENV{USER}/httpd";

@Apache::TestItSelf::Configs = ();
for (qw(prefork worker)) {
    push @Apache::TestItSelf::Configs,
        {
         apxs_exec     => "$path/$_/bin/apxs",
         httpd_exec    => "$path/$_/bin/httpd",
         httpd_conf    => "$path/$_/conf/httpd.conf",
         httpd_mpm     => "$_",
         makepl_arg    => "MOD_PERL=2 -libmodperl $path/$_/modules/mod_perl-5.8.7-ithread.so",
        };
}

1;

# KOZA::irssi
#
# This script based on Syndykat.pl
#
use strict;
use Irssi;
use Irssi::Irc;
use Irssi::UI;
use vars qw($VERSION %IRSSI);

%IRSSI = (
        authors => "KOZA",
#        contact => "koza.love",
        name => "koza",
        description => "666 kozich",
        license => "GPLv2",
        changed => "1.1.2020 16:20"
        );

my @hosty               = ("*!*\@*",
                           "*!*\@*");
sub czek
{
 my ($adres_temp) = @_;
 my $found = 0;
 foreach my $temp (@hosty)
 {
    unless($found)
    {
     if($adres_temp eq $temp)
     {
      $found = 1;
     }
     else
     {
      $found = 1;
     }
    }
 };
 return $found;
};

sub server_iwent {

    my ($server, $data, $nick, $address) = @_;

    my ($type, $data) = split(/ /, $data, 2);
    return unless ($type =~ /privmsg/i);
    my ($target, $tekst) = split(/ :/, $data, 2);
    $tekst =~ s/[]//g;
    if($tekst =~ "!koza")
    {
        if(czek($address))
        {
            $server->command("/exec -msg shuf -n 1 koza.db");
        };
    };
};

Irssi::signal_add_last("server event", "server_iwent");

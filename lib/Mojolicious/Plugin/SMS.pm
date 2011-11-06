package Mojolicious::Plugin::SMS;
use Mojo::Base 'Mojolicious::Plugin';
use SMS::Send;

our $VERSION = '0.01';

sub register {
  my ($self, $app, $conf) = @_;
  $conf ||= {};
  $conf->{driver} = delete $conf->{driver};
  my $sms_send = SMS::Send->new($conf->{driver}, %$conf);

  $app->helper(
    sms => sub {
      my $self = shift;
      my %params;
      if (@_ == 2) {
          @params{qw(to text)} = @_;
      } elsif (@_ > 2 && @_ % 2 == 0) {
          %params = @_;
      } else {
          die "Invalid params passed to sms helper!";
      }
      return $sms_send->send_sms(%params);
    }
  );
}

1;

package Net::Braintree::TestHelper;
use lib qw(lib t/lib);
use Try::Tiny;
use Test::More;
use HTTP::Request;
use LWP::UserAgent;
use Net::Braintree::Util;
use Data::Dumper;
use CGI;

use Net::Braintree;
Net::Braintree->configuration->environment("integration");

use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS );
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(not_ok should_throw simulate_form_post_for_tr make_subscription_past_due);
our @EXPORT_OK = qw();

sub not_ok {
  my($predicate, $message) = @_;
  ok(!$predicate, $message);
}

sub should_throw {
  my($exception, $block, $message) = @_;
  try {
    $block->();
    fail($message . " [Should have thrown $exception]");
  } catch {
    like($_ , qr/^$exception.*/, $message);
  }
}

sub simulate_form_post_for_tr {
  my ($tr_string, $form_params) = @_;
  my $escaped_tr_string = CGI::escape($tr_string);
  my $tr_data = {tr_data => $escaped_tr_string, %$form_params};

  my $request = HTTP::Request->new(POST => Net::Braintree->configuration->base_merchant_url .
    "/transparent_redirect_requests");

  $request->content_type("application/x-www-form-urlencoded");
  $request->content(hash_to_query_string($tr_data));

  my $agent = LWP::UserAgent->new;
  my $response = $agent->request($request);
  my @url_and_query = split(/\?/, $response->header("location"), 2);
  return $url_and_query[1];
}

sub make_subscription_past_due {
  my $subscription_id = shift;

  my $request = Net::Braintree->configuration->gateway->http->put(
    "/subscriptions/$subscription_id/make_past_due?days_past_due=1");
}

1;
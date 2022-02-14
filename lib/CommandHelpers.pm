package CommandHelpers;

use v5.30;
use warnings;

sub import
{
	my $caller = caller;
	my ($self, %args) = @_;

	if ($args{dir}) {
		my $envdir = $ENV{HOME} . '/.envdata/';
		mkdir $envdir
			unless -e $envdir;

		my $dir = $envdir . $args{dir};
		mkdir $dir
			unless -e $dir;

		{
			no strict 'refs';
			*{"${caller}::DATA_DIR"} = sub { $dir };
		}
	}
}

sub handle_completion
{
	my ($self, @list) = @_;

	if (@ARGV && $ARGV[0] eq '--completion') {
		my $current = $ARGV[2];
		@list = grep { $_ =~ /^\Q$current\E/ } @list
			if length $current;

		print join "\n", @list;
		exit;
	}
}

1;


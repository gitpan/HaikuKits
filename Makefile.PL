use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME'     => 'HaikuKits',
	'VERSION'  => '0.01',
	'CC'       => 'g++',
	'LD'       => '$(CC)',
	'XSOPT'    => '-C++',
	'DIR'      => [ 'ApplicationKit', 'InterfaceKit', 'StorageKit', 'SupportKit' ]
);

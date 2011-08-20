use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME'     => 'Haiku::InterfaceKit',
	'VERSION'  => '0.01',
	'CC'       => 'g++',
	'LD'       => '$(CC)',
	'XSOPT'    => '-C++',
	dynamic_lib => { 'BSLOADLIBS' => 'libbe' }
);

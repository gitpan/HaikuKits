use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME'     => 'Haiku::ApplicationKit',
	'VERSION'  => '0.01',
	'CC'       => 'g++',
	'LD'       => '$(CC)',
	'XSOPT'    => '-C++',
	dynamic_lib => { 'BSLOADLIBS' => 'libbe' }
);

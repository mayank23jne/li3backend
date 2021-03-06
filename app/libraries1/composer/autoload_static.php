<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit113cc819c0db0293929852740cf4bae7
{
    public static $prefixLengthsPsr4 = array (
        'C' => 
        array (
            'Composer\\Installers\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Composer\\Installers\\' => 
        array (
            0 => __DIR__ . '/..' . '/composer/installers/src/Composer/Installers',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit113cc819c0db0293929852740cf4bae7::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit113cc819c0db0293929852740cf4bae7::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}

<?php

require_once 'vendor/autoload.php';

$pdo = new PDO('mysql:host=mysql;port=3306;dbname=docker', 'root', 'secret');
$seeder = new tebazil\dbseeder\Seeder($pdo);
$generator = $seeder->getGeneratorConfigurator();
$faker = $generator->getFakerConfigurator();


$seeder->table('users')->columns([
    'id',
    'name' => $faker->name,
    'email' => $faker->email,
    'birthday' => $faker->date('Y-m-d', '-18 years')
])->rowQuantity(100);


$seeder->table('companies')->columns([
    'id',
    'name' => $faker->company
])->rowQuantity(30);

$seeder->table('employees')->columns([
    'user_id' => array_unique($generator->relation('users', 'id')),
    'company_id' => $generator->relation('companies', 'id'),
    'date_of_employment' => $faker->date('Y-m-d', 'now')
])->rowQuantity(80);

$seeder->refill();

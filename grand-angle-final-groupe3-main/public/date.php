<?php
setlocale(LC_TIME, 'fr_FR.UTF-8');
 
$currentDayOfWeek = date('w');
 
$frenchDayNames = [
    'Sunday' => 'Dimanche',
    'Monday' => 'Lundi',
    'Tuesday' => 'Mardi',
    'Wednesday' => 'Mercredi',
    'Thursday' => 'Jeudi',
    'Friday' => 'Vendredi',
    'Saturday' => 'Samedi'
];
 
$englishDayName = date('l');
 
$frenchDayName = $frenchDayNames[$englishDayName];
 
$frenchMonthNames = [
    'January' => 'Janvier',
    'February' => 'Février',
    'March' => 'Mars',
    'April' => 'Avril',
    'May' => 'Mai',
    'June' => 'Juin',
    'July' => 'Juillet',
    'August' => 'Août',
    'September' => 'Septembre',
    'October' => 'Octobre',
    'November' => 'Novembre',
    'December' => 'Décembre'
];
 
$englishMonthName = date('F');
 
$frenchMonthName = $frenchMonthNames[$englishMonthName];
 
$formattedDate = ucfirst($frenchDayName) . ' ' . date('d') . ' ' . $frenchMonthName . ' ' . date('Y');
 
echo $formattedDate;
?>
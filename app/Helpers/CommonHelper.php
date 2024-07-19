<?php

namespace App\Helpers;


class CommonHelper
{
    public static function formatDate($date, $format = 'd-M-y')
    {
        if (!$date) {
            return null;
        }
        return date_format($date, $format);
    }

    
}
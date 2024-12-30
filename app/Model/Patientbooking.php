<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\User;

class Patientbooking extends Model
{
    protected $fillable =
    ["id", "doctor", "doctoremail", "department", "days", "time", "patientname", "patientemail", "patientphone", "patientage", "consultancyfees"];
    public function user(): HasOne
    {
        return $this->hasOne(User::class, 'doctoremail', 'patientemail');
    }

    public function scopeUserData($query)
    {
        return $query->where('patientemail', auth()->user()->email);
    }


    public function scopeUserData2($query)
    {
        return $query->where('doctoremail', auth()->user()->email);
    }
}

<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\HasOne;
use App\User;
class Patient extends Model
{
    protected $fillable= 
    ["id","doctoremail","name","email","gender","phone","address","age","medicalhistory","prescription"];

    public function user(): HasOne
    {
        return $this->hasOne(User::class,'doctoremail');
    }

    public function scopeUserData($query)
    {
        return $query->where('doctoremail', auth()->user()->email);
    }
}

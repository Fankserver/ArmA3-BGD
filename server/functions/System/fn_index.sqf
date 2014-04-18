private["_find","_array","_limit","_select","_return"];
_find = _this select 0;
_array = _this select 1;

_limit = (count _array)-1;
_return = -1;

for "_i" from 0 to _limit do {
    _select = _array select _i;
    if ((_find == _select) && _return < 0) exitWith {
        _return = _i;
    };
};

_return;
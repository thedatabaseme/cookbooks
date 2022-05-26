-- Disables the defaults profile password lifetime policy.
-- This leads to, that the passwords will no longer expire
-- by default after 120 days.

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
-- Short Lua script for calculating coupling factor of two coils.
-- It presumes the problem is already defined in FEMM, and
-- that the two windings are defined by circuits named "pri" and "sec".
-- The problem may be DC or AC at a frequency of your choice.
-- Intended for circuits with series property.
-- Execute with the FEMM menu item File/OpenLuaScript.
clearconsole()
showconsole()

mi_mirror(0,60,0,-480, (1))
print("Done")

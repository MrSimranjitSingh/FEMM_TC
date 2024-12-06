-- Short Lua script for calculating coupling factor of two coils.
-- It presumes the problem is already defined in FEMM, and
-- that the two windings are defined by circuits named "pri" and "sec".
-- The problem may be DC or AC at a frequency of your choice.
-- Intended for circuits with series property.
-- Execute with the FEMM menu item File/OpenLuaScript.
clearconsole()
showconsole()
-- Simulate first with only secondary current:
mi_modifycircprop("pri",1,0)
mi_modifycircprop("sec",1,1)
mi_analyze()
mi_loadsolution()
print(mo_getcircuitproperties("sec"))  -- Optional display of intermediate results
print(mo_getcircuitproperties("pri"))  -- Optional display of intermediate results
i, Vsec, Lsec = mo_getcircuitproperties("sec")
i, Vpri_sec, Lpri_sec = mo_getcircuitproperties("pri")
-- Simulate next with only primary current:
mi_modifycircprop("pri",1,1)
mi_modifycircprop("sec",1,0)
mi_analyze()
mi_loadsolution()
print(mo_getcircuitproperties("sec"))  -- Optional display of intermediate results
print(mo_getcircuitproperties("pri"))  -- Optional display of intermediate results
i, Vsec_pri, Lsec_pri = mo_getcircuitproperties("sec")
i, Vpri, Lpri = mo_getcircuitproperties("pri")
-- Calculate and print coupling factor:
coupling_factor = sqrt(Lsec_pri * Lpri_sec / (Lpri * Lsec))
print("Coupling factor is:", coupling_factor)

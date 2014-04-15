clear all
set more off
set trace off
mata mata clear
// cd i:/george/comandos_paquetes_librerias/stata/devtools
set matastrict on

mata mata mlib create ldevtools, replace
do devtools.mata
do dt_capture.mata
do dt_st_chars.mata
do dt_moxygen.mata
mata mata mlib add ldevtools dt_*(), complete

/* Documenting source code */
mata dt_moxygen(("devtools.mata","dt_capture.mata","dt_st_chars.mata","dt_moxygen.mata"), "devtools_source.hlp")

/*
Creates a pkg file
mata
dt_create_pkg(
	"devtools Tools for the stata developer.",
	("ldevtools.mlib","devtools_source.hlp","mf_dt_capture.sthlp"),
	1,
	"George Vega, James Fiedler"
)
end
*/

mata dt_install_on_the_fly("devtools")

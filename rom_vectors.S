.section ".vectors","ax"
	
.global rom_secure_boot_api
.global rom_get_soc_id
.global rom_get_rnd_vector
.global rom_get_lcs

	b rom_secure_boot_api
	b rom_get_soc_id
	b rom_get_rnd_vector
	b rom_get_lcs
